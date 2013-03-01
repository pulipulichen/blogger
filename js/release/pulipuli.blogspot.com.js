// JavaScript Document
// LAST UPDATE: 2010.6.9
// Dropbox URL: http://dl.dropbox.com/u/717137/blogger/pulipuli.blogspot.com.js

/**
 * 如果要停止功能，請加入<span class="disable-post-catalog"></span>
 */

if (typeof(is_blogger_fullpage) != 'function')
{
	is_blogger_fullpage = function ()
	{
	  var href_array = location.href.split("/");
	  //var href_array2 = location.href.split("\\");
	  if (href_array.length > 5 && href_array[4] != "label" && href_array[0] != "file:")
	    return true;
	  else
	    return false;
	};
}

if (typeof($.create_id) != 'function')
{
	$.create_id = function () {
	    return (new Date()).getTime() + '';
	};
}

$.puliPostCatalog = function (cata_container, heading) {
	
	if (is_blogger_fullpage() == false)
		return;
	
	$(function () {	//頁面讀取完之後，再進行讀取

	if (heading == null)
		heading = "h4";
	
	if (cata_container == null)
	{
		if ($('div.post-body .disable-post-catalog').length > 0)
		{
			return;
		}
		
		var firstHeading = $('div.post-body:first > '+heading+':first');
		
		if (firstHeading.length == 0)
		{
			return;
		}
		
		//如果firstHeading之前有hr，則移除之
		var hr = firstHeading.prev().filter('hr');
		if (hr.length > 0)
			hr.remove();
		else
		{
			var div = firstHeading.prevAll("div:first");
			hr = div.children(':last').filter('hr');
			if (hr.length > 0)
				hr.remove();
		}
		
		cata_container = $('<span></span>')
			.insertBefore(firstHeading);
		cata_container.attr('id', 'postcata'+$.create_id());
		
		
	}
	
	//get cataSlt ID
	var cata = jQuery(cata_container);
	var prefix = cata.attr("id");
	
	//取得divID所在的所有的heading
	var postBody = jQuery(cata_container).parents("div.post-body:first");
	//postBody.css("border", "1px solid red");
	
	if (postBody.find('.cate-title').length > 0)
		return;
	
	
	var headingAry = postBody.find("h4,h5");
	var headingTop = [];
	var topId = {};
	for (var i = 0; i < headingAry.length; i++)
	{
		var heading = headingAry.eq(i);
		var top = heading.offset().top;
		topId[top] = heading;
		headingTop.push(top);
	}
	
	//然後將headingTop排序
	headingTop.sort(function (a, b) { return a - b; });
	
	//重新輸入headingAry
	headingAry = [];
	for (var i = 0; i < headingTop.length; i++)
	{
		var top = headingTop[i];
		var heading = topId[top];
		headingAry.push(heading);
	}
	
	//headingAry.css("border", "1px solid red");

	var cataTitleID = prefix+"cataTitle";
	var cataTitle = jQuery("<div class='cata-title' style='width: 75%'>"
		//+ '目錄's
		+ "<a name='"+cataTitleID+"' id='"+cataTitleID+"' /></div>");
		
	var goCata = jQuery('<a style="margin:0;padding:0;text-decoration:none;font-size:smaller;font-weight:normal;float:right;" href="#'+cataTitleID+'"><sup>&lt;^&gt;</sup></a>');

	var ulObj = jQuery("<ul></ul>");
	//在每個Heading後面加入錨點
	for (var i = 0; i < headingAry.length; i++)
	{
		var hdObj = headingAry[i];
		
		var title = hdObj.text();
		//脫逸「<」成為「&lt;」、「>」成為「&gt;」
		title = title.replace(/</g, '&lt;').replace(/>/g, '&gt;');
		
		var anchorID = prefix + "_anchor" + i;
		
		var anc = jQuery("<a id='"+anchorID+"' name='"+anchorID+"' />");
		hdObj.prepend(anc);
		
		hdObj.prepend(goCata.clone());
		
		var tagName = hdObj.attr('tagName').toLowerCase();
		
		var hd = jQuery("<li><a href='#"+anchorID+"'>"+title+"</a></li>");
		
		if (tagName == 'h4')
		{
			ulObj.append(hd);
		}
		else
		{
			var lastHd = ulObj.children('li:last');
			
			if (lastHd.length == 0)
			{
				lastHd = $('<li></li>').appendTo(ulObj);
			}
			
			var lastUl = lastHd.children("ul:last");
			
			if (lastUl.length == 0)
			{
				lastUl = $('<ul></ul>').appendTo(lastHd);
			}
			
			lastUl.append(hd);
		}
		
	}
	
	if (headingAry.length != 0)
	{
		
		cata_container.append(cataTitle)
			.append(ulObj);
		
		//postBody.prepend("<hr width='75%' />");
		cata_container.prepend("<hr width='75%' />");
		cata_container.append("<hr width='75%' />");
		//postBody.prepend(ulObj);
		//postBody.prepend(cataTitle);
	}
	
	});	//$(function () {
	
};

(function($){$.fn.lazyload=function(options){var settings={threshold:0,failurelimit:0,event:"scroll",effect:"show",container:window};if(options){$.extend(settings,options);}
var elements=this;if("scroll"==settings.event){$(settings.container).bind("scroll",function(event){var counter=0;elements.each(function(){if($.abovethetop(this,settings)||$.leftofbegin(this,settings)){}else if(!$.belowthefold(this,settings)&&!$.rightoffold(this,settings)){$(this).trigger("appear");}else{if(counter++>settings.failurelimit){return false;}}});var temp=$.grep(elements,function(element){return!element.loaded;});elements=$(temp);});}
this.each(function(){var self=this;if(undefined==$(self).attr("original")){$(self).attr("original",$(self).attr("src"));}
if("scroll"!=settings.event||undefined==$(self).attr("src")||settings.placeholder==$(self).attr("src")||($.abovethetop(self,settings)||$.leftofbegin(self,settings)||$.belowthefold(self,settings)||$.rightoffold(self,settings))){if(settings.placeholder){$(self).attr("src",settings.placeholder);}else{$(self).removeAttr("src");}
self.loaded=false;}else{self.loaded=true;}
$(self).one("appear",function(){if(!this.loaded){$("<img />").bind("load",function(){$(self).hide().attr("src",$(self).attr("original"))
[settings.effect](settings.effectspeed);self.loaded=true;}).attr("src",$(self).attr("original"));};});if("scroll"!=settings.event){$(self).bind(settings.event,function(event){if(!self.loaded){$(self).trigger("appear");}});}});$(settings.container).trigger(settings.event);return this;};$.belowthefold=function(element,settings){if(settings.container===undefined||settings.container===window){var fold=$(window).height()+$(window).scrollTop();}else{var fold=$(settings.container).offset().top+$(settings.container).height();}
return fold<=$(element).offset().top-settings.threshold;};$.rightoffold=function(element,settings){if(settings.container===undefined||settings.container===window){var fold=$(window).width()+$(window).scrollLeft();}else{var fold=$(settings.container).offset().left+$(settings.container).width();}
return fold<=$(element).offset().left-settings.threshold;};$.abovethetop=function(element,settings){if(settings.container===undefined||settings.container===window){var fold=$(window).scrollTop();}else{var fold=$(settings.container).offset().top;}
return fold>=$(element).offset().top+settings.threshold+$(element).height();};$.leftofbegin=function(element,settings){if(settings.container===undefined||settings.container===window){var fold=$(window).scrollLeft();}else{var fold=$(settings.container).offset().left;}
return fold>=$(element).offset().left+settings.threshold+$(element).width();};$.extend($.expr[':'],{"below-the-fold":"$.belowthefold(a, {threshold : 0, container: window})","above-the-fold":"!$.belowthefold(a, {threshold : 0, container: window})","right-of-fold":"$.rightoffold(a, {threshold : 0, container: window})","left-of-fold":"!$.rightoffold(a, {threshold : 0, container: window})"});})(jQuery);

