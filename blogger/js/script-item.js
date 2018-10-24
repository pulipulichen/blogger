
/**
 * Table of Content
 * for Pulipuli.blogspot.tw
 * 布丁式自動標題產生器
 * 
 * 如果要停止功能，請加入<span class="disable-post-catalog"></span>
 * @author Pulipuli Chen
 * @version 20130304
 */
PULI_UTILS.post.toc = function (cata_container, heading) {
    var i, top;

    //if (PULI_UTILS.is_blogger_fullpage() === false) {
    //	return;
    //}

    //PULI_UTILS.log('post.toc', '1');

    $(function () {	//頁面讀取完之後，再進行讀取

        if (typeof heading === "undefined") {
            heading = "h4";
        }

        //PULI_UTILS.log('post.toc', '2');

        if (typeof cata_container === "undefined") {

            //先檢查是否有取消目錄的功能
            if ($('div.entry-content .disable-post-catalog').length > 0) {
                return;
            }

            var firstHeading = $('div.entry-content:first > article > ' + heading + ':first');

            //PULI_UTILS.log('post.toc 2-1 firstHeading.length:', firstHeading.length );

            if (firstHeading.length === 0) {
                return;
            }

            //如果firstHeading之前有<font size="3"></font>，則移除之
            var font = firstHeading.prev().filter('font');
            if (font.length > 0) {
                font.remove();
            }

            //如果firstHeading之前有hr，則移除之
            var hr = firstHeading.prev().filter('hr');
            if (hr.length > 0) {
                hr.remove();
                /*console.log("有<hr />");*/
            }
            else {
                var div = firstHeading.prevAll("div:first");
                hr = div.children(':last').filter('hr');
                if (hr.length > 0) {
                    hr.remove();
                    /*console.log("有 div > hr");*/
                }
                else {
                    var p = firstHeading.prevAll("p:first");
                    //p.css("border", "1px solid red");
                    //console.log([p.length, p.html()]);
                    hr = p.children().filter('hr');
                    if (hr.length > 0) {
                        hr.remove();
                        /*console.log("有 p > hr");*/
                    }
                    else {
                        hr = p.prev().filter("hr");
                        if (hr.length > 0) {
                            hr.remove();
                        }
                        //console.log(["p裡面找不到", p.length, p.children().length, p.html() ]);
                    }
                    if ($.trim(p.html()) === "") {
                        p.remove();
                        //console.log('p 也移除囉');
                    }
                }
            }

            //var p = firstHeading.prevAll("p:first");
            //console.log(firstHeading.html());
            //console.log(p.children().length);
            //if (p.length > 0) {
            //	p.remove();
            //}

            cata_container = $('<span></span>')
                    .hide()
                    .insertBefore(firstHeading);
            cata_container.attr('id', 'postcata' + PULI_UTILS.create_page_id());
        }

        //get cataSlt ID
        var cata = jQuery(cata_container);
        var prefix = cata.attr("id");

        //取得divID所在的所有的heading
        var postBody = jQuery(cata_container).parents("article:first");
        //postBody.css("border", "1px solid red");

        if (postBody.find('.cate-title').length > 0) {
            return;
        }

        //PULI_UTILS.log('post.toc', '3');

        var headingAry = postBody.find("h4,h5");
        var headingTop = [];
        var topId = {};
        for (i = 0; i < headingAry.length; i++) {
            heading = headingAry.eq(i);
            top = heading.offset().top;
            topId[top] = heading;
            headingTop.push(top);
        }
        
        if (headingTop.length === 1) {
            hr = firstHeading.prevAll().filter('hr');
            if (hr.length === 0) {
                firstHeading.before("<hr />");
            }
            return;
        }

        //然後將headingTop排序
        headingTop.sort(function (a, b) {
            return a - b;
        });

        //重新輸入headingAry
        headingAry = [];
        for (i = 0; i < headingTop.length; i++) {
            top = headingTop[i];
            heading = topId[top];
            headingAry.push(heading);
        }

        //PULI_UTILS.log('post.toc', '4');

        //headingAry.css("border", "1px solid red");

        var cataTitleID = prefix + "cataTitle";
        var cataTitle = jQuery("<div class='cata-title' style='width: 75%'>"
                //+ '目錄's
                + "<a name='" + cataTitleID + "' id='" + cataTitleID + "' /></div>");

        var goCata = jQuery('<a style="margin:0;padding:0;text-decoration:none;font-size:smaller;font-weight:normal;float:right;" href="#' + cataTitleID + '">'
        + '<i class="fa fa-chevron-circle-up" aria-hidden="true"></i>'
        + '</a>');

        var ulObj = jQuery("<ul></ul>").addClass("puli-toc");

        //在每個Heading後面加入錨點
        for (i = 0; i < headingAry.length; i++) {
            var hdObj = headingAry[i];

            var title = hdObj.text();
            var anchorID = prefix + "_anchor" + i;

            var anc = jQuery("<a id='" + anchorID + "' name='" + anchorID + "' />");
            hdObj.prepend(anc);

            hdObj.prepend(goCata.clone());

            var tagName = hdObj.prop('tagName');
            if (tagName === undefined) {
                tagName = hdObj.attr('tagName');
            }
            if (typeof (tagName) === "string") {
                tagName = tagName.toLowerCase();
            }

            var hd = jQuery("<li><a href='#" + anchorID + "'>" + title + "</a></li>");

            if (tagName === 'h4') {
                ulObj.append(hd);
            }
            else if (tagName === 'h5') {

                var lastHd = ulObj.children('li:last');

                if (lastHd.length === 0) {
                    lastHd = $('<li></li>').appendTo(ulObj);
                }

                var lastUl = lastHd.children("ul:last");

                if (lastUl.length === 0) {
                    lastUl = $('<ul></ul>').appendTo(lastHd);
                }
                lastUl.append(hd);
            }
            //ulObj.append(hd);
        }

        //PULI_UTILS.log('post.toc', '5');

        /**
         * 顯示目錄
         */
        //console.log(headingAry.length);
        if (headingAry.length > 1) {

            cata_container.append(cataTitle)
                    .append(ulObj)
                    .slideDown();

            cata_container.prepend("<hr />");
            cata_container.append("<hr />");
        }

    });	//$(function () {

    //PULI_UTILS.log('post.toc', '6');

};

$(function () {
    PULI_UTILS.post.toc();
});

//----------------------

function pulipuli_related_results_labels_thumbs(e) {
    //console.log(e);
    if (typeof(e.feed.entry) === "undefined") {
        if ($("#related-posts").hasClass("has-item") === false) {
            $("#related-posts").hide();
        }
        return;
    }
    else {
        $("#related-posts").addClass("has-item");
        $("#related-posts").show();
    }

    for (var t = 0; t < e.feed.entry.length; t++) {
        var n = e.feed.entry[t];
        relatedTitles[relatedTitlesNum] = n.title.$t;
        try {
            thumburl[relatedTitlesNum] = n.media$thumbnail.url;
        } catch (r) {
            var s = n.content.$t;
            var a = s.indexOf("<img");
            var b = s.indexOf('src="', a);
            var c = s.indexOf('"', b + 5);
            var d = s.substr(b + 5, c - b - 5);
            if (a !== -1 && b !== -1 && c !== -1 && d !== "") {
                thumburl[relatedTitlesNum] = d;
            } else {
                if (typeof defaultnoimage !== "undefined")
                    thumburl[relatedTitlesNum] = defaultnoimage;
                else
                    thumburl[relatedTitlesNum] = "";
            }
        }
        //if (relatedTitles[relatedTitlesNum].length > 60) {
        //    relatedTitles[relatedTitlesNum] = relatedTitles[relatedTitlesNum].substring(0, 60) + "...";
        //}
        for (var i = 0; i < n.link.length; i++) {
            if (n.link[i].rel === "alternate") {
                relatedUrls[relatedTitlesNum] = n.link[i].href;
                relatedTitlesNum++;
            }
        }
    }
}

