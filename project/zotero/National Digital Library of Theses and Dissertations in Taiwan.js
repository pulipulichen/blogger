{
	"translatorID": "8fa8c0e6-c2a4-45e5-92f7-7a5d91462ae4",
	"label": "National Digital Library of Theses and Dissertations in Taiwan",
	"creator": "Pulipuli Chen",
	"target": ".edu.tw/cgi-bin/gs32/gsweb.cgi",
	"minVersion": "3.0",
	"maxVersion": "",
	"priority": 80,
	"inRepository": true,
	"translatorType": 7,
	"browserSupport": "gcs",
	"lastUpdated": "2016-11-05 13:11:40"
}

/* FW LINE 59:b820c6d */ function flatten(t){var e=new Array;for(var i in t){var r=t[i];r instanceof Array?e=e.concat(flatten(r)):e.push(r)}return e}var FW={_scrapers:new Array};FW._Base=function(){this.callHook=function(t,e,i,r){if("object"==typeof this.hooks){var n=this.hooks[t];"function"==typeof n&&n(e,i,r)}},this.evaluateThing=function(t,e,i){var r=typeof t;if("object"===r){if(t instanceof Array){var n=this.evaluateThing,a=t.map(function(t){return n(t,e,i)});return flatten(a)}return t.evaluate(e,i)}return"function"===r?t(e,i):t},this.makeItems=function(t,e,i,r,n){n()}},FW.Scraper=function(t){FW._scrapers.push(new FW._Scraper(t))},FW._Scraper=function(t){for(x in t)this[x]=t[x];this._singleFieldNames=["abstractNote","applicationNumber","archive","archiveLocation","artworkMedium","artworkSize","assignee","audioFileType","audioRecordingType","billNumber","blogTitle","bookTitle","callNumber","caseName","code","codeNumber","codePages","codeVolume","committee","company","conferenceName","country","court","date","dateDecided","dateEnacted","dictionaryTitle","distributor","docketNumber","documentNumber","DOI","edition","encyclopediaTitle","episodeNumber","extra","filingDate","firstPage","forumTitle","genre","history","institution","interviewMedium","ISBN","ISSN","issue","issueDate","issuingAuthority","journalAbbreviation","label","language","legalStatus","legislativeBody","letterType","libraryCatalog","manuscriptType","mapType","medium","meetingName","nameOfAct","network","number","numberOfVolumes","numPages","pages","patentNumber","place","postType","presentationType","priorityNumbers","proceedingsTitle","programTitle","programmingLanguage","publicLawNumber","publicationTitle","publisher","references","reportNumber","reportType","reporter","reporterVolume","rights","runningTime","scale","section","series","seriesNumber","seriesText","seriesTitle","session","shortTitle","studio","subject","system","thesisType","title","type","university","url","version","videoRecordingType","volume","websiteTitle","websiteType"],this._makeAttachments=function(t,e,i,r){if(i instanceof Array)i.forEach(function(i){this._makeAttachments(t,e,i,r)},this);else if("object"==typeof i){var n=i.urls||i.url,a=i.types||i.type,s=i.titles||i.title,o=i.snapshots||i.snapshot,u=this.evaluateThing(n,t,e),l=this.evaluateThing(s,t,e),c=this.evaluateThing(a,t,e),h=this.evaluateThing(o,t,e);u instanceof Array||(u=[u]);for(var f in u){var p,m,v,d=u[f];p=c instanceof Array?c[f]:c,m=l instanceof Array?l[f]:l,v=h instanceof Array?h[f]:h,r.attachments.push({url:d,title:m,mimeType:p,snapshot:v})}}},this.makeItems=function(t,e,i,r,n){var a=new Zotero.Item(this.itemType);a.url=e;for(var s in this._singleFieldNames){var o=this._singleFieldNames[s];if(this[o]){var u=this.evaluateThing(this[o],t,e);u instanceof Array?a[o]=u[0]:a[o]=u}}var l=["creators","tags"];for(var c in l){var h=l[c],f=this.evaluateThing(this[h],t,e);if(f)for(var p in f)a[h].push(f[p])}this._makeAttachments(t,e,this.attachments,a),r(a,this,t,e),n()}},FW._Scraper.prototype=new FW._Base,FW.MultiScraper=function(t){FW._scrapers.push(new FW._MultiScraper(t))},FW._MultiScraper=function(t){for(x in t)this[x]=t[x];this._mkSelectItems=function(t,e){var i=new Object;for(var r in t)i[e[r]]=t[r];return i},this._selectItems=function(t,e,i){var r=new Array;Zotero.selectItems(this._mkSelectItems(t,e),function(t){for(var e in t)r.push(e);i(r)})},this._mkAttachments=function(t,e,i){var r=this.evaluateThing(this.attachments,t,e),n=new Object;if(r)for(var a in i)n[i[a]]=r[a];return n},this._makeChoices=function(t,e,i,r,n){if(t instanceof Array)t.forEach(function(t){this._makeTitlesUrls(t,e,i,r,n)},this);else if("object"==typeof t){var a=t.urls||t.url,s=t.titles||t.title,o=this.evaluateThing(a,e,i),u=this.evaluateThing(s,e,i),l=u instanceof Array;o instanceof Array||(o=[o]);for(var c in o){var h,f=o[c];h=l?u[c]:u,n.push(f),r.push(h)}}},this.makeItems=function(t,e,i,r,n){if(this.beforeFilter){var a=this.beforeFilter(t,e);if(a!=e)return void this.makeItems(t,a,i,r,n)}var s=[],o=[];this._makeChoices(this.choices,t,e,s,o);var u=this._mkAttachments(t,e,o),l=this.itemTrans;this._selectItems(s,o,function(t){if(t){var e=function(t){var e=t.documentURI,i=l;void 0===i&&(i=FW.getScraper(t,e)),void 0===i||i.makeItems(t,e,u[e],r,function(){})};Zotero.Utilities.processDocuments(t,e,n)}else n()})}},FW._MultiScraper.prototype=new FW._Base,FW.WebDelegateTranslator=function(t){return new FW._WebDelegateTranslator(t)},FW._WebDelegateTranslator=function(t){for(x in t)this[x]=t[x];this.makeItems=function(t,e,i,r,n){var a=this,s=Zotero.loadTranslator("web");s.setHandler("itemDone",function(i,n){r(n,a,t,e)}),s.setDocument(t),this.translatorId?(s.setTranslator(this.translatorId),s.translate()):(s.setHandler("translators",function(t,e){e.length&&(s.setTranslator(e[0]),s.translate())}),s.getTranslators()),n()}},FW._WebDelegateTranslator.prototype=new FW._Base,FW._StringMagic=function(){this._filters=new Array,this.addFilter=function(t){return this._filters.push(t),this},this.split=function(t){return this.addFilter(function(e){return e.split(t).filter(function(t){return""!=t})})},this.replace=function(t,e,i){return this.addFilter(function(r){return r.match(t)?r.replace(t,e,i):r})},this.prepend=function(t){return this.replace(/^/,t)},this.append=function(t){return this.replace(/$/,t)},this.remove=function(t,e){return this.replace(t,"",e)},this.trim=function(){return this.addFilter(function(t){return Zotero.Utilities.trim(t)})},this.trimInternal=function(){return this.addFilter(function(t){return Zotero.Utilities.trimInternal(t)})},this.match=function(t,e){return e||(e=0),this.addFilter(function(i){var r=i.match(t);return void 0===r||null===r?void 0:r[e]})},this.cleanAuthor=function(t,e){return this.addFilter(function(i){return Zotero.Utilities.cleanAuthor(i,t,e)})},this.key=function(t){return this.addFilter(function(e){return e[t]})},this.capitalizeTitle=function(){return this.addFilter(function(t){return Zotero.Utilities.capitalizeTitle(t)})},this.unescapeHTML=function(){return this.addFilter(function(t){return Zotero.Utilities.unescapeHTML(t)})},this.unescape=function(){return this.addFilter(function(t){return unescape(t)})},this._applyFilters=function(t,e){for(i in this._filters){t=flatten(t),t=t.filter(function(t){return void 0!==t&&null!==t});for(var r=0;r<t.length;r++)try{if(void 0===t[r]||null===t[r])continue;t[r]=this._filters[i](t[r],e)}catch(n){t[r]=void 0,Zotero.debug("Caught exception "+n+"on filter: "+this._filters[i])}t=t.filter(function(t){return void 0!==t&&null!==t})}return flatten(t)}},FW.PageText=function(){return new FW._PageText},FW._PageText=function(){this._filters=new Array,this.evaluate=function(t){var e=[t.documentElement.innerHTML];return e=this._applyFilters(e,t),0==e.length?!1:e}},FW._PageText.prototype=new FW._StringMagic,FW.Url=function(){return new FW._Url},FW._Url=function(){this._filters=new Array,this.evaluate=function(t,e){var i=[e];return i=this._applyFilters(i,t),0==i.length?!1:i}},FW._Url.prototype=new FW._StringMagic,FW.Xpath=function(t){return new FW._Xpath(t)},FW._Xpath=function(t){this._xpath=t,this._filters=new Array,this.text=function(){var t=function(t){return"object"==typeof t&&t.textContent?t.textContent:t};return this.addFilter(t),this},this.sub=function(t){var e=function(e,i){var r=i.evaluate(t,e,null,XPathResult.ANY_TYPE,null);return r?r.iterateNext():void 0};return this.addFilter(e),this},this.evaluate=function(t){var e=t.evaluate(this._xpath,t,null,XPathResult.ANY_TYPE,null),i=e.resultType,r=new Array;if(i==XPathResult.STRING_TYPE)r.push(e.stringValue);else if(i==XPathResult.BOOLEAN_TYPE)r.push(e.booleanValue);else if(i==XPathResult.NUMBER_TYPE)r.push(e.numberValue);else if(i==XPathResult.ORDERED_NODE_ITERATOR_TYPE||i==XPathResult.UNORDERED_NODE_ITERATOR_TYPE)for(var n;n=e.iterateNext();)r.push(n);return r=this._applyFilters(r,t),0==r.length?!1:r}},FW._Xpath.prototype=new FW._StringMagic,FW.detectWeb=function(t,e){for(var i in FW._scrapers){var r=FW._scrapers[i],n=r.evaluateThing(r.itemType,t,e),a=r.evaluateThing(r.detect,t,e);if(a.length>0&&a[0])return n}},FW.getScraper=function(t,e){var i=FW.detectWeb(t,e);return FW._scrapers.filter(function(r){return r.evaluateThing(r.itemType,t,e)==i&&r.evaluateThing(r.detect,t,e)})[0]},FW.doWeb=function(t,e){var i=FW.getScraper(t,e);i.makeItems(t,e,[],function(t,e,i,r){e.callHook("scraperDone",t,i,r),t.title||(t.title=""),t.complete()},function(){Zotero.done()}),Zotero.wait()};




function detectWeb(doc, url) { return FW.detectWeb(doc, url); }
function doWeb(doc, url) { return FW.doWeb(doc, url); }

/** Reportes */
FW.Scraper({ itemType         : 'thesis',
			 detect           : FW.Xpath('//*[@id="format0_disparea"]'),
			 //title            : FW.Xpath('//*[@id="format0_disparea"]/tbody/tr[3]/td').text().trim(),
			 //  //*[text()[contains(.,'ABC')]]
			 title            : FW.Xpath('//*[text()[contains(.,"論文名稱:")]]/following-sibling::td[1] | //*[text()[contains(.,"論文名稱(外文):")]]/following-sibling::td[1]').text().trim(),
			 
			 /**
			  * 研究生欄位現在只取用「研究生:」，不包括外文。
			  *
			  * 因為國圖修改了欄位，一次取得兩個欄位有點困難，所以我做了調整
			  * 
			  * //creators         : FW.Xpath('//*[text()[contains(.,"研究生:")]]/following-sibling::td[1] | //*[text()[contains(.,"研究生(外文):")]]/following-sibling::td[1]').text().trim().split(/,/).cleanAuthor("author"),
			  */
			 creators         : FW.Xpath('//*[text()[contains(.,"研究生:")]]/following-sibling::td[1] | //*[text()[contains(.,"作者:")]]/following-sibling::td[1]').text().trim()
			 	.addFilter(function (_s) {
			 		var _output_ary = _s.split(",");
					
					for (var _i in _output_ary) {
						var _item = _output_ary[_i];
						var _json = {
							lastName: _item,
							fieldMode: 1,
							creatorType: "author"
						}
						_output_ary[_i] = _json;
					}
					return _output_ary;
			 	}),
			 abstractNote     : FW.Xpath('//*[@name="description"]/@content').text().trim()
			 	.addFilter(function (_s) { 
			 		if (_s.substr(0,2) == "提要" || _s.substr(0,2) == "摘要") {
			 			_s = _s.substr(2, _s.length);
			 		}
					return _s; 
				}).trim(),
			 accessDate       : "CURRENT_TIMESTAMP",
			 
			 language         : FW.Xpath('( //*[text()[contains(.,"語文別:")]]/following-sibling::td[1] | //*[text()[contains(.,"相關次數:")]] )[1]').text().trim()
			 	.addFilter(function (_s) {
			 		
			 		if (_s == "相關次數:") {
			 			return "en-us";
			 		}
			 		
				 	if (_s == "中文") {
				 		return "zh-tw";
				 	}
				 	else if (_s == "繁體中文") {
				 		return "zh-tw";
				 	}
				 	else if (_s == "英文") {
				 		return "en-us";
				 	}
				 	else if (_s == "日文") {
				 		return "ja-jp";
				 	}
				 	else if (_s == "韓文") {
				 		return "ko-kr";
				 	}
				 	else if (_s == "法文") {
				 		return "fr-fr";
				 	}
				 	else if (_s == "德文") {
				 		return "de-de";
				 	}
				 	else {
				 		return "en-us";
				 	}
			 	}),
			 //date             : FW.Xpath('//*[text()[contains(.,"論文出版年:")]]/following-sibling::td[1]').text().trim(),
			 date             : FW.Xpath('//*[text()[contains(.,"論文出版年:")]]/following-sibling::td[1] | //*[text()[contains(.,"畢業學年度:")]]/following-sibling::td[1]').text().trim()
			 	.addFilter(function (_s) {
			 		_s = parseInt(_s, 10);
			 		if (_s < 1000) {
			 			_s = _s + 1911;	// 101+1911=2012
			 		}
			 		return _s;
			 	}),
			 numPages         : FW.Xpath('//*[text()[contains(.,"論文頁數:")]]/following-sibling::td[1]').text().trim(),
			 university       : FW.Xpath('concat(//*[text()[contains(.,"校院名稱:")]]/following-sibling::td[1], //*[text()[contains(.,"系所名稱:")]]/following-sibling::td[1]  )').trim(),
			 	//FW.Xpath('//*[@id="format0_disparea"]/tbody/tr[8]/td/a').text().trim()],
			 	//concat(/div/text(), /div/em/text())
			 thesisType       : FW.Xpath('//*[text()[contains(.,"學位類別:")]]/following-sibling::td[1]').text().trim()
			 	.addFilter(function (_s) {
				 	if (_s == "碩士") {
				 		return "碩士論文";
				 	}
				 	else if (_s == "博士") {
				 		return "博士論文";
				 	}
				 	else {
				 		return _s;
				 	}
			 	}),
			 place            : FW.Xpath('//*[text()[contains(.,"校院名稱:")]]/following-sibling::td[1]').text().trim(),
			 rights           : "國家圖書館著作權聲明 Copyright © 2010 All rights reserved.",
			 archive          : "國家圖書館",
			 shortTitle       : FW.Xpath('//*[text()[contains(.,"論文名稱(外文):")]]/following-sibling::td[1]').text().trim(),
			 tags             : [FW.Xpath('//*[text()[contains(.,"中文關鍵詞:")]]/following-sibling::td[1]').text().trim().split("、")
			 	, FW.Xpath('//*[text()[contains(.,"外文關鍵詞:")]]/following-sibling::td[1]').text().trim().split("、")],
			 attachments : [
				 { url: FW.Url(),
 					title: FW.Xpath('//*[text()[contains(.,"論文名稱:")]]/following-sibling::td[1]').text().trim().append(" Snapshot"),
 					type: "text/html" }
			  ]	
  });
  
  FW.MultiScraper({ itemType  : "multiple",
			 	  detect    : FW.Xpath('//*[@id="tablefmt1"]'),
			 	  choices : {
				 	title    : FW.Xpath('//*[@id="tablefmt1"]/tbody/tr/td[3]/div/div[1]/table/tbody/tr[1]/td/a/span').text(),
				 	//  //*[@id="tablefmt1"]/tbody/tr[2]/td[3]/div/div[1]/table/tbody/tr[1]/td/a/span
				 	//  //*[@id="tablefmt1"]/tbody/tr[2]
			 	  	urls    : FW.Xpath('//*[@id="tablefmt1"]/tbody/tr/td[3]/div/div[1]/table/tbody/tr[1]/td/a').key('href').text()
			 	  }
});/** BEGIN TEST CASES **/
var testCases = [
	{
		"type": "web",
		"url": "https://ndltd.ncl.edu.tw/cgi-bin/gs32/gsweb.cgi/ccd=MpgjWZ/record?r1=1&h1=0",
		"items": [
			{
				"itemType": "thesis",
				"creators": [
					{
						"lastName": "林秀珍",
						"fieldMode": 1,
						"creatorType": "author"
					}
				],
				"notes": [],
				"tags": [
					"愛國主義",
					"關稅自主權",
					"歷史教學",
					"八年抗戰",
					false
				],
				"seeAlso": [],
				"attachments": [
					{
						"title": "愛國主義歷史教學目標在國中歷史教學的實踐— 以捍衛中華民國的政治經濟主權為中心 Snapshot",
						"type": "text/html"
					}
				],
				"url": "https://ndltd.ncl.edu.tw/cgi-bin/gs32/gsweb.cgi/ccd=MpgjWZ/record?r1=1&h1=0",
				"abstractNote": "教科書一方面為學生求得知識的來源；另一方面，教科書匯集了各式各樣的素材，成為輔助課堂教學與學習的依據。教科書的使用，時常左右教學的方式與學習的形態，其重要性不言而喻。由於教科書兼具知識的普及性與國家的主導性，教科書內容往往成為影響教學工作的關鍵因素。因此，了解與分析教科書內涵，將有助於教學工作的開展。清末以來，歷史教育深受西方文化的影響，課程目標的出現與設置，確立了歷史教育發展的主軸與方向。綜觀清末迄今的教育發展，愛國主義的歷史教育目標一直是近代乃至九年一貫課程的重要理念。歷史教師進行愛國主義的歷史教學活動，一方面在實踐國家的教育理念，另一方面則使學習者認識社會文化的歷史淵源，進而增進個體與社會的聯結。有關愛國主義歷史教學目標的實踐方法，筆者在本次的論文研究當中，將以收回關稅自主權與八年抗戰為主題，運用多媒體教學法與小組討論法，進行一連串的教學活動與設計。藉由分析近代中國在八年抗戰與收回關稅自主權的具體表現，探討國民政府對於捍衛中華民國政治與經濟主權的態度與作法。期許經由相關教學活動的推展，使學習者增進對國家的了解與對社會的認同，進而達到落實愛國主義歷史教學目標的目的。",
				"archive": "國家圖書館",
				"date": 2011,
				"language": "zh-tw",
				"numPages": "161",
				"place": "國立臺灣師範大學",
				"rights": "國家圖書館著作權聲明 Copyright © 2010 All rights reserved.",
				"thesisType": "碩士論文",
				"title": "愛國主義歷史教學目標在國中歷史教學的實踐— 以捍衛中華民國的政治經濟主權為中心",
				"university": "國立臺灣師範大學歷史學系在職進修碩士班",
				"libraryCatalog": "National Digital Library of Theses and Dissertations in Taiwan",
				"accessDate": "CURRENT_TIMESTAMP"
			}
		]
	}
]
/** END TEST CASES **/
