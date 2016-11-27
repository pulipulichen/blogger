
/**
 * 檢查PULI_UTILS是否存在
 */
if (typeof(PULI_UTILS) === "undefined") {
	PULI_UTILS = {};
}
 
if (typeof PULI_UTILS.post === "undefined") {
	PULI_UTILS.post = {};
}


$(function () {
    $("#srch_btn").click(function () {
        $("#masthead input.gsc-search-button").click();
    });
});

var menu_search_submit = function (_form) {
    var _query = _form.q.value;
    ga("send", "event", "search", _query, 1);
    //console.log("送出GA事件 search");
    
    $("#masthead input.gsc-input").val(_query);
    $("#masthead input.gsc-search-button").click();
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
	var _is_fulllpage = (href_array.length > 5 && href_array[4] !== "label");
	var _is_file = href_array[0] !== "file:";
	var _is_localhost = (href_array[2] === 'localhost');
	var _is_localhost_fullpage = (href_array[href_array.length-1] === 'fullpage.html');
	
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

var _page_index = 0;
PULI_UTILS.create_page_id = function () {
    var _pagename = location.pathname.split("/").slice(-1);
    if (typeof(_pagename[0]) === "string") {
        _pagename = _pagename[0];
    }
    _pagename = _pagename + _page_index;
    _page_index++;
    return _pagename;
};

// ----------------------------------
// 20160522 回到上一頁的功能：如果上一頁不是布丁布丁吃什麼，那就隱藏

var _header_back_button_click = function () {
    
    var _back_type = "back";
    
    if (typeof(document.referrer) !== "string") {
        _back_type = "index";
    }
    else {
        var _needle = [
            "http://blog.pulipuli.info/", 
            "http://pulipuli.info/", 
            "http://pulipuli.blogspot.com/", 
            "http://pulipuli.blogspot.tw/"
        ];

        var _result = false;
        for (var _i = 0; _i < _needle.length; _i++) {
            var _n = _needle[_i];
            if (document.referrer.substr(0, _n.length) === _n) {
                _result = true;
                break;
            }
        }
        
        if (_result === false) {
            _back_type = "index";
        }
    }
    
    if (_back_type === "back") {
        if (history.back() === undefined) {
            location.href = "/";
        }
    }
    else {
        location.href = "/";
    }
};

// ----------------------------------
// 20160522 Relate post的功能

var _display_related_posts = function (items, msgs, config) {
    var cursor = null;
      if (items && items.length > 0) {
        cursor = parseInt(items[items.length - 1].timestamp) + 1;
      }

      var bodyFromEntry = function(entry) {
        if (entry.gd$extendedProperty) {
          for (var k in entry.gd$extendedProperty) {
            if (entry.gd$extendedProperty[k].name === 'blogger.contentRemoved') {
              return '<span class="deleted-comment">' + entry.content.$t + '</span>';
            }
          }
        }
        return entry.content.$t;
      }

      var parse = function(data) {
        cursor = null;
        var comments = [];
        if (data && data.feed && data.feed.entry) {
          for (var i = 0, entry; entry = data.feed.entry[i]; i++) {
            var comment = {};
            // comment ID, parsed out of the original id format
            var id = /blog-(\d+).post-(\d+)/.exec(entry.id.$t);
            comment.id = id ? id[2] : null;
            comment.body = bodyFromEntry(entry);
            comment.timestamp = Date.parse(entry.published.$t) + '';
            if (entry.author && entry.author.constructor === Array) {
              var auth = entry.author[0];
              if (auth) {
                comment.author = {
                  name: (auth.name ? auth.name.$t : undefined),
                  profileUrl: (auth.uri ? auth.uri.$t : undefined),
                  avatarUrl: (auth.gd$image ? auth.gd$image.src : undefined)
                };
              }
            }
            if (entry.link) {
              if (entry.link[2]) {
                comment.link = comment.permalink = entry.link[2].href;
              }
              if (entry.link[3]) {
                var pid = /.*comments\/default\/(\d+)\?.*/.exec(entry.link[3].href);
                if (pid && pid[1]) {
                  comment.parentId = pid[1];
                }
              }
            }
            comment.deleteclass = 'item-control blog-admin';
            if (entry.gd$extendedProperty) {
              for (var k in entry.gd$extendedProperty) {
                if (entry.gd$extendedProperty[k].name === 'blogger.itemClass') {
                  comment.deleteclass += ' ' + entry.gd$extendedProperty[k].value;
                }
              }
            }
            comments.push(comment);
          }
        }
        return comments;
      };

      var paginator = function(callback) {
        if (hasMore()) {
          var url = config.feed + '?alt=json&v=2&orderby=published&reverse=false&max-results=50';
          if (cursor) {
            url += '&published-min=' + new Date(cursor).toISOString();
          }
          window.bloggercomments = function(data) {
            var parsed = parse(data);
            cursor = parsed.length < 50 ? null
                : parseInt(parsed[parsed.length - 1].timestamp) + 1;
            callback(parsed);
            window.bloggercomments = null;
          };
          url += '&callback=bloggercomments';
          var script = document.createElement('script');
          script.type = 'text/javascript';
          script.src = url;
          document.getElementsByTagName('head')[0].appendChild(script);
        }
      };
      var hasMore = function() {
        return !!cursor;
      };
      var getMeta = function(key, comment) {
        if ('iswriter' === key) {
          var matches = !!comment.author
              && comment.author.name === config.authorName
              && comment.author.profileUrl === config.authorUrl;
          return matches ? 'true' : '';
        } else if ('deletelink' === key) {
          return config.baseUri + '/delete-comment.g?blogID='
               + config.blogId + '&postID=' + comment.id;
        } else if ('deleteclass' === key) {
          return comment.deleteclass;
        }
        return '';
      };

      var replybox = null;
      var replyUrlParts = null;
      var replyParent = undefined;

      var onReply = function(commentId, domId) {
        if (replybox === null) {
          // lazily cache replybox, and adjust to suit this style:
          replybox = document.getElementById('comment-editor');
          if (replybox !== null) {
            replybox.height = '210px';
            replybox.style.display = 'block';
            replyUrlParts = replybox.src.split('#');
          }
        }
        if (replybox && (commentId !== replyParent)) {
          document.getElementById(domId).insertBefore(replybox, null);
          replybox.src = replyUrlParts[0]
              + (commentId ? '&parentID=' + commentId : '')
              + '#' + replyUrlParts[1];
          replyParent = commentId;
        }
      };

      var hash = (window.location.hash || '#').substring(1);
      var startThread, targetComment;
      if (/^comment-form_/.test(hash)) {
        startThread = hash.substring('comment-form_'.length);
      } else if (/^c[0-9]+$/.test(hash)) {
        targetComment = hash.substring(1);
      }

      // Configure commenting API:
      var configJso = {
        'maxDepth': config.maxThreadDepth
      };
      var provider = {
        'id': config.postId,
        'data': items,
        'loadNext': paginator,
        'hasMore': hasMore,
        'getMeta': getMeta,
        'onReply': onReply,
        'rendered': true,
        'initComment': targetComment,
        'initReplyThread': startThread,
        'config': configJso,
        'messages': msgs
      };

    var render = function() {
        if (window.goog && window.goog.comments) {
            var holder = document.getElementById('comment-holder');
            window.goog.comments.render(holder, provider);
        }
        
        var _div = $(".comment-replies ol li.comment span.comment-actions");
        for (var _i = 0; _i < _div.length; _i++) {
            _div.eq(_i).append(_reply_link.clone(true));
        }
        //console.log(_div.length);
    };

    // render now, or queue to render when library loads:
    if (window.goog && window.goog.comments) {
        render();
    } else {
        window.goog = window.goog || {};
        window.goog.comments = window.goog.comments || {};
        window.goog.comments.loadQueue = window.goog.comments.loadQueue || [];
        window.goog.comments.loadQueue.push(render);
    }
    
    // 為每個留言後面加上回覆
    var _reply_link = $('<a kind="i" href="javascript:;" target="_self" o="r">回覆</a>').click(function () {
        $(this).parents(".comment-replies").prev().find('a[o="r"]:first').click();
        var _top = $("#comment-editor:first").offset().top - $("#masthead .container:first").height();
        window.scrollTo(0, _top);
    });
    
};

//---------------------------------------

$('.go-top').click(function(){$('.st-content').animate({scrollTop:0},'slow');$('html, body').animate({scrollTop:0},'slow');return false;});

//----------------------------------------

$(function () {
    $(".widget h2").wrapInner("<span/>");
});

// -------------------
$(function ($) {

    var aboveHeight = $('#leader-wrapper').outerHeight();
    $(window).scroll(function () {
        if ($(window).scrollTop() > aboveHeight) {
            $('#masthead').addClass('fixed-nav').css('top', '0').next()
                    .css('padding-top', '5px');

        } else {
            $('#masthead').removeClass('fixed-nav').next()
                    .css('padding-top', '0');
        }
    });
});

// --------------
// 20160625 隨機文章
$(function () {
    _load_random_posts();
});
    
var _load_random_posts = function () {
    var _ul = $("#random_posts");
    _ul.empty();
    
    var randomposts_number = 5;
    var randomposts_chars = 110;
    var randomposts_details = true;
    var randomposts_comments = '留言';
    var randomposts_commentsd = '';
    var randomposts_current = [];
    var total_randomposts = 0;
    var randomposts_current = new Array(randomposts_number);

    randomposts = function (json) {
        total_randomposts = json.feed.openSearch$totalResults.$t;
    };
    //document.write('<script type=\"text/javascript\" src=\"/feeds/posts/default?alt=json-in-script&max-results=0&callback=randomposts\"><\/script>');
    

    var getvalue = function () {
        for (var i = 0; i < randomposts_number; i++) {
            var found = false;
            var rndValue = get_random();
            for (var j = 0; j < randomposts_current.length; j++) {
                if (randomposts_current[j] === rndValue) {
                    found = true;
                    break
                }
            };
            if (found) {
                i--;
            } else {
                randomposts_current[i] = rndValue;
            }
        }
    };

    var get_random = function () {
        var ranNum = 1 + Math.round(Math.random() * (total_randomposts - 1));
        return ranNum;
    };

    random_posts = function (json) {
        for (var i = 0; i < randomposts_number; i++) {
            var entry = json.feed.entry[i];
            var randompoststitle = entry.title.$t;
            
            if (randompoststitle.length > 40) {
                randompoststitle = randompoststitle.substr(0, 40) + "...";
            }
            // 20160625 最新標題，把/之前的文字加上粗體
            if (randompoststitle.indexOf(" / ") > 0) {
                var _slash_pos = randompoststitle.indexOf(" / ");
                randompoststitle = "<strong>" + randompoststitle.substr(0, _slash_pos) + "</strong>" + randompoststitle.substr(_slash_pos);
            }
            else {
                randompoststitle = "<strong>" + randompoststitle + "</strong>";
            }
            
            if ('content' in entry) {
                var randompostsnippet = entry.content.$t;
            } else {
                if ('summary' in entry) {
                    var randompostsnippet = entry.summary.$t;
                } else {
                    var randompostsnippet = "";
                }
            };
            randompostsnippet = randompostsnippet.replace(/<[^>]*>/g, "");
            if (randompostsnippet.length < randomposts_chars) {
                var randomposts_snippet = randompostsnippet;
            } else {
                randompostsnippet = randompostsnippet.substring(0, randomposts_chars);
                var whitespace = randompostsnippet.lastIndexOf(" ");
                randomposts_snippet = randompostsnippet.substring(0, whitespace) + "&#133;";
            };
            for (var j = 0; j < entry.link.length; j++) {
                if ('thr$total' in entry && entry.thr$total.$t > 0) {
                    var randomposts_commentsnum = entry.thr$total.$t + ' ' + randomposts_comments;
                } else {
                    randomposts_commentsnum = randomposts_commentsd;
                }; if (entry.link[j].rel === 'alternate') {
                    var randompostsurl = entry.link[j].href;
                    var randomposts_date = entry.published.$t;
                    if ('media$thumbnail' in entry) {
                        var randompoststhumb = entry.media$thumbnail.url;
                    } else {
                        randompoststhumb = "http://3.bp.blogspot.com/-5SoVe1K6JSk/Utl0OOmucAI/AAAAAAAAF6E/hQghgD_EJdQ/s1600/no_thumb.png";
                    }
                }
            };
            var _li = '';
            //document.write('<li>');
            _li = _li + '<dd>';
            _li = _li + '<a href="' + randompostsurl + '" rel="nofollow" title="' + randomposts_snippet + '">';
            //document.write('<a href="' + randompostsurl + '" rel="nofollow"><img alt="' + randompoststitle + '" src="' + randompoststhumb + '"/></a>');
            _li = _li + '<img alt="' + randompoststitle + '" src="' + randompoststhumb + '"/>';
            //document.write('<div><a href="' + randompostsurl + '" rel="nofollow">' + randompoststitle + '</a></div>');
            
            _li = _li + randompoststitle;
            
            if (randomposts_details === true) {
                //document.write('<span><div  class="random-info">' + randomposts_date.substring(8, 10) + '.' + randomposts_date.substring(5, 7) + '.' + randomposts_date.substring(0, 4) + ' - ' + randomposts_commentsnum) + '</div></span>'
                
                _li = _li + '<span><div  class="random-info">(' 
                        + randomposts_date.substring(0, 4) 
                        + '-'  + randomposts_date.substring(8, 10)
                        + '-'  + randomposts_date.substring(5, 7)
                        
                        + ') ' + randomposts_commentsnum 
                        + '</span>';
            };
            //document.write('<br/><div class="random-summary">' + randomposts_snippet + '</div><div style="clear:both"></div></li>')
            //_li = _li + '<br/><div class="random-summary">' + randomposts_snippet + '</div>';
            _li = _li + '<div style="clear:both"></div>';
            _li = _li + '</a>' + '</dd>';
            _ul.append(_li);
        }
    };
    
    //console.log("/feeds/posts/default?alt=json-in-script&max-results=0&callback=randomposts");
    $.getScript("/feeds/posts/default?alt=json-in-script&max-results=0&callback=randomposts", function () {
        getvalue();
        //for (var i = 0; i < randomposts_number; i++) {
            //document.write('<script type=\"text/javascript\" src=\"/feeds/posts/default?alt=json-in-script&start-index=' + randomposts_current[i] + '&max-results=1&callback=random_posts\"><\/script>')
            //$.getScript('/feeds/posts/default?alt=json-in-script&start-index=' + randomposts_current[i] + '&max-results=1&callback=random_posts');
        //};
        
        var _i = 0;
        var _loop = function () {
            //console.log([_i, randomposts_number]);
            if (_i < randomposts_number) {
                //console.log('/feeds/posts/default?alt=json-in-script&start-index=' + randomposts_current[_i] + '&max-results=1&callback=random_posts');
                $.getScript('/feeds/posts/default?alt=json-in-script&start-index=' + randomposts_current[_i] + '&max-results=1&callback=random_posts');
                _i++;
                _loop();
            }
        };
        _loop();
    });
};

//(function () {
    var _getQueryVariable = function (variable) {
        var query = window.location.search.substring(1);
        var vars = query.split("&");
        for (var i=0;i<vars.length;i++) {
          var pair = vars[i].split("=");
          if (pair[0] === variable) {
            return pair[1];
          }
        }
    };
    
    var _icon = _getQueryVariable("icon");
    console.log(_icon);
    if (_icon !== undefined) {
        $(function () {
            //$("head link[rel='icon']").remove();
            $("head").append('<link rel="icon" href="'+_icon+'" type="image/' + _icon.substr(_icon.lastIndexOf('.')+1) + '" size="192x192" />');
        });
           
    }
//})();