var _puli_related_post_render = function (_owl_items) {
    //console.log($(_owl_items[0]).html());
    for (var _i = 0; _i < _owl_items.length; _i++) {
        var _item = $(_owl_items[_i]);
        var _a = _item.find("a:first");
        var _title = _a.attr("title");
        _a.prepend('<div class="related-post-title">' + _title + '</div>');
    }
    
    $(function () {
        var _stop_play = "stop-play";
        $(".owl-wrapper-outer").hover(function () {
            $(this).addClass(_stop_play);
        }, function () {
            $(this).removeClass(_stop_play);
        });
    });
};


// --------------------

// jQuery OwlCarousel Modified For Blogger By themexpose

// http://www.owlgraphic.com/owlcarousel/
// http://ar-themes.blogspot.com/
// Copyright (c) 2013 Bartosz Wojciechowski
// Licensed under MIT

"function"!==typeof Object.create&&(Object.create=function(f){function g(){}g.prototype=f;return new g});
(function(f,g,k){var l={init:function(a,b){this.$elem=f(b);this.options=f.extend({},f.fn.owlCarousel.options,this.$elem.data(),a);this.userOptions=a;this.loadContent()},loadContent:function(){function a(a){var d,e="";if("function"===typeof b.options.jsonSuccess)b.options.jsonSuccess.apply(this,[a]);else{for(d in a.owl)a.owl.hasOwnProperty(d)&&(e+=a.owl[d].item);b.$elem.html(e)}b.logIn()}var b=this,e;"function"===typeof b.options.beforeInit&&b.options.beforeInit.apply(this,[b.$elem]);"string"===typeof b.options.jsonPath?
(e=b.options.jsonPath,f.getJSON(e,a)):b.logIn()},logIn:function(){this.$elem.data("owl-originalStyles",this.$elem.attr("style"));this.$elem.data("owl-originalClasses",this.$elem.attr("class"));this.$elem.css({opacity:0});this.orignalItems=this.options.items;this.checkBrowser();this.wrapperWidth=0;this.checkVisible=null;this.setVars()},setVars:function(){if(0===this.$elem.children().length)return!1;this.baseClass();this.eventTypes();this.$userItems=this.$elem.children();this.itemsAmount=this.$userItems.length;
this.wrapItems();this.$owlItems=this.$elem.find(".owl-item");this.$owlWrapper=this.$elem.find(".owl-wrapper");this.playDirection="next";this.prevItem=0;this.prevArr=[0];this.currentItem=0;this.customEvents();this.onStartup()},onStartup:function(){this.updateItems();this.calculateAll();this.buildControls();this.updateControls();this.response();this.moveEvents();this.stopOnHover();this.owlStatus();!1!==this.options.transitionStyle&&this.transitionTypes(this.options.transitionStyle);!0===this.options.autoPlay&&
(this.options.autoPlay=5E3);this.play();this.$elem.find(".owl-wrapper").css("display","block");this.$elem.is(":visible")?this.$elem.css("opacity",1):this.watchVisibility();this.onstartup=!1;this.eachMoveUpdate();"function"===typeof this.options.afterInit&&this.options.afterInit.apply(this,[this.$elem]);},eachMoveUpdate:function(){!0===this.options.lazyLoad&&this.lazyLoad();!0===this.options.autoHeight&&this.autoHeight();this.onVisibleItems();"function"===typeof this.options.afterAction&&this.options.afterAction.apply(this,
[this.$elem])},updateVars:function(){"function"===typeof this.options.beforeUpdate&&this.options.beforeUpdate.apply(this,[this.$elem]);this.watchVisibility();this.updateItems();this.calculateAll();this.updatePosition();this.updateControls();this.eachMoveUpdate();"function"===typeof this.options.afterUpdate&&this.options.afterUpdate.apply(this,[this.$elem])},reload:function(){var a=this;g.setTimeout(function(){a.updateVars()},0)},watchVisibility:function(){var a=this;if(!1===a.$elem.is(":visible"))a.$elem.css({opacity:0}),
g.clearInterval(a.autoPlayInterval),g.clearInterval(a.checkVisible);else return!1;a.checkVisible=g.setInterval(function(){a.$elem.is(":visible")&&(a.reload(),a.$elem.animate({opacity:1},200),g.clearInterval(a.checkVisible))},500)},wrapItems:function(){this.$userItems.wrapAll('<div class="owl-wrapper">').wrap('<div class="owl-item"></div>');_puli_related_post_render(this.$userItems);this.$elem.find(".owl-wrapper").wrap('<div class="owl-wrapper-outer">');this.wrapperOuter=this.$elem.find(".owl-wrapper-outer");this.$elem.css("display","block")},
baseClass:function(){var a=this.$elem.hasClass(this.options.baseClass),b=this.$elem.hasClass(this.options.theme);a||this.$elem.addClass(this.options.baseClass);b||this.$elem.addClass(this.options.theme)},updateItems:function(){var a,b;if(!1===this.options.responsive)return!1;if(!0===this.options.singleItem)return this.options.items=this.orignalItems=1,this.options.itemsCustom=!1,this.options.itemsDesktop=!1,this.options.itemsDesktopSmall=!1,this.options.itemsTablet=!1,this.options.itemsTabletSmall=
!1,this.options.itemsMobile=!1;a=f(this.options.responsiveBaseWidth).width();a>(this.options.itemsDesktop[0]||this.orignalItems)&&(this.options.items=this.orignalItems);if(!1!==this.options.itemsCustom)for(this.options.itemsCustom.sort(function(a,b){return a[0]-b[0]}),b=0;b<this.options.itemsCustom.length;b+=1)this.options.itemsCustom[b][0]<=a&&(this.options.items=this.options.itemsCustom[b][1]);else a<=this.options.itemsDesktop[0]&&!1!==this.options.itemsDesktop&&(this.options.items=this.options.itemsDesktop[1]),
a<=this.options.itemsDesktopSmall[0]&&!1!==this.options.itemsDesktopSmall&&(this.options.items=this.options.itemsDesktopSmall[1]),a<=this.options.itemsTablet[0]&&!1!==this.options.itemsTablet&&(this.options.items=this.options.itemsTablet[1]),a<=this.options.itemsTabletSmall[0]&&!1!==this.options.itemsTabletSmall&&(this.options.items=this.options.itemsTabletSmall[1]),a<=this.options.itemsMobile[0]&&!1!==this.options.itemsMobile&&(this.options.items=this.options.itemsMobile[1]);this.options.items>this.itemsAmount&&
!0===this.options.itemsScaleUp&&(this.options.items=this.itemsAmount)},response:function(){var a=this,b,e;if(!0!==a.options.responsive)return!1;e=f(g).width();a.resizer=function(){f(g).width()!==e&&(!1!==a.options.autoPlay&&g.clearInterval(a.autoPlayInterval),g.clearTimeout(b),b=g.setTimeout(function(){e=f(g).width();a.updateVars()},a.options.responsiveRefreshRate))};f(g).resize(a.resizer)},updatePosition:function(){this.jumpTo(this.currentItem);!1!==this.options.autoPlay&&this.checkAp()},appendItemsSizes:function(){var a=
this,b=0,e=a.itemsAmount-a.options.items;a.$owlItems.each(function(c){var d=f(this);d.css({width:a.itemWidth}).data("owl-item",Number(c));if(0===c%a.options.items||c===e)c>e||(b+=1);d.data("owl-roundPages",b)})},appendWrapperSizes:function(){this.$owlWrapper.css({width:this.$owlItems.length*this.itemWidth*2,left:0});this.appendItemsSizes()},calculateAll:function(){this.calculateWidth();this.appendWrapperSizes();this.loops();this.max()},calculateWidth:function(){this.itemWidth=Math.round(this.$elem.width()/
this.options.items)},max:function(){var a=-1*(this.itemsAmount*this.itemWidth-this.options.items*this.itemWidth);this.options.items>this.itemsAmount?this.maximumPixels=a=this.maximumItem=0:(this.maximumItem=this.itemsAmount-this.options.items,this.maximumPixels=a);return a},min:function(){return 0},loops:function(){var a=0,b=0,e,c;this.positionsInArray=[0];this.pagesInArray=[];for(e=0;e<this.itemsAmount;e+=1)b+=this.itemWidth,this.positionsInArray.push(-b),!0===this.options.scrollPerPage&&(c=f(this.$owlItems[e]),
c=c.data("owl-roundPages"),c!==a&&(this.pagesInArray[a]=this.positionsInArray[e],a=c))},buildControls:function(){if(!0===this.options.navigation||!0===this.options.pagination)this.owlControls=f('<div class="owl-controls"/>').toggleClass("clickable",!this.browser.isTouch).appendTo(this.$elem);!0===this.options.pagination&&this.buildPagination();!0===this.options.navigation&&this.buildButtons()},buildButtons:function(){var a=this,b=f('<div class="owl-buttons"/>');a.owlControls.append(b);a.buttonPrev=
f("<div/>",{"class":"owl-prev",html:a.options.navigationText[0]||""});a.buttonNext=f("<div/>",{"class":"owl-next",html:a.options.navigationText[1]||""});b.append(a.buttonPrev).append(a.buttonNext);b.on("touchstart.owlControls mousedown.owlControls",'div[class^="owl"]',function(a){a.preventDefault()});b.on("touchend.owlControls mouseup.owlControls",'div[class^="owl"]',function(b){b.preventDefault();f(this).hasClass("owl-next")?a.next():a.prev()})},buildPagination:function(){var a=this;a.paginationWrapper=
f('<div class="owl-pagination"/>');a.owlControls.append(a.paginationWrapper);a.paginationWrapper.on("touchend.owlControls mouseup.owlControls",".owl-page",function(b){b.preventDefault();Number(f(this).data("owl-page"))!==a.currentItem&&a.goTo(Number(f(this).data("owl-page")),!0)})},updatePagination:function(){var a,b,e,c,d,g;if(!1===this.options.pagination)return!1;this.paginationWrapper.html("");a=0;b=this.itemsAmount-this.itemsAmount%this.options.items;for(c=0;c<this.itemsAmount;c+=1)0===c%this.options.items&&
(a+=1,b===c&&(e=this.itemsAmount-this.options.items),d=f("<div/>",{"class":"owl-page"}),g=f("<span></span>",{text:!0===this.options.paginationNumbers?a:"","class":!0===this.options.paginationNumbers?"owl-numbers":""}),d.append(g),d.data("owl-page",b===c?e:c),d.data("owl-roundPages",a),this.paginationWrapper.append(d));this.checkPagination()},checkPagination:function(){var a=this;if(!1===a.options.pagination)return!1;a.paginationWrapper.find(".owl-page").each(function(){f(this).data("owl-roundPages")===
f(a.$owlItems[a.currentItem]).data("owl-roundPages")&&(a.paginationWrapper.find(".owl-page").removeClass("active"),f(this).addClass("active"))})},checkNavigation:function(){if(!1===this.options.navigation)return!1;!1===this.options.rewindNav&&(0===this.currentItem&&0===this.maximumItem?(this.buttonPrev.addClass("disabled"),this.buttonNext.addClass("disabled")):0===this.currentItem&&0!==this.maximumItem?(this.buttonPrev.addClass("disabled"),this.buttonNext.removeClass("disabled")):this.currentItem===
this.maximumItem?(this.buttonPrev.removeClass("disabled"),this.buttonNext.addClass("disabled")):0!==this.currentItem&&this.currentItem!==this.maximumItem&&(this.buttonPrev.removeClass("disabled"),this.buttonNext.removeClass("disabled")))},updateControls:function(){this.updatePagination();this.checkNavigation();this.owlControls&&(this.options.items>=this.itemsAmount?this.owlControls.hide():this.owlControls.show())},destroyControls:function(){this.owlControls&&this.owlControls.remove()},next:function(a){if ($(".owl-wrapper-outer").hasClass("stop-play")) {return;};if(this.isTransition)return!1;
this.currentItem+=!0===this.options.scrollPerPage?this.options.items:1;if(this.currentItem>this.maximumItem+(!0===this.options.scrollPerPage?this.options.items-2:0))if(!0===this.options.rewindNav)this.currentItem=0,a="rewind";else return this.currentItem=this.maximumItem,!1;this.goTo(this.currentItem,a)},prev:function(a){if(this.isTransition)return!1;this.currentItem=!0===this.options.scrollPerPage&&0<this.currentItem&&this.currentItem<this.options.items?0:this.currentItem-(!0===this.options.scrollPerPage?
this.options.items:1);if(0>this.currentItem)if(!0===this.options.rewindNav)this.currentItem=this.maximumItem,a="rewind";else return this.currentItem=0,!1;this.goTo(this.currentItem,a)},goTo:function(a,b,e){var c=this;if(c.isTransition)return!1;"function"===typeof c.options.beforeMove&&c.options.beforeMove.apply(this,[c.$elem]);a>=c.maximumItem?a=c.maximumItem:0>=a&&(a=0);c.currentItem=c.owl.currentItem=a;if(!1!==c.options.transitionStyle&&"drag"!==e&&1===c.options.items&&!0===c.browser.support3d)return c.swapSpeed(0),
!0===c.browser.support3d?c.transition3d(c.positionsInArray[a]):c.css2slide(c.positionsInArray[a],1),c.afterGo(),c.singleItemTransition(),!1;a=c.positionsInArray[a];!0===c.browser.support3d?(c.isCss3Finish=!1,!0===b?(c.swapSpeed("paginationSpeed"),g.setTimeout(function(){c.isCss3Finish=!0},c.options.paginationSpeed)):"rewind"===b?(c.swapSpeed(c.options.rewindSpeed),g.setTimeout(function(){c.isCss3Finish=!0},c.options.rewindSpeed)):(c.swapSpeed("slideSpeed"),g.setTimeout(function(){c.isCss3Finish=!0},
c.options.slideSpeed)),c.transition3d(a)):!0===b?c.css2slide(a,c.options.paginationSpeed):"rewind"===b?c.css2slide(a,c.options.rewindSpeed):c.css2slide(a,c.options.slideSpeed);c.afterGo()},jumpTo:function(a){"function"===typeof this.options.beforeMove&&this.options.beforeMove.apply(this,[this.$elem]);a>=this.maximumItem||-1===a?a=this.maximumItem:0>=a&&(a=0);this.swapSpeed(0);!0===this.browser.support3d?this.transition3d(this.positionsInArray[a]):this.css2slide(this.positionsInArray[a],1);this.currentItem=
this.owl.currentItem=a;this.afterGo()},afterGo:function(){this.prevArr.push(this.currentItem);this.prevItem=this.owl.prevItem=this.prevArr[this.prevArr.length-2];this.prevArr.shift(0);this.prevItem!==this.currentItem&&(this.checkPagination(),this.checkNavigation(),this.eachMoveUpdate(),!1!==this.options.autoPlay&&this.checkAp());"function"===typeof this.options.afterMove&&this.prevItem!==this.currentItem&&this.options.afterMove.apply(this,[this.$elem])},stop:function(){this.apStatus="stop";g.clearInterval(this.autoPlayInterval)},
checkAp:function(){"stop"!==this.apStatus&&this.play()},play:function(){var a=this;a.apStatus="play";if(!1===a.options.autoPlay)return!1;g.clearInterval(a.autoPlayInterval);a.autoPlayInterval=g.setInterval(function(){a.next(!0)},a.options.autoPlay)},swapSpeed:function(a){"slideSpeed"===a?this.$owlWrapper.css(this.addCssSpeed(this.options.slideSpeed)):"paginationSpeed"===a?this.$owlWrapper.css(this.addCssSpeed(this.options.paginationSpeed)):"string"!==typeof a&&this.$owlWrapper.css(this.addCssSpeed(a))},
addCssSpeed:function(a){return{"-webkit-transition":"all "+a+"ms ease","-moz-transition":"all "+a+"ms ease","-o-transition":"all "+a+"ms ease",transition:"all "+a+"ms ease"}},removeTransition:function(){return{"-webkit-transition":"","-moz-transition":"","-o-transition":"",transition:""}},doTranslate:function(a){return{"-webkit-transform":"translate3d("+a+"px, 0px, 0px)","-moz-transform":"translate3d("+a+"px, 0px, 0px)","-o-transform":"translate3d("+a+"px, 0px, 0px)","-ms-transform":"translate3d("+
a+"px, 0px, 0px)",transform:"translate3d("+a+"px, 0px,0px)"}},transition3d:function(a){this.$owlWrapper.css(this.doTranslate(a))},css2move:function(a){this.$owlWrapper.css({left:a})},css2slide:function(a,b){var e=this;e.isCssFinish=!1;e.$owlWrapper.stop(!0,!0).animate({left:a},{duration:b||e.options.slideSpeed,complete:function(){e.isCssFinish=!0}})},checkBrowser:function(){var a=k.createElement("div");a.style.cssText="  -moz-transform:translate3d(0px, 0px, 0px); -ms-transform:translate3d(0px, 0px, 0px); -o-transform:translate3d(0px, 0px, 0px); -webkit-transform:translate3d(0px, 0px, 0px); transform:translate3d(0px, 0px, 0px)";
a=a.style.cssText.match(/translate3d\(0px, 0px, 0px\)/g);this.browser={support3d:null!==a&&1===a.length,isTouch:"ontouchstart"in g||g.navigator.msMaxTouchPoints}},moveEvents:function(){if(!1!==this.options.mouseDrag||!1!==this.options.touchDrag)this.gestures(),this.disabledEvents()},eventTypes:function(){var a=["s","e","x"];this.ev_types={};!0===this.options.mouseDrag&&!0===this.options.touchDrag?a=["touchstart.owl mousedown.owl","touchmove.owl mousemove.owl","touchend.owl touchcancel.owl mouseup.owl"]:
!1===this.options.mouseDrag&&!0===this.options.touchDrag?a=["touchstart.owl","touchmove.owl","touchend.owl touchcancel.owl"]:!0===this.options.mouseDrag&&!1===this.options.touchDrag&&(a=["mousedown.owl","mousemove.owl","mouseup.owl"]);this.ev_types.start=a[0];this.ev_types.move=a[1];this.ev_types.end=a[2]},disabledEvents:function(){this.$elem.on("dragstart.owl",function(a){a.preventDefault()});this.$elem.on("mousedown.disableTextSelect",function(a){return f(a.target).is("input, textarea, select, option")})},
gestures:function(){function a(a){if(void 0!==a.touches)return{x:a.touches[0].pageX,y:a.touches[0].pageY};if(void 0===a.touches){if(void 0!==a.pageX)return{x:a.pageX,y:a.pageY};if(void 0===a.pageX)return{x:a.clientX,y:a.clientY}}}function b(a){"on"===a?(f(k).on(d.ev_types.move,e),f(k).on(d.ev_types.end,c)):"off"===a&&(f(k).off(d.ev_types.move),f(k).off(d.ev_types.end))}function e(b){b=b.originalEvent||b||g.event;d.newPosX=a(b).x-h.offsetX;d.newPosY=a(b).y-h.offsetY;d.newRelativeX=d.newPosX-h.relativePos;
"function"===typeof d.options.startDragging&&!0!==h.dragging&&0!==d.newRelativeX&&(h.dragging=!0,d.options.startDragging.apply(d,[d.$elem]));(8<d.newRelativeX||-8>d.newRelativeX)&&!0===d.browser.isTouch&&(void 0!==b.preventDefault?b.preventDefault():b.returnValue=!1,h.sliding=!0);(10<d.newPosY||-10>d.newPosY)&&!1===h.sliding&&f(k).off("touchmove.owl");d.newPosX=Math.max(Math.min(d.newPosX,d.newRelativeX/5),d.maximumPixels+d.newRelativeX/5);!0===d.browser.support3d?d.transition3d(d.newPosX):d.css2move(d.newPosX)}
function c(a){a=a.originalEvent||a||g.event;var c;a.target=a.target||a.srcElement;h.dragging=!1;!0!==d.browser.isTouch&&d.$owlWrapper.removeClass("grabbing");d.dragDirection=0>d.newRelativeX?d.owl.dragDirection="left":d.owl.dragDirection="right";0!==d.newRelativeX&&(c=d.getNewPosition(),d.goTo(c,!1,"drag"),h.targetElement===a.target&&!0!==d.browser.isTouch&&(f(a.target).on("click.disable",function(a){a.stopImmediatePropagation();a.stopPropagation();a.preventDefault();f(a.target).off("click.disable")}),
a=f._data(a.target,"events").click,c=a.pop(),a.splice(0,0,c)));b("off")}var d=this,h={offsetX:0,offsetY:0,baseElWidth:0,relativePos:0,position:null,minSwipe:null,maxSwipe:null,sliding:null,dargging:null,targetElement:null};d.isCssFinish=!0;d.$elem.on(d.ev_types.start,".owl-wrapper",function(c){c=c.originalEvent||c||g.event;var e;if(3===c.which)return!1;if(!(d.itemsAmount<=d.options.items)){if(!1===d.isCssFinish&&!d.options.dragBeforeAnimFinish||!1===d.isCss3Finish&&!d.options.dragBeforeAnimFinish)return!1;
!1!==d.options.autoPlay&&g.clearInterval(d.autoPlayInterval);!0===d.browser.isTouch||d.$owlWrapper.hasClass("grabbing")||d.$owlWrapper.addClass("grabbing");d.newPosX=0;d.newRelativeX=0;f(this).css(d.removeTransition());e=f(this).position();h.relativePos=e.left;h.offsetX=a(c).x-e.left;h.offsetY=a(c).y-e.top;b("on");h.sliding=!1;h.targetElement=c.target||c.srcElement}})},getNewPosition:function(){var a=this.closestItem();a>this.maximumItem?a=this.currentItem=this.maximumItem:0<=this.newPosX&&(this.currentItem=
a=0);return a},closestItem:function(){var a=this,b=!0===a.options.scrollPerPage?a.pagesInArray:a.positionsInArray,e=a.newPosX,c=null;f.each(b,function(d,g){e-a.itemWidth/20>b[d+1]&&e-a.itemWidth/20<g&&"left"===a.moveDirection()?(c=g,a.currentItem=!0===a.options.scrollPerPage?f.inArray(c,a.positionsInArray):d):e+a.itemWidth/20<g&&e+a.itemWidth/20>(b[d+1]||b[d]-a.itemWidth)&&"right"===a.moveDirection()&&(!0===a.options.scrollPerPage?(c=b[d+1]||b[b.length-1],a.currentItem=f.inArray(c,a.positionsInArray)):
(c=b[d+1],a.currentItem=d+1))});return a.currentItem},moveDirection:function(){var a;0>this.newRelativeX?(a="right",this.playDirection="next"):(a="left",this.playDirection="prev");return a},customEvents:function(){var a=this;a.$elem.on("owl.next",function(){a.next()});a.$elem.on("owl.prev",function(){a.prev()});a.$elem.on("owl.play",function(b,e){a.options.autoPlay=e;a.play();a.hoverStatus="play"});a.$elem.on("owl.stop",function(){a.stop();a.hoverStatus="stop"});a.$elem.on("owl.goTo",function(b,e){a.goTo(e)});
a.$elem.on("owl.jumpTo",function(b,e){a.jumpTo(e)})},stopOnHover:function(){var a=this;!0===a.options.stopOnHover&&!0!==a.browser.isTouch&&!1!==a.options.autoPlay&&(a.$elem.on("mouseover",function(){a.stop()}),a.$elem.on("mouseout",function(){"stop"!==a.hoverStatus&&a.play()}))},lazyLoad:function(){var a,b,e,c,d;if(!1===this.options.lazyLoad)return!1;for(a=0;a<this.itemsAmount;a+=1)b=f(this.$owlItems[a]),"loaded"!==b.data("owl-loaded")&&(e=b.data("owl-item"),c=b.find(".lazyOwl"),"string"!==typeof c.data("src")?
b.data("owl-loaded","loaded"):(void 0===b.data("owl-loaded")&&(c.hide(),b.addClass("loading").data("owl-loaded","checked")),(d=!0===this.options.lazyFollow?e>=this.currentItem:!0)&&e<this.currentItem+this.options.items&&c.length&&this.lazyPreload(b,c)))},lazyPreload:function(a,b){function e(){a.data("owl-loaded","loaded").removeClass("loading");b.removeAttr("data-src");"fade"===d.options.lazyEffect?b.fadeIn(400):b.show();"function"===typeof d.options.afterLazyLoad&&d.options.afterLazyLoad.apply(this,
[d.$elem])}function c(){f+=1;d.completeImg(b.get(0))||!0===k?e():100>=f?g.setTimeout(c,100):e()}var d=this,f=0,k;"DIV"===b.prop("tagName")?(b.css("background-image","url("+b.data("src")+")"),k=!0):b[0].src=b.data("src");c()},autoHeight:function(){function a(){var a=f(e.$owlItems[e.currentItem]).height();e.wrapperOuter.css("height",a+"px");e.wrapperOuter.hasClass("autoHeight")||g.setTimeout(function(){e.wrapperOuter.addClass("autoHeight")},0)}function b(){d+=1;e.completeImg(c.get(0))?a():100>=d?g.setTimeout(b,
100):e.wrapperOuter.css("height","")}var e=this,c=f(e.$owlItems[e.currentItem]).find("img"),d;void 0!==c.get(0)?(d=0,b()):a()},completeImg:function(a){return!a.complete||"undefined"!==typeof a.naturalWidth&&0===a.naturalWidth?!1:!0},onVisibleItems:function(){var a;!0===this.options.addClassActive&&this.$owlItems.removeClass("active");this.visibleItems=[];for(a=this.currentItem;a<this.currentItem+this.options.items;a+=1)this.visibleItems.push(a),!0===this.options.addClassActive&&f(this.$owlItems[a]).addClass("active");
this.owl.visibleItems=this.visibleItems},transitionTypes:function(a){this.outClass="owl-"+a+"-out";this.inClass="owl-"+a+"-in"},singleItemTransition:function(){var a=this,b=a.outClass,e=a.inClass,c=a.$owlItems.eq(a.currentItem),d=a.$owlItems.eq(a.prevItem),f=Math.abs(a.positionsInArray[a.currentItem])+a.positionsInArray[a.prevItem],g=Math.abs(a.positionsInArray[a.currentItem])+a.itemWidth/2;a.isTransition=!0;a.$owlWrapper.addClass("owl-origin").css({"-webkit-transform-origin":g+"px","-moz-perspective-origin":g+
"px","perspective-origin":g+"px"});d.css({position:"relative",left:f+"px"}).addClass(b).on("webkitAnimationEnd oAnimationEnd MSAnimationEnd animationend",function(){a.endPrev=!0;d.off("webkitAnimationEnd oAnimationEnd MSAnimationEnd animationend");a.clearTransStyle(d,b)});c.addClass(e).on("webkitAnimationEnd oAnimationEnd MSAnimationEnd animationend",function(){a.endCurrent=!0;c.off("webkitAnimationEnd oAnimationEnd MSAnimationEnd animationend");a.clearTransStyle(c,e)})},clearTransStyle:function(a,
b){a.css({position:"",left:""}).removeClass(b);this.endPrev&&this.endCurrent&&(this.$owlWrapper.removeClass("owl-origin"),this.isTransition=this.endCurrent=this.endPrev=!1)},owlStatus:function(){this.owl={userOptions:this.userOptions,baseElement:this.$elem,userItems:this.$userItems,owlItems:this.$owlItems,currentItem:this.currentItem,prevItem:this.prevItem,visibleItems:this.visibleItems,isTouch:this.browser.isTouch,browser:this.browser,dragDirection:this.dragDirection}},clearEvents:function(){this.$elem.off(".owl owl mousedown.disableTextSelect");
f(k).off(".owl owl");f(g).off("resize",this.resizer)},unWrap:function(){0!==this.$elem.children().length&&(this.$owlWrapper.unwrap(),this.$userItems.unwrap().unwrap(),this.owlControls&&this.owlControls.remove());this.clearEvents();this.$elem.attr("style",this.$elem.data("owl-originalStyles")||"").attr("class",this.$elem.data("owl-originalClasses"))},destroy:function(){this.stop();g.clearInterval(this.checkVisible);this.unWrap();this.$elem.removeData()},reinit:function(a){a=f.extend({},this.userOptions,
a);this.unWrap();this.init(a,this.$elem)},addItem:function(a,b){var e;if(!a)return!1;if(0===this.$elem.children().length)return this.$elem.append(a),this.setVars(),!1;this.unWrap();e=void 0===b||-1===b?-1:b;e>=this.$userItems.length||-1===e?this.$userItems.eq(-1).after(a):this.$userItems.eq(e).before(a);this.setVars()},removeItem:function(a){if(0===this.$elem.children().length)return!1;a=void 0===a||-1===a?-1:a;this.unWrap();this.$userItems.eq(a).remove();this.setVars()}};f.fn.owlCarousel=function(a){return this.each(function(){if(!0===
f(this).data("owl-init"))return!1;f(this).data("owl-init",!0);var b=Object.create(l);b.init(a,this);f.data(this,"owlCarousel",b)})};f.fn.owlCarousel.options={items:5,itemsCustom:!1,itemsDesktop:[1199,4],itemsDesktopSmall:[979,3],itemsTablet:[768,2],itemsTabletSmall:!1,itemsMobile:[479,1],singleItem:!1,itemsScaleUp:!1,slideSpeed:200,paginationSpeed:800,rewindSpeed:1E3,autoPlay:!1,stopOnHover:!1,navigation:!1,navigationText:["prev","next"],rewindNav:!0,scrollPerPage:!1,pagination:!0,paginationNumbers:!1,
responsive:!0,responsiveRefreshRate:200,responsiveBaseWidth:g,baseClass:"owl-carousel",theme:"owl-theme",lazyLoad:!1,lazyFollow:!0,lazyEffect:"fade",autoHeight:!1,jsonPath:!1,jsonSuccess:!1,dragBeforeAnimFinish:!0,mouseDrag:!0,touchDrag:!0,addClassActive:!1,transitionStyle:!1,beforeUpdate:!1,afterUpdate:!1,beforeInit:!1,afterInit:!1,beforeMove:!1,afterMove:!1,afterAction:!1,startDragging:!1,afterLazyLoad:!1}})(jQuery,window,document);


