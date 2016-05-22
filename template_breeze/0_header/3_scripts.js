$(document).ready(function(){
  $(".widget h2").wrapInner("<span/>");
    });

// -------------------
jQuery(document).ready(function($){

  var aboveHeight = $('#leader-wrapper').outerHeight();
  $(window).scroll(function(){
    if ($(window).scrollTop() > aboveHeight){
      $('#masthead').addClass('fixed-nav').css('top','0').next()
      .css('padding-top','5px');

    } else {
      $('#masthead').removeClass('fixed-nav').next()
      .css('padding-top','0');
    }
  });
});