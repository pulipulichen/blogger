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