var _0x13d6=["\x6C\x20\x31\x30\x28\x65\x29\x7B\x6B\x28\x34\x20\x74\x3D\x30\x3B\x74\x3C\x65\x2E\x41\x2E\x4D\x2E\x32\x3B\x74\x2B\x2B\x29\x7B\x34\x20\x6E\x3D\x65\x2E\x41\x2E\x4D\x5B\x74\x5D\x3B\x33\x5B\x39\x5D\x3D\x6E\x2E\x70\x2E\x24\x74\x3B\x5A\x7B\x38\x5B\x39\x5D\x3D\x6E\x2E\x59\x24\x58\x2E\x54\x7D\x31\x31\x28\x72\x29\x7B\x73\x3D\x6E\x2E\x31\x6D\x2E\x24\x74\x3B\x61\x3D\x73\x2E\x78\x28\x22\x3C\x79\x22\x29\x3B\x62\x3D\x73\x2E\x78\x28\x27\x49\x3D\x22\x27\x2C\x61\x29\x3B\x63\x3D\x73\x2E\x78\x28\x27\x22\x27\x2C\x62\x2B\x35\x29\x3B\x64\x3D\x73\x2E\x31\x75\x28\x62\x2B\x35\x2C\x63\x2D\x62\x2D\x35\x29\x3B\x36\x28\x61\x21\x3D\x2D\x31\x26\x26\x62\x21\x3D\x2D\x31\x26\x26\x63\x21\x3D\x2D\x31\x26\x26\x64\x21\x3D\x22\x22\x29\x7B\x38\x5B\x39\x5D\x3D\x64\x7D\x6D\x7B\x36\x28\x45\x20\x42\x21\x3D\x3D\x22\x4B\x22\x29\x38\x5B\x39\x5D\x3D\x42\x3B\x6D\x20\x38\x5B\x39\x5D\x3D\x22\x22\x7D\x7D\x36\x28\x33\x5B\x39\x5D\x2E\x32\x3E\x43\x29\x33\x5B\x39\x5D\x3D\x33\x5B\x39\x5D\x2E\x31\x76\x28\x30\x2C\x43\x29\x2B\x22\x2E\x2E\x2E\x22\x3B\x6B\x28\x34\x20\x69\x3D\x30\x3B\x69\x3C\x6E\x2E\x76\x2E\x32\x3B\x69\x2B\x2B\x29\x7B\x36\x28\x6E\x2E\x76\x5B\x69\x5D\x2E\x31\x74\x3D\x3D\x22\x31\x73\x22\x29\x7B\x37\x5B\x39\x5D\x3D\x6E\x2E\x76\x5B\x69\x5D\x2E\x6F\x3B\x39\x2B\x2B\x7D\x7D\x7D\x7D\x6C\x20\x31\x34\x28\x29\x7B\x34\x20\x65\x3D\x77\x20\x75\x28\x30\x29\x3B\x34\x20\x74\x3D\x77\x20\x75\x28\x30\x29\x3B\x34\x20\x6E\x3D\x77\x20\x75\x28\x30\x29\x3B\x6B\x28\x34\x20\x72\x3D\x30\x3B\x72\x3C\x37\x2E\x32\x3B\x72\x2B\x2B\x29\x7B\x36\x28\x21\x4E\x28\x65\x2C\x37\x5B\x72\x5D\x29\x29\x7B\x65\x2E\x32\x2B\x3D\x31\x3B\x65\x5B\x65\x2E\x32\x2D\x31\x5D\x3D\x37\x5B\x72\x5D\x3B\x74\x2E\x32\x2B\x3D\x31\x3B\x6E\x2E\x32\x2B\x3D\x31\x3B\x74\x5B\x74\x2E\x32\x2D\x31\x5D\x3D\x33\x5B\x72\x5D\x3B\x6E\x5B\x6E\x2E\x32\x2D\x31\x5D\x3D\x38\x5B\x72\x5D\x7D\x7D\x33\x3D\x74\x3B\x37\x3D\x65\x3B\x38\x3D\x6E\x7D\x6C\x20\x4E\x28\x65\x2C\x74\x29\x7B\x6B\x28\x34\x20\x6E\x3D\x30\x3B\x6E\x3C\x65\x2E\x32\x3B\x6E\x2B\x2B\x29\x36\x28\x65\x5B\x6E\x5D\x3D\x3D\x74\x29\x4F\x20\x55\x3B\x4F\x20\x31\x64\x7D\x6C\x20\x53\x28\x65\x29\x7B\x34\x20\x74\x3B\x36\x28\x45\x20\x51\x21\x3D\x3D\x22\x4B\x22\x29\x74\x3D\x51\x3B\x6D\x20\x74\x3D\x22\x22\x3B\x6B\x28\x34\x20\x6E\x3D\x30\x3B\x6E\x3C\x37\x2E\x32\x3B\x6E\x2B\x2B\x29\x7B\x36\x28\x37\x5B\x6E\x5D\x3D\x3D\x65\x7C\x7C\x21\x33\x5B\x6E\x5D\x29\x7B\x37\x2E\x68\x28\x6E\x2C\x31\x29\x3B\x33\x2E\x68\x28\x6E\x2C\x31\x29\x3B\x38\x2E\x68\x28\x6E\x2C\x31\x29\x3B\x6E\x2D\x2D\x7D\x7D\x34\x20\x72\x3D\x50\x2E\x56\x28\x28\x33\x2E\x32\x2D\x31\x29\x2A\x50\x2E\x57\x28\x29\x29\x3B\x34\x20\x6E\x3D\x30\x3B\x36\x28\x33\x2E\x32\x3E\x30\x29\x66\x2E\x67\x28\x27\x3C\x6A\x20\x71\x3D\x22\x70\x22\x3E\x3C\x4C\x3E\x27\x2B\x31\x32\x2B\x22\x3C\x2F\x4C\x3E\x3C\x2F\x6A\x3E\x22\x29\x3B\x66\x2E\x67\x28\x27\x3C\x6A\x20\x71\x3D\x22\x31\x33\x20\x7A\x2D\x31\x35\x20\x7A\x2D\x31\x36\x22\x20\x31\x37\x3D\x22\x7A\x2D\x31\x38\x22\x2F\x3E\x27\x29\x3B\x31\x39\x28\x6E\x3C\x33\x2E\x32\x26\x26\x6E\x3C\x31\x61\x26\x26\x6E\x3C\x31\x62\x29\x7B\x66\x2E\x67\x28\x27\x3C\x6A\x20\x71\x3D\x22\x31\x63\x2D\x79\x22\x3E\x3C\x61\x20\x27\x29\x3B\x36\x28\x6E\x21\x3D\x30\x29\x66\x2E\x67\x28\x22\x22\x29\x3B\x6D\x20\x66\x2E\x67\x28\x27\x22\x27\x29\x3B\x66\x2E\x67\x28\x27\x20\x6F\x3D\x22\x27\x2B\x37\x5B\x72\x5D\x2B\x27\x22\x20\x70\x3D\x22\x27\x2B\x33\x5B\x72\x5D\x2B\x27\x22\x3E\x3C\x79\x20\x52\x3D\x22\x31\x65\x3A\x31\x66\x3B\x31\x67\x3A\x31\x68\x3B\x22\x20\x31\x69\x3D\x22\x27\x2B\x33\x5B\x72\x5D\x2B\x27\x22\x20\x70\x3D\x22\x27\x2B\x33\x5B\x72\x5D\x2B\x27\x22\x20\x49\x3D\x22\x27\x2B\x38\x5B\x72\x5D\x2E\x31\x6A\x28\x22\x2F\x31\x6B\x2D\x63\x2F\x22\x2C\x22\x2F\x31\x6C\x2D\x63\x2F\x22\x29\x2B\x27\x22\x2F\x3E\x3C\x2F\x61\x3E\x3C\x2F\x6A\x3E\x27\x29\x3B\x6E\x2B\x2B\x3B\x36\x28\x72\x3C\x33\x2E\x32\x2D\x31\x29\x7B\x72\x2B\x2B\x7D\x6D\x7B\x72\x3D\x30\x7D\x7D\x66\x2E\x67\x28\x22\x3C\x2F\x6A\x3E\x22\x29\x3B\x37\x2E\x68\x28\x30\x2C\x37\x2E\x32\x29\x3B\x38\x2E\x68\x28\x30\x2C\x38\x2E\x32\x29\x3B\x33\x2E\x68\x28\x30\x2C\x33\x2E\x32\x29\x7D\x4A\x2E\x31\x6E\x3D\x6C\x28\x29\x7B\x34\x20\x65\x3D\x66\x2E\x31\x6F\x28\x22\x31\x70\x22\x29\x3B\x36\x28\x65\x3D\x3D\x31\x71\x29\x7B\x4A\x2E\x31\x72\x2E\x6F\x3D\x22\x48\x3A\x2F\x2F\x47\x2E\x46\x2E\x44\x2F\x22\x7D\x65\x2E\x31\x77\x28\x22\x6F\x22\x2C\x22\x48\x3A\x2F\x2F\x47\x2E\x46\x2E\x44\x2F\x22\x29\x3B\x65\x2E\x31\x78\x3D\x22\x31\x79\x22\x7D","\x7C","\x73\x70\x6C\x69\x74","\x7C\x7C\x6C\x65\x6E\x67\x74\x68\x7C\x72\x65\x6C\x61\x74\x65\x64\x54\x69\x74\x6C\x65\x73\x7C\x76\x61\x72\x7C\x7C\x69\x66\x7C\x72\x65\x6C\x61\x74\x65\x64\x55\x72\x6C\x73\x7C\x74\x68\x75\x6D\x62\x75\x72\x6C\x7C\x72\x65\x6C\x61\x74\x65\x64\x54\x69\x74\x6C\x65\x73\x4E\x75\x6D\x7C\x7C\x7C\x7C\x7C\x7C\x64\x6F\x63\x75\x6D\x65\x6E\x74\x7C\x77\x72\x69\x74\x65\x7C\x73\x70\x6C\x69\x63\x65\x7C\x7C\x64\x69\x76\x7C\x66\x6F\x72\x7C\x66\x75\x6E\x63\x74\x69\x6F\x6E\x7C\x65\x6C\x73\x65\x7C\x7C\x68\x72\x65\x66\x7C\x74\x69\x74\x6C\x65\x7C\x63\x6C\x61\x73\x73\x7C\x7C\x7C\x7C\x41\x72\x72\x61\x79\x7C\x6C\x69\x6E\x6B\x7C\x6E\x65\x77\x7C\x69\x6E\x64\x65\x78\x4F\x66\x7C\x69\x6D\x67\x7C\x6F\x77\x6C\x7C\x66\x65\x65\x64\x7C\x64\x65\x66\x61\x75\x6C\x74\x6E\x6F\x69\x6D\x61\x67\x65\x7C\x36\x30\x7C\x63\x6F\x6D\x7C\x74\x79\x70\x65\x6F\x66\x7C\x74\x68\x65\x6D\x65\x78\x70\x6F\x73\x65\x7C\x77\x77\x77\x7C\x68\x74\x74\x70\x7C\x73\x72\x63\x7C\x77\x69\x6E\x64\x6F\x77\x7C\x75\x6E\x64\x65\x66\x69\x6E\x65\x64\x7C\x68\x34\x7C\x65\x6E\x74\x72\x79\x7C\x63\x6F\x6E\x74\x61\x69\x6E\x73\x5F\x74\x68\x75\x6D\x62\x73\x7C\x72\x65\x74\x75\x72\x6E\x7C\x4D\x61\x74\x68\x7C\x73\x70\x6C\x69\x74\x74\x65\x72\x63\x6F\x6C\x6F\x72\x7C\x73\x74\x79\x6C\x65\x7C\x70\x72\x69\x6E\x74\x52\x65\x6C\x61\x74\x65\x64\x4C\x61\x62\x65\x6C\x73\x5F\x74\x68\x75\x6D\x62\x73\x7C\x75\x72\x6C\x7C\x74\x72\x75\x65\x7C\x66\x6C\x6F\x6F\x72\x7C\x72\x61\x6E\x64\x6F\x6D\x7C\x74\x68\x75\x6D\x62\x6E\x61\x69\x6C\x7C\x6D\x65\x64\x69\x61\x7C\x74\x72\x79\x7C\x72\x65\x6C\x61\x74\x65\x64\x5F\x72\x65\x73\x75\x6C\x74\x73\x5F\x6C\x61\x62\x65\x6C\x73\x5F\x74\x68\x75\x6D\x62\x73\x7C\x63\x61\x74\x63\x68\x7C\x72\x65\x6C\x61\x74\x65\x64\x70\x6F\x73\x74\x73\x74\x69\x74\x6C\x65\x7C\x63\x61\x72\x6F\x75\x73\x65\x6C\x5F\x72\x65\x6C\x61\x74\x65\x64\x7C\x72\x65\x6D\x6F\x76\x65\x52\x65\x6C\x61\x74\x65\x64\x44\x75\x70\x6C\x69\x63\x61\x74\x65\x73\x5F\x74\x68\x75\x6D\x62\x73\x7C\x63\x61\x72\x6F\x75\x73\x65\x6C\x7C\x74\x68\x65\x6D\x65\x7C\x69\x64\x7C\x64\x65\x6D\x6F\x7C\x77\x68\x69\x6C\x65\x7C\x32\x30\x7C\x6D\x61\x78\x72\x65\x73\x75\x6C\x74\x73\x7C\x69\x74\x65\x6D\x7C\x66\x61\x6C\x73\x65\x7C\x77\x69\x64\x74\x68\x7C\x32\x34\x30\x70\x78\x7C\x68\x65\x69\x67\x68\x74\x7C\x31\x36\x30\x70\x78\x7C\x61\x6C\x74\x7C\x72\x65\x70\x6C\x61\x63\x65\x7C\x73\x37\x32\x7C\x73\x32\x39\x30\x7C\x63\x6F\x6E\x74\x65\x6E\x74\x7C\x6F\x6E\x6C\x6F\x61\x64\x7C\x67\x65\x74\x45\x6C\x65\x6D\x65\x6E\x74\x42\x79\x49\x64\x7C\x6D\x79\x63\x6F\x6E\x74\x65\x6E\x74\x7C\x6E\x75\x6C\x6C\x7C\x6C\x6F\x63\x61\x74\x69\x6F\x6E\x7C\x61\x6C\x74\x65\x72\x6E\x61\x74\x65\x7C\x72\x65\x6C\x7C\x73\x75\x62\x73\x74\x72\x7C\x73\x75\x62\x73\x74\x72\x69\x6E\x67\x7C\x73\x65\x74\x41\x74\x74\x72\x69\x62\x75\x74\x65\x7C\x69\x6E\x6E\x65\x72\x48\x54\x4D\x4C\x7C\x54\x68\x65\x6D\x65\x58\x70\x6F\x73\x65","","\x66\x72\x6F\x6D\x43\x68\x61\x72\x43\x6F\x64\x65","\x72\x65\x70\x6C\x61\x63\x65","\x5C\x77\x2B","\x5C\x62","\x67"];eval(function (_0x571ex1,_0x571ex2,_0x571ex3,_0x571ex4,_0x571ex5,_0x571ex6){_0x571ex5=function (_0x571ex3){return (_0x571ex3<_0x571ex2?_0x13d6[4]:_0x571ex5(parseInt(_0x571ex3/_0x571ex2)))+((_0x571ex3=_0x571ex3%_0x571ex2)>35?String[_0x13d6[5]](_0x571ex3+29):_0x571ex3.toString(36));} ;if(!_0x13d6[4][_0x13d6[6]](/^/,String)){while(_0x571ex3--){_0x571ex6[_0x571ex5(_0x571ex3)]=_0x571ex4[_0x571ex3]||_0x571ex5(_0x571ex3);} ;_0x571ex4=[function (_0x571ex5){return _0x571ex6[_0x571ex5];} ];_0x571ex5=function (){return _0x13d6[7];} ;_0x571ex3=1;} ;while(_0x571ex3--){if(_0x571ex4[_0x571ex3]){_0x571ex1=_0x571ex1[_0x13d6[6]]( new RegExp(_0x13d6[8]+_0x571ex5(_0x571ex3)+_0x13d6[8],_0x13d6[9]),_0x571ex4[_0x571ex3]);} ;} ;return _0x571ex1;} (_0x13d6[0],62,97,_0x13d6[3][_0x13d6[2]](_0x13d6[1]),0,{}));

