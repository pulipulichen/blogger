$(function(){
    $.getScript("//pulipulichen.github.io/blogger/blogger/js/jquery-lightbox-2010/jquery.lightbox-0.5.pack.js", function(){
        $("head").append($("<link />").attr({
            rel: "stylesheet",
            type: "text/css",
            href: "//pulipulichen.github.io/blogger/blogger/js/jquery-lightbox-2010/jquery.lightbox-0.5.css"
            //media: "screen"
        }));
        $.each($("div.post > div.post-body"), function(i, $obj){
            $.each($(this).find("a:has(img)"), function(){
                if ($(this).attr("href").indexOf("amazon.com") === -1) 
                    $(this).addClass("lightbox-group" + i).attr({
                        href: $(this).attr("href").replace(/s1600-h/g, "s1600")
                    });
            });
            $(".lightbox-group" + i).lightBox({
                imageLoading: '//pulipulichen.github.io/blogger/blogger/js/jquery-lightbox-2010/lightbox-ico-loading.gif',
                imageBtnPrev: '//pulipulichen.github.io/blogger/blogger/js/jquery-lightbox-2010/lightbox-btn-prev.gif',
                imageBtnNext: '//pulipulichen.github.io/blogger/blogger/js/jquery-lightbox-2010/lightbox-btn-next.gif',
                imageBtnClose: '//pulipulichen.github.io/blogger/blogger/js/jquery-lightbox-2010/lightbox-btn-close.gif',
                imageBlank: '//pulipulichen.github.io/blogger/blogger/js/jquery-lightbox-2010/lightbox-blank.gif',
                fixedNavigation: true,
                overlayOpacity: 0.4,
                containerResizeSpeed: 500
            });
        });
    });
});