/**
 * 加入圖片的lightbox
 * @author http://lokeshdhakar.com/projects/lightbox2/#getting-started 20160928
 */
$(function(){
    if (document.body.clientWidth < 460) {
        $.each($("article a:has(img)"), function(_i){
            $(this).attr("target", "_blank");
        });
        return;
    }
    
    $.each($("article a:has(img)"), function(_i){
        var _title = "image";
        if ($(this).attr("title") !== undefined) {
            _title = $(this).hasAttr("title");
        }
        _title = _title + _i;
        
        if ($(this).attr("href").indexOf("amazon.com") === -1) {
            $(this).addClass("lightbox-group")
                .attr("href", $(this).attr("href").replace(/s1600-h/g, "s1600"))
                .attr("data-lightbox", _title);
        }
    });
    
    $("head").append($("<link />").attr({
        rel: "stylesheet",
        type: "text/css",
        href: "//pulipulichen.github.io/blogger/blogger/lib/lightbox2-lokeshdhakar/css/lightbox.min.css"
        //media: "screen"
    }));
    
    $.getScript("//pulipulichen.github.io/blogger/blogger/lib/lightbox2-lokeshdhakar/js/lightbox.min.js", function () {
        lightbox.option({
            'disableScrolling': true
        });
        $("#lightbox .lb-nav").click(function () {
            var _src = $(this).prev().attr("src");
            //console.log(_src);
            if (_src !== undefined) {
                window.open(_src);
            }
        });
    });
});