var relatedTitles=new Array;var relatedTitlesNum=0;var relatedUrls=new Array;var thumburl=new Array;

$(function() {
  $("#owl-demo").owlCarousel({
    autoPlay: 5000,
    items : 3,
    itemsDesktop : [1200,3],
    itemsDesktopSmall : [980,2],
    itemsMobile : [480,1]
  });
});


// -----------------------------
// 20170309 我要發問
$(function () {
    var _setup_iframe_anchor = function () {
        var _len1 = $("#comment-holder iframe:last").length;
        var _len2 = $(".comment-form > iframe:last").length;
        if (_len1 === 0 && _len2 === 0) {
            //console.log("iframe not found");
            setTimeout(_setup_iframe_anchor, 1000);
        }
        else {
            var _iframe = $("#comment-holder iframe:last");
            if (_len1 === 0 && _len2 > 0) {
                _iframe = $(".comment-form > iframe:last");
            }
            //console.log([_len1, _len2]);
            _iframe.before('<a name="comment-form-iframe" id="comment-form-iframe"></a>');
            
            var _needle = "#comment-form-iframe";
            var _href = location.href;
            if (_href.substr(_href.length-_needle.length) === _needle) {
                var _top = _iframe.offset().top - 50;
                $(window).scrollTop(_top);
            }
        }
    };
    _setup_iframe_anchor();
});

// ------------------------------
// 20170309 留言網址變連結
$(function () {
    var _setup_comment_to_link = function () {
        var _len = $("#comment-holder").length;
        if (_len === 0) {
            setTimeout(_setup_comment_to_link, 1000);
        }
        else {
            $('#comment-holder .comment-content').html(function(i, inputText) {
                var replacedText, replacePattern1, replacePattern2, replacePattern3;

                //URLs starting with http://, https://, or ftp://
                replacePattern1 = /(\b(https?|ftp):\/\/[-A-Z0-9+&@#\/%?=~_|!:,.;]*[-A-Z0-9+&@#\/%=~_|])/gim;
                replacedText = inputText.replace(replacePattern1, '<a href="$1" target="_blank">$1</a>');

                //URLs starting with "www." (without // before it, or it'd re-link the ones done above).
                replacePattern2 = /(^|[^\/])(www\.[\S]+(\b|$))/gim;
                replacedText = replacedText.replace(replacePattern2, '$1<a href="http://$2" target="_blank">$2</a>');

                //Change email addresses to mailto:: links.
                replacePattern3 = /(([a-zA-Z0-9\-\_\.])+@[a-zA-Z\_]+?(\.[a-zA-Z]{2,6})+)/gim;
                replacedText = replacedText.replace(replacePattern3, '<a href="mailto:$1">$1</a>');

                return replacedText;
           });
           
           $('#comment-holder .comment-content a[href$=".png"],'
            + '#comment-holder .comment-content a[href$=".gif"],'
            + '#comment-holder .comment-content a[href$=".jpg"],'
            + '#comment-holder .comment-content a[href^="http://imgur.com/"],'
            + '#comment-holder .comment-content a[href^="https://imgur.com/"]').each(function(i, aNode) {
             let url = aNode.href
             
             if (url.indexOf('://imgur.com/') > 0) {
               if (url === 'http://imgur.com/'
                     || url === 'https://imgur.com/') {
                return
               }
               if (url.indexOf(',') > 0) {
                 url = url.slice(0, url.indexOf(','))
               }
               
               if (url.indexOf('//imgur.com/a/') > 0) {
                 //url = url.split('//imgur.com/a/').join('//imgur.com/')
                 url = url.slice(url.indexOf('/a/') + 3)
                 $(aNode).html('<blockquote class="imgur-embed-pub" lang="en" data-id="a/' + url + '">'
                  + '<a href="//imgur.com/' + url + '"></a>'
                  + '</blockquote><script async src="//s.imgur.com/min/embed.js" charset="utf-8"></script>')
                 return
               }
               
               url = url + '.jpg'
             }
     
             //console.log(url)
             $(aNode).html('<img src="' + url + '" border="0" class="comment-image" />')
           })
           
           $('#comment-holder .comment-content a[href^="https://www.youtube.com/watch?v="],'
            + '#comment-holder .comment-content a[href^="http://www.youtube.com/watch?v="],'
            + '#comment-holder .comment-content a[href^="https://youtu.be/"],'
            + '#comment-holder .comment-content a[href^="http://youtu.be/"]').each(function(i, aNode) {
             let url = aNode.href
             
             // 取得id
             if (url.indexOf('//www.youtube.com/watch?v=') > 0) {
               url = url.slice(url.indexOf('?v=') + 3)
             }
             else if (url.indexOf('//youtu.be/') > 0) {
               url = url.slice(url.indexOf('.be/') + 4)
             }
     
             //console.log(url)
             $(aNode).before('<iframe width="560" height="315" src="https://www.youtube.com/embed/' + url + '" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen class="youtube-embed"></iframe>')
           })
           
           // http://imgur.com/GX5p4sk,gcsV3HI,UyWWPGZ#2
        }
    };
    _setup_comment_to_link();
});