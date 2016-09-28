/**
 * 語法標亮
 * @author https://highlightjs.org/usage/ 20160928
 */
$(function(){
    $("article code").wrap("<pre></pre>");
    
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