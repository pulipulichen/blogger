/**
 * //pulipulichen.github.io/blogger/posts/2016/11/cwise/print_button.js
 * <script type="text/javascript" src="//pulipulichen.github.io/blogger/posts/2016/11/cwise/print_button.js"></script>
 */
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
                _setup_print_button();
            }
        };
        _check_jquery();
    }
    else {
        _setup_print_button();
    }
};


var _setup_print_button = function () {
    $(function () {
        //$("body").append('');
        $("body").append('<div style="text-align: center;position: fixed;bottom: 0;width: 100%;background-color: white;padding-bottom: 5px;"><hr /><button style="box-shadow: 0 0 0 0 rgba(34,36,38,.15) inset; background-color: #975b33; color: #fff; text-shadow: none; background-image: none; font-size: 1rem !important; padding: .78571429em 1.5em; min-height: 1em; height: auto; border-radius: .28571429rem; display: inline-block;" onclick="window.print();" type="button">列印</button></div>');
    });
};

_load_jquery();

