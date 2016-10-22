package org.dspace.search;

import java.io.IOException;
import java.io.Reader;
import java.io.StringReader;

import org.apache.lucene.analysis.Analyzer;
import org.apache.lucene.analysis.TokenStream;
import org.apache.lucene.analysis.Tokenizer;
//import org.apache.lucene.analysis.cn.ChineseAnalyzer;
//import org.apache.lucene.analysis.cn.smart.SentenceTokenizer;
//import org.apache.lucene.analysis.tokenattributes.TermAttribute;
//import org.apache.lucene.util.Version;
//import org.apache.lucene.analysis.tokenattributes.TermAttribute;

import tw.cheyingwu.ckip.CKIP;
import tw.cheyingwu.ckip.WordSegmentationService;

import org.dspace.core.ConfigurationManager;


import java.util.ArrayList;
import java.util.List;
import tw.cheyingwu.ckip.CKIP;
import tw.cheyingwu.ckip.Term;
import tw.cheyingwu.ckip.WordSegmentationService;
import java.io.BufferedReader;

import org.apache.lucene.analysis.cn.ChineseTokenizer;
import org.apache.lucene.analysis.cn.ChineseFilter;
//import org.apache.lucene.analysis.Analyzer.TokenStreamComponents;

import org.apache.log4j.Logger;

import java.util.Set;
import org.apache.lucene.analysis.LowerCaseFilter;
import org.apache.lucene.analysis.PorterStemFilter;
import org.apache.lucene.analysis.StopFilter;
import org.apache.lucene.analysis.TokenStream;
import org.apache.lucene.analysis.standard.StandardFilter;


/*
 * 建立CKIPAnalyzer
 */
public class CKIPChineseAnalyzer extends Analyzer {
	private String id;
	private String pw;
	private String host;
	private int port;
	private WordSegmentationService c;
	
	/*
     * An array containing some common words that are not usually useful for
     * searching.
     */
    private static final String[] STOP_WORDS =
    {

    // new stopwords (per MargretB)
            "a", "am", "and", "are", "as", "at", "be", "but", "by", "for",
            "if", "in", "into", "is", "it", "no", "not", "of", "on", "or",
            "the", "to", "was"
    // old stopwords (Lucene default)
    /*
     * "a", "and", "are", "as", "at", "be", "but", "by", "for", "if", "in",
     * "into", "is", "it", "no", "not", "of", "on", "or", "s", "such", "t",
     * "that", "the", "their","then", "there","these", "they", "this", "to",
     * "was", "will", "with"
     */
    };

    /*
     * Stop table
     */
    final static private Set stopSet = StopFilter.makeStopSet(STOP_WORDS);
	
	public CKIPChineseAnalyzer(){
		this.host = ConfigurationManager.getProperty("search.analyzer.ckip.host");
		this.port = ConfigurationManager.getIntProperty("search.analyzer.ckip.port");
		this.id = ConfigurationManager.getProperty("search.analyzer.ckip.username");
		this.pw = ConfigurationManager.getProperty("search.analyzer.ckip.password");
	}
	
	@Override
	public TokenStream tokenStream(String arg0, Reader reader) {
		
		Logger log = Logger.getLogger(CKIPChineseAnalyzer.class);
		log.info("Before Token : " + readerToString(reader));
		
		// 先把reader變成String
		String str = readerToString(reader);
		
		// 斷詞處理
		c = new CKIP(host, port, id, pw);
		c.setRawText(str);
		c.send();
		String strTokened = "";
		for (Term t : c.getTerm()) {
			if (!strTokened.equals("")) {
				strTokened = strTokened + " ";
			}
			strTokened = strTokened + t.getTerm();
		}
		log.info("After ckip: " + strTokened);
		
		// 轉換成reader
		reader = new StringReader(strTokened);
		
		
		// 丟入Lucene的ChineseTokenizer
		TokenStream source = new ChineseTokenizer(reader);
		source = new ChineseFilter(source);
		
		// 丟入DSAnalyzer
		//TokenStream source = new DSTokenizer(reader);
        //source = new StandardFilter(source);
        //source = new LowerCaseFilter(source);
        //source = new StopFilter(source, stopSet);
        //source = new PorterStemFilter(source);
		
		return source;
	}

	private String readerToString(Reader reader) {
		StringBuilder builder = new StringBuilder();
		int charsRead = -1;
		char[] chars = new char[100];
		try {
			do{
				charsRead = reader.read(chars,0,chars.length);
				//if we have valid chars, append them to end of string.
				if(charsRead>0)
					builder.append(chars,0,charsRead);
			}while(charsRead>0);
			reader.reset();
		} catch (Exception e) {}
		
		String stringReadFromReader = builder.toString();
		return stringReadFromReader;
	}
	
}