function puliBloggerDigest(delayTime, wordMin, wordMax, langBlogURL, langReadAll, langContiReadAll, langShowDigest)
{
	var pBD = this;
	
	pBD.setDefaultValue = function(v, defaultValue)
	{
		if (typeof(v) == "undefined")
		{
			return defaultValue;
		}
		else
		{
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
	
	pBD.stop_tag = new Array;
	pBD.stop_tag[0] = "img";
	pBD.stop_tag[1] = "br";
	
	pBD.stop_chr = new Array;
	pBD.stop_chr[0] = " ";
	pBD.stop_chr[1] = "\n";
	pBD.stop_chr[2] = "\t";
	pBD.stop_chr[3] = ">";
	pBD.stop_chr[4] = "<";
	
	pBD.skip_tag = new Array;
	pBD.skip_tag[0] = "script";
	pBD.skip_tag[1] = "style";
	
	pBD.limit = null;	//如果limit == null: 全部；limit == 1: 第一個；limit == -1 除了第一個之外
	
	pBD.doDegiest = function(callback)
	{
		pBD.doDigest(callback);
	};
	
	pBD.doDigest = function(callback)
	{
		if (pBD.is_blogger_fullpage() == true)
		{
			if (typeof(callback) == "function")
				callback();
			return;
		}
		
		var postBody = jQuery("div.post-body");
		//防止找不到div.post-body
		if (postBody.length == 0)
		{
			postBody = jQuery("div.post div.entry");
		}
		
		if (postBody.length == 0)
		{
			var divPost = jQuery("div.post");
			for (var i = 0; i < divPost.length; i++)
			{
				var post = divPost.eq(i).children(":not(a:first, h3.post-title:first, p.post-footer, :first):first");
				post.css("border", "1px solid red");
				var postBody = jQuery('<div class="post-body"></div>')
					.append(post);
				
				divPost.eq(i).children("h3.post-title:first").after(postBody);
			}
			postBody = jQuery("div.post-body");
		}
		
		var postTitleURL = jQuery("div.post").find("a[title='permanent link']");
		if (postTitleURL.length == 0)
		{
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
					if (typeof(callback) == "function")
						callback();
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
				if (typeof(callback) == "function")
					callback();
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
			 || pbObj.find("span.digest-mode.hidden-all").length != 0)
		 {
		   digest_point = 0;
		   digest_mode = "hidden_all";
		 }
	  }
	  
	  if (digest_mode == "auto")
	  {
		 digest_point = blogitembody.indexOf("<!--Show All-->", 0);
	
		 if (digest_point != -1
			 || pbObj.find("span.digest-mode.show-all").length != 0)
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
	   
		if (blogitembody.toLowerCase().substr(blogitembody.length-56, 56) == '<div style="clear:both; padding-bottom: 0.25em;"></div>')
			var body_len = blogitembody.length - 56;
		else
			var body_len = blogitembody.length;
	 	
//alert(blogitembody.toLowerCase().substr(blogitembody.length-56, 56) + " -- " + body_len + " -- " + digest_point);
	   //alert(body_len);
	 
		if (digest_point < body_len && digest_point != -1)
		{
			if (digest_mode != "hidden_all" || digest_mode != "digest")
				continue_reading1 = "……";
			else
				continue_reading1 = "";
	  
			//continue_reading2 = '<a href="'+url+'" title="post link" class="link_fullpost">(繼續閱讀)</a>'; 

			if (digest_mode == "hidden_all")
			{
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
			var text = blogitembody.substr(0, digest_point);
			each_tag = text.split("<");
			
			 //end_tags = new Array;
			 //var tag_i = 0;
		 
			for (var i = 1; i < each_tag.length; i++)
			{
				if (each_tag[i].substr(0, 1) == "/"
					|| each_tag[i].substr(0, 1) == "!")
					continue;
			
				temp = each_tag[i].split(" ", 2);
				temp2 = each_tag[i].split(">", 2);
				if (temp[0].length < temp2[0].length)
					tag = temp[0];
				else
					tag = temp2[0];
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
	var tags = new Array; //儲存每個tag，以方便還原
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
				temp_str = blogitembody.substr(eval(i+1), skip_tag[sk_i].length);
				if (temp_str == skip_tag[sk_i])
				{
					//跳躍到同樣的標籤結束為止
					i = blogitembody.indexOf("</"+skip_tag[sk_i]+">", i);
					i = eval(i) + skip_tag[sk_i].length + 3;
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
			if (tagname_point2 < tagname_point1 || tagname_point1 == -1)
				tagname_point = tagname_point2;
			else
				tagname_point = tagname_point1;
	   
			tagname = blogitembody.substr(eval(i+1), tagname_point - eval(i+1));
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
			i = blogitembody.indexOf(">", eval(i));
			
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
		digest_point = eval(i+1);

		//檢查是否有結尾標籤
		var temp_dp = blogitembody.indexOf("</" , digest_point);
		if (temp_dp - digest_point < word_min && temp_dp != -1)
			digest_point = temp_dp;
		  
		//標籤還原
		end_tag = "";
		//alert(tag_i);
		  
		for (var i = (tag_i-1) ; i > -1; i--)
		{
			//alert("</"+ tags[i] + ">");
			if (typeof(tags[i]) != 'undefined'
				&& tags[i].substr(0,1) != "/")
				end_tag = end_tag + '</'+ tags[i] + '>';
		}

		//alert(end_tag);

		//alert(blogitembody.substr(0, digest_point)); 

		if (blogitembody.toLowerCase().substr(blogitembody.length-56, 56) == '<div style="clear:both; padding-bottom: 0.25em;"></div>')
		{
			var body_len = blogitembody.length - (tag_i * 5) - 56;
		}
		else
			var body_len = blogitembody.length - (tag_i * 5);
		
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
			if (!(blogitembody_digest_ohter == "" || typeof(blogitembody_digest_ohter) == "undefined"))
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
	
	  if (document.getElementById(id+"-show").style.display == ""
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
	  if (href_array.length > 5 && href_array[4] != "label" && href_array[0] != "file:")
		return true;
	  else
		return false;
	};	//pBD.is_blogger_fullpage = function()
	return pBD;
}


/*
	--------------------------------
	Infinite Scroll
	--------------------------------
	+ https://github.com/paulirish/infinitescroll
	+ version 2.0b2.110617
	+ Copyright 2011 Paul Irish & Luke Shumard
	+ Licensed under the MIT license
	
	+ Documentation: http://infinite-scroll.com/
	
*/

(function (window, $, undefined) {
	
	$.infinitescroll = function infscr(options, callback, element) {
		
		this.element = $(element);
		this._create(options, callback);
	
	};
	
	$.infinitescroll.defaults = {
		callback: function () { },
		debug: false,
		behavior: undefined,
		binder: $(window), // used to cache the selector
		nextSelector: "div.navigation a:first",
		loadMsgSelector: null,
		loadingMsgRevealSpeed: 'fast', // controls how fast you want the loading message to come in, ex: 'fast', 'slow', 200 (milliseconds)
		loadingImg: "https://sites.google.com/site/puddingchen35/blogger-image/loading.gif",
		loadingText: "<em>Loading the next set of posts...</em>",
		loadingStart: undefined,
		loadingEnd: undefined,
		donetext: "<em>Congratulations, you've reached the end of the internet.</em>",
		navSelector: "div.navigation",
		contentSelector: null, // rename to pageFragment
		extraScrollPx: 150,
		itemSelector: "div.post",
		animate: false,
		pathParse: undefined,
		dataType: 'html',
		appendCallback: true,
		bufferPx: 40,
		orientation: 'height',
		errorCallback: function () { },
		currPage: 1,
		infid: 0, //Instance ID
		isDuringAjax: false,
		isInvalidPage: false,
		isDestroyed: false,
		isDone: false, // For when it goes all the way through the archive.
		isPaused: false,
		pixelsFromNavToBottom: undefined,
		pagesLoaded: null,
		path: undefined,
		loadingMsg: undefined
	};


    $.infinitescroll.prototype = {

        /*	
        ----------------------------
        Private methods
        ----------------------------
        */

        // Bind or unbind from scroll
        _binding: function infscr_binding(binding) {

            var instance = this;

            if (binding !== 'bind' && binding !== 'unbind') {
                this._debug('Binding value  ' + binding + ' not valid');
                return false;
            }

            if (binding == 'unbind') {

                (this.options.binder).unbind('smartscroll.infscr.' + instance.options.infid);

            } else {

                (this.options.binder)[binding]('smartscroll.infscr.' + instance.options.infid, function () {
                    instance.scroll();
                });

            };

            this._debug('Binding', binding);

        },

		// Fundamental aspects of the plugin are initialized
		_create: function infscr_create(options, callback) {

            // If selectors from options aren't valid, return false
            if (!this._validate(options)) { return false; }

            // Define options and shorthand
            var opts = this.options = $.extend({}, $.infinitescroll.defaults, options),
				// get the relative URL - everything past the domain name.
				relurl = /(.*?\/\/).*?(\/.*)/,
				path = this._get_next_path();
				
            // contentSelector is 'page fragment' option for .load() / .ajax() calls
            opts.contentSelector = opts.contentSelector || this.element;

            // loadMsgSelector - if we want to place the load message in a specific selector, defaulted to the contentSelector
            opts.loadMsgSelector = opts.loadMsgSelector || opts.contentSelector;

            // if there's not path, return
            if (!path) { this._debug('Navigation selector not found'); return; }

            // Set the path to be a relative URL from root.
            opts.path = this._determinepath(path);

            // Define loadingMsg
            opts.loadingMsg = $('<div id="infscr-loading" style="text-align:center;"><img alt="Loading..." src="' + opts.loadingImg + '" /><div><a class="loading-msg" href="">' + opts.loadingText + '</a></div></div>');
            
            var _infinitescroll = this;
            opts.setupLoadingMsgLink = function () {
	            var _next_path = _infinitescroll._get_next_path();
		    	if (_next_path.length > 0 && typeof(opts.loadingMsg) != "undefined")
		    	{
		    		opts.loadingMsg.find(".loading-msg").attr("href", _next_path[0]);
		    	}
		    };
		    
		    opts.setupLoadingMsgLink();

            // Preload loadingImg
            (new Image()).src = opts.loadingImg;

            // distance from nav links to bottom
            // computed as: height of the document + top offset of container - top offset of nav link
            opts.pixelsFromNavToBottom = $(document).height() - $(opts.navSelector).offset().top;

			// determine loadingStart actions
            opts.loadingStart = opts.loadingStart || function() {
				
				$(opts.navSelector).hide();

				opts.loadingMsg
					.appendTo(opts.loadMsgSelector)
					.show(opts.loadingMsgRevealSpeed, function () {
						
						opts.setupLoadingMsgLink();
						
	                	beginAjax(opts);
	            });
			};
			
			// determine loadingEnd actions
			opts.loadingEnd = opts.loadingEnd || function() {
				opts.loadingMsg.fadeOut('normal');
			};

            // callback loading
            opts.callback = callback || function () { };

            this._setup();

        },

        // Console log wrapper
        _debug: function infscr_debug() {

            if (this.options.debug) {
                return window.console && console.log.call(console, arguments);
            }

        },

        // find the number to increment in the path.
        _determinepath: function infscr_determinepath(path) {
        	
			return this._get_next_path();	
			
            var opts = this.options;

            if ($.isFunction(opts.pathParse)) {

                this._debug('pathParse');
                return [path];

            } else if (path.match(/^(.*?)\b2\b(.*?$)/)) {
                path = path.match(/^(.*?)\b2\b(.*?$)/).slice(1);

                // if there is any 2 in the url at all.    
            } else if (path.match(/^(.*?)2(.*?$)/)) {

                // page= is used in django:
                // http://www.infinite-scroll.com/changelog/comment-page-1/#comment-127
                if (path.match(/^(.*?page=)2(\/.*|$)/)) {
                    path = path.match(/^(.*?page=)2(\/.*|$)/).slice(1);
                    return path;
                }

                path = path.match(/^(.*?)2(.*?$)/).slice(1);

            } else {

                // page= is used in drupal too but second page is page=1 not page=2:
                // thx Jerod Fritz, vladikoff
                if (path.match(/^(.*?page=)1(\/.*|$)/)) {
                    path = path.match(/^(.*?page=)1(\/.*|$)/).slice(1);
                    return path;
                } else {
                    this._debug('Sorry, we couldn\'t parse your Next (Previous Posts) URL. Verify your the css selector points to the correct A tag. If you still get this error: yell, scream, and kindly ask for help at infinite-scroll.com.');
                    // Get rid of isInvalidPage to allow permalink to state
                    opts.isInvalidPage = true;  //prevent it from running on this page.
                }
            }
            this._debug('determinePath', path);
            return path;

        },

        // Custom error
        _error: function infscr_error(xhr) {

            var opts = this.options;

            if (xhr !== 'destroy' && xhr !== 'end') {
                xhr = 'unknown';
            }

            this._debug('Error', xhr);

            if (xhr == 'end') {
                this._showdonemsg();
            }

            opts.isDone = true;
            opts.currPage = 1; // if you need to go back to this instance
            opts.isPaused = false;
            this.binding('unbind');

        },

        // Load Callback
        _loadcallback: function infscr_loadcallback(box, data) {

            var opts = this.options,
	    		callback = this.options.callback, // GLOBAL OBJECT FOR CALLBACK
	    		result = (opts.isDone) ? 'done' : (!opts.appendCallback) ? 'no-append' : 'append',
	    		frag;

            switch (result) {

                case 'done':

                    this._showdonemsg();
                    return false;

                    break;

                case 'no-append':

                    if (opts.dataType == 'html') {
                        data = '<div>' + data + '</div>';
                        data = $(data).find(opts.itemSelector);
                    };

                    break;

                case 'append':

                    var children = box.children();

                    // if it didn't return anything
                    if (children.length == 0) {
                        return this._error('end');
                    }


                    // use a documentFragment because it works when content is going into a table or UL
                    frag = document.createDocumentFragment();
                    while (box[0].firstChild) {
                        frag.appendChild(box[0].firstChild);
                    }

                    this._debug('contentSelector', $(opts.contentSelector)[0]);
                    $(opts.contentSelector)[0].appendChild(frag);
                    // previously, we would pass in the new DOM element as context for the callback
                    // however we're now using a documentfragment, which doesnt havent parents or children,
                    // so the context is the contentContainer guy, and we pass in an array
                    //   of the elements collected as the first argument.

                    data = children.get();


                    break;

            }

            // loadingEnd function
			opts.loadingEnd.call($(opts.contentSelector)[0],opts);
            

            // smooth scroll to ease in the new content
            if (opts.animate) {
                var scrollTo = $(window).scrollTop() + $('#infscr-loading').height() + opts.extraScrollPx + 'px';
                $('html,body').animate({ scrollTop: scrollTo }, 800, function () { opts.isDuringAjax = false; });
            }

            if (!opts.animate) opts.isDuringAjax = false; // once the call is done, we can allow it again.

            callback.call($(opts.contentSelector)[0], data);

        },

        _nearbottom: function infscr_nearbottom() {

            var opts = this.options,
	        	pixelsFromWindowBottomToBottom = 0 + $(document).height() - (opts.binder.scrollTop()) - $(window).height();

            this._debug('math:', pixelsFromWindowBottomToBottom, opts.pixelsFromNavToBottom);

            // if distance remaining in the scroll (including buffer) is less than the orignal nav to bottom....
            return (pixelsFromWindowBottomToBottom - opts.bufferPx < opts.pixelsFromNavToBottom);

        },

		// Pause / temporarily disable plugin from firing
        _pausing: function infscr_pausing(pause) {

            var opts = this.options;

            // If pause is not 'pause' or 'resume', toggle it's value
            if (pause !== 'pause' && pause !== 'resume' && pause !== null) {
                this._debug('Invalid argument. Toggling pause value instead');
            };

            pause = (pause && (pause == 'pause' || pause == 'resume')) ? pause : 'toggle';

            switch (pause) {
                case 'pause':
                    opts.isPaused = true;
                    break;

                case 'resume':
                    opts.isPaused = false;
                    break;

                case 'toggle':
                    opts.isPaused = !opts.isPaused;
                    break;
            }

            this._debug('Paused', opts.isPaused);
            return false;

        },

		// Behavior is determined
		// If the behavior option is undefined, it will set to default and bind to scroll
		_setup: function infscr_setup() {
			
			var opts = this.options;
			(!opts.behavior)? this._binding('bind') : this['_setup_'+opts.behavior]();
			
			return false;
			
		},

        // Show done message
        _showdonemsg: function infscr_showdonemsg() {

            var opts = this.options;

            opts.loadingMsg
	    		.find('img')
	    		.hide()
	    		.parent()
	    		.find('div').html(opts.donetext).animate({ opacity: 1 }, 2000, function () {
	    		    //$(this).parent().fadeOut('normal');
	    		    $(this).parent().slideUp('normal');
	    		});
	    	
            // user provided callback when done    
            opts.errorCallback.call($(opts.contentSelector)[0],'done');

        },

        // grab each selector option and see if any fail
        _validate: function infscr_validate(opts) {

            for (var key in opts) {
                if (key.indexOf && key.indexOf('Selector') > -1 && $(opts[key]).length === 0) {
                    this._debug('Your ' + key + ' found no elements.');
                    return false;
                }
                return true;
            }

        },
        	
        _get_next_path : function () {
        	var opts = this.options;
        	var nextSelector = $(opts.nextSelector);
        	var path = nextSelector.attr('href');
        	path = [path];
        	//nextSelector.remove();
        	return path;
        },

        /*	
        ----------------------------
        Public methods
        ----------------------------
        */

		// Bind to scroll
		bind: function infscr_bind() {
			this._binding('bind');
		},

        // Destroy current instance of plugin
        destroy: function infscr_destroy() {

            this.options.isDestroyed = true;
            return this._error('destroy');

        },

		// Set pause value to false
		pause: function infscr_pause() {
			this._pausing('pause');
		},
		
		// Set pause value to false
		resume: function infscr_resume() {
			this._pausing('resume');
		},

        // Retrieve next set of content items
        retrieve: function infscr_retrieve(pageNum) {

            var instance = this,
				opts = instance.options,
				path = this._get_next_path(),
				box, frag, desturl, method, condition,
	    		pageNum = pageNum || null,
				getPage = (!!pageNum) ? pageNum : opts.currPage;
				beginAjax = function infscr_ajax(opts) {
					
					// increment the URL bit. e.g. /page/3/
	                opts.currPage++;

	                instance._debug('heading into ajax', path);

	                // if we're dealing with a table we can't use DIVs
	                box = $(opts.contentSelector).is('table') ? $('<tbody/>') : $('<div/>');

	                desturl = ($.isFunction(opts.pathParse)) ? opts.pathParse(path.join('2'), opts.currPage) : path.join(opts.currPage);

	                method = (opts.dataType == 'html' || opts.dataType == 'json') ? opts.dataType : 'html+callback';
	                if (opts.appendCallback && opts.dataType == 'html') method += '+callback';

	                switch (method) {

	                    case 'html+callback':

	                        instance._debug('Using HTML via .load() method');
	                        box.load(desturl + ' ' + opts.itemSelector, null, function infscr_ajax_callback(responseText) {
	                            instance._loadcallback(box, responseText);
	                        });

	                        break;

	                    case 'html':
	                    case 'json':

	                        instance._debug('Using ' + (method.toUpperCase()) + ' via $.ajax() method');
	                        $.ajax({
	                            // params
	                            url: desturl,
	                            dataType: opts.dataType,
	                            complete: function infscr_ajax_callback(jqXHR, textStatus) {
	                                condition = (typeof (jqXHR.isResolved) !== 'undefined') ? (jqXHR.isResolved()) : (textStatus === "success" || textStatus === "notmodified");
	                                (condition) ? instance._loadcallback(box, jqXHR.responseText) : instance._error('end');
	                            }
	                        });
	
	                        break;
	                }
				};

            
			// for manual triggers, if destroyed, get out of here
			if (opts.isDestroyed) {
                this._debug('Instance is destroyed');
                return false;
            };

            // we dont want to fire the ajax multiple times
            opts.isDuringAjax = true;

            opts.loadingStart.call($(opts.contentSelector)[0],opts);

        },

        // Check to see next page is needed
        scroll: function infscr_scroll() {

            var opts = this.options;

            if (opts.isDuringAjax || opts.isInvalidPage || opts.isDone || opts.isDestroyed || opts.isPaused) return;

            if (!this._nearbottom()) return;

            this.retrieve();

        },
		
		// Toggle pause value
		toggle: function infscr_toggle() {
			this._pausing();
		},
		
		// Unbind from scroll
		unbind: function infscr_unbind() {
			this._binding('unbind');
		}

    };


    /*	
    ----------------------------
    Infinite Scroll function
    ----------------------------
	
    Borrowed logic from the following...
	
    jQuery UI
    - https://github.com/jquery/jquery-ui/blob/master/ui/jquery.ui.widget.js
	
    jCarousel
    - https://github.com/jsor/jcarousel/blob/master/lib/jquery.jcarousel.js
	
    Masonry
    - https://github.com/desandro/masonry/blob/master/jquery.masonry.js		
	
    */

    $.fn.infinitescroll = function infscr_init(options, callback) {


        var thisCall = typeof options;

        switch (thisCall) {

            // method 
            case 'string':

                var args = Array.prototype.slice.call(arguments, 1);

                this.each(function () {

                    var instance = $.data(this, 'infinitescroll');

                    if (!instance) {
                        // not setup yet
                        // return $.error('Method ' + options + ' cannot be called until Infinite Scroll is setup');
						return false;
                    }
                    if (!$.isFunction(instance[options]) || options.charAt(0) === "_") {
                        // return $.error('No such method ' + options + ' for Infinite Scroll');
						return false;
                    }

                    // no errors!
                    instance[options].apply(instance, args);

                });

                break;

            // creation 
            case 'object':

                this.each(function () {

                    var instance = $.data(this, 'infinitescroll');

                    if (instance) {

                        // go for it
                        // instance._create(options);

                    } else {

                        // initialize new instance
                        $.data(this, 'infinitescroll', new $.infinitescroll(options, callback, this));

                    }

                });

                break;

        }

        return this;

    };



    /* 
    * smartscroll: debounced scroll event for jQuery *
    * https://github.com/lukeshumard/smartscroll
    * Based on smartresize by @louis_remi: https://github.com/lrbabe/jquery.smartresize.js *
    * Copyright 2011 Louis-Remi & Luke Shumard * Licensed under the MIT license. *
    */

    var event = $.event,
		scrollTimeout;

    event.special.smartscroll = {
        setup: function () {
            $(this).bind("scroll", event.special.smartscroll.handler);
        },
        teardown: function () {
            $(this).unbind("scroll", event.special.smartscroll.handler);
        },
        handler: function (event, execAsap) {
            // Save the context
            var context = this,
		      args = arguments;

            // set correct event type
            event.type = "smartscroll";

            if (scrollTimeout) { clearTimeout(scrollTimeout); }
            scrollTimeout = setTimeout(function () {
                jQuery.event.handle.apply(context, args);
            }, execAsap === "execAsap" ? 0 : 100);
        }
    };

    $.fn.smartscroll = function (fn) {
        return fn ? this.bind("smartscroll", fn) : this.trigger("smartscroll", ["execAsap"]);
    };


})(window, jQuery);

/**
 * blogger.js
 * 20110707 by Pudding Chen
 */

/**
 * Global Config
 */
//for LinkWithin
var linkwithin_site_id = 226251;
var addthis_config = {
   services_compact: 'plurk,twitter,facebook,hemidemi,funp,delicious,digg,blogger,readitlater,evernote,googlebuzz,googlereader,igoogle,messenger,email,print',
   "data_track_clickback":true
};

function digest_show(id)
{

  if (document.getElementById(id+"-show").style.display == ""
	 || document.getElementById(id+"-show").style.display == "block")
  {
	 //document.getElementById(id+"-show").style.display = "none";
	 //document.getElementById(id+"-hidden").style.display = "block";
	 jQuery("#"+id+"-show").hide();
	 jQuery("#"+id+"-hidden").show();
	 //location.href = "#"+id+"-digest_point";
  }
  else
  {
	 jQuery("#"+id+"-hidden").hide();
	 jQuery("#"+id+"-show").show();
	 //document.getElementById(id+"-hidden").style.display = "none";
	 //document.getElementById(id+"-show").style.display = "block";
	 //document.getElementById(id+"-show").scrollIntoView(true);
	 document.getElementById(id+"-show").parentNode.parentNode.scrollIntoView(true);
  }
	return false;
}


function sidebar_control(mode)
{ 
  //判斷模式
  
  if (jQuery("#main").css("display") != "none"
	&& jQuery("#sidebar-wrapper").css("display") != "none")
  {
	if (mode == 0) mode = "max";
	else if (mode == 1) mode = "hidden";
  }
  else if (mode == 0 
	&& jQuery("#main").css("display") != "none")
  		mode = "normal";
  else if (mode == 1 
	&& jQuery("#sidebar-wrapper").css("display") != "none")
  		mode = "normal";
  else
  	return;
  
  
  var normal_left = "65%";
  var normal_right = "30%";
  var max_length = "97%";
  var min_length = "0%";
  
  var mainID = "#main";
  /*
  if (is_blogger_fullpage() == false)
  	var mainID = "#main";
  else
  	var mainID = "#main-wrapper";
  */
  jQuery(mainID).show();
  jQuery("#sidebar-wrapper").show();

  //alert(mode);
  if (mode == 'normal')
  {
	jQuery("#sidebar-wrapper").animate({
			width: normal_right
		}, 500);
	jQuery(mainID).animate({
			width: normal_left
		}, 500);
  }
  else if (mode == 'hidden')
  {
	jQuery("#sidebar-wrapper").animate({
			width: min_length
		}, 500, "linear", function () {
			jQuery("#sidebar-wrapper").hide();
		});
	jQuery(mainID).animate({
		width: max_length
	}, 500);
  }	
  else if (mode == 'max')
  {
	jQuery(mainID).animate({
			width: min_length
		}, 500, "linear", function () {
			jQuery(mainID).hide();
		});
	jQuery("#sidebar-wrapper").animate({
		width: max_length
	}, 500, "linear");
  }
}

function is_blogger_fullpage()
{
  var href_array = location.href.split("/");
  //var href_array2 = location.href.split("\\");
  if (href_array.length > 5 && href_array[4] != "label" && href_array[0] != "file:")
    return true;
  else
    return false;
}

function is_blogger_search()
{
	return ((location.href.indexOf(".blogspot.com/search?") > -1) || (location.href.indexOf(".blogspot.com/search/") > -1));
}

function is_blogger_label()
{
	return (location.href.indexOf(".blogspot.com/search/label/") > -1);
}

function is_blogger_archive() 
{
	var needle = "_archive.html";
	var url = location.href;
	return (url.substring(url.length - needle.length, url.length) == needle);
}


function generateBreadcrumbs(outputSlt) 
{
	if (is_blogger_fullpage() == false)
		return "";
		
	  var strHref = location.href.toLowerCase();
	  var intWhereAt = strHref.lastIndexOf('/', strHref.indexOf('.html'));
	  var intYear = parseInt(strHref.substr(intWhereAt - 7, 4));
	  var homepage = '<a href="'+jQuery("h1.title a").attr("href")+'">首頁</a>';
	  var strCrumbOutput = homepage + ' &gt; <a href="/search?updated-min=' + intYear;
	  strCrumbOutput += '-01-01T00%3A00%3A00-08%3A00&updated-max=' + (intYear + 1);
	  strCrumbOutput += '-01-01T00%3A00%3A00-08%3A00">' + intYear + '年</a>';
	  
	  var intMonth = strHref.substr(intWhereAt - 2, 2);
	  if (intMonth.substr(0, 1) == '0')
	  	  intMonth = intMonth.substr(1, 1);
	  intMonth = parseInt(intMonth);
	  var intNextMonthYear = intYear;
	  var intNextMonth = intMonth + 1;
	  if (intNextMonth > 11) {
		intNextMonth = 1;
		intNextMonthYear += 1;
	  }
	  var strMonth = intMonth;
	  if (intMonth < 10) strMonth = "0" + intMonth;
	  var strNextMonth = intNextMonth;
	  if (intNextMonth < 10) strNextMonth = "0" + intNextMonth;
	  strCrumbOutput += ' &gt; <a href="/search?updated-min=' + intYear;
	  strCrumbOutput += '-' + strMonth + '-01T00%3A00%3A00-08%3A00&updated-max=' + intNextMonthYear;
	  strCrumbOutput += '-' + strNextMonth + '-01T00%3A00%3A00-08%3A00">' + strMonth + '月</a>';
	  //document.write(strCrumbOutput);
	  
	  //jQuery(outputSlt).html(strCrumbOutput);
	  return "<span class='breadcrumbs'>" + strCrumbOutput + "</span>";
}


//20090302 Create
function postCatalog(cataSlt, heading)
{
	count = location.href.split('/');
	if ((count.length != 1 &&!(count.length > 5 && count[4] != "label")) || count[0] == "file:")
	{
    	return;
    }
	
	if (typeof(heading) == "undefined")
	{
		heading = "h4";
	}
	
	//get cataSlt ID
	var cata = jQuery(cataSlt);
	var prefix = cata.attr("id");
	
	//取得divID所在的所有的heading
	var postBody = jQuery(cataSlt).parents("div.post-body:first");
	//postBody.css("border", "1px solid red");
	var headingAry = postBody.find("h4,h5");
	//headingAry.css("border", "1px solid red");

	var cataTitleID = prefix+"cataTitle";
	var cataTitle = jQuery("<div class='cata-title' style='width: 75%'>目錄<a name='"+cataTitleID+"' id='"+cataTitleID+"' /></div>");
		
	var goCata = jQuery('<a style="margin:0;padding:0;text-decoration:none;font-size:smaller;font-weight:normal;" href="#'+cataTitleID+'"><sup>&lt;^&gt;</sup></a>');


	var ulObj = jQuery("<ul></ul>");
	//在每個Heading後面加入錨點
	for (var i = 0; i < headingAry.length; i++)
	{
		var hdObj = headingAry.eq(i);
		
		var title = hdObj.text();
		var anchorID = prefix + "_anchor" + i;
		
		var anc = jQuery("<a id='"+anchorID+"' name='"+anchorID+"' />");
		hdObj.append(anc);
		
		var tagName = hdObj.attr('tagName').toLowerCase();
		
		var hd = jQuery("<li><a href='#"+anchorID+"'>"+title+"</a></li>");
		if (tagName == 'h4')
		{
			ulObj.append(hd);
		}
		else
		{
			var lastHd = ulObj.find('li:last');
			
			if (lastHd.length == 0)
			{
				lastHd = $('<li></li>').appendTo(ulObj);
			}
			
			var lastUl = lastHd.find("ul:last");
			
			if (lastUl.length == 0)
			{
				lastUl = $('<ul></ul>').appendTo(lastHd);
			}
			
			lastUl.append(hd);
		}
		
		hdObj.append(goCata.clone());
	}
	if (headingAry.length != 0)
	{
		
		postBody.prepend("<hr width='75%' />");	
		postBody.prepend(ulObj);
		postBody.prepend(cataTitle);
		
	}
	
}

function RemoveDuplicatedPosts(PostUrl)
{
  function contains(a, e) 
  {
  	for(var j = 0; j < a.length; j++)
	  if (a[j]==e)
			return true;
	return false;
  }

  var tmpUrls = new Array(0);
  var tmpTitles = new Array(0);
  var tmpDates = new Array(0);
  for(var i = 0; i < relatedUrls.length; i++) {
	if(!contains(tmpUrls, relatedUrls[i]) && PostUrl != relatedUrls[i]) {
	  tmpUrls.length += 1;
	  tmpUrls[tmpUrls.length - 1] = relatedUrls[i];
	  tmpTitles.length += 1;
	  tmpTitles[tmpTitles.length - 1] = relatedTitles[i];
	  tmpDates.length += 1;
	  tmpDates[tmpDates.length - 1] = relatedDates[i];
	}
  }
  relatedTitles = tmpTitles;
  relatedUrls = tmpUrls;
  relatedDates = tmpDates;
}

function RelatedLabels(json)
{
	if (typeof(json.feed.entry) == "undefined" || json.feed.entry == null)
		return;
	
	for (var i = 0; i < json.feed.entry.length; i++) 
	{
		var entry = json.feed.entry[i];
		relatedTitles[relatedPostsNum] = entry.title.$t;
		relatedDates[relatedPostsNum] = entry.published.$t.substr(0,10);
		for (var j = 0; j < entry.link.length; j++) 
		{
		    if (entry.link[j].rel == 'alternate')
			{
				relatedUrls[relatedPostsNum] = entry.link[j].href;
				relatedPostsNum++;
				break;
		  	}
    	}
  	}
}

function ShowRelatedPosts(PostUrl) {
	RemoveDuplicatedPosts(PostUrl);
	var r = Math.floor((relatedTitles.length - 1) * Math.random());
	var i = 0;
	var output = "";
	if (relatedTitles.length > 0) 
	{
		output = '<div style="margin-top: 1em;">相關連結: <ul>';
		while (i < relatedTitles.length && i < 5) 
		{
			output = output + '<li><a href="' + relatedUrls[r] + '">' + relatedTitles[r] + '</a> - ' + relatedDates[r] + '</li>';
			if (r < relatedTitles.length - 1)
				r++;
			else
				r = 0;
			i++;
		}
		output = output + '</ul></div>';
	}
	return output;
}

//<SCRIPT src="/feeds/posts/default/-/" + lable + "?alt=json-in-script&callback=RelatedLabels&max-results=10" type="text/javascript" />

function compareentry(a,b){
	order= Date.parse(a.published.$t.replace(/^(\d{4})-(\d{2})-(\d{2})T([0-9:]*)([.0-9]*)(.)(.*)$/,
  '$1/$2/$3 $4 GMT')) - Date.parse(b.published.$t.replace(/^(\d{4})-(\d{2})-(\d{2})T([0-9:]*)([.0-9]*)(.)(.*)$/,
  '$1/$2/$3 $4 GMT'));
	return 0-order;
}

/**
 * 最新文章
 */
function handlePostspulipuli(json) {

	if (document.getElementById("newpostspulipuli") == null)
		return;

    var title = '<h2></h2>';
	if (title == '<h2></h2>')
	  title = '';
	var temp = title + '<ul id="Feed001_feedItemListDisplay">';
    var postshow=10;
	var titlelen = '';
	var layout = "%timestamp%<br/>%title%";
	try
	{
    	var sortentry=json.feed.entry.sort(compareentry);
    }
    catch (e) {}
    for (var i=0, post; post = sortentry[i]; i++) 
    {
        if(i >= postshow) break;
        var title=post.title.$t;
		if (titlelen != "" && title.length > titlelen)
		  title = title.substr(0, titlelen) + "...";
        var link=post.link[4].href;
		var summary = post.summary.$t;
			var tmp = summary.split('"'); summary = tmp.join('&quot;');
			var tmp = summary.split('<br />'); summary = tmp.join('&nbsp;');
			var tmp = summary.split('<'); summary = tmp.join('&lt;');
			var tmp = summary.split('>'); summary = tmp.join('&gt;');
			
		var title_link = '<a href="'+link+'" title="'+summary+'">'+ title +'</a>';
		var authorname=post.author[0].name.$t;
        var timestamp=post.published.$t.substr(0,10);
		
		var layout_replace = layout.replace("%title%",title_link).replace("%timestamp%",timestamp).replace("%authorname%",authorname);
		
        temp += '<li><span class="item-title">'+layout_replace+'</span></li>';
   }
	temp+="</ul>";
	
	document.getElementById("newpostspulipuli").innerHTML = temp;
}

/**
 * 最新回應
 */
function handleCommentspulipuli(json) {
	if (document.getElementById("newcommentspulipuli") == null)
		return;
	
	var temp = '<ul id="Feedpulipuli_feedItemListDisplay">';
	var postshow= 10 ;
	var titlelen = '20';
	var layout = "%Y%-%M%-%D% %authorname%<br/>%comment%";
	try
	{
		var sortentry=json.feed.entry.sort(compareentry);
	}
	catch (e) { }
	for (var i=0, post; post = sortentry[i]; i++) 
	{
		if (i >= postshow) 
			break;
			var fulltitle = post.content.$t;
			fulltitle = fulltitle.replace("\u003CBR/\u003E", "\n");
			var tmp = fulltitle.split('<br />'); fulltitle = tmp.join('&nbsp;\n');
			tmp = fulltitle.split('<br/>'); fulltitle = tmp.join('&nbsp;\n');
			tmp = fulltitle.split('<br>'); fulltitle = tmp.join('&nbsp;\n');
			tmp = fulltitle.split('"'); fulltitle = tmp.join('&quot;');
			tmp = fulltitle.split('<'); fulltitle = tmp.join('&lt;');
			tmp = fulltitle.split('>'); fulltitle = tmp.join('&gt;');
			
		var title=fulltitle;
		tmp = title.split('&nbsp;'); title = tmp.join(' ');
		if (titlelen != "" && title.length > titlelen)
		  title = title.substr(0, titlelen) + "...";
		
		var title_temp = "";
		for (var j = 0; j < title.length; j++)
		{
			var temp_char = title.substr(j, 1);
			if (temp_char == "<")
			{
				var temp_j = title.indexOf(">", j);
				if (temp_j != -1)
					j = temp_j;
				continue;
			}
			else
				title_temp = title_temp + temp_char;
		}
		title = title_temp;
		var link=post.link[2].href;
		var title_link = '<a href="'+link+'" title="'+fulltitle+'">'+ title +'</a>';
		var authorname=post.author[0].name.$t;
		var timestamp=post.published.$t.substr(0,10);
		  var y = timestamp.substr(0, 4);
		  var m = timestamp.substr(5, 2);
		  var d = timestamp.substr(8, 2);
		
		var layout_replace = layout.replace("%comment%",title_link).replace("%Y%",y).replace("%M%",m).replace("%D%",d).replace("%authorname%",authorname);
		
		temp += '<li><span class="item-title">'+layout_replace+'</span></li>';
	  }
	  
		temp+="</ul>";
		document.getElementById("newcommentspulipuli").innerHTML = temp;

}

function handleGuestbookPulipuli(json) {
	if (document.getElementById("pulipuli_guestbook") == null)
		return;
	
	document.getElementById("pulipuli_guestbook").innerHTML = '';
	
	var temp = '<ul id="Feedpulipuli_guestbookDisplay">';
	var postshow= 20 ;
	var titlelen = '20';
	var layout = "<span class='date'>%Y%-%M%-%D%</span> <strong>%authorname%</strong>: %comment%";
	var _profile_list = {};
	
	try
	{
		var sortentry=json.feed.entry.sort(compareentry);
	}
	catch (e) { }
	var firstPost = null;
	
	var _i2 = 0;
	for (var i=0, post; post = sortentry[i]; i++) 
	{
		if (i == 0)
			firstPost = post;
		if (i >= postshow) 
			break;
		var title=post.content.$t;
			var fulltitle = title.replace("\u003CBR/\u003E", "<br />\n");
			//var tmp = fulltitle.split('<br />'); fulltitle = tmp.join('&nbsp;\n');
			//var tmp = fulltitle.split('"'); fulltitle = tmp.join('&quot;');
			//var tmp = fulltitle.split('<'); fulltitle = tmp.join('&lt;');
			//var tmp = fulltitle.split('>'); fulltitle = tmp.join('&gt;');
		//if (titlelen != "" && title.length > titlelen)
		//  title = title.substr(0, titlelen) + "...";
		var title_temp = "";
		for (var j = 0; j < title.length; j++)
		{
			var temp_char = title.substr(j, 1);
			if (temp_char == "<")
			{
				var temp_j = title.indexOf(">", j);
				if (temp_j != -1)
					j = temp_j;
				continue;
			}
			else
				title_temp = title_temp + temp_char;
		}	//for (var j = 0; j < title.length; j++)
		title = title_temp;
		
		var link= "";
		if (typeof(post.link[2]) != "undefined")
		{
			link = post.link[2].href;
		}
		var _post_link = link;
		
		var title_link = fulltitle;
		if (title_link == "此文章已被作者刪除。")
		{
			_i2++;
			continue;
		}
		var authorname=post.author[0].name.$t;
		
		if (authorname == 'Anonymous')
			authorname = '匿名';
		
		/*
		if (authorname == '布丁布丁吃布丁')
		{
			authorname = '<img src="http://1.bp.blogspot.com/_yr4MQB4zDus/SZ4Mb30N0aI/AAAAAAAAFUg/3OGhwhzBUOg/S45/" style="float:left;margin-right: 5px;width:20px; height: 20px;display:block;" border="0" /> ' 
				+ authorname;
		}
		*/
			
		var uri = '';
		if (typeof(post.author[0].uri) != 'undefined')
		{
			uri = post.author[0].uri.$t;
			if (typeof(_profile_list[uri]) == "undefined")
				_profile_list[uri] = null;
			
			authorname = '<a href="'+uri+'" target="_blank">'+authorname+'</a>';
		}
		
		var timestamp=post.published.$t.substr(0,10);
		  var y = timestamp.substr(0, 4);
		  var m = timestamp.substr(5, 2);
		  var d = timestamp.substr(8, 2);
		
		var layout_replace = layout.replace("%comment%",title_link).replace("%Y%",y).replace("%M%",m).replace("%D%",d).replace("%authorname%",authorname);
		
		var odd = 0;
		if (_i2 % 2 == 1)
			odd = 1;
		temp += '<li class="guest-book-li guest-book-li-'+odd+'"><span class="item-title">'+layout_replace+'</span></li>';
		_i2++;
	  }	//for (var i=0, post; post = sortentry[i]; i++) 
	
	var add_link = '';
	var rss_link = '';
	var reload_cmd = '';
	
	if (firstPost != null)
	{
		link = firstPost.link[0].href;
		//http://www.blogger.com/feeds/16607461/1187506547871300947/comments/default/5372166020783852457
		var parts = link.split('/');
		var blogID = parts[4];
		var postID = parts[5];
		
		var baseLink = firstPost.link[2].href;
		var pos = baseLink.indexOf('.com/');
		baseLink = baseLink.substring(0, pos + 5);

		rss_link = baseLink + 'feeds/' + postID + '/comments/default';
		add_link = 'https://www.blogger.com/comment.g?blogID=' + blogID + '&postID=' + postID;
		//https://www.blogger.com/comment.g?blogID=16607461&postID=113544406852218769
		reload_cmd = "$.getScript('"+baseLink+"feeds/"+postID+"/comments/full?alt=json-in-script&callback=handleGuestbookPulipuli')";
		//$.getScript('http://pulipuli.blogspot.com/feeds/1187506547871300947/comments/full?alt=json-in-script&callback=handleGuestbookPulipuli');
	}
	  
	  if (post = sortentry[i])
	  {
	  	link=add_link;
		
	  	temp += '<li class="guest-book-li readmore"><span class="item-title">'
			+ '<a href="'+link+'#comments" target="guestbook_write">' + '閱讀全部的留言' + '&nbsp;&gt;&gt;</a>'
			+ '</span></li>';
	  }
	temp+="</ul>";
	
	
	
	temp += '<div class="guestbook-write">'
		+ ' <a href="'+rss_link+'" style="float:right;"><img src="http://3.bp.blogspot.com/_yr4MQB4zDus/Ru35yvgloDI/AAAAAAAABOQ/bbtw-pQhpOk/s200/rss.gif" border="0" /></a>'
		
		+ ' <a href="'+add_link+'" class="write" target="guestbook_write">撰寫留言</a>'
		+ ' <a class="write" onclick="'+reload_cmd+'">重新讀取</a>'
		+ '</div>';
	
	document.getElementById("pulipuli_guestbook").innerHTML = temp;
	
	//----------------------------------------------
	// 接下來，開始讀取照片資料！
	// 網頁的網址 var link
	// 留言欄的位置 #Blog1_comments-block-wrapper
	
	var _comments_block = $("<div></div>").load(_post_link + " #Blog1_comments-block-wrapper", function () {

		// 從profile id去找圖片
		// <a href="http://www.blogger.com/profile/14890873291104464656" rel="nofollow" onclick="" class="avatar-hovercard" id="av-0-14890873291104464656"><img src="http://img2.blogblog.com/img/b16-rounded.gif" width="16" height="16" alt="" title="豪宅我來了"></a>
		// 不使用的圖片http://img2.blogblog.com/img/b16-rounded.gif
		var _guestbook = $("#pulipuli_guestbook");
		for (var _profile_uri in _profile_list)
		{
			var _img = _comments_block.find("a[href='"+_profile_uri+"'] img:first");
			if (_img.length > 0)
			{
				var _src = _img.attr("longdesc");
				if (typeof(_src) != "undefined" && _src != "http://img2.blogblog.com/img/b16-rounded.gif")
				{
					_profile_list[_profile_uri] = _src;
					
					var _guest_img = $("<img src='"+_src+"' border='0' class='pulipuli_guestbook-profile-photo' />");
					
					var _profile_search = _guestbook.find("a[href='"+_profile_uri+"']");
					for (var _i = 0; _i < _profile_search.length; _i++)
					{
						_profile_search.eq(_i).prepend(_guest_img.clone());
					}
				}
			}
		}
		_comments_block.remove();
	
	});
	
}	//function handleGuestbookPulipuli(json) {

function openIframeDiv(thisObj)
{
	var div = jQuery(thisObj);
	if (div.hasClass("iframe-div") == false)
		div = div.parents(".iframe-div:first");
	
	var src = div.find(".src").attr("value");
	var frameborder = div.find(".frameborder").attr("value");
	var width = div.find(".width").attr("value");
	var height = div.find(".height").attr("value");
	
	var iframe = jQuery("<iframe></iframe>")
		.insertAfter(div);
	div.remove();
	
	iframe.attr("src", src)
		.attr("frameborder", frameborder)
		.attr("width", width)
		.attr("height", height);
}

function getScript(url, callback)
{
	/*
	var scr = "scri" + "pt";
	
	var tag = "<"+scr+" type='text/java"+scr+"' src='"+url+"'></"+scr+">";
	jQuery("body").append(jQuery(tag));
	if (typeof(callback) == "function")
	{
		jQuery(function () {
			var time = 2000;
			//if (jQuery.browser.msie)
			//	time = 2000;
			
			setTimeout(function () {
				callback();
			}, time);
		});
	}
	*/
	jQuery.ajax({
	  url: url,
	  dataType: 'script',
	  cache: true,
	  success: callback
	});
}

//-----------------------------------------------------------------------------
function blogAjax()
{
	//	if (is_blogger_fullpage() == true)
	//jQuery("#main-wrapper").append(jQuery("#sidebar-wrapper"));
	
	var doCallback = function (callback) {
		if (typeof(callback) == "function")
			callback();
	};

	this.ajaxFunction = new Array;
	
	this.ajaxFunction.push(function (callback) {
		//過濾Google Docs
		
		var filterIframe = function (iframe) 
		{
			var src = iframe.attr("src");
				var width = iframe.attr("width");
				var height = iframe.attr("height");
				var frameborder = iframe.attr("frameborder");
				
				var link = src;
				if (link.length > 50)
				{
					link = link.substr(0, 50) + "...";
				}
				
				var iframeDiv = jQuery("<div><table onclick='openIframeDiv(this)'><tbody><tr><td valign='top'><img src='http://3.bp.blogspot.com/_yr4MQB4zDus/TA_RfdTE-TI/AAAAAAAAGw4/T1ewljZ9sSU/s320/stock_insert-floating-frame.png' /></td><td>請點此開啟內嵌網頁" + link + "</td></tr></tbody></table></div>")
					.addClass("iframe-div")
					.append("<input type='hidden' class='width' value='"+width+"' />")
					.append("<input type='hidden' class='height' value='"+height+"' />")
					.append("<input type='hidden' class='src' value='"+src+"' />")
					.append("<input type='hidden' class='frameborder' value='"+frameborder+"' />")
					.attr("onclick", "openIframeDiv(this)")
					.insertAfter(iframe);
				iframe.remove();
		};
		
		var needle = "?imgmax=800";
		var filterImg = function (imgs)
		{
			for (var i = 0; i < imgs.length; i++)
			{
				var img = imgs.eq(i);
				var src = img.attr("src");
				if (typeof(src) == "undefined")
					continue;
				
				var len = src.length;
				if (src.substring(len - needle.length, len) == needle)
				{
					src = src.substring(0, len - needle.length);
					img.attr("src", src);
				}
			}
		};
		
		if (is_blogger_fullpage() == false)
		{
			var entries = jQuery("div.blog-posts div.post .entry-content-text");
		
			for (var e = 0; e < entries.length; e++)
			{
				var element = jQuery("<div></div>").html(entries.eq(e).text());
				var iframes = element.find("iframe");
				
				for (var i = 0; i < iframes.length; i++)
				{
					var iframe = iframes.eq(i);
					filterIframe(iframe);
				}
				
				var imgs = element.find("img");
				filterImg(imgs);
				
				entries.eq(e).text(element.html());
			}	//for (var e = 0; e < entries.length; e++)
		}
		else
		{
			var iframes = jQuery("div.post-body iframe");
			for (var i = 0; i < iframes.length; i++)
			{
				var iframe = iframes.eq(i);
				
				var src = iframe.attr("src");
				var needle = "http://www.facebook.com/plugins/like.php";
				//alert([src, needle]);
				if (src.substr(0, needle.length) == needle)
					continue;
				
				filterIframe(iframe);
			}
			
			var imgs = jQuery("div.post-body img");
			filterImg(imgs);
		}
		
		doCallback(callback);
	});
	
	this.ajaxFunction.push(function (callback) {
		
		$("#main .blog-posts .post-body img").lazyload({
			effect : "fadeIn",
			placeholder: "data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAEAAAABCAYAAAAfFcSJAAAABHNCSVQICAgIfAhkiAAAAA1JREFUCJljOHTo0H8AB9YDRlccwe4AAAAASUVORK5CYII%3D"
		});
		
		doCallback(callback);
	});
	
	this.ajaxFunction.push(function (callback) {
		
		if (is_blogger_fullpage() == false)
		{
			var _older_link = $("a.blog-pager-older-link:first");
			var _link_needle = null;
			if (_older_link.length > 0)
			{
				_link_needle = _older_link.attr("href");
			}
			else
			{
				doCallback(callback);
				return;
			}
			
			$('#main-wrapper .main.section:first').infinitescroll({
			 
			    navSelector  : "#main-wrapper:last div.blog-feeds, #main-wrapper:last div.blog-pager:last",
			                   // selector for the paged navigation (it will be hidden)
			    nextSelector : "#main-wrapper:last .widget.Blog div.blog-pager:last a.blog-pager-older-link",    
			                   // selector for the NEXT link (to page 2)
			    itemSelector : "#main-wrapper .widget.Blog:first",
			                   // selector for all items you'll retrieve
			    loadingText : "下一頁讀取中……"
			}, function (arrayOfNewElems) {
				var elems = $(arrayOfNewElems);
				_older_link = elems.find("a.blog-pager-older-link");
				
				if (_older_link.length == 0)
				{
					$(window).unbind('.infscr');
					elems.find(".blog-pager").hide();
					return;
				}
				else
				{
					var _link = _older_link.attr("href");
					if (_link_needle == _link)
					{
						$(window).unbind('.infscr');
						elems.children(".blog-posts").remove();
						elems.children(".blog-pager").remove();
						return;
					}
					else
					{
						_link_needle = _link;
					}
				}
				elems.find(".status-msg-wrap").hide();
				elems.find(".blog-pager").hide();
			});
		}
		
		doCallback(callback);
	});
	
	this.ajaxFunction.push(function (callback) {
		//自動摘要
		//alert("自動摘要");
		
		if (is_blogger_search() == true 
			|| is_blogger_label() == true)
		{
			//alert("search or label: " + is_blogger_search() + "; " + is_blogger_label());
			doCallback(callback);
			return;
		}
		else if (is_blogger_fullpage() == false)
		{	
			//alert("is blogger fullpage");
			
			//jQuery.getScript("http://sites.google.com/site/puddingchen35/Home/puliBloggerDigest.js", function() {
			//getScript("http://pulipuli.hostse.com/puliBloggerDigest.js", function() {
			//getScript("http://140.119.61.174/puliBloggerDigest.js", function() {
			
				pBD = puliBloggerDigest();
				pBD.delayTime = 500; //執行延遲時間，單位是「毫秒」(1000毫秒=1秒)
				pBD.wordMin = 50; //自動摘要最少字數
				pBD.wordMax = 100; //自動摘要最多字數
				pBD.langBlogURL = "文章連結"; //連結按鈕
				pBD.langReadAll = "閱讀全文"; //連結按鈕
				pBD.langContiReadAll = "繼續閱讀"; //連結按鈕
				pBD.langShowDigest = "顯示摘要"; //連結按鈕
				pBD.doDigest();
			//});
			
			setTimeout(function () {
				doCallback(callback);
			}, 500);
			return;
		}
		else
		{
			//jQuery("div.post-body").show();
			doCallback(callback);
			return;
		}
	});
	
	this.ajaxFunction.push(function (callback) {
		//網頁目錄
		//alert("網頁目錄");
		
		if (is_blogger_fullpage())
			$.puliPostCatalog();
		
		doCallback(callback);
	});
	
	/*
	this.ajaxFunction.push(function (callback) {
		//相關連結
		if (is_blogger_fullpage() == true)
		{
			relatedPostsNum = 0;
			relatedTitles = new Array();
			relatedUrls = new Array();
			relatedDates = new Array();
			
			var labels = jQuery("span.post-labels a");
				relatedLabelNum = labels.length;
				relatedLoaded = 0;
			for (var i = 0; i < labels.length; i++)
			{
				var label = labels.eq(i).html();
				getScript("http://pulipuli.blogspot.com/feeds/posts/default/-/"+label+"?alt=json-in-script&callback=RelatedLabels&max-results=10"
					, function () {
						relatedLoaded++;
						if (relatedLoaded == relatedLabelNum)
						{
							var output = ShowRelatedPosts("http://pulipuli.blogspot.com");
							output = jQuery.trim(output);
							if (output != "")
								jQuery("div.post-footer").prepend(jQuery(output));
						}
					});
			}
		}
		doCallback(callback);
	});
	*/

	this.ajaxFunction.push(function (callback) {
		//sidebar控制
		//alert("sidebar控制");
		
		var sidebarCtrl =  jQuery("<div></div>")
			.addClass("sidebar-controller");
			
			var arrowLeft = jQuery("<span onclick='sidebar_control(0)' > &lt; Side</span>")
				.css("cursor", "pointer")
				.css("font-weight", "bold")
				.hover(function () {this.style.color = "white";},function () {this.style.color = "#CCCCCC";});
			var arrowRight = jQuery("<span onclick='sidebar_control(1)' >bar &gt; </span>")
				.css("cursor", "pointer")
				.css("font-weight", "bold")
				.hover(function () {this.style.color = "white";},function () {this.style.color = "#CCCCCC";});
		sidebarCtrl.append(arrowLeft)
			.append(arrowRight);
		
		jQuery("div.descriptionwrapper").prepend(sidebarCtrl);
		
		//20110620 改成立即隱藏
		//if (is_blogger_fullpage() == true)
		//	sidebar_control(1);
		
		doCallback(callback);
	});

	this.ajaxFunction.push(function (callback) {
		//加入日期導覽
		//alert("加入日期導覽");
		
		if (is_blogger_fullpage() == true)
		{
			var breadcrumbs = generateBreadcrumbs();
			//alert([breadcrumbs, jQuery("h2.data-header:first").length]);
			if (breadcrumbs != "")
			{
				jQuery("h2.date-header:first").append(jQuery(breadcrumbs));	
			}
		}
		
		doCallback(callback);
	});
	
	this.ajaxFunction.push(function (callback) {
		//sidebar widget控制
		//alert("sidebar widget控制");
		
		var widgets = jQuery("div#sidebar > div.widget");
		
		var button = jQuery("<div>-</div>")
			.addClass("widget-toggle")
			.attr("title", "close")
			.click(function () {
				var thisObj = jQuery(this);
				var widget = thisObj.parents("div.widget:first").children("div.widget-content:first");
				if (thisObj.hasClass("closed"))
				{
					widget.show();
					thisObj.removeClass("closed");
					thisObj.html("-");
					thisObj.attr("title", "open");
				}
				else
				{
					widget.hide();
					thisObj.addClass("closed");
					thisObj.html("+");
					thisObj.attr("title", "close");
				}
			})
			.hover(function () { 
				jQuery(this).addClass("hover");
			}, function () {
				jQuery(this).removeClass("hover");
			});
			
		/*
		var hideWidgets = ["文章存檔"];
		var removeWidgets = [];
		
		if (is_blogger_search() == true 
			|| is_blogger_label() == true
			|| is_blogger_archive() == true)
		{
			hideWidgets = [];
			removeWidgets = ["最新文章", "布丁布丁來聊天", "哪顆布丁最熱門", "布丁布丁來我家", "布丁布丁吃幾顆(7天內)"];
		}
		*/
		for (var i = 0; i < widgets.length; i++)
		{
			var h2 = widgets.eq(i).children("h2:first");
			var _title = $.trim(h2.html());
			
			var b = button.clone(true);
			h2.prepend(b);
			h2.addClass("toggle-setup");
			
			var _content_is_show = (h2.nextAll(".widget-content").css("display") == "none");
			if (_content_is_show)
				b.click();
			
			/*
			var _matchRemove = (jQuery.inArray(_title, removeWidgets) != -1);
			var _matchHide = (jQuery.inArray(_title, hideWidgets) != -1);
			if (_matchRemove)
			{
				widgets.eq(i).remove();
				continue;
			}
			else if (_matchHide)
			{
				b.click();
			}
			
			widgets.eq(i).show();
			*/
		}
		
		doCallback(callback);
	});
	

	/*
	 * 20110706 by Pudding Chen
	 * 改成AddThis新制按鈕，直接寫在樣板中，不在這邊執行
	this.ajaxFunction.push(function (callback) {
		//推到噗浪等
		//alert("推到噗浪等");
		
		//if (is_blogger_search() == true 
		//	|| is_blogger_label() == true
		//	|| is_blogger_archive() == true)
		//{
		//	doCallback(callback);
		//	return;
		//}
		
		if (is_blogger_fullpage() == false)
		{
			doCallback(callback);
			return;
		}
		
		window.addthis_config = {
		   services_compact: 'plurk,twitter,facebook,hemidemi,funp,delicious,digg,blogger,readitlater,evernote,googlebuzz,googlereader,igoogle,messenger,email,print'
		};
		
		//getScript("http://s7.addthis.com/js/250/addthis_widget.js#username=pulipuli", function () {
			
			var titles = jQuery("div#main h3.entry-title a");
			for (var i = 0; i < titles.length; i++)
			{
				var url = titles.eq(i).attr("href");
				var title = titles.eq(i).html();
				
				var share = jQuery("<div></div>")
					.addClass("share-buttons")
					.insertBefore(titles.eq(i).parents("div.post:first").find("div.post-header-line-1"));
				
				var addThis = jQuery('<div class="add-this">'
					+ '<a addthis:title="'+title+'" addthis:url="'+url+'" class="addthis_button">'
					+ '<img src="http://s7.addthis.com/static/btn/sm-share-en.gif" alt="分享並加入書籤" style="border:0"/></a></div>')
					.appendTo(share);
				
				// 20110502 停止使用Facebook的like，改以Send按鈕安裝 http://goo.gl/LLwuW
				//var facebook = jQuery('<iframe src="http://www.facebook.com/plugins/like.php?href='+url+'&layout=standard&show_faces=true&width=450&action=like&font=verdana&colorscheme=light" scrolling="no" frameborder="0" class="fackbook-like" height="30"></iframe>')
				//	.appendTo(share);
			}
			
			doCallback(callback);
			
			
		//});	getScript("http://s7.addthis.com/js/250/addthis_widget.js#username=pulipuli", function () {
	});
	*/
	
	this.ajaxFunction.push(function (callback) {
		//最新文章與最新回應
		//alert("最新文章與最新回應");
		
		if (is_blogger_fullpage() == false)
		{
			getScript("http://pulipuli.blogspot.com/feeds/posts/summary/?alt=json-in-script&callback=handlePostspulipuli"
				, function () {
					getScript("http://pulipuli.blogspot.com/feeds/comments/full?alt=json-in-script&callback=handleCommentspulipuli"
						, function () {
							getScript('http://pulipuli.blogspot.com/feeds/113544406852218769/comments/full?alt=json-in-script&callback=handleGuestbookPulipuli', function () {
								doCallback(callback);
							});
					});
				});
		}
		else
		{
			setTimeout(function () {
				getScript("http://pulipuli.blogspot.com/feeds/posts/summary/?alt=json-in-script&callback=handlePostspulipuli"
					, function () {
						getScript("http://pulipuli.blogspot.com/feeds/comments/full?alt=json-in-script&callback=handleCommentspulipuli", function () {
							getScript('http://pulipuli.blogspot.com/feeds/113544406852218769/comments/full?alt=json-in-script&callback=handleGuestbookPulipuli');
						});
					});
			}, 10000);
			doCallback(callback);
		}
	});
	
	
	
	this.ajaxFunction.push(function (callback) {
		//show plurk
		//alert("show plurk");
		
		if (is_blogger_search() == true 
			|| is_blogger_label() == true
			|| is_blogger_archive() == true)
		{
			doCallback(callback);
			return;
		}
		
		var showPlurk = function () {
			var plurkdiv = '<iframe src="http://www.plurk.com/getWidget?uid=1422855&h=200&w=200&u_info=2&bg=5A3818&tl=FFF7EF" width="200" frameborder="0" height="200" scrolling="no"></iframe>';
			
			jQuery("div#plurkDiv").hide()
				.html(plurkdiv)
				.attr("style", "width: 200px; height: 200px; margin-bottom: 10px;")
				.slideDown();
		};
		
		if (is_blogger_fullpage() == true)
		{
			setTimeout(showPlurk, 10*1000);
		}
		else
			showPlurk();
		
		doCallback(callback);
	});
	
	
	this.ajaxFunction.push(function (callback) {
		//show linkwithin
		//alert("show linkwithin");
		
		if (is_blogger_fullpage())
		{
			
		//alert([jQuery(".linkwithin_outer").length, is_blogger_fullpage()]);
			//jQuery(".linkwithin_outer").show();
			jQuery(".post-body").addClass("show-linkwithin");
		}
		
		doCallback(callback);
	});
	
	/*
	//要使用Cbox，請建立HTML/JavaScript Widget
	//內容：<div id="cboxdiv">Loading...</div>
	//即可
	this.ajaxFunction.push(function (callback) {
		//顯示Cbox
		if (is_blogger_search() == true 
			|| is_blogger_label() == true
			|| is_blogger_archive() == true)
		{
			jQuery("#cboxdiv").parents(".widget:first").remove();
			jQuery("#Followers1-wrapper").parents(".widget:first").remove();
			doCallback(callback);
			return;
		}
		
		var showCbox = function () {
			var cboxmain = jQuery('<iframe frameborder="0" marginheight="2" marginwidth="2" height="305" src="http://www2.cbox.ws/box/?boxid=1702733&boxtag=n7p2xr&sec=main" id="cboxmain" scrolling="auto" style="border: 0px solid;" width="200" allowtransparency="yes" name="cboxmain"></iframe>');
			var cboxform = jQuery('<iframe frameborder="0" marginheight="2" marginwidth="2" height="75" src="http://www2.cbox.ws/box/?boxid=1702733&boxtag=n7p2xr&sec=form" id="cboxform" scrolling="no" style="border: 0px solid;border-top:0px" width="200" allowtransparency="yes" name="cboxform"></iframe>');

			jQuery("div#cboxdiv").hide()
				.html(cboxmain)
				.append("<br/>")
				.append(cboxform)
				.slideDown();
		};
		
		if (is_blogger_fullpage() == true)
		{
			setTimeout(showCbox, 10*1000);
		}
		else
			showCbox();
		
		doCallback(callback);
	});
	*/
	
	//this.ajaxFunction.push(function (callback) { doCallback(callback); });

	var blogAjaxExec = function (func, i)
	{
		if (func.length == 0)
			return;
		this.func = func.pop();
		//Check which function is Error:
			//alert(this.ajaxFunction.length);
		//alert(["blog ajax exec", i]);
		this.func(function () {
			i++;
			setTimeout(function () {
				blogAjaxExec(func, i);
			}, 100);
		});
	};
	
	this.ajaxFunction.reverse();
	
	setTimeout(function () {
		blogAjaxExec(this.ajaxFunction, 0);
	}, 0);
	
	
}

$(function () {
	blogAjax();
});

/**
 * 如果要停止功能，請加入<span class="disable-post-catalog"></span>
 */

if (typeof(is_blogger_fullpage) != 'function')
{
	is_blogger_fullpage = function ()
	{
	  var href_array = location.href.split("/");
	  //var href_array2 = location.href.split("\\");
	  if (href_array.length > 5 && href_array[4] != "label" && href_array[0] != "file:")
	    return true;
	  else
	    return false;
	};
}

if (typeof($.create_id) != 'function')
{
	$.create_id = function () {
	    return (new Date()).getTime() + '';
	};
}

$.puliPostCatalog = function (cata_container, heading) {
	
	if (is_blogger_fullpage() == false)
		return;
	
	$(function () {	//頁面讀取完之後，再進行讀取

	if (heading == null)
		heading = "h4";
	
	if (cata_container == null)
	{
		if ($('div.post-body .disable-post-catalog').length > 0)
		{
			return;
		}
		
		var firstHeading = $('div.post-body:first > '+heading+':first');
		
		if (firstHeading.length == 0)
		{
			return;
		}
		
		//如果firstHeading之前有hr，則移除之
		var hr = firstHeading.prev().filter('hr');
		if (hr.length > 0)
			hr.remove();
		else
		{
			var div = firstHeading.prevAll("div:first");
			hr = div.children(':last').filter('hr');
			if (hr.length > 0)
				hr.remove();
		}
		
		cata_container = $('<span></span>')
			.insertBefore(firstHeading);
		cata_container.attr('id', 'postcata'+$.create_id());
		
		
	}
	
	//get cataSlt ID
	var cata = jQuery(cata_container);
	var prefix = cata.attr("id");
	
	//取得divID所在的所有的heading
	var postBody = jQuery(cata_container).parents("div.post-body:first");
	//postBody.css("border", "1px solid red");
	
	if (postBody.find('.cate-title').length > 0)
		return;
	
	
	var headingAry = postBody.find("h4,h5");
	var headingTop = [];
	var topId = {};
	for (var i = 0; i < headingAry.length; i++)
	{
		var heading = headingAry.eq(i);
		var top = heading.offset().top;
		topId[top] = heading;
		headingTop.push(top);
	}
	
	//然後將headingTop排序
	headingTop.sort(function (a, b) { return a - b; });
	
	//重新輸入headingAry
	headingAry = [];
	for (var i = 0; i < headingTop.length; i++)
	{
		var top = headingTop[i];
		var heading = topId[top];
		headingAry.push(heading);
	}
	
	//headingAry.css("border", "1px solid red");

	var cataTitleID = prefix+"cataTitle";
	var cataTitle = jQuery("<div class='cata-title' style='width: 75%'>"
		//+ '目錄's
		+ "<a name='"+cataTitleID+"' id='"+cataTitleID+"' /></div>");
		
	var goCata = jQuery('<a style="margin:0;padding:0;text-decoration:none;font-size:smaller;font-weight:normal;float:right;" href="#'+cataTitleID+'"><sup>&lt;^&gt;</sup></a>');

	var ulObj = jQuery("<ul></ul>");
	//在每個Heading後面加入錨點
	for (var i = 0; i < headingAry.length; i++)
	{
		var hdObj = headingAry[i];
		
		var title = hdObj.text();
		//脫逸「<」成為「&lt;」、「>」成為「&gt;」
		title = title.replace(/</g, '&lt;').replace(/>/g, '&gt;');
		
		var anchorID = prefix + "_anchor" + i;
		
		var anc = jQuery("<a id='"+anchorID+"' name='"+anchorID+"' />");
		hdObj.prepend(anc);
		
		hdObj.prepend(goCata.clone());
		
		var tagName = hdObj.attr('tagName').toLowerCase();
		
		var hd = jQuery("<li><a href='#"+anchorID+"'>"+title+"</a></li>");
		
		if (tagName == 'h4')
		{
			ulObj.append(hd);
		}
		else
		{
			var lastHd = ulObj.children('li:last');
			
			if (lastHd.length == 0)
			{
				lastHd = $('<li></li>').appendTo(ulObj);
			}
			
			var lastUl = lastHd.children("ul:last");
			
			if (lastUl.length == 0)
			{
				lastUl = $('<ul></ul>').appendTo(lastHd);
			}
			
			lastUl.append(hd);
		}
		
	}
	
	if (headingAry.length != 0)
	{
		
		cata_container.append(cataTitle)
			.append(ulObj);
		
		//postBody.prepend("<hr width='75%' />");
		cata_container.prepend("<hr width='75%' />");
		cata_container.append("<hr width='75%' />");
		//postBody.prepend(ulObj);
		//postBody.prepend(cataTitle);
	}
	
	});	//$(function () {
	
};
