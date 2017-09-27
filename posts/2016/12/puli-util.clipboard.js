if (typeof (PULI_UTIL) === "undefined") {
    PULI_UTIL = {};
}

PULI_UTIL.clipboard = {
    init: function (_callback) {
        //console.log(typeof(Clipboard));
        if (typeof (Clipboard) !== "function") {
            var _clipboard_url = '//pulipulichen.github.io/blogger/posts/2016/12/clipboard.min.js';
            if ($('head script[src="' + _clipboard_url + '"]').length === 0) {
                $('head').append('<script type="text/javascript" src="' + _clipboard_url + '"></sc' + 'ript>');
            }
            $(function () {
                setTimeout(function () {
                    PULI_UTIL.clipboard.init(_callback);
                }, 100);
            });
        } else {
            if ($('#clipboard_button').length === 0) {
                var _button = $('<button type="button" id="clipboard_button"></button>')
                        //.attr("data-clipboard-text", _content)
                        .hide()
                        .appendTo("body");

                try {
                    var clipboard = new Clipboard('#clipboard_button');
                }
                catch (e) {
                    
                }
            }
            $(function () {
                if (typeof (_callback) === "function") {
                    _callback();
                }
            });
        }
    },
    copy: function (_content) {
        var _button = $('#clipboard_button')
                .attr("data-clipboard-text", _content);

        _button.click();
        //console.log([typeof(Clipboard), _button.data('clipboard-text')]);
        //console.log("finish");
    }
}

$(function () {
    PULI_UTIL.clipboard.init();
});
