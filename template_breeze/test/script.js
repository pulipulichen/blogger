
/**
 * 檢查PULI_UTILS是否存在
 */
if (typeof(PULI_UTILS) == "undefined") {
	PULI_UTILS = {};
}
 
if (typeof PULI_UTILS.post == "undefined") {
	PULI_UTILS.post = {};
}

//----------------------

function pulipuli_related_results_labels_thumbs(e) {
    //console.log(e);
    if (typeof(e.feed.entry) === "undefined") {
        $("#related-posts").hide();
        return;
    }

    for (var t = 0; t < e.feed.entry.length; t++) {
        var n = e.feed.entry[t];
        relatedTitles[relatedTitlesNum] = n.title.$t;
        try {
            thumburl[relatedTitlesNum] = n.media$thumbnail.url
        } catch (r) {
            s = n.content.$t;
            a = s.indexOf("<img");
            b = s.indexOf('src="', a);
            c = s.indexOf('"', b + 5);
            d = s.substr(b + 5, c - b - 5);
            if (a != -1 && b != -1 && c != -1 && d != "") {
                thumburl[relatedTitlesNum] = d
            } else {
                if (typeof defaultnoimage !== "undefined")
                    thumburl[relatedTitlesNum] = defaultnoimage;
                else
                    thumburl[relatedTitlesNum] = ""
            }
        }
        if (relatedTitles[relatedTitlesNum].length > 60)
            relatedTitles[relatedTitlesNum] = relatedTitles[relatedTitlesNum].substring(0, 60) + "...";
        for (var i = 0; i < n.link.length; i++) {
            if (n.link[i].rel == "alternate") {
                relatedUrls[relatedTitlesNum] = n.link[i].href;
                relatedTitlesNum++
            }
        }
    }
}


$(function () {
    $("#srch_btn").click(function () {
        $("input.gsc-search-button").click();
    });
});

var menu_search_submit = function (_form) {
    var _query = _form.q.value;
    $("input.gsc-input").val(_query);
    $("input.gsc-search-button").click();
    return false;
};

var _disqus_embed = function () {
    var disqus_url = disqus_blogger_current_url;

    (function () {
        "use strict";
//        var get_comment_block = function () {
////            var block = document.getElementById('comments');
////            if (!block) {
////                block = document.getElementById('disqus-blogger-comment-block');
////            }
//            var block = document.getElementById('disqus-blogger-comment-block');
//            return block;
//        };
//        var comment_block = get_comment_block();
//        //alert(typeof(comment_block));
//        if (!!comment_block) {
//            
//            //var disqus_div = document.createElement('div');
//            //disqus_div.id = 'disqus_thread';
//            //comment_block.innerHTML = '';
//            //comment_block.appendChild(disqus_div);
//            //comment_block.style.display = 'block';
//            //var dsq = document.createElement('script');
//            //dsq.async = true;
//            var _src = '//' + disqus_shortname + '.disqus.com/embed.js';
//            //(document.getElementsByTagName('head')[0] || document.body).appendChild(dsq);
//            $.getScript('//' + disqus_shortname + '.disqus.com/embed.js');
//        }
        //var _src = '//' + disqus_shortname + '.disqus.com/embed.js';
        $.getScript('//' + disqus_shortname + '.disqus.com/embed.js');
    })();
};

//----------------------------------


/**
 * 記錄
 * 
 * @param {String} _title 標題
 * @param {String} _message 內文
 */
PULI_UTILS.log = function (_title, _message) {
	if (_message === undefined) {
		_message = _title;
		_title = null;
	}
	
	if (_title !== null) {
		_message = "[" + _title + "] " + _message;
	}
	
	_message = "[PULIPULI] " + _message;
	//console.trace(_message);
};
		
/**
 * 確認Blogger是否是全文網頁
 * @return {boolean}
 */
PULI_UTILS.is_blogger_fullpage = function()
{
	var href_array = location.href.split("/");
	//var href_array2 = location.href.split("\\");
	var _is_fulllpage = (href_array.length > 5 && href_array[4] != "label");
	var _is_file = href_array[0] != "file:";
	var _is_localhost = (href_array[2] == 'localhost');
	var _is_localhost_fullpage = (href_array[href_array.length-1] == 'fullpage.html');
	
	if (_is_localhost) {
		if (_is_localhost_fullpage) {
		return true;
	}
	else {
		return false;
	}
	}
	
	if (_is_fulllpage 
			&& _is_file) {
		//console.log('is_blogger_fullpage: true');
		return true;
	}
	else {
		//console.log('is_blogger_fullpage: false');
		return false;
	}
};

/**
 * 確認Blogger是否是全文網頁
 * @return {boolean}
 */
PULI_UTILS.is_guess_message = function()
{
	var _needle = "/2005/12/blogger_113544406852218769.html";
	var _href = location.href;
	return (_href.substr((_href.length - _needle.length), _needle.length ) === _needle);
};

/**
 * 建立獨一無二的ID
 * @return {integer}
 */
PULI_UTILS.create_id = function () {
	return (new Date()).getTime() + '';
};


/**
 * Table of Content
 * for Pulipuli.blogspot.tw
 * 布丁式自動標題產生器
 * 
 * 如果要停止功能，請加入<span class="disable-post-catalog"></span>
 * @author Pulipuli Chen
 * @version 20130304
 */
