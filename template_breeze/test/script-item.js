
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

            var firstHeading = $('div.entry-content:first > article > ' + heading + ':first');

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
            cata_container.attr('id', 'postcata' + PULI_UTILS.create_page_id());
        }

        //get cataSlt ID
        var cata = jQuery(cata_container);
        var prefix = cata.attr("id");

        //取得divID所在的所有的heading
        var postBody = jQuery(cata_container).parents("article:first");
        //postBody.css("border", "1px solid red");

        if (postBody.find('.cate-title').length > 0) {
            return;
        }

        //PULI_UTILS.log('post.toc', '3');

        var headingAry = postBody.find("h4,h5");
        var headingTop = [];
        var topId = {};
        for (i = 0; i < headingAry.length; i++) {
            heading = headingAry.eq(i);
            top = heading.offset().top;
            topId[top] = heading;
            headingTop.push(top);
        }

        //然後將headingTop排序
        headingTop.sort(function (a, b) {
            return a - b;
        });

        //重新輸入headingAry
        headingAry = [];
        for (i = 0; i < headingTop.length; i++) {
            top = headingTop[i];
            heading = topId[top];
            headingAry.push(heading);
        }

        //PULI_UTILS.log('post.toc', '4');

        //headingAry.css("border", "1px solid red");

        var cataTitleID = prefix + "cataTitle";
        var cataTitle = jQuery("<div class='cata-title' style='width: 75%'>"
                //+ '目錄's
                + "<a name='" + cataTitleID + "' id='" + cataTitleID + "' /></div>");

        var goCata = jQuery('<a style="margin:0;padding:0;text-decoration:none;font-size:smaller;font-weight:normal;float:right;" href="#' + cataTitleID + '">'
        + '<i class="fa fa-chevron-circle-up" aria-hidden="true"></i>'
        + '</a>');

        var ulObj = jQuery("<ul></ul>").addClass("puli-toc");

        //在每個Heading後面加入錨點
        for (i = 0; i < headingAry.length; i++) {
            var hdObj = headingAry[i];

            var title = hdObj.text();
            var anchorID = prefix + "_anchor" + i;

            var anc = jQuery("<a id='" + anchorID + "' name='" + anchorID + "' />");
            hdObj.prepend(anc);

            hdObj.prepend(goCata.clone());

            var tagName = hdObj.prop('tagName');
            if (tagName === undefined) {
                tagName = hdObj.attr('tagName');
            }
            if (typeof (tagName) === "string") {
                tagName = tagName.toLowerCase();
            }

            var hd = jQuery("<li><a href='#" + anchorID + "'>" + title + "</a></li>");

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

            cata_container.prepend("<hr />");
            cata_container.append("<hr />");
        }

    });	//$(function () {

    //PULI_UTILS.log('post.toc', '6');

};

$(function () {
    PULI_UTILS.post.toc();
});

//----------------------

function pulipuli_related_results_labels_thumbs(e) {
    //console.log(e);
    if (typeof(e.feed.entry) === "undefined") {
        if ($("#related-posts").hasClass("has-item") === false) {
            $("#related-posts").hide();
        }
        return;
    }
    else {
        $("#related-posts").addClass("has-item");
    }

    for (var t = 0; t < e.feed.entry.length; t++) {
        var n = e.feed.entry[t];
        relatedTitles[relatedTitlesNum] = n.title.$t;
        try {
            thumburl[relatedTitlesNum] = n.media$thumbnail.url;
        } catch (r) {
            var s = n.content.$t;
            var a = s.indexOf("<img");
            var b = s.indexOf('src="', a);
            var c = s.indexOf('"', b + 5);
            var d = s.substr(b + 5, c - b - 5);
            if (a !== -1 && b !== -1 && c !== -1 && d !== "") {
                thumburl[relatedTitlesNum] = d;
            } else {
                if (typeof defaultnoimage !== "undefined")
                    thumburl[relatedTitlesNum] = defaultnoimage;
                else
                    thumburl[relatedTitlesNum] = "";
            }
        }
        //if (relatedTitles[relatedTitlesNum].length > 60) {
        //    relatedTitles[relatedTitlesNum] = relatedTitles[relatedTitlesNum].substring(0, 60) + "...";
        //}
        for (var i = 0; i < n.link.length; i++) {
            if (n.link[i].rel === "alternate") {
                relatedUrls[relatedTitlesNum] = n.link[i].href;
                relatedTitlesNum++;
            }
        }
    }
}

var _puli_related_post_render = function (_owl_items) {
    //console.log($(_owl_items[0]).html());
    for (var _i = 0; _i < _owl_items.length; _i++) {
        var _item = $(_owl_items[_i]);
        var _a = _item.find("a:first");
        var _title = _a.attr("title");
        _a.prepend('<div class="related-post-title">' + _title + '</div>');
    }
};