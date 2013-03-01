/**
 * blogger.js
 * pulipuli.blogspot.tw專用的JavaScript大雜匯
 *
 * Last Update: 20120720
 */

//for LinkWithin
var linkwithin_site_id = 226251;

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
    	return;
	
	if (typeof(heading) == "undefined")
		heading = "h4";
	
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
	try
	{
		var sortentry=json.feed.entry.sort(compareentry);
	}
	catch (e) { }
	var firstPost = null;
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
		}
		title = title_temp;
		var link="";
		if (typeof(post.link[2]) != "undefined")
			link=post.link[2].href;
		var title_link = fulltitle;
		var authorname=post.author[0].name.$t;
		if (authorname == 'Anonymous')
			authorname = '匿名';
		
		if (authorname == '布丁布丁吃布丁')
		{
			authorname = '<img src="http://1.bp.blogspot.com/_yr4MQB4zDus/SZ4Mb30N0aI/AAAAAAAAFUg/3OGhwhzBUOg/S45/" style="float:left;margin-right: 5px;width:20px; height: 20px;display:block;" border="0" /> ' 
				+ authorname;
		}
			
		var uri = '';
		if (typeof(post.author[0].uri) != 'undefined')
		{
			uri = post.author[0].uri.$t;
			authorname = '<a href="'+uri+'" target="_blank">'+authorname+'</a>';
		}
		
		var timestamp=post.published.$t.substr(0,10);
		  var y = timestamp.substr(0, 4);
		  var m = timestamp.substr(5, 2);
		  var d = timestamp.substr(8, 2);
		
		var layout_replace = layout.replace("%comment%",title_link).replace("%Y%",y).replace("%M%",m).replace("%D%",d).replace("%authorname%",authorname);
		
		var odd = 0;
		if (i % 2 == 1)
			odd = 1;
		temp += '<li class="guest-book-li guest-book-li-'+odd+'"><span class="item-title">'+layout_replace+'</span></li>';
	  }
	
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
		add_link = 'https://www.blogger.com/comment.g?blogID='+blogID+'&postID='+postID;
		//https://www.blogger.com/comment.g?blogID=16607461&postID=113544406852218769
		reload_cmd = "$.getScript('"+baseLink+"feeds/"+postID+"/comments/full?alt=json-in-script&callback=handleGuestbookPulipuli')";
		//$.getScript('http://pulipuli.blogspot.com/feeds/1187506547871300947/comments/full?alt=json-in-script&callback=handleGuestbookPulipuli');
	}
	  
	  if (post = sortentry[i])
	  {
	  	link=add_link;
		
	  	temp += '<li class="guest-book-li readmore"><span class="item-title">'
			+ '<a href="'+link+'#comments" target="guestbook_write">閱讀全部的留言</a>'
			+ '</span></li>';
	  }
	temp+="</ul>";
	
	
	
	temp += '<div class="guestbook-write">'
		+ ' <a href="'+rss_link+'" style="float:right;"><img src="http://3.bp.blogspot.com/_yr4MQB4zDus/Ru35yvgloDI/AAAAAAAABOQ/bbtw-pQhpOk/s200/rss.gif" border="0" /></a>'
		
		+ ' <a href="'+add_link+'" class="write" target="guestbook_write">撰寫留言</a>'
		+ ' <a class="write" onclick="'+reload_cmd+'">重新讀取</a>'
		+ '</div>';
	
	document.getElementById("pulipuli_guestbook").innerHTML = temp;
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
				
				if (elems.find("a.blog-pager-older-link").length == 0)
				{
					$(window).unbind('.infscr');
					elems.find(".blog-pager").hide();
					return;
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
	
	
	
	this.ajaxFunction.push(function (callback) {
		//推到噗浪等
		//alert("推到噗浪等");
		
		if (is_blogger_search() == true 
			|| is_blogger_label() == true
			|| is_blogger_archive() == true)
		{
			doCallback(callback);
			return;
		}
		
		getScript("http://s7.addthis.com/js/250/addthis_widget.js#username=pulipuli", function () {
		
			addthis_config =
			{
			   services_compact: 'plurk,twitter,facebook,hemidemi,funp,delicious,digg,blogger,readitlater,evernote,googlebuzz,googlereader,igoogle,messenger,email,print'
			};
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
		});
	});
	
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