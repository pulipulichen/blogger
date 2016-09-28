/**
 * 語法標亮
 * @author https://highlightjs.org/usage/ 20160928
 */
$(function(){
    $("article code").each(function (_i, _code) {
        _code = $(_code);
        if (_code.parent().filter("pre").length === 0) {
            _code.wrap("<pre></pre>");
        }
    });
    
    $("head").append($("<link />").attr({
        rel: "stylesheet",
        type: "text/css",
        href: "//pulipulichen.github.io/blogger/blogger/lib/highlight/default.min.css"
        //media: "screen"
    }));
    
    $.getScript("//pulipulichen.github.io/blogger/blogger/lib/highlight/highlight.min.js", function () {
        hljs.initHighlightingOnLoad();
    });
});