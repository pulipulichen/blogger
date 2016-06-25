// JavaScript Document
//puliHandleRecentFunction.js

puliHandlePost = function () {
    var pHP = this;
    pHP.title = "";
    pHP.divID = "puliHandlePostDiv";
    pHP.loading = "Loading...";
    pHP.ulID = "puliHandlePostUl";
    pHP.ulClass = "";
    pHP.liClass = "puliHandlePost-item-title";
    pHP.postshow = 10;
    pHP.titlelen = '';
    pHP.layout = "%Y%-%M%-%D% %authorname%<br />%title%";
    pHP.bloggerName = "pulipuli";
    pHP.tagname = "";
    pHP.callback;

    pHP.compareentry = function (a, b) {
        order = Date.parse(a.published.$t.replace(/^(\d{4})-(\d{2})-(\d{2})T([0-9:]*)([.0-9]*)(.)(.*)$/,
                '$1/$2/$3 $4 GMT')) - Date.parse(b.published.$t.replace(/^(\d{4})-(\d{2})-(\d{2})T([0-9:]*)([.0-9]*)(.)(.*)$/,
                '$1/$2/$3 $4 GMT'));
        return 0 - order;
    };

    pHP.handlePosts = function (json) {
        var title = '';
        if (pHP.title !== '') {
            title = '<h2>' + pHP.title + '</h2>';
        }
        var temp = title + '<ul id="' + pHP.ulID + '">';
        var postshow = pHP.postshow;
        var titlelen = pHP.titlelen;
        var layout = pHP.layout;
        var sortentry = json.feed.entry.sort(compareentry);
        for (var i = 0, post; post = sortentry[i]; i++) {
            if (i >= postshow) {
                break;
            }
            var title = post.title.$t;
            if (titlelen !== "" && title.length > titlelen) {
                title = title.substr(0, titlelen) + "...";
            }
            
            // 20160625 最新標題，把/之前的文字加上粗體
            if (title.indexOf(" / ") > 0) {
                var _slash_pos = title.indexOf(" / ");
                title = "<strong>" + title.substr(0, _slash_pos) + "</strong>" + title.substr(_slash_pos);
            }
            else {
                title = "<strong>" + title + "</strong>";
            }
            
            var link = post.link[4].href;
            if (link.substr(link.length - 5, 5) !== ".html") {
                //如果擷取到的網址不是html網頁的話
                var _links = post.link;
                for (var _l = 0; _l < _links.length; _l++)
                {
                    link = _links[_l].href;
                    if (link.substr(link.length - 5, link.length) === ".html") {
                        break;
                    }
                }
            }
            var title_link = '<a href="' + link + '">' + title + '</a>';
            var authorname = post.author[0].name.$t;
            var timestamp = post.published.$t.substr(0, 10);
            var y = timestamp.substr(0, 4);
            var m = timestamp.substr(5, 2);
            var d = timestamp.substr(8, 2);

            var layout_replace = layout.replace("%title%", title_link).replace("%Y%", y).replace("%M%", m).replace("%D%", d).replace("%authorname%", authorname);

            temp += '<li class="' + pHP.liClass + '">' + layout_replace + '</li>';
        }
        temp += "</ul>";
        jQuery("#" + pHP.divID).html(temp);
        
        if (typeof(pHP.callback) === "function") {
            pHP.callback();
        }
    };

    pHP.load = function (nodeID) {
        jQuery("#" + nodeID).html('<div id="' + pHP.divID + '"><h2>' + pHP.loading + '</h2></div>');

        var tagname = pHP.tagname;
        if (tagname.substr(0, 3) !== "/-/"
                && tagname !== "") {
            tagname = "/-/" + tagname;
        }

        jQuery.getJSON("/feeds/posts/summary" + tagname + "/?alt=json-in-script&callback=?",
                function (data) {
                    pHP.handlePosts(data);
                });
        return pHP;
    };
    return pHP;
};

var puliHandleComments = function ()	{
    var pHC = this;
    pHC.title = "";
    pHC.divID = "puliHandleCommentsDiv";
    pHC.loading = "Loading...";
    pHC.ulID = "puliHandleCommentsUl";
    pHC.ulClass = "";
    pHC.liClass = "puliHandleCom-item-title";
    pHC.postshow = 10;
    pHC.titlelen = 20;
    pHC.layout = "%Y%-%M%-%D% %authorname%<br />%title%";
    pHC.bloggerName = "pulipuli";

    pHC.compareentry = function (a, b) {
        order = Date.parse(a.published.$t.replace(/^(\d{4})-(\d{2})-(\d{2})T([0-9:]*)([.0-9]*)(.)(.*)$/,
                '$1/$2/$3 $4 GMT')) - Date.parse(b.published.$t.replace(/^(\d{4})-(\d{2})-(\d{2})T([0-9:]*)([.0-9]*)(.)(.*)$/,
                '$1/$2/$3 $4 GMT'));
        return 0 - order;
    };

    pHC.handleComments = function (json) {
        var title = '';
        if (pHC.title !== '')
            title = '<h2>' + pHC.title + '</h2>';
        var temp = title + '<ul id="' + pHC.ulID + '">';
        var postshow = pHC.postshow;
        var titlelen = pHC.titlelen;
        var layout = pHC.layout;
        var sortentry = json.feed.entry.sort(compareentry);
        for (var i = 0, post; post = sortentry[i]; i++) {
            if (i >= postshow) {
                break;
            }
            var title = post.title.$t;
            if (titlelen !== "" && title.length > titlelen)
                title = title.substr(0, titlelen) + "...";
            var link = "#";
            if (typeof (post.link[2]) !== "undefined") {
                link = post.link[2].href;
            }

            title = title.replace("<", "&lt;")
                    .replace(">", "&gt;");

            if ($.trim(title) === "") {
                postshow++;
                continue;
            }
            var title_link = '<a href="' + link + '">' + title + '</a>';


            var authorname = post.author[0].name.$t;
            var timestamp = post.published.$t.substr(0, 10);
            var y = timestamp.substr(0, 4);
            var m = timestamp.substr(5, 2);
            var d = timestamp.substr(8, 2);

            var layout_replace = layout.replace("%comment%", title_link).replace("%Y%", y).replace("%M%", m).replace("%D%", d).replace("%authorname%", authorname);

            temp += '<li class="' + pHC.liClass + '">' + layout_replace + '</li>';
        }   //for (var i = 0, post; post = sortentry[i]; i++) {
        temp += "</ul>";
        jQuery("#" + pHC.divID).html(temp);

    };

    pHC.load = function (nodeID)
    {
        jQuery("#" + nodeID).html('<div id="' + pHC.divID + '"><h2>' + pHC.loading + '</h2></div>');

        jQuery.getJSON("/feeds/comments/full?alt=json-in-script&callback=?",
                function (data) {
                    pHC.handleComments(data);
                });
        return pHC;
    };
    return pHC;
};