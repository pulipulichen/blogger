 (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
  (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
  m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
  })(window,document,'script','//www.google-analytics.com/analytics.js','ga');

//ga('create', 'UA-37178375-1', 'auto');    // 原始的呼叫方法

// IMPORTANT: This is just example data for demonstration purposes to send *something* to GA. Populate your `customUserId` some other way. DO NOT COPY THIS.
  var prefix = ['abc', 'def', 'ghi'],
      middle = ['123', '456', '789'],
      suffix = ['rst', 'uvw', 'xyz'],
      random = function() {
          return Math.floor(Math.random() * 3);
      };
 
  // IMPORTANT: POPULATE YOUR OWN `customUserId` HERE...
  // Simple pseudo-random user id - 27 possible values
  // This is *just* some "random" text that we're using as userIds. DO NOT COPY THIS.
  // You'll need to implement something here linked to your customer database, CRM system, mailing list or whatever you're using
  var customUserId = prefix[random()] + '-' + middle[random()] + '-' + suffix[random()]; // e.g. abc-123-rst
 
ga('create', 'UA-37178375-1', {'userId': customUserId});   // 20161118 嘗試加入userId看看
ga('require', 'displayfeatures');
ga('set', 'dimension1', customUserId);

ga('send', 'pageview');

// ----------------------------------------
/**
 * 20161118 加入事件設定
 */
  
 $(function () {
     
     // ------------------------
     // 搜尋
     var _check_ga_search_ready = function () {
         if ($(".gsc-search-button").length === 0) {
             setTimeout(_check_ga_search_ready, 1000);
         }
         else {
             $(".gsc-search-button:first").click(function () {
                 ga("send", "event", "search", $("input.gsc-input:first").val(), 1);
                 //console.log("送出GA event search");
             });
         }
     };
     _check_ga_search_ready();
     
     // ----------------------------
     // 分享
     $(".social-button").click(function () {
         //var _btn = $(this);
         //var _link = _btn.parent("aside:first");
         ga("send", "event", "share", $(this).attr("data-title"), 1);
        //console.log("送出GA event search");
     });
 });