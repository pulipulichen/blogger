/**
 * puliBloggerDigest.js
 * 布丁式自動摘要 （for pulipuli.blogspot.tw）
 * 
 * Last Update: 20121207
 */

// JavaScript Document
// LAST UPDATE: 2010.6.9

function puliBloggerDigest(delayTime, wordMin, wordMax, langBlogURL, langReadAll, langContiReadAll, langShowDigest)
{
	var pBD = this;
	
	pBD.setDefaultValue = function(v, defaultValue)
	{
		if (typeof(v) == "undefined") {
			return defaultValue;
		}
		else {
			return v;
		}
	};
	
	pBD.wordMin = pBD.setDefaultValue(wordMin, 100);
	pBD.wordMax = pBD.setDefaultValue(wordMax, 200);
	
	pBD.langBlogURL = pBD.setDefaultValue(langBlogURL, "文章網頁");	//文章網頁
	pBD.langReadAll = pBD.setDefaultValue(langReadAll, "閱讀全文");	//閱讀全文
	pBD.langContiReadAll = pBD.setDefaultValue(langContiReadAll, "繼續閱讀全文");	//繼續閱讀全文
	pBD.langShowDigest = pBD.setDefaultValue(langShowDigest, "僅顯示摘要");	//僅顯示摘要
	
	pBD.delayTime = pBD.setDefaultValue(delayTime, 0);
	
	pBD.stop_tag = []; // new Array();
	pBD.stop_tag[0] = "img";
	pBD.stop_tag[1] = "br";
	
	pBD.stop_chr = []; // new Array();
	pBD.stop_chr[0] = " ";
	pBD.stop_chr[1] = "\n";
	pBD.stop_chr[2] = "\t";
	pBD.stop_chr[3] = ">";
	pBD.stop_chr[4] = "<";
	
	pBD.skip_tag = []; // new Array();
	pBD.skip_tag[0] = "script";
	pBD.skip_tag[1] = "style";
	
	pBD.limit = null;	//如果limit == null: 全部；limit == 1: 第一個；limit == -1 除了第一個之外
	
	pBD.doDegiest = function(callback)
	{
		pBD.doDigest(callback);
	};
	
	pBD.doDigest = function(callback)
	{
		if (pBD.is_blogger_fullpage() === true)
		{
			if (typeof(callback) == "function") {
				callback();
			}
			return;
		}
		
		var postBody = jQuery("div.post-body");
		//防止找不到div.post-body
		if (postBody.length === 0)
		{
			postBody = jQuery("div.post div.entry");
		}
		
		if (postBody.length === 0)
		{
			var divPost = jQuery("div.post");
			for (var i = 0; i < divPost.length; i++)
			{
				var post = divPost.eq(i).children(":not(a:first, h3.post-title:first, p.post-footer, :first):first");
				post.css("border", "1px solid red");
				postBody = jQuery('<div class="post-body"></div>')
					.append(post);
				
				divPost.eq(i).children("h3.post-title:first").after(postBody);
			}
			postBody = jQuery("div.post-body");
		}
		
		var postTitleURL = jQuery("div.post").find("a[title='permanent link']");
		if (postTitleURL.length === 0) {
			postTitleURL = jQuery("div.post").find("a.comment-link:last");
		}
		
		postBody.hide();
		
		var loop = function(pb, i) {
			var pbObj = postBody.eq(i);
			var url = postTitleURL.eq(i).attr("href");
			url = url.replace("#links", "");
			
			pBD.digest_blogbody(pbObj, url, i, function () {
				i++;
				if (i < pb.length)
				{
					setTimeout(function () {
						loop(pb, i);
					}, 0);
				}
				else
				{
					if (typeof(callback) == "function") {
						callback();
					}
				}
			});
		};
		
		
		loop(postBody, 0);
		/*
		for (var i = 0; i < postBody.length; i++)
		{
			var pbObj = postBody.eq(i);
			var url = postTitleURL.eq(i).attr("href");
			url = url.replace("#links", "");

			//setTimeout(function () {
				pBD.digest_blogbody(pbObj, url, i, function () {});
			//	}, pBD.delayTime*i);
		}
		*/
	};
	
	//function digest_blogbody----------------------------------------------------
	pBD.digest_blogbody = function (pbObj, url, eq, callback)
	{
		var returnCallback = function () {
			pbObj.slideDown("fast", function () {
				if (typeof(callback) == "function") {
					callback();
				}
				return;
			});
		};
		
		//自動文章摘要的變數設定
		var word_min = pBD.wordMin; //字數最少要到這種程度
		var word_max = pBD.wordMax; //字數最多要到這種程度

		//count = location.href.split("/");
		//if ((count.length > 5 || count[4] == "label")&& count[0] != "file:")
		if (is_blogger_fullpage())
		{
			returnCallback();
			return;
		}
	  //blogitembody = document.getElementById(id).innerHTML;
	  
		var textarea = pbObj.find("textarea.entry-content-text:first");
		if (textarea.length == 1)
		{
			var text = textarea.text();
			textarea.remove();
			pbObj.html(text);
		}
		blogitembody = pbObj.html();
	 
	  id = "postBodyAnchor"+eq;
		this.id = id;
		this.url = url;
		this.contiReading = function (title, msgContiReading)	
		{
			return '<div class="link_fullpost" style="margin: 5px;margin-bottom: 1em;">| <a onclick="pBD.digest_show(\''+this.id+'\')" title="'+title+'" href="javascript:void(0);">'+msgContiReading+'</a> | <a href="'+this.url+'" title="post link">'+pBD.langBlogURL+'</a> |</div>';
		};
		var digest_point = -1;
		var digest_mode = "auto";
	
	  //判斷是否有隱藏全文
	  if (digest_mode == "auto")
	  {
		 digest_point = blogitembody.indexOf("<!--Hidden All-->", 0);
		if (digest_point != -1
			 || pbObj.find("span.digest-mode.hidden-all").length !== 0)
		 {
		   digest_point = 0;
		   digest_mode = "hidden_all";
		 }
	  }
	  
	  if (digest_mode == "auto")
	  {
		 digest_point = blogitembody.indexOf("<!--Show All-->", 0);
	
		 if (digest_point != -1
			 || pbObj.find("span.digest-mode.show-all").length !== 0)
		 {
		   digest_point = blogitembody.length;
		   digest_mode = "show_all";
		 }
	  }
	  if (digest_mode == "auto")
	  {
	
		digest_point = blogitembody.indexOf("<!--Digest-->", 0);
		digest_point2 = blogitembody.indexOf("<!--more-->", 0);
		digest_point3 = blogitembody.indexOf(">DIGEST<", 0);
		digest_point4 = blogitembody.indexOf("<!-- Digest -->", 0);
	
		 if (digest_point != -1)
		 {
		   digest_point = digest_point + 13;
		   digest_mode = "digest";
		 }
		 if (digest_point2 != -1 && digest_point2 > digest_point)
		 {
		   digest_point = digest_point2 + 11;
		   digest_mode = "digest";
		 }
		 
		 if (digest_point3 != -1 && digest_point3 > digest_point2)
		 {
		   digest_point = digest_point3 + 2;
		   digest_mode = "digest";
		 } 
		 if (digest_point4 != -1 && digest_point4 > digest_point3)
		 {
		   digest_point = digest_point3 + 15;
		   digest_mode = "digest";
		 } 
	  }
	
	//手動設定，輸出
	if (digest_mode != "auto")
	{
		//alert(blogitembody);
		//if (digest_mode == "hidden_all")
		//digest_point = 0;
	    var body_len;
		if (blogitembody.toLowerCase().substr(blogitembody.length - 56, 56) == '<div style="clear:both; padding-bottom: 0.25em;"></div>') {
			body_len = blogitembody.length - 56;
		}
		else {
			body_len = blogitembody.length;
		}
	 	
//alert(blogitembody.toLowerCase().substr(blogitembody.length-56, 56) + " -- " + body_len + " -- " + digest_point);
	   //alert(body_len);
	 
		if (digest_point < body_len && digest_point != -1)
		{
			if (digest_mode != "hidden_all" || digest_mode != "digest") {
				continue_reading1 = "……";
			}
			else {
				continue_reading1 = "";
			}
	  
			//continue_reading2 = '<a href="'+url+'" title="post link" class="link_fullpost">(繼續閱讀)</a>'; 

			if (digest_mode == "hidden_all") {
				continue_reading2 = this.contiReading("show all", pBD.langReadAll);
			}
			else if  (digest_mode == "digest")
			{
				continue_reading2 = this.contiReading("show all", pBD.langContiReadAll);
			}
	  
			//隱藏全文
			hidden_reading = this.contiReading("show only digest", pBD.langShowDigest);

			blogitembody_digest_ohter = blogitembody.substr(0, digest_point) + '<a id="'+id+'-digest_point" name="'+id+'-digest_point"></a>'+blogitembody.substr(digest_point, blogitembody.length-digest_point);

			blogitembody_digest_ohter = '<div class="post_hidden puli-blogger-digest" id="'+id+'-hidden" style="display:none;clear:both">'+blogitembody_digest_ohter + hidden_reading + '</div>';
		}
		else
		{
			continue_reading1 = "";
			continue_reading2 = "";
			blogitembody_digest_ohter = "";
		}
	   
		//處理end tag
		var end_tag = "";
		if (digest_mode == "digest")
		{
			text = blogitembody.substr(0, digest_point);
			each_tag = text.split("<");
			
			 //end_tags = new Array;
			 //var tag_i = 0;
		 
			for (var i = 1; i < each_tag.length; i++)
			{
				if (each_tag[i].substr(0, 1) == "/" ||
				each_tag[i].substr(0, 1) == "!") {
					continue;
				}
			
				temp = each_tag[i].split(" ", 2);
				temp2 = each_tag[i].split(">", 2);
				if (temp[0].length < temp2[0].length) {
					tag = temp[0];
				}
				else {
					tag = temp2[0];
				}
				end_tag = "</" + tag + ">" + end_tag;
		 	}	//for (
		}	//if (digest_mode == "digest")
		
		blogitembody_digest = blogitembody.substr(0, digest_point) + continue_reading1 + end_tag;
		
		pbObj.html('<div name="'+id+'-show" id="'+id+'-show" class="post_show puli-blogger-digest" style="clear:both;">'+blogitembody_digest+continue_reading2+'</div>')
			.after(blogitembody_digest_ohter);
		
		returnCallback();
		return;
	}	//if (digest_mode != "auto")
	//--------------------------------------------------------
	//以上是手動切斷設定，以下是自動切斷的程式

	//0. 長度不到就自動略過
	if (pbObj.text().length < word_max)
	{
		returnCallback();
		return;
	}

	//1. 初始化設定

	//blogitembody //本文
	if (blogitembody.length < word_max)
	{
		returnCallback();
		return;
	}
	var word_num = 0; //字數
	var words = ""; //待顯示的文字與標籤
	var tags = []; //new Array; //儲存每個tag，以方便還原
	tag_i = 0;
	var dp = 0; //現在判斷的位置
	
	var stop_tag = pBD.stop_tag;
	
	var no_save = "false";
	
	var stop_chr = pBD.stop_chr;
	
	var chr_no_save = "false";
	
	var skip_tag = pBD.skip_tag;
	
	var temp_str = "";  //暫存字元，用來比較關鍵字用
	var now_chr = ""; //現在檢查的字元
	
	//alert(digest_point);
	
	var interval = 1;
	
	//一個字一個字抓取
	//for (i = 0; i < blogitembody.length && digest_point == -1; i++)
	//{
	var process = function (blogitembody, i, digest_point)
	{
		//if (i < 5)
		//	alert([i, blogitembody.length, digest_point]);
		if (!(i < blogitembody.length && digest_point == -1))
		{
			ending(i, tags);
			return;
		}
		
		now_chr = blogitembody.substr(i, 1);
	
		//檢查是否要跳過
		if (now_chr == "<")
		{
			//檢查是否為省略標籤
			is_skip_tag = "false";
			for (sk_i = 0; sk_i < skip_tag.length; sk_i++)
			{
				temp_str = blogitembody.substr(parseInt(i+1, 10), skip_tag[sk_i].length);
				if (temp_str == skip_tag[sk_i])
				{
					//跳躍到同樣的標籤結束為止
					i = blogitembody.indexOf("</"+skip_tag[sk_i]+">", i);
					i = parseInt(i, 10) + skip_tag[sk_i].length + 3;
					//word_num--;
					is_skip_tag = "true";
					break;
				}
			}
			if (is_skip_tag == "true")
			{
				//continue;
				i++;
				setTimeout(function () {	process(blogitembody, i, digest_point);	}, interval);
				return;
			}

			//檢查標籤是否要儲存
			tagname_point1 = blogitembody.indexOf(" ", i);
			tagname_point2 = blogitembody.indexOf(">", i);
			if (tagname_point2 < tagname_point1 || tagname_point1 == -1) {
				tagname_point = tagname_point2;
			}
			else {
				tagname_point = tagname_point1;
			}
			tagname = blogitembody.substr(parseInt(i+1, 10), tagname_point - parseInt(i+1, 10));
			no_save = "false";
			for (st_i = 0; st_i < stop_tag; st_i++)
			{
				if (tagname == stop_tag[st_i])
				{
					no_save = "true";
					break;
				}
			}

			if (no_save == "false")
			{
				tags[tag_i] = tagname;
				tag_i++;
			}
	   
			//跳躍到標籤結束為止
			i = blogitembody.indexOf(">", parseInt(i, 10));
			
			//continue;
			i++;
			setTimeout(function () {	process(blogitembody, i, digest_point);	}, interval);
			return;
		}
 
		//儲存字元
		chr_no_save = "false";
		for (sc_i = 0; sc_i < stop_chr.length; sc_i++)
		{
			if (now_chr == stop_chr[sc_i])
			{
				chr_no_save = "true";
				break;
			}
		}
		if (chr_no_save == "false" && now_chr != "<")
		{
			word_num++;
			//alert("'"+blogitembody.substr(i-1, 3)+"'");
		}
	 
		//檢查是否超過限制字元
		if (word_num > word_max + tags.length)
		{
			//break;
			ending(i, tags);
			return;
		}
		else
		{
			i++;
			setTimeout(function () {	process(blogitembody, i, digest_point);	}, interval);
			return;
		}
	};	//var process = function (blogitembody, i, digest_point)
	//alert(word_num);
	
	var ending = function (i, tags) 
	{
		digest_point = parseInt(i+1, 10);

		//檢查是否有結尾標籤
		var temp_dp = blogitembody.indexOf("</" , digest_point);
		if (temp_dp - digest_point < word_min && temp_dp != -1) {
			digest_point = temp_dp;
		}
		  
		//標籤還原
		end_tag = "";
		//alert(tag_i);
		  
		for (i = (tag_i-1) ; i > -1; i--) {
			//alert("</"+ tags[i] + ">");
			if (typeof(tags[i]) != 'undefined' &&
			tags[i].substr(0, 1) != "/") {
				end_tag = end_tag + '</' + tags[i] + '>';
			}
		}

		//alert(end_tag);

		//alert(blogitembody.substr(0, digest_point)); 
		var body_len;
		if (blogitembody.toLowerCase().substr(blogitembody.length - 56, 56) == '<div style="clear:both; padding-bottom: 0.25em;"></div>') {
				body_len = blogitembody.length - (tag_i * 5) - 56;
		}
		else {
			body_len = blogitembody.length - (tag_i * 5);
		}
		
		//alert(blogitembody.toLowerCase().substr(blogitembody.length-56, 56) + " -- " + body_len + " -- " + digest_point);

		if (digest_point < body_len && digest_point != -1)
		{
			continue_reading1 = "……";
			continue_reading2 = this.contiReading("show all", pBD.langContiReadAll);

			//隱藏全文
			hidden_reading = this.contiReading("show only digest", pBD.langShowDigest);
			blogitembody_digest_ohter = blogitembody.substr(0, digest_point) 
				+ '<a id="'+id+'-digest_point" name="'+id+'-digest_point"></a>'
				+ blogitembody.substr(digest_point, blogitembody.length-digest_point);
			blogitembody_digest_ohter = '<div class="post_hidden puli-blogger-digest" id="'+id+'-hidden" style="display:none;clear:both;">'
				+ "<textarea class='post_hidden text'>" + blogitembody_digest_ohter + "</textarea>"
				+ hidden_reading + '</div>';
		  }
		  else
		  {
			 continue_reading1 = "";
			 continue_reading2 = "";
			 
			 blogitembody_digest_ohter = '';
		  }
		  
		  //alert(end_tag);
			blogitembody_digest = blogitembody.substr(0, digest_point) + continue_reading1 + end_tag;
		
			var postShow = jQuery('<div class="post_show puli-blogger-digest" name="'+id+'-show" id="'+id+'-show" style="clear:both;"></div>')
				.append(blogitembody_digest)
				.append(continue_reading2);
			postShow.find("script").remove();
			
			pbObj.html(postShow);
			if (!(blogitembody_digest_ohter === "" || typeof(blogitembody_digest_ohter) == "undefined"))
			{
	  			var postHidden = jQuery(blogitembody_digest_ohter);
				pbObj.append(postHidden);
			}
			
			returnCallback();
			return;
	};	//var ending = function () 
	process(blogitembody, 0, digest_point);
	
	};	//pBD.doDigest = function(callback)
	//function digest_blogbody----------------------------------------------------
	
	pBD.digest_show = function(id)
	{
	
	  if (document.getElementById(id+"-show").style.display === ""
		 || document.getElementById(id+"-show").style.display == "block")
	  {		
		 jQuery("#"+id+"-show").hide();
		 var hidden = jQuery("#"+id+"-hidden");
		 var textarea = hidden.children("textarea.post_hidden.text");
		 if (textarea.length == 1)
		 {
		 	var text = textarea.text();
		 	textarea.remove();
		 	hidden.prepend(jQuery("<div>" + text + "</div>"));
		 }
		 
		 hidden.show();
	  }
	  else
	  {
		 jQuery("#"+id+"-hidden").hide();
		 jQuery("#"+id+"-show").show();
		 document.getElementById(id+"-show").parentNode.parentNode.scrollIntoView(true);
		 //jQuery("#"+id+"-show").parent().scrollIntoView(true);
	  }	
	  return false;
	};	//pBD.digest_show = function(id)
	
	pBD.is_blogger_fullpage = function()
	{
	  var href_array = location.href.split("/");
	  //var href_array2 = location.href.split("\\");
	  if (href_array.length > 5 && href_array[4] != "label" && href_array[0] != "file:") {
	  	return true;
	  }
	  else {
	  	return false;
	  }
	};
	return pBD;
}