PULI_UTILS.post.toc = function (cata_container, heading) {
	var i, top;
	
	//if (PULI_UTILS.is_blogger_fullpage() === false) {
	//	return;
	//}
	
	//PULI_UTILS.log('post.toc', '1');
	
	$(function () {	//頁面讀取完之後，再進行讀取

	if (typeof heading === "undefined") {
		heading = "h4";
	}
	
	//PULI_UTILS.log('post.toc', '2');
	
	if (typeof cata_container === "undefined") {
		
		//先檢查是否有取消目錄的功能
		if ($('div.entry-content .disable-post-catalog').length > 0) {
			return;
		}
		
		var firstHeading = $('div.entry-content:first > '+heading+':first');
		
		//PULI_UTILS.log('post.toc 2-1 firstHeading.length:', firstHeading.length );
		
		if (firstHeading.length === 0) {
			return;
		}
		
		//如果firstHeading之前有<font size="3"></font>，則移除之
		var font = firstHeading.prev().filter('font');
		if (font.length > 0) {
			font.remove();
		}
		
		//如果firstHeading之前有hr，則移除之
		var hr = firstHeading.prev().filter('hr');
		if (hr.length > 0) {
			hr.remove();
		}
		else {
			var div = firstHeading.prevAll("div:first");
			hr = div.children(':last').filter('hr');
			if (hr.length > 0) {
				hr.remove();
			}
		}

		//var p = firstHeading.prevAll("p:first");
		//console.log(firstHeading.html());
		//console.log(p.children().length);
		//if (p.length > 0) {
		//	p.remove();
		//}
		
		cata_container = $('<span></span>')
			.hide()
			.insertBefore(firstHeading);
		cata_container.attr('id', 'postcata'+PULI_UTILS.create_id());
	}
	
	//get cataSlt ID
	var cata = jQuery(cata_container);
	var prefix = cata.attr("id");
	
	//取得divID所在的所有的heading
	var postBody = jQuery(cata_container).parents("div.entry-content:first");
	//postBody.css("border", "1px solid red");
	
	if (postBody.find('.cate-title').length > 0) {
		return;
	}
	
	//PULI_UTILS.log('post.toc', '3');
	
	var headingAry = postBody.find("h4,h5");
	var headingTop = [];
	var topId = {};
	for (i = 0; i < headingAry.length; i++)	{
		heading = headingAry.eq(i);
		top = heading.offset().top;
		topId[top] = heading;
		headingTop.push(top);
	}
	
	//然後將headingTop排序
	headingTop.sort(function (a, b) { return a - b; });
	
	//重新輸入headingAry
	headingAry = [];
	for (i = 0; i < headingTop.length; i++)	{
		top = headingTop[i];
		heading = topId[top];
		headingAry.push(heading);
	}
	
	//PULI_UTILS.log('post.toc', '4');
	
	//headingAry.css("border", "1px solid red");

	var cataTitleID = prefix+"cataTitle";
	var cataTitle = jQuery("<div class='cata-title' style='width: 75%'>"
		//+ '目錄's
		+ "<a name='"+cataTitleID+"' id='"+cataTitleID+"' /></div>");
		
	var goCata = jQuery('<a style="margin:0;padding:0;text-decoration:none;font-size:smaller;font-weight:normal;float:right;" href="#'+cataTitleID+'"><sup>&lt;^&gt;</sup></a>');

	var ulObj = jQuery("<ul></ul>");

	//在每個Heading後面加入錨點
	for (i = 0; i < headingAry.length; i++) {
		var hdObj = headingAry[i];
		
		var title = hdObj.text();
		var anchorID = prefix + "_anchor" + i;
		
		var anc = jQuery("<a id='"+anchorID+"' name='"+anchorID+"' />");
		hdObj.prepend(anc);
		
		hdObj.prepend(goCata.clone());
		
		var tagName = hdObj.prop('tagName');
		if (tagName === undefined) {
			tagName = hdObj.attr('tagName');
		}
		if (typeof(tagName) === "string") {
			tagName = tagName.toLowerCase();
		}
		
		var hd = jQuery("<li><a href='#"+anchorID+"'>"+title+"</a></li>");
		
		 if (tagName === 'h4') {
		 	ulObj.append(hd);
		 }
		 else if (tagName === 'h5') {
		 	
		 	var lastHd = ulObj.children('li:last');
		
		 	if (lastHd.length === 0) {
		 		lastHd = $('<li></li>').appendTo(ulObj);
		 	}
			
		 	var lastUl = lastHd.children("ul:last");
			
		 	if (lastUl.length === 0) {
		 		lastUl = $('<ul></ul>').appendTo(lastHd);
		 	}
			lastUl.append(hd);
		 }
		//ulObj.append(hd);
	}
	
	//PULI_UTILS.log('post.toc', '5');
	
	/**
	 * 顯示目錄
	 */
	if (headingAry.length !== 0) {
		
		cata_container.append(cataTitle)
			.append(ulObj)
			.slideDown();
		
		cata_container.prepend("<hr width='75%' />");
		cata_container.append("<hr width='75%' />");
	}
	
	});	//$(function () {
	
	//PULI_UTILS.log('post.toc', '6');
	
};