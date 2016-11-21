var _lib_scripts = [
    "//pulipulichen.github.io/blogger/posts/2016/11/rangy-highlighter/jquery.cookie.js",
    "//pulipulichen.github.io/blogger/posts/2016/11/rangy-highlighter/rangy-core.js",
    "//pulipulichen.github.io/blogger/posts/2016/11/rangy-highlighter/rangy-classapplier.js",
    "//pulipulichen.github.io/blogger/posts/2016/11/rangy-highlighter/rangy-highlighter.js"
];

var _lib_styles = [
    "//pulipulichen.github.io/blogger/posts/2016/11/rangy-highlighter/rangy-highlighter.css"
];

var _lib_annotate_panel = "//pulipulichen.github.io/blogger/posts/2016/11/rangy-highlighter/annotate-panel.html";

var _annotate_area = "div.article";

// ----------------------------------
// Load jQuery

var _load_jquery = function () {
    if (typeof($) !== "function") {
        var s = document.createElement("script");
        s.type = "text/javascript";
        s.src = "//pulipulichen.github.io/blogger/posts/2016/11/rangy-highlighter/jquery.min.js";
        document.head.appendChild(s);

        var _check_jquery = function () {
            if (typeof($) !== "function") {
                setTimeout(_check_jquery, 1000);
            }
            else {
                _load_libraries();
            }
        };
        _check_jquery();
    }
    else {
        _load_libraries();
    }
};

    

// ----------------------------------
// Load Library

var _load_libraries = function () {
    for (var _i in _lib_styles) {
        $("head").append('<link rel="stylesheet" href="' + _lib_styles[_i] + '">');
    }

    //for (var _i in _lib_scripts) {
    //   var _script_url = _lib_scripts[_i];
    //    $("head").append('<script type="text/javascript" src="' + _script_url + '"></script>');
    //}
    var _load_script = function (_i) {
        if (_i === _lib_scripts.length) {
            _check_rangy();
            return;
        }
        
        var _script_url = _lib_scripts[_i];
        //console.log(_script_url);
        $.getScript(_script_url, function () {
            _i++;
            _load_script(_i);
        });
    };

    var _check_rangy = function () {
        if (typeof(rangy) !== "object") {
            setTimeout(_check_rangy, 1000);
        }
        else {
            _setup_panel();
        }
    };
    //_check_rangy();
    
    _load_script(0);
};

    

// ----------------------------------

var _setup_panel = function () {
    $.get(_lib_annotate_panel, function (_html) {
        $("body").append(_html);
        _init_highlighter();
    });
};

var highlighter;

var _init_highlighter = function () {

var _get_cookie_key = function () {
    return "highlight" + location.href;
};
//var serializedHighlights = decodeURIComponent(window.location.search.slice(window.location.search.indexOf("=") + 1));
var serializedHighlights = $.cookie(_get_cookie_key());


//var initialDoc;


$(function() {
    rangy.init();

    highlighter = rangy.createHighlighter();

    highlighter.addClassApplier(rangy.createClassApplier("highlight", {
        ignoreWhiteSpace: true,
        tagNames: ["span", "a"]
    }));

    highlighter.addClassApplier(rangy.createClassApplier("note", {
        ignoreWhiteSpace: true,
        elementTagName: "a",
        elementProperties: {
            href: "#",
            onclick: function() {
                var highlight = highlighter.getHighlightForElement(this);
                if (window.confirm("Delete this note (ID " + highlight.id + ")?")) {
                    highlighter.removeHighlights( [highlight] );
                }
                return false;
            }
        }
    }));


    if (serializedHighlights) {
        highlighter.deserialize(serializedHighlights);
    }

    //console.log(serializedHighlights);
});


var _highlightSelectedText = function () {
    highlighter.highlightSelection("highlight");
    $.cookie(_get_cookie_key(), highlighter.serialize(), {expires: 5 }); 
    var sel = rangy.getSelection();
    sel.removeAllRanges();
    $(".annotate-panel").removeClass("show");
};

var _removeHighlightFromSelectedText = function () {
    highlighter.unhighlightSelection();
    $.cookie(_get_cookie_key(), highlighter.serialize(), {expires: 5 }); 
    $(".annotate-panel").removeClass("show");
};


$(function () {
    
    var _annotate_panel_timer;
    var _last_string;

    var _annotate_panel = $(".annotate-panel");

    _annotate_panel.find(".button.highlightSelectedText").click(_highlightSelectedText);
    _annotate_panel.find(".button.removeHighlightFromSelectedText").click(_removeHighlightFromSelectedText);

    var _hide_annotate_panel_now = function () {
            _annotate_panel.fadeOut(function () {
                _annotate_panel.removeClass("show");
                _annotate_panel.css({
                    "top": "-10000px",
                    "display": "block"
                });
            });
    };

    var _hide_annotate_panel = function () {
        //return;
        _annotate_panel_timer = setTimeout(function () {
            _hide_annotate_panel_now();
        }, 3000);
    };

    _annotate_area.mouseup(function (e) {
        var sel = rangy.getSelection();
        //console.log(sel.saveRanges());
        var intersectingHighlights = highlighter.getIntersectingHighlights( sel.getAllRanges() );
        if (intersectingHighlights.length > 0) {
            _annotate_panel.removeClass("hide-remove");
        }
        else {
            _annotate_panel.addClass("hide-remove");
        }


        var _to_string = $.trim(sel.toString());
        if (_to_string !== "" && _last_string !== _to_string) {
            _last_string = _to_string;
            var _top = e.clientY - ($(".annotate-panel").height() + 15);
            if (_top < 0) {
                _top = 0;
            }
            var _left = e.clientX - ($(".annotate-panel").width() / 2);
            if (_left < 0) {
                _left = 0;
            }
            $(".annotate-panel").css({
                "top": _top,
                "left": _left
            });
            $(".annotate-panel").addClass("show");

            clearTimeout(_annotate_panel_timer);

            //return;
            _hide_annotate_panel();
        }
    });
    _annotate_panel.mouseover(function () {
        clearTimeout(_annotate_panel_timer);
    });
    _annotate_panel.mouseout(function () {
        _hide_annotate_panel();
    });


    // -------------------------------
    // 拖曳功能

    /*
    var _last_range;
    var mouseUp = function () {
        $("body").css("user-select", "initial");
        var sel = rangy.getSelection();
        sel.restoreRanges(_last_range);
        window.removeEventListener('mousemove', divMove, true);
        window.removeEventListener('mouseup', mouseUp, false);

    };
    var mouseDown = function (e){
        
        var sel = rangy.getSelection();
        _last_range = sel.saveRanges();
        sel.removeAllRanges();
        $("body").css("user-select", "none");
        window.addEventListener('mousemove', divMove, true);
        window.addEventListener('mouseup', mouseUp, false);

    };

    var divMove = function (e){
        _annotate_panel.css({
            "top": e.clientY,
            "left": e.clientX
        });
    };

    document.getElementById('annotate-panel').addEventListener('mousedown', mouseDown, false);
    */
    //window.addEventListener('mouseup', mouseUp, false);


});

};   //var init = function () {

// -------------------------------

_load_jquery();