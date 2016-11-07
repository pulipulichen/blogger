INSERT INTO doc (fulltext) VALUES ( '
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html dir=''ltr'' xmlns=''http://www.w3.org/1999/xhtml'' xmlns:b=''http://www.google.com/2005/gml/b'' xmlns:data=''http://www.google.com/2005/gml/data'' xmlns:expr=''http://www.google.com/2005/gml/expr''>
<head>
<title>
開箱即用的R運作環境&#65281;RStudio Server OpenVZ虛擬機器分享 / Standalone R Environment: RStudio Server in OpenVZ Virtual Machine - 布丁布丁吃什麼&#65311;
</title>
<meta content=''text/html; charset=UTF-8'' http-equiv=''Content-Type''/>
<meta content=''blogger'' name=''generator''/>
<link href=''http://blog.pulipuli.info/favicon.ico'' rel=''icon'' type=''image/x-icon''/>
<link href=''http://blog.pulipuli.info/2016/11/rrstudio-server-openvz-standalone-r.html'' rel=''canonical''/>
<link rel="alternate" type="application/atom+xml" title="布丁布丁吃什麼&#65311; - Atom" href="http://blog.pulipuli.info/feeds/posts/default" />
<link rel="alternate" type="application/rss+xml" title="布丁布丁吃什麼&#65311; - RSS" href="http://blog.pulipuli.info/feeds/posts/default?alt=rss" />
<link rel="service.post" type="application/atom+xml" title="布丁布丁吃什麼&#65311; - Atom" href="https://www.blogger.com/feeds/16607461/posts/default" />

<link rel="alternate" type="application/atom+xml" title="布丁布丁吃什麼&#65311; - Atom" href="http://blog.pulipuli.info/feeds/3945870409398834382/comments/default" />
<link href=''https://lh3.googleusercontent.com/-ybNC09QREIo/WCAa8HLqr3I/AAAAAAAC82k/pVxbGmRI_ec/image_thumb%25255B4%25255D.png?imgmax=800'' rel=''image_src''/>
<meta content=''http://blog.pulipuli.info/2016/11/rrstudio-server-openvz-standalone-r.html'' property=''og:url''/>
<meta content=''開箱即用的R運作環境！RStudio Server OpenVZ虛擬機器分享 / Standalone R Environment: RStudio Server in OpenVZ Virtual Machine'' property=''og:title''/>
<meta content=''布丁布丁吃布丁分享網頁技術、讀書心得的園地。'' property=''og:description''/>
<meta content=''https://lh3.googleusercontent.com/-ybNC09QREIo/WCAa8HLqr3I/AAAAAAAC82k/pVxbGmRI_ec/w1200-h630-p-nu/image_thumb%25255B4%25255D.png?imgmax=800'' property=''og:image''/>
<!--[if IE]> <script> (function() { var html5 = ("abbr,article,aside,audio,canvas,datalist,details," + "figure,footer,header,hgroup,mark,menu,meter,nav,output," + "progress,section,time,video").split('',''); for (var i = 0; i < html5.length; i++) { document.createElement(html5[i]); } try { document.execCommand(''BackgroundImageCache'', false, true); } catch(e) {} })(); </script> <![endif]-->
<link type=''text/css'' rel=''stylesheet'' href=''https://www.blogger.com/static/v1/widgets/2210556531-widget_css_bundle.css'' />
<link type=''text/css'' rel=''stylesheet'' href=''https://www.blogger.com/dyn-css/authorization.css?targetBlogID=16607461&zx=e20bc493-f1f6-430c-83e5-2630113db056'' />
<style id=''page-skin-1'' type=''text/css''><!--
/*
-----------------------------------------------
Blogger Template Style
Name:        Breeze
Created by:  ThemeXpose
Url:         http://www.themexpose.com/
License:     Full version
----------------------------------------------- */
body#layout .nav-collapse,.no-image,.pagenavi .pages,#navbar,.date-header,.feed-links,.post-location,.post-share-buttons,.post-icons{display: none !important;}
.section,.widget,.widget-content,.widget ul,.widget li,body,h1,h2,h3,h4,h5,ul,li,a,p,span,img,dd{margin:0;padding:0;list-style:none;text-decoration:none;border:none;outline:none}
body#layout #content {float:left;width:600px;margin-left:30px}
body#layout #side-bar {float:right;width:300px;}
#column1,#column2,#column3 {float:left}
body,.body-fauxcolumn-outer{font-family: "Lato",Helvetica,sans-serif;background:#E9F0F4;font-size:18px;font-weight:300;line-height:1.75;overflow-x:hidden;position:relative}
a{color:#333}
a:hover{color:#F69087}
h1,h2,h3,h4,h5{font-family:"Lato",serif}
.bl_background{position:fixed;z-index:-1;width:100%;height:100%;left:0;top:0}
.bl_background img{width:100%;height:100%}
#background_pattern{background-repeat:repeat;height:100%;left:0;position:fixed;top:0;width:100%;z-index:-1}
.clearfix{*zoom:1}
.clearfix:before,.clearfix:after{display:table;content:"";line-height:0}
.clearfix:after{clear:both}
.hide-text{font:0/0 a;color:transparent;text-shadow:none;background-color:transparent;border:0}
.input-block-level{display:block;width:100%;min-height:30px;-webkit-box-sizing:border-box;-moz-box-sizing:border-box;box-sizing:border-box}
article,aside,details,figcaption,figure,footer,header,hgroup,nav,section{display:block}
audio,canvas,video{display:inline-block;*display:inline;*zoom:1}
audio:not([controls]){display:none}
html{font-size:100%;-webkit-text-size-adjust:100%;-ms-text-size-adjust:100%}
a:focus{outline:thin dotted #333;outline:5px auto -webkit-focus-ring-color;outline-offset:-2px}
a:hover,a:active{outline:0}
sub,sup{position:relative;font-size:75%;line-height:0;vertical-align:baseline}
sup{top:-0.5em}
sub{bottom:-0.25em}
img{max-width:100%;width:auto\9;height:auto;vertical-align:middle;border:0;-ms-interpolation-mode:bicubic}
#map_canvas img,.google-maps img{max-width:none}
button,input,select,textarea{margin:0;font-size:100%;vertical-align:middle}
button,input{*overflow:visible;line-height:normal}
button::-moz-focus-inner,input::-moz-focus-inner{padding:0;border:0}
button,html input[type="button"],input[type="reset"],input[type="submit"]{-webkit-appearance:button;cursor:pointer}
label,select,button,input[type="button"],input[type="reset"],input[type="submit"],input[type="radio"],input[type="checkbox"]{cursor:pointer}
input[type="search"]{-webkit-box-sizing:content-box;-moz-box-sizing:content-box;box-sizing:content-box;-webkit-appearance:textfield}
input[type="search"]::-webkit-search-decoration,input[type="search"]::-webkit-search-cancel-button{-webkit-appearance:none}
textarea{overflow:auto;vertical-align:top}
@media print{*{text-shadow:none !important;color:#000 !important;background:transparent !important;box-shadow:none !important}
a,a:visited{text-decoration:underline}
a[href]:after{content:" (" attr(href) ")"}
abbr[title]:after{content:" (" attr(title) ")"}
.ir a:after,a[href^="javascript:"]:after,a[href^="#"]:after{content:""}
thead{display:table-header-group}
tr,img{page-break-inside:avoid}
img{max-width:100% !important}
@page{margin:0.5cm}
p,h2,h3{orphans:3;widows:3}
h2,h3{page-break-after:avoid}
}
.img-rounded{-webkit-border-radius:6px;-moz-border-radius:6px;border-radius:6px}
.img-polaroid{padding:4px;background-color:#fff;border:1px solid #ccc;border:1px solid rgba(0,0,0,0.2);-webkit-box-shadow:0 1px 3px rgba(0,0,0,0.1);-moz-box-shadow:0 1px 3px rgba(0,0,0,0.1);box-shadow:0 1px 3px rgba(0,0,0,0.1)}
.img-circle{-webkit-border-radius:500px;-moz-border-radius:500px;border-radius:500px}
.row{margin-left:-20px;*zoom:1}
.row:before,.row:after{display:table;content:"";line-height:0}
.row:after{clear:both}
[class*="span"]{float:left;min-height:1px;margin-left:20px}
.container,.navbar-static-top .container,.navbar-fixed-top .container,.navbar-fixed-bottom .container{width:940px}
.span12{width:940px}
.span11{width:860px}
.span10{width:780px}
.span9{width:700px}
.span8{width:620px}
.span7{width:540px}
.span6{width:460px}
.span5{width:380px}
.span4{width:300px}
.span3{width:220px}
.span2{width:140px}
.span1{width:60px}
.offset12{margin-left:980px}
.offset11{margin-left:900px}
.offset10{margin-left:820px}
.offset9{margin-left:740px}
.offset8{margin-left:660px}
.offset7{margin-left:580px}
.offset6{margin-left:500px}
.offset5{margin-left:420px}
.offset4{margin-left:340px}
.offset3{margin-left:260px}
.offset2{margin-left:180px}
.offset1{margin-left:100px}
.row-fluid{width:100%;*zoom:1}
.row-fluid:before,.row-fluid:after{display:table;content:"";line-height:0}
.row-fluid:after{clear:both}
.row-fluid > [class*="span"]{display:block;width:100%;min-height:30px;-webkit-box-sizing:border-box;-moz-box-sizing:border-box;box-sizing:border-box;float:left;margin-left:2.127659574468085%;*margin-left:2.074468085106383%}
.row-fluid > [class*="span"]:first-child{margin-left:0}
.row-fluid .controls-row [class*="span"]+[class*="span"]{margin-left:2.127659574468085%}
.row-fluid .span12{width:100%;*width:99.94680851063829%}
.row-fluid .span11{width:91.48936170212765%;*width:91.43617021276594%}
.row-fluid .span10{width:82.97872340425532%;*width:82.92553191489361%}
.row-fluid .span9{width:74.46808510638297%;*width:74.41489361702126%}
.row-fluid .span8{width:65.95744680851064%;*width:65.90425531914893%}
.row-fluid .span7{width:57.44680851063829%;*width:57.39361702127659%}
.row-fluid .span6{width:48.93617021276595%;*width:48.88297872340425%}
.row-fluid .span5{width:40.42553191489362%;*width:40.37234042553192%}
.row-fluid .span4{width:31.914893617021278%;*width:31.861702127659576%}
.row-fluid .span3{width:23.404255319148934%;*width:23.351063829787233%}
.row-fluid .span2{width:14.893617021276595%;*width:14.840425531914894%}
.row-fluid .span1{width:6.382978723404255%;*width:6.329787234042553%}
.row-fluid .offset12{margin-left:104.25531914893617%;*margin-left:104.14893617021275%}
.row-fluid .offset12:first-child{margin-left:102.12765957446808%;*margin-left:102.02127659574467%}
.row-fluid .offset11{margin-left:95.74468085106382%;*margin-left:95.6382978723404%}
.row-fluid .offset11:first-child{margin-left:93.61702127659574%;*margin-left:93.51063829787232%}
.row-fluid .offset10{margin-left:87.23404255319149%;*margin-left:87.12765957446807%}
.row-fluid .offset10:first-child{margin-left:85.1063829787234%;*margin-left:84.99999999999999%}
.row-fluid .offset9{margin-left:78.72340425531914%;*margin-left:78.61702127659572%}
.row-fluid .offset9:first-child{margin-left:76.59574468085106%;*margin-left:76.48936170212764%}
.row-fluid .offset8{margin-left:70.2127659574468%;*margin-left:70.10638297872339%}
.row-fluid .offset8:first-child{margin-left:68.08510638297872%;*margin-left:67.9787234042553%}
.row-fluid .offset7{margin-left:61.70212765957446%;*margin-left:61.59574468085106%}
.row-fluid .offset7:first-child{margin-left:59.574468085106375%;*margin-left:59.46808510638297%}
.row-fluid .offset6{margin-left:53.191489361702125%;*margin-left:53.085106382978715%}
.row-fluid .offset6:first-child{margin-left:51.063829787234035%;*margin-left:50.95744680851063%}
.row-fluid .offset5{margin-left:44.68085106382979%;*margin-left:44.57446808510638%}
.row-fluid .offset5:first-child{margin-left:42.5531914893617%;*margin-left:42.4468085106383%}
.row-fluid .offset4{margin-left:36.170212765957444%;*margin-left:36.06382978723405%}
.row-fluid .offset4:first-child{margin-left:34.04255319148936%;*margin-left:33.93617021276596%}
.row-fluid .offset3{margin-left:27.659574468085104%;*margin-left:27.5531914893617%}
.row-fluid .offset3:first-child{margin-left:25.53191489361702%;*margin-left:25.425531914893618%}
.row-fluid .offset2{margin-left:19.148936170212764%;*margin-left:19.04255319148936%}
.row-fluid .offset2:first-child{margin-left:17.02127659574468%;*margin-left:16.914893617021278%}
.row-fluid .offset1{margin-left:10.638297872340425%;*margin-left:10.53191489361702%}
.row-fluid .offset1:first-child{margin-left:8.51063829787234%;*margin-left:8.404255319148938%}
[class*="span"].hide,.row-fluid [class*="span"].hide{display:none}
[class*="span"].pull-right,.row-fluid [class*="span"].pull-right{float:right;}
.container{margin-right:auto;margin-left:auto;*zoom:1}
.container:before,.container:after{display:table;content:"";line-height:0}
.container:after{clear:both}
.container-fluid{padding-right:20px;padding-left:20px;*zoom:1}
.container-fluid:before,.container-fluid:after{display:table;content:"";line-height:0}
.container-fluid:after{clear:both}
p{margin:0 0 10px}
.lead{margin-bottom:20px;font-size:21px;font-weight:200;line-height:30px}
small{font-size:85%}
strong{font-weight:bold}
em{font-style:italic}
cite{font-style:normal}
.muted{color:#999}
a.muted:hover,a.muted:focus{color:#808080}
.text-warning{color:#c09853}
a.text-warning:hover,a.text-warning:focus{color:#a47e3c}
.text-error{color:#b94a48}
a.text-error:hover,a.text-error:focus{color:#953b39}
.text-info{color:#3a87ad}
a.text-info:hover,a.text-info:focus{color:#2d6987}
.text-success{color:#468847}
a.text-success:hover,a.text-success:focus{color:#356635}
.text-left{text-align:left}
.text-right{text-align:right}
.text-center{text-align:center}
.page-header{padding-bottom:9px;margin:20px 0 30px;border-bottom:1px solid #eee}
ul,ol{padding:0;margin:0 0 10px 25px}
ul ul,ul ol,ol ol,ol ul{margin-bottom:0}
li{line-height:20px}
ul.unstyled,ol.unstyled{margin-left:0;list-style:none}
ul.inline,ol.inline{margin-left:0;list-style:none}
ul.inline>li,ol.inline>li{display:inline-block;*display:inline;*zoom:1;padding-left:5px;padding-right:5px}
dl{margin-bottom:20px}
dt,dd{line-height:20px}
dt{font-weight:bold}
dd{margin-left:10px}
.dl-horizontal{*zoom:1}
.dl-horizontal:before,.dl-horizontal:after{display:table;content:"";line-height:0}
.dl-horizontal:after{clear:both}
.dl-horizontal dt{float:left;width:160px;clear:left;text-align:right;overflow:hidden;text-overflow:ellipsis;white-space:nowrap}
.dl-horizontal dd{margin-left:180px}
hr{margin:20px 0;border:0;border-top:1px solid #eee;border-bottom:1px solid #fff}
abbr[title],abbr[data-original-title]{cursor:help;border-bottom:1px dotted #999}
abbr.initialism{font-size:90%;text-transform:uppercase}
blockquote{padding:0 0 0 15px;margin:0 0 20px;border-left:5px solid #eee}
blockquote p{margin-bottom:0;font-size:17.5px;font-weight:300;line-height:1.25}
blockquote small{display:block;line-height:20px;color:#999}
blockquote small:before{content:''\2014 \00A0''}
blockquote.pull-right{float:right;padding-right:15px;padding-left:0;border-right:5px solid #eee;border-left:0}
blockquote.pull-right p,blockquote.pull-right small{text-align:right}
blockquote.pull-right small:before{content:''''}
blockquote.pull-right small:after{content:''\00A0 \2014''}
q:before,q:after,blockquote:before,blockquote:after{content:""}
address{display:block;margin-bottom:20px;font-style:normal;line-height:20px}
code,pre{padding:0 3px 2px;font-family:Monaco,Menlo,Consolas,"Courier New",monospace;font-size:12px;color:#333;-webkit-border-radius:3px;-moz-border-radius:3px;border-radius:3px}
code{padding:2px 4px;color:#d14;background-color:#f7f7f9;border:1px solid #e1e1e8;white-space:nowrap}
pre{display:block;padding:9.5px;margin:0 0 10px;font-size:13px;line-height:20px;word-break:break-all;word-wrap:break-word;white-space:pre;white-space:pre-wrap;background-color:#f5f5f5;border:1px solid #ccc;border:1px solid rgba(0,0,0,0.15);-webkit-border-radius:4px;-moz-border-radius:4px;border-radius:4px}
pre.prettyprint{margin-bottom:20px}
pre code{padding:0;color:inherit;white-space:pre;white-space:pre-wrap;background-color:transparent;border:0}
.pre-scrollable{max-height:340px;overflow-y:scroll}
.label,.badge{display:inline-block;padding:2px 4px;font-size:11.844px;font-weight:bold;line-height:14px;color:#fff;vertical-align:baseline;white-space:nowrap;text-shadow:0 -1px 0 rgba(0,0,0,0.25);background-color:#999}
.label{-webkit-border-radius:3px;-moz-border-radius:3px;border-radius:3px}
.badge{padding-left:9px;padding-right:9px;-webkit-border-radius:9px;-moz-border-radius:9px;border-radius:9px}
.label:empty,.badge:empty{display:none}
a.label:hover,a.label:focus,a.badge:hover,a.badge:focus{color:#fff;text-decoration:none;cursor:pointer}
.label-important,.badge-important{background-color:#b94a48}
.label-important[href],.badge-important[href]{background-color:#953b39}
.label-warning,.badge-warning{background-color:#f89406}
.label-warning[href],.badge-warning[href]{background-color:#c67605}
.label-success,.badge-success{background-color:#468847}
.label-success[href],.badge-success[href]{background-color:#356635}
.label-info[href],.badge-info[href]{background-color:#2d6987}
.label-inverse,.badge-inverse{background-color:#333}
.label-inverse[href],.badge-inverse[href]{background-color:#1a1a1a}
.btn .label,.btn .badge{position:relative;top:-1px}
.btn-mini .label,.btn-mini .badge{top:0}
table{max-width:100%;background-color:transparent;border-collapse:collapse;border-spacing:0}
.table{width:100%;margin-bottom:20px}
.table th,.table td{padding:8px;line-height:20px;text-align:left;vertical-align:top;border-top:1px solid #ddd}
.table th{font-weight:bold}
.table thead th{vertical-align:bottom}
.table caption+thead tr:first-child th,.table caption+thead tr:first-child td,.table colgroup+thead tr:first-child th,.table colgroup+thead tr:first-child td,.table thead:first-child tr:first-child th,.table thead:first-child tr:first-child td{border-top:0}
.table tbody+tbody{border-top:2px solid #ddd}
.table .table{background-color:#fff}
.table-condensed th,.table-condensed td{padding:4px 5px}
.table-bordered{border:1px solid #ddd;border-collapse:seblte;*border-collapse:collapse;border-left:0;-webkit-border-radius:4px;-moz-border-radius:4px;border-radius:4px}
.table-bordered th,.table-bordered td{border-left:1px solid #ddd}
.table-bordered caption+thead tr:first-child th,.table-bordered caption+tbody tr:first-child th,.table-bordered caption+tbody tr:first-child td,.table-bordered colgroup+thead tr:first-child th,.table-bordered colgroup+tbody tr:first-child th,.table-bordered colgroup+tbody tr:first-child td,.table-bordered thead:first-child tr:first-child th,.table-bordered tbody:first-child tr:first-child th,.table-bordered tbody:first-child tr:first-child td{border-top:0}
.table-bordered thead:first-child tr:first-child>th:first-child,.table-bordered tbody:first-child tr:first-child>td:first-child,.table-bordered tbody:first-child tr:first-child>th:first-child{-webkit-border-top-left-radius:4px;-moz-border-radius-topleft:4px;border-top-left-radius:4px}
.table-bordered thead:first-child tr:first-child>th:last-child,.table-bordered tbody:first-child tr:first-child>td:last-child,.table-bordered tbody:first-child tr:first-child>th:last-child{-webkit-border-top-right-radius:4px;-moz-border-radius-topright:4px;border-top-right-radius:4px}
.table-bordered thead:last-child tr:last-child>th:first-child,.table-bordered tbody:last-child tr:last-child>td:first-child,.table-bordered tbody:last-child tr:last-child>th:first-child,.table-bordered tfoot:last-child tr:last-child>td:first-child,.table-bordered tfoot:last-child tr:last-child>th:first-child{-webkit-border-bottom-left-radius:4px;-moz-border-radius-bottomleft:4px;border-bottom-left-radius:4px}
.table-bordered thead:last-child tr:last-child>th:last-child,.table-bordered tbody:last-child tr:last-child>td:last-child,.table-bordered tbody:last-child tr:last-child>th:last-child,.table-bordered tfoot:last-child tr:last-child>td:last-child,.table-bordered tfoot:last-child tr:last-child>th:last-child{-webkit-border-bottom-right-radius:4px;-moz-border-radius-bottomright:4px;border-bottom-right-radius:4px}
.table-bordered tfoot+tbody:last-child tr:last-child td:first-child{-webkit-border-bottom-left-radius:0;-moz-border-radius-bottomleft:0;border-bottom-left-radius:0}
.table-bordered tfoot+tbody:last-child tr:last-child td:last-child{-webkit-border-bottom-right-radius:0;-moz-border-radius-bottomright:0;border-bottom-right-radius:0}
.table-bordered caption+thead tr:first-child th:first-child,.table-bordered caption+tbody tr:first-child td:first-child,.table-bordered colgroup+thead tr:first-child th:first-child,.table-bordered colgroup+tbody tr:first-child td:first-child{-webkit-border-top-left-radius:4px;-moz-border-radius-topleft:4px;border-top-left-radius:4px}
.table-bordered caption+thead tr:first-child th:last-child,.table-bordered caption+tbody tr:first-child td:last-child,.table-bordered colgroup+thead tr:first-child th:last-child,.table-bordered colgroup+tbody tr:first-child td:last-child{-webkit-border-top-right-radius:4px;-moz-border-radius-topright:4px;border-top-right-radius:4px}
.table-striped tbody>tr:nth-child(odd)>td,.table-striped tbody>tr:nth-child(odd)>th{background-color:#f9f9f9}
.table-hover tbody tr:hover>td,.table-hover tbody tr:hover>th{background-color:#f5f5f5}
table td[class*="span"],table th[class*="span"],.row-fluid table td[class*="span"],.row-fluid table th[class*="span"]{display:table-cell;float:none;margin-left:0}
.table td.span1,.table th.span1{float:none;width:44px;margin-left:0}
.table td.span2,.table th.span2{float:none;width:124px;margin-left:0}
.table td.span3,.table th.span3{float:none;width:204px;margin-left:0}
.table td.span4,.table th.span4{float:none;width:284px;margin-left:0}
.table td.span5,.table th.span5{float:none;width:364px;margin-left:0}
.table td.span6,.table th.span6{float:none;width:444px;margin-left:0}
.table td.span7,.table th.span7{float:none;width:524px;margin-left:0}
.table td.span8,.table th.span8{float:none;width:604px;margin-left:0}
.table td.span9,.table th.span9{float:none;width:684px;margin-left:0}
.table td.span10,.table th.span10{float:none;width:764px;margin-left:0}
.table td.span11,.table th.span11{float:none;width:844px;margin-left:0}
.table td.span12,.table th.span12{float:none;width:924px;margin-left:0}
.table tbody tr.success>td{background-color:#dff0d8}
.table tbody tr.error>td{background-color:#f2dede}
.table tbody tr.warning>td{background-color:#fcf8e3}
.table tbody tr.info>td{background-color:#d9edf7}
.table-hover tbody tr.success:hover>td{background-color:#d0e9c6}
.table-hover tbody tr.error:hover>td{background-color:#ebcccc}
.table-hover tbody tr.warning:hover>td{background-color:#faf2cc}
.table-hover tbody tr.info:hover>td{background-color:#c4e3f3}
form{margin:0 0 20px}
fieldset{padding:0;margin:0;border:0}
legend{display:block;width:100%;padding:0;margin-bottom:20px;font-size:21px;line-height:40px;color:#333;border:0;border-bottom:1px solid #e5e5e5}
legend small{font-size:15px;color:#999}
label,input,button,select,textarea{font-size:14px;font-weight:normal;line-height:20px}
input,button,select,textarea{font-family:"Helvetica Neue",Helvetica,Arial,sans-serif}
label{display:block;margin-bottom:5px}
select,textarea,input[type="text"],input[type="password"],input[type="datetime"],input[type="datetime-local"],input[type="date"],input[type="month"],input[type="time"],input[type="week"],input[type="number"],input[type="email"],input[type="url"],input[type="search"],input[type="tel"],input[type="color"],.uneditable-input{display:inline-block;height:20px;padding:4px 6px;margin-bottom:10px;font-size:14px;line-height:20px;color:#555;-webkit-border-radius:4px;-moz-border-radius:4px;border-radius:4px;vertical-align:middle}
input,textarea,.uneditable-input{width:206px}
textarea{height:auto}
textarea,input[type="text"],input[type="password"],input[type="datetime"],input[type="datetime-local"],input[type="date"],input[type="month"],input[type="time"],input[type="week"],input[type="number"],input[type="email"],input[type="url"],input[type="search"],input[type="tel"],input[type="color"],.uneditable-input{background-color:#fff;border:1px solid #ccc;-webkit-box-shadow:inset 0 1px 1px rgba(0,0,0,0.075);-moz-box-shadow:inset 0 1px 1px rgba(0,0,0,0.075);box-shadow:inset 0 1px 1px rgba(0,0,0,0.075);-webkit-transition:border linear .2s,box-shadow linear .2s;-moz-transition:border linear .2s,box-shadow linear .2s;-o-transition:border linear .2s,box-shadow linear .2s;transition:border linear .2s,box-shadow linear .2s}
textarea:focus,input[type="text"]:focus,input[type="password"]:focus,input[type="datetime"]:focus,input[type="datetime-local"]:focus,input[type="date"]:focus,input[type="month"]:focus,input[type="time"]:focus,input[type="week"]:focus,input[type="number"]:focus,input[type="email"]:focus,input[type="url"]:focus,input[type="search"]:focus,input[type="tel"]:focus,input[type="color"]:focus,.uneditable-input:focus{border-color:rgba(82,168,236,0.8);outline:0;outline:thin dotted \9;-webkit-box-shadow:inset 0 1px 1px rgba(0,0,0,.075),0 0 8px rgba(82,168,236,.6);-moz-box-shadow:inset 0 1px 1px rgba(0,0,0,.075),0 0 8px rgba(82,168,236,.6);box-shadow:inset 0 1px 1px rgba(0,0,0,.075),0 0 8px rgba(82,168,236,.6)}
input[type="radio"],input[type="checkbox"]{margin:4px 0 0;*margin-top:0;margin-top:1px \9;line-height:normal}
input[type="file"],input[type="image"],input[type="submit"],input[type="reset"],input[type="button"],input[type="radio"],input[type="checkbox"]{width:auto}
select,input[type="file"]{height:30px;*margin-top:4px;line-height:30px}
select{width:220px;border:1px solid #ccc;background-color:#fff}
select[multiple],select[size]{height:auto}
select:focus,input[type="file"]:focus,input[type="radio"]:focus,input[type="checkbox"]:focus{outline:thin dotted #333;outline:5px auto -webkit-focus-ring-color;outline-offset:-2px}
.uneditable-input,.uneditable-textarea{color:#999;background-color:#fcfcfc;border-color:#ccc;-webkit-box-shadow:inset 0 1px 2px rgba(0,0,0,0.025);-moz-box-shadow:inset 0 1px 2px rgba(0,0,0,0.025);box-shadow:inset 0 1px 2px rgba(0,0,0,0.025);cursor:not-allowed}
.uneditable-input{overflow:hidden;white-space:nowrap}
.uneditable-textarea{width:auto;height:auto}
input:-moz-placeholder,textarea:-moz-placeholder{color:#999}
input:-ms-input-placeholder,textarea:-ms-input-placeholder{color:#999}
input::-webkit-input-placeholder,textarea::-webkit-input-placeholder{color:#999}
.radio,.checkbox{min-height:20px;padding-left:20px}
.radio input[type="radio"],.checkbox input[type="checkbox"]{float:left;margin-left:-20px}
.controls>.radio:first-child,.controls>.checkbox:first-child{padding-top:5px}
.radio.inline,.checkbox.inline{display:inline-block;padding-top:5px;margin-bottom:0;vertical-align:middle}
.radio.inline+.radio.inline,.checkbox.inline+.checkbox.inline{margin-left:10px}
.input-mini{width:60px}
.input-small{width:90px}
.input-medium{width:150px}
.input-large{width:210px}
.input-xlarge{width:270px}
.input-xxlarge{width:530px}
input[class*="span"],select[class*="span"],textarea[class*="span"],.uneditable-input[class*="span"],.row-fluid input[class*="span"],.row-fluid select[class*="span"],.row-fluid textarea[class*="span"],.row-fluid .uneditable-input[class*="span"]{float:none;margin-left:0}
.input-append input[class*="span"],.input-append .uneditable-input[class*="span"],.input-prepend input[class*="span"],.input-prepend .uneditable-input[class*="span"],.row-fluid input[class*="span"],.row-fluid select[class*="span"],.row-fluid textarea[class*="span"],.row-fluid .uneditable-input[class*="span"],.row-fluid .input-prepend [class*="span"],.row-fluid .input-append [class*="span"]{display:inline-block}
input,textarea,.uneditable-input{margin-left:0}
.controls-row [class*="span"]+[class*="span"]{margin-left:20px}
input.span12,textarea.span12,.uneditable-input.span12{width:926px}
input.span11,textarea.span11,.uneditable-input.span11{width:846px}
input.span10,textarea.span10,.uneditable-input.span10{width:766px}
input.span9,textarea.span9,.uneditable-input.span9{width:686px}
input.span8,textarea.span8,.uneditable-input.span8{width:606px}
input.span7,textarea.span7,.uneditable-input.span7{width:526px}
input.span6,textarea.span6,.uneditable-input.span6{width:446px}
input.span5,textarea.span5,.uneditable-input.span5{width:366px}
input.span4,textarea.span4,.uneditable-input.span4{width:286px}
input.span3,textarea.span3,.uneditable-input.span3{width:206px}
input.span2,textarea.span2,.uneditable-input.span2{width:126px}
input.span1,textarea.span1,.uneditable-input.span1{width:46px}
.controls-row{*zoom:1}
.controls-row:before,.controls-row:after{display:table;content:"";line-height:0}
.controls-row:after{clear:both}
.controls-row [class*="span"],.row-fluid .controls-row [class*="span"]{float:left}
.controls-row .checkbox[class*="span"],.controls-row .radio[class*="span"]{padding-top:5px}
input[disabled],select[disabled],textarea[disabled],input[readonly],select[readonly],textarea[readonly]{cursor:not-allowed;background-color:#eee}
input[type="radio"][disabled],input[type="checkbox"][disabled],input[type="radio"][readonly],input[type="checkbox"][readonly]{background-color:transparent}
.control-group.warning .control-label,.control-group.warning .help-block,.control-group.warning .help-inline{color:#c09853}
.control-group.warning .checkbox,.control-group.warning .radio,.control-group.warning input,.control-group.warning select,.control-group.warning textarea{color:#c09853}
.control-group.warning input,.control-group.warning select,.control-group.warning textarea{border-color:#c09853;-webkit-box-shadow:inset 0 1px 1px rgba(0,0,0,0.075);-moz-box-shadow:inset 0 1px 1px rgba(0,0,0,0.075);box-shadow:inset 0 1px 1px rgba(0,0,0,0.075)}
.control-group.warning input:focus,.control-group.warning select:focus,.control-group.warning textarea:focus{border-color:#a47e3c;-webkit-box-shadow:inset 0 1px 1px rgba(0,0,0,0.075),0 0 6px #dbc59e;-moz-box-shadow:inset 0 1px 1px rgba(0,0,0,0.075),0 0 6px #dbc59e;box-shadow:inset 0 1px 1px rgba(0,0,0,0.075),0 0 6px #dbc59e}
.control-group.warning .input-prepend .add-on,.control-group.warning .input-append .add-on{color:#c09853;background-color:#fcf8e3;border-color:#c09853}
.control-group.error .control-label,.control-group.error .help-block,.control-group.error .help-inline{color:#b94a48}
.control-group.error .checkbox,.control-group.error .radio,.control-group.error input,.control-group.error select,.control-group.error textarea{color:#b94a48}
.control-group.error input,.control-group.error select,.control-group.error textarea{border-color:#b94a48;-webkit-box-shadow:inset 0 1px 1px rgba(0,0,0,0.075);-moz-box-shadow:inset 0 1px 1px rgba(0,0,0,0.075);box-shadow:inset 0 1px 1px rgba(0,0,0,0.075)}
.control-group.error input:focus,.control-group.error select:focus,.control-group.error textarea:focus{border-color:#953b39;-webkit-box-shadow:inset 0 1px 1px rgba(0,0,0,0.075),0 0 6px #d59392;-moz-box-shadow:inset 0 1px 1px rgba(0,0,0,0.075),0 0 6px #d59392;box-shadow:inset 0 1px 1px rgba(0,0,0,0.075),0 0 6px #d59392}
.control-group.error .input-prepend .add-on,.control-group.error .input-append .add-on{color:#b94a48;background-color:#f2dede;border-color:#b94a48}
.control-group.success .control-label,.control-group.success .help-block,.control-group.success .help-inline{color:#468847}
.control-group.success .checkbox,.control-group.success .radio,.control-group.success input,.control-group.success select,.control-group.success textarea{color:#468847}
.control-group.success input,.control-group.success select,.control-group.success textarea{border-color:#468847;-webkit-box-shadow:inset 0 1px 1px rgba(0,0,0,0.075);-moz-box-shadow:inset 0 1px 1px rgba(0,0,0,0.075);box-shadow:inset 0 1px 1px rgba(0,0,0,0.075)}
.control-group.success input:focus,.control-group.success select:focus,.control-group.success textarea:focus{border-color:#356635;-webkit-box-shadow:inset 0 1px 1px rgba(0,0,0,0.075),0 0 6px #7aba7b;-moz-box-shadow:inset 0 1px 1px rgba(0,0,0,0.075),0 0 6px #7aba7b;box-shadow:inset 0 1px 1px rgba(0,0,0,0.075),0 0 6px #7aba7b}
.control-group.success .input-prepend .add-on,.control-group.success .input-append .add-on{color:#468847;background-color:#dff0d8;border-color:#468847}
.control-group.info .control-label,.control-group.info .help-block,.control-group.info .help-inline{color:#3a87ad}
.control-group.info .checkbox,.control-group.info .radio,.control-group.info input,.control-group.info select,.control-group.info textarea{color:#3a87ad}
.control-group.info input,.control-group.info select,.control-group.info textarea{border-color:#3a87ad;-webkit-box-shadow:inset 0 1px 1px rgba(0,0,0,0.075);-moz-box-shadow:inset 0 1px 1px rgba(0,0,0,0.075);box-shadow:inset 0 1px 1px rgba(0,0,0,0.075)}
.control-group.info input:focus,.control-group.info select:focus,.control-group.info textarea:focus{border-color:#2d6987;-webkit-box-shadow:inset 0 1px 1px rgba(0,0,0,0.075),0 0 6px #7ab5d3;-moz-box-shadow:inset 0 1px 1px rgba(0,0,0,0.075),0 0 6px #7ab5d3;box-shadow:inset 0 1px 1px rgba(0,0,0,0.075),0 0 6px #7ab5d3}
.control-group.info .input-prepend .add-on,.control-group.info .input-append .add-on{color:#3a87ad;background-color:#d9edf7;border-color:#3a87ad}
input:focus:invalid,textarea:focus:invalid,select:focus:invalid{color:#b94a48;border-color:#ee5f5b}
input:focus:invalid:focus,textarea:focus:invalid:focus,select:focus:invalid:focus{border-color:#e9322d;-webkit-box-shadow:0 0 6px #f8b9b7;-moz-box-shadow:0 0 6px #f8b9b7;box-shadow:0 0 6px #f8b9b7}
.form-actions{padding:19px 20px 20px;margin-top:20px;margin-bottom:20px;background-color:#f5f5f5;border-top:1px solid #e5e5e5;*zoom:1}
.form-actions:before,.form-actions:after{display:table;content:"";line-height:0}
.form-actions:after{clear:both}
.help-block,.help-inline{color:#595959}
.help-block{display:block;margin-bottom:10px}
.help-inline{display:inline-block;*display:inline;*zoom:1;vertical-align:middle;padding-left:5px}
.input-append,.input-prepend{display:inline-block;margin-bottom:10px;vertical-align:middle;font-size:0;white-space:nowrap}
.input-append input,.input-prepend input,.input-append select,.input-prepend select,.input-append .uneditable-input,.input-prepend .uneditable-input,.input-append .dropdown-menu,.input-prepend .dropdown-menu,.input-append .popover,.input-prepend .popover{font-size:14px}
.input-append input,.input-prepend input,.input-append select,.input-prepend select,.input-append .uneditable-input,.input-prepend .uneditable-input{position:relative;margin-bottom:0;*margin-left:0;vertical-align:top;-webkit-border-radius:0 4px 4px 0;-moz-border-radius:0 4px 4px 0;border-radius:0 4px 4px 0}
.input-append input:focus,.input-prepend input:focus,.input-append select:focus,.input-prepend select:focus,.input-append .uneditable-input:focus,.input-prepend .uneditable-input:focus{z-index:2}
.input-append .add-on,.input-prepend .add-on{display:inline-block;width:auto;height:20px;min-width:16px;padding:4px 5px;font-size:14px;font-weight:normal;line-height:20px;text-align:center;text-shadow:0 1px 0 #fff;background-color:#eee;border:1px solid #ccc}
.input-append .add-on,.input-prepend .add-on,.input-append .btn,.input-prepend .btn,.input-append .btn-group>.dropdown-toggle,.input-prepend .btn-group>.dropdown-toggle{vertical-align:top;-webkit-border-radius:0;-moz-border-radius:0;border-radius:0}
.input-append .active,.input-prepend .active{background-color:#a9dba9;border-color:#46a546}
.input-prepend .add-on,.input-prepend .btn{margin-right:-1px}
.input-prepend .add-on:first-child,.input-prepend .btn:first-child{-webkit-border-radius:4px 0 0 4px;-moz-border-radius:4px 0 0 4px;border-radius:4px 0 0 4px}
.input-append input,.input-append select,.input-append .uneditable-input{-webkit-border-radius:4px 0 0 4px;-moz-border-radius:4px 0 0 4px;border-radius:4px 0 0 4px}
.input-append input+.btn-group .btn:last-child,.input-append select+.btn-group .btn:last-child,.input-append .uneditable-input+.btn-group .btn:last-child{-webkit-border-radius:0 4px 4px 0;-moz-border-radius:0 4px 4px 0;border-radius:0 4px 4px 0}
.input-append .add-on,.input-append .btn,.input-append .btn-group{margin-left:-1px}
.input-append .add-on:last-child,.input-append .btn:last-child,.input-append .btn-group:last-child>.dropdown-toggle{-webkit-border-radius:0 4px 4px 0;-moz-border-radius:0 4px 4px 0;border-radius:0 4px 4px 0}
.input-prepend.input-append input,.input-prepend.input-append select,.input-prepend.input-append .uneditable-input{-webkit-border-radius:0;-moz-border-radius:0;border-radius:0}
.input-prepend.input-append input+.btn-group .btn,.input-prepend.input-append select+.btn-group .btn,.input-prepend.input-append .uneditable-input+.btn-group .btn{-webkit-border-radius:0 4px 4px 0;-moz-border-radius:0 4px 4px 0;border-radius:0 4px 4px 0}
.input-prepend.input-append .add-on:first-child,.input-prepend.input-append .btn:first-child{margin-right:-1px;-webkit-border-radius:4px 0 0 4px;-moz-border-radius:4px 0 0 4px;border-radius:4px 0 0 4px}
.input-prepend.input-append .add-on:last-child,.input-prepend.input-append .btn:last-child{margin-left:-1px;-webkit-border-radius:0 4px 4px 0;-moz-border-radius:0 4px 4px 0;border-radius:0 4px 4px 0}
.control-group{margin-bottom:10px}
legend+.control-group{margin-top:20px;-webkit-margin-top-collapse:separate}
.form-horizontal .control-group{margin-bottom:20px;*zoom:1}
.form-horizontal .control-group:before,.form-horizontal .control-group:after{display:table;content:"";line-height:0}
.form-horizontal .control-group:after{clear:both}
.form-horizontal .control-label{float:left;width:160px;padding-top:5px;text-align:right}
.form-horizontal .controls{*display:inline-block;*padding-left:20px;margin-left:180px;*margin-left:0}
.form-horizontal .controls:first-child{*padding-left:180px}
.form-horizontal .help-block{margin-bottom:0}
.form-horizontal input+.help-block,.form-horizontal select+.help-block,.form-horizontal textarea+.help-block,.form-horizontal .uneditable-input+.help-block,.form-horizontal .input-prepend+.help-block,.form-horizontal .input-append+.help-block{margin-top:10px}
.form-horizontal .form-actions{padding-left:180px}
.btn{display:inline-block;*display:inline;*zoom:1;padding:4px 12px;margin-bottom:0;font-size:14px;line-height:20px;text-align:center;vertical-align:middle;cursor:pointer;color:#333;text-shadow:0 1px 1px rgba(255,255,255,0.75);background-color:#f5f5f5;background-image:-moz-linear-gradient(top,#fff,#e6e6e6);background-image:-webkit-gradient(linear,0 0,0 100%,from(#fff),to(#e6e6e6));background-image:-webkit-linear-gradient(top,#fff,#e6e6e6);background-image:-o-linear-gradient(top,#fff,#e6e6e6);background-image:linear-gradient(to bottom,#fff,#e6e6e6);background-repeat:repeat-x;filter:progid:DXImageTransform.Microsoft.gradient(startColorstr=''#fffff'',endColorstr=''#ffe6e6e6'',GradientType=0);border-color:#e6e6e6 #e6e6e6 #bfbfbf;border-color:rgba(0,0,0,0.1) rgba(0,0,0,0.1) rgba(0,0,0,0.25);*background-color:#e6e6e6;filter:progid:DXImageTransform.Microsoft.gradient(enabled = false);border:1px solid #ccc;*border:0;border-bottom-color:#b3b3b3;-webkit-border-radius:4px;-moz-border-radius:4px;border-radius:4px;*margin-left:.3em;-webkit-box-shadow:inset 0 1px 0 rgba(255,255,255,.2),0 1px 2px rgba(0,0,0,.05);-moz-box-shadow:inset 0 1px 0 rgba(255,255,255,.2),0 1px 2px rgba(0,0,0,.05);box-shadow:inset 0 1px 0 rgba(255,255,255,.2),0 1px 2px rgba(0,0,0,.05)}
.btn:hover,.btn:focus,.btn:active,.btn.active,.btn.disabled,.btn[disabled]{color:#333;background-color:#e6e6e6;*background-color:#d9d9d9}
.btn:active,.btn.active{background-color:#ccc \9}
.btn:first-child{*margin-left:0}
.btn:hover,.btn:focus{color:#333;text-decoration:none;background-position:0 -15px;-webkit-transition:background-position 0.1s linear;-moz-transition:background-position 0.1s linear;-o-transition:background-position 0.1s linear;transition:background-position 0.1s linear}
.btn:focus{outline:thin dotted #333;outline:5px auto -webkit-focus-ring-color;outline-offset:-2px}
.btn.active,.btn:active{background-image:none;outline:0;-webkit-box-shadow:inset 0 2px 4px rgba(0,0,0,.15),0 1px 2px rgba(0,0,0,.05);-moz-box-shadow:inset 0 2px 4px rgba(0,0,0,.15),0 1px 2px rgba(0,0,0,.05);box-shadow:inset 0 2px 4px rgba(0,0,0,.15),0 1px 2px rgba(0,0,0,.05)}
.btn.disabled,.btn[disabled]{cursor:default;background-image:none;opacity:0.65;filter:alpha(opacity=65);-webkit-box-shadow:none;-moz-box-shadow:none;box-shadow:none}
.btn-large{padding:11px 19px;font-size:17.5px;-webkit-border-radius:6px;-moz-border-radius:6px;border-radius:6px}
.btn-large [class^="icon-"],.btn-large [class*=" icon-"]{margin-top:4px}
.btn-small{padding:2px 10px;font-size:11.9px;-webkit-border-radius:3px;-moz-border-radius:3px;border-radius:3px}
.btn-small [class^="icon-"],.btn-small [class*=" icon-"]{margin-top:0}
.btn-mini [class^="icon-"],.btn-mini [class*=" icon-"]{margin-top:-1px}
.btn-mini{padding:0 6px;font-size:10.5px;-webkit-border-radius:3px;-moz-border-radius:3px;border-radius:3px}
.btn-block{display:block;width:100%;padding-left:0;padding-right:0;-webkit-box-sizing:border-box;-moz-box-sizing:border-box;box-sizing:border-box}
.btn-block+.btn-block{margin-top:5px}
input[type="submit"].btn-block,input[type="reset"].btn-block,input[type="button"].btn-block{width:100%}
.btn-primary.active,.btn-warning.active,.btn-danger.active,.btn-success.active,.btn-info.active,.btn-inverse.active{color:rgba(255,255,255,0.75)}
.btn-primary{color:#fff;text-shadow:0 -1px 0 rgba(0,0,0,0.25);background-image:-moz-linear-gradient(top,#08c,#04c);background-image:-webkit-gradient(linear,0 0,0 100%,from(#08c),to(#04c));background-image:-webkit-linear-gradient(top,#08c,#04c);background-image:-o-linear-gradient(top,#08c,#04c);background-image:linear-gradient(to bottom,#08c,#04c);background-repeat:repeat-x;filter:progid:DXImageTransform.Microsoft.gradient(startColorstr=''#f08cc'',endColorstr=''#f04cc'',GradientType=0);border-color:#04c #04c #002a80;border-color:rgba(0,0,0,0.1) rgba(0,0,0,0.1) rgba(0,0,0,0.25);*background-color:#04c;filter:progid:DXImageTransform.Microsoft.gradient(enabled = false)}
.btn-primary:hover,.btn-primary:focus,.btn-primary:active,.btn-primary.active,.btn-primary.disabled,.btn-primary[disabled]{color:#fff;background-color:#04c;*background-color:#003bb3}
.btn-primary:active,.btn-primary.active{background-color:#039 \9}
.btn-warning{color:#fff;text-shadow:0 -1px 0 rgba(0,0,0,0.25);background-color:#faa732;background-image:-moz-linear-gradient(top,#fbb450,#f89406);background-image:-webkit-gradient(linear,0 0,0 100%,from(#fbb450),to(#f89406));background-image:-webkit-linear-gradient(top,#fbb450,#f89406);background-image:-o-linear-gradient(top,#fbb450,#f89406);background-image:linear-gradient(to bottom,#fbb450,#f89406);background-repeat:repeat-x;filter:progid:DXImageTransform.Microsoft.gradient(startColorstr=''#fffbb450'',endColorstr=''#fff89406'',GradientType=0);border-color:#f89406 #f89406 #ad6704;border-color:rgba(0,0,0,0.1) rgba(0,0,0,0.1) rgba(0,0,0,0.25);*background-color:#f89406;filter:progid:DXImageTransform.Microsoft.gradient(enabled = false)}
.btn-warning:hover,.btn-warning:focus,.btn-warning:active,.btn-warning.active,.btn-warning.disabled,.btn-warning[disabled]{color:#fff;background-color:#f89406;*background-color:#df8505}
.btn-warning:active,.btn-warning.active{background-color:#c67605 \9}
.btn-danger{color:#fff;text-shadow:0 -1px 0 rgba(0,0,0,0.25);background-color:#da4f49;background-image:-moz-linear-gradient(top,#ee5f5b,#bd362f);background-image:-webkit-gradient(linear,0 0,0 100%,from(#ee5f5b),to(#bd362f));background-image:-webkit-linear-gradient(top,#ee5f5b,#bd362f);background-image:-o-linear-gradient(top,#ee5f5b,#bd362f);background-image:linear-gradient(to bottom,#ee5f5b,#bd362f);background-repeat:repeat-x;filter:progid:DXImageTransform.Microsoft.gradient(startColorstr=''#ffee5f5b'',endColorstr=''#ffbd362f'',GradientType=0);border-color:#bd362f #bd362f #802420;border-color:rgba(0,0,0,0.1) rgba(0,0,0,0.1) rgba(0,0,0,0.25);*background-color:#bd362f;filter:progid:DXImageTransform.Microsoft.gradient(enabled = false)}
.btn-danger:hover,.btn-danger:focus,.btn-danger:active,.btn-danger.active,.btn-danger.disabled,.btn-danger[disabled]{color:#fff;background-color:#bd362f;*background-color:#a9302a}
.btn-danger:active,.btn-danger.active{background-color:#942a25 \9}
.btn-success{color:#fff;text-shadow:0 -1px 0 rgba(0,0,0,0.25);background-color:#5bb75b;background-image:-moz-linear-gradient(top,#62c462,#51a351);background-image:-webkit-gradient(linear,0 0,0 100%,from(#62c462),to(#51a351));background-image:-webkit-linear-gradient(top,#62c462,#51a351);background-image:-o-linear-gradient(top,#62c462,#51a351);background-image:linear-gradient(to bottom,#62c462,#51a351);background-repeat:repeat-x;filter:progid:DXImageTransform.Microsoft.gradient(startColorstr=''#ff62c462'',endColorstr=''#ff51a351'',GradientType=0);border-color:#51a351 #51a351 #387038;border-color:rgba(0,0,0,0.1) rgba(0,0,0,0.1) rgba(0,0,0,0.25);*background-color:#51a351;filter:progid:DXImageTransform.Microsoft.gradient(enabled = false)}
.btn-success:hover,.btn-success:focus,.btn-success:active,.btn-success.active,.btn-success.disabled,.btn-success[disabled]{color:#fff;background-color:#51a351;*background-color:#499249}
.btn-success:active,.btn-success.active{background-color:#408140 \9}
.btn-info{color:#fff;text-shadow:0 -1px 0 rgba(0,0,0,0.25);background-color:#49afcd;background-image:-moz-linear-gradient(top,#5bc0de,#2f96b4);background-image:-webkit-gradient(linear,0 0,0 100%,from(#5bc0de),to(#2f96b4));background-image:-webkit-linear-gradient(top,#5bc0de,#2f96b4);background-image:-o-linear-gradient(top,#5bc0de,#2f96b4);background-image:linear-gradient(to bottom,#5bc0de,#2f96b4);background-repeat:repeat-x;filter:progid:DXImageTransform.Microsoft.gradient(startColorstr=''#ff5bc0de'',endColorstr=''#ff2f96b4'',GradientType=0);border-color:#2f96b4 #2f96b4 #1f6377;border-color:rgba(0,0,0,0.1) rgba(0,0,0,0.1) rgba(0,0,0,0.25);*background-color:#2f96b4;filter:progid:DXImageTransform.Microsoft.gradient(enabled = false)}
.btn-info:hover,.btn-info:focus,.btn-info:active,.btn-info.active,.btn-info.disabled,.btn-info[disabled]{color:#fff;background-color:#2f96b4;*background-color:#2a85a0}
.btn-info:active,.btn-info.active{background-color:#24748c \9}
.btn-inverse{color:#fff;text-shadow:0 -1px 0 rgba(0,0,0,0.25);background-color:#363636;background-image:-moz-linear-gradient(top,#444,#222);background-image:-webkit-gradient(linear,0 0,0 100%,from(#444),to(#222));background-image:-webkit-linear-gradient(top,#444,#222);background-image:-o-linear-gradient(top,#444,#222);background-image:linear-gradient(to bottom,#444,#222);background-repeat:repeat-x;filter:progid:DXImageTransform.Microsoft.gradient(startColorstr=''#f4444'',endColorstr=''#f2222'',GradientType=0);border-color:#222 #222 #000;border-color:rgba(0,0,0,0.1) rgba(0,0,0,0.1) rgba(0,0,0,0.25);*background-color:#222;filter:progid:DXImageTransform.Microsoft.gradient(enabled = false)}
.btn-inverse:hover,.btn-inverse:focus,.btn-inverse:active,.btn-inverse.active,.btn-inverse.disabled,.btn-inverse[disabled]{color:#fff;background-color:#222;*background-color:#151515}
.btn-inverse:active,.btn-inverse.active{background-color:#080808 \9}
button.btn,input[type="submit"].btn{*padding-top:3px;*padding-bottom:3px}
button.btn::-moz-focus-inner,input[type="submit"].btn::-moz-focus-inner{padding:0;border:0}
button.btn.btn-large,input[type="submit"].btn.btn-large{*padding-top:7px;*padding-bottom:7px}
button.btn.btn-small,input[type="submit"].btn.btn-small{*padding-top:3px;*padding-bottom:3px}
button.btn.btn-mini,input[type="submit"].btn.btn-mini{*padding-top:1px;*padding-bottom:1px}
.btn-link,.btn-link:active,.btn-link[disabled]{background-color:transparent;background-image:none;-webkit-box-shadow:none;-moz-box-shadow:none;box-shadow:none}
.btn-link{border-color:transparent;cursor:pointer;color:#08c;-webkit-border-radius:0;-moz-border-radius:0;border-radius:0}
.btn-link:hover,.btn-link:focus{color:#005580;text-decoration:underline;background-color:transparent}
.btn-link[disabled]:hover,.btn-link[disabled]:focus{color:#333;text-decoration:none}
.btn-group{position:relative;display:inline-block;*display:inline;*zoom:1;font-size:0;vertical-align:middle;white-space:nowrap;*margin-left:.3em}
.btn-group:first-child{*margin-left:0}
.btn-group+.btn-group{margin-left:5px}
.btn-toolbar{font-size:0;margin-top:10px;margin-bottom:10px}
.btn-toolbar>.btn+.btn,.btn-toolbar>.btn-group+.btn,.btn-toolbar>.btn+.btn-group{margin-left:5px}
.btn-group>.btn{position:relative;-webkit-border-radius:0;-moz-border-radius:0;border-radius:0}
.btn-group>.btn+.btn{margin-left:-1px}
.btn-group>.btn,.btn-group>.dropdown-menu,.btn-group>.popover{font-size:14px}
.btn-group>.btn-mini{font-size:10.5px}
.btn-group>.btn-small{font-size:11.9px}
.btn-group>.btn-large{font-size:17.5px}
.btn-group>.btn:first-child{margin-left:0;-webkit-border-top-left-radius:4px;-moz-border-radius-topleft:4px;border-top-left-radius:4px;-webkit-border-bottom-left-radius:4px;-moz-border-radius-bottomleft:4px;border-bottom-left-radius:4px}
.btn-group>.btn:last-child,.btn-group>.dropdown-toggle{-webkit-border-top-right-radius:4px;-moz-border-radius-topright:4px;border-top-right-radius:4px;-webkit-border-bottom-right-radius:4px;-moz-border-radius-bottomright:4px;border-bottom-right-radius:4px}
.btn-group>.btn.large:first-child{margin-left:0;-webkit-border-top-left-radius:6px;-moz-border-radius-topleft:6px;border-top-left-radius:6px;-webkit-border-bottom-left-radius:6px;-moz-border-radius-bottomleft:6px;border-bottom-left-radius:6px}
.btn-group>.btn.large:last-child,.btn-group>.large.dropdown-toggle{-webkit-border-top-right-radius:6px;-moz-border-radius-topright:6px;border-top-right-radius:6px;-webkit-border-bottom-right-radius:6px;-moz-border-radius-bottomright:6px;border-bottom-right-radius:6px}
.btn-group>.btn:hover,.btn-group>.btn:focus,.btn-group>.btn:active,.btn-group>.btn.active{z-index:2}
.btn-group .dropdown-toggle:active,.btn-group.open .dropdown-toggle{outline:0}
.btn-group>.btn+.dropdown-toggle{padding-left:8px;padding-right:8px;-webkit-box-shadow:inset 1px 0 0 rgba(255,255,255,.125),inset 0 1px 0 rgba(255,255,255,.2),0 1px 2px rgba(0,0,0,.05);-moz-box-shadow:inset 1px 0 0 rgba(255,255,255,.125),inset 0 1px 0 rgba(255,255,255,.2),0 1px 2px rgba(0,0,0,.05);box-shadow:inset 1px 0 0 rgba(255,255,255,.125),inset 0 1px 0 rgba(255,255,255,.2),0 1px 2px rgba(0,0,0,.05);*padding-top:5px;*padding-bottom:5px}
.btn-group>.btn-mini+.dropdown-toggle{padding-left:5px;padding-right:5px;*padding-top:2px;*padding-bottom:2px}
.btn-group>.btn-small+.dropdown-toggle{*padding-top:5px;*padding-bottom:4px}
.btn-group>.btn-large+.dropdown-toggle{padding-left:12px;padding-right:12px;*padding-top:7px;*padding-bottom:7px}
.btn-group.open .dropdown-toggle{background-image:none;-webkit-box-shadow:inset 0 2px 4px rgba(0,0,0,.15),0 1px 2px rgba(0,0,0,.05);-moz-box-shadow:inset 0 2px 4px rgba(0,0,0,.15),0 1px 2px rgba(0,0,0,.05);box-shadow:inset 0 2px 4px rgba(0,0,0,.15),0 1px 2px rgba(0,0,0,.05)}
.btn-group.open .btn.dropdown-toggle{background-color:#e6e6e6}
.btn-group.open .btn-primary.dropdown-toggle{background-color:#04c}
.btn-group.open .btn-warning.dropdown-toggle{background-color:#f89406}
.btn-group.open .btn-danger.dropdown-toggle{background-color:#bd362f}
.btn-group.open .btn-success.dropdown-toggle{background-color:#51a351}
.btn-group.open .btn-info.dropdown-toggle{background-color:#2f96b4}
.btn-group.open .btn-inverse.dropdown-toggle{background-color:#222}
.btn .caret{margin-top:8px;margin-left:0}
.btn-large .caret{margin-top:6px}
.btn-large .caret{border-left-width:5px;border-right-width:5px;border-top-width:5px}
.btn-mini .caret,.btn-small .caret{margin-top:8px}
.dropup .btn-large .caret{border-bottom-width:5px}
.btn-primary .caret,.btn-warning .caret,.btn-danger .caret,.btn-info .caret,.btn-success .caret,.btn-inverse .caret{border-top-color:#fff;border-bottom-color:#fff}
.btn-group-vertical{display:inline-block;*display:inline;*zoom:1}
.btn-group-vertical>.btn{display:block;float:none;max-width:100%;-webkit-border-radius:0;-moz-border-radius:0;border-radius:0}
.btn-group-vertical>.btn+.btn{margin-left:0;margin-top:-1px}
.btn-group-vertical>.btn:first-child{-webkit-border-radius:4px 4px 0 0;-moz-border-radius:4px 4px 0 0;border-radius:4px 4px 0 0}
.btn-group-vertical>.btn:last-child{-webkit-border-radius:0 0 4px 4px;-moz-border-radius:0 0 4px 4px;border-radius:0 0 4px 4px}
.btn-group-vertical>.btn-large:first-child{-webkit-border-radius:6px 6px 0 0;-moz-border-radius:6px 6px 0 0;border-radius:6px 6px 0 0}
.btn-group-vertical>.btn-large:last-child{-webkit-border-radius:0 0 6px 6px;-moz-border-radius:0 0 6px 6px;border-radius:0 0 6px 6px}
.nav{margin-left:0;margin-bottom:20px;list-style:none}
.nav>li>a{display:block}
.nav>li>a:hover,.nav>li>a:focus{text-decoration:none;background-color:#eee}
.nav>li>a>img{max-width:none}
.nav>.pull-right{float:right}
.nav-header{display:block;padding:3px 15px;font-size:11px;font-weight:bold;line-height:20px;color:#999;text-shadow:0 1px 0 rgba(255,255,255,0.5);text-transform:uppercase}
.nav li+.nav-header{margin-top:9px}
.nav-list{padding-left:15px;padding-right:15px;margin-bottom:0}
.nav-list>li>a,.nav-list .nav-header{margin-left:-15px;margin-right:-15px;text-shadow:0 1px 0 rgba(255,255,255,0.5)}
.nav-list>li>a{padding:3px 15px}
.nav-list>.active>a,.nav-list>.active>a:hover,.nav-list>.active>a:focus{color:#fff;text-shadow:0 -1px 0 rgba(0,0,0,0.2);background-color:#08c}
.nav-list [class^="icon-"],.nav-list [class*=" icon-"]{margin-right:2px}
.nav-list .divider{*width:100%;height:1px;margin:9px 1px;*margin:-5px 0 5px;overflow:hidden;background-color:#e5e5e5;border-bottom:1px solid #fff}
.nav-tabs,.nav-pills{*zoom:1}
.nav-tabs:before,.nav-pills:before,.nav-tabs:after,.nav-pills:after{display:table;content:"";line-height:0}
.nav-tabs:after,.nav-pills:after{clear:both}
.nav-tabs>li,.nav-pills>li{float:left}
.nav-tabs>li>a,.nav-pills>li>a{padding-right:12px;padding-left:12px;margin-right:2px;line-height:14px}
.nav-tabs{border-bottom:1px solid #ddd}
.nav-tabs>li{margin-bottom:-1px}
.nav-tabs>li>a{padding-top:8px;padding-bottom:8px;line-height:20px;border:1px solid transparent;-webkit-border-radius:4px 4px 0 0;-moz-border-radius:4px 4px 0 0;border-radius:4px 4px 0 0}
.nav-tabs>li>a:hover,.nav-tabs>li>a:focus{border-color:#eee #eee #ddd}
.nav-tabs>.active>a,.nav-tabs>.active>a:hover,.nav-tabs>.active>a:focus{color:#555;background-color:#fff;border:1px solid #ddd;border-bottom-color:transparent;cursor:default}
.nav-pills>li>a{padding-top:8px;padding-bottom:8px;margin-top:2px;margin-bottom:2px;-webkit-border-radius:5px;-moz-border-radius:5px;border-radius:5px}
.nav-pills>.active>a,.nav-pills>.active>a:hover,.nav-pills>.active>a:focus{color:#fff;background-color:#08c}
.nav-stacked>li{float:none}
.nav-stacked>li>a{margin-right:0}
.nav-tabs.nav-stacked{border-bottom:0}
.nav-tabs.nav-stacked>li>a{border:1px solid #ddd;-webkit-border-radius:0;-moz-border-radius:0;border-radius:0}
.nav-tabs.nav-stacked>li:first-child>a{-webkit-border-top-right-radius:4px;-moz-border-radius-topright:4px;border-top-right-radius:4px;-webkit-border-top-left-radius:4px;-moz-border-radius-topleft:4px;border-top-left-radius:4px}
.nav-tabs.nav-stacked>li:last-child>a{-webkit-border-bottom-right-radius:4px;-moz-border-radius-bottomright:4px;border-bottom-right-radius:4px;-webkit-border-bottom-left-radius:4px;-moz-border-radius-bottomleft:4px;border-bottom-left-radius:4px}
.nav-tabs.nav-stacked>li>a:hover,.nav-tabs.nav-stacked>li>a:focus{border-color:#ddd;z-index:2}
.nav-pills.nav-stacked>li>a{margin-bottom:3px}
.nav-pills.nav-stacked>li:last-child>a{margin-bottom:1px}
.nav-tabs .dropdown-menu{-webkit-border-radius:0 0 6px 6px;-moz-border-radius:0 0 6px 6px;border-radius:0 0 6px 6px}
.nav-pills .dropdown-menu{-webkit-border-radius:6px;-moz-border-radius:6px;border-radius:6px}
.nav .dropdown-toggle .caret{border-top-color:#08c;border-bottom-color:#08c;margin-top:6px}
.nav .dropdown-toggle:hover .caret,.nav .dropdown-toggle:focus .caret{border-top-color:#005580;border-bottom-color:#005580}
.nav-tabs .dropdown-toggle .caret{margin-top:8px}
.nav .active .dropdown-toggle .caret{border-top-color:#fff;border-bottom-color:#fff}
.nav-tabs .active .dropdown-toggle .caret{border-top-color:#555;border-bottom-color:#555}
.nav>.dropdown.active>a:hover,.nav>.dropdown.active>a:focus{cursor:pointer}
.nav-tabs .open .dropdown-toggle,.nav-pills .open .dropdown-toggle,.nav>li.dropdown.open.active>a:hover,.nav>li.dropdown.open.active>a:focus{color:#fff;background-color:#999;border-color:#999}
.nav li.dropdown.open .caret,.nav li.dropdown.open.active .caret,.nav li.dropdown.open a:hover .caret,.nav li.dropdown.open a:focus .caret{border-top-color:#fff;border-bottom-color:#fff;opacity:1;filter:alpha(opacity=100)}
.tabs-stacked .open>a:hover,.tabs-stacked .open>a:focus{border-color:#999}
.tabbable{*zoom:1}
.tabbable:before,.tabbable:after{display:table;content:"";line-height:0}
.tabbable:after{clear:both}
.tab-content{overflow:auto}
.tabs-below>.nav-tabs,.tabs-right>.nav-tabs,.tabs-left>.nav-tabs{border-bottom:0}
.tab-content>.tab-pane,.pill-content>.pill-pane{display:none}
.tab-content>.active,.pill-content>.active{display:block}
.tabs-below>.nav-tabs{border-top:1px solid #ddd}
.tabs-below>.nav-tabs>li{margin-top:-1px;margin-bottom:0}
.tabs-below>.nav-tabs>li>a{-webkit-border-radius:0 0 4px 4px;-moz-border-radius:0 0 4px 4px;border-radius:0 0 4px 4px}
.tabs-below>.nav-tabs>li>a:hover,.tabs-below>.nav-tabs>li>a:focus{border-bottom-color:transparent;border-top-color:#ddd}
.tabs-below>.nav-tabs>.active>a,.tabs-below>.nav-tabs>.active>a:hover,.tabs-below>.nav-tabs>.active>a:focus{border-color:transparent #ddd #ddd #ddd}
.tabs-left>.nav-tabs>li,.tabs-right>.nav-tabs>li{float:none}
.tabs-left>.nav-tabs>li>a,.tabs-right>.nav-tabs>li>a{min-width:74px;margin-right:0;margin-bottom:3px}
.tabs-left>.nav-tabs{float:left;margin-right:19px;border-right:1px solid #ddd}
.tabs-left>.nav-tabs>li>a{margin-right:-1px;-webkit-border-radius:4px 0 0 4px;-moz-border-radius:4px 0 0 4px;border-radius:4px 0 0 4px}
.tabs-left>.nav-tabs>li>a:hover,.tabs-left>.nav-tabs>li>a:focus{border-color:#eee #ddd #eee #eee}
.tabs-left>.nav-tabs .active>a,.tabs-left>.nav-tabs .active>a:hover,.tabs-left>.nav-tabs .active>a:focus{border-color:#ddd transparent #ddd #ddd;*border-right-color:#fff}
.tabs-right>.nav-tabs{float:right;margin-left:19px;border-left:1px solid #ddd}
.tabs-right>.nav-tabs>li>a{margin-left:-1px;-webkit-border-radius:0 4px 4px 0;-moz-border-radius:0 4px 4px 0;border-radius:0 4px 4px 0}
.tabs-right>.nav-tabs>li>a:hover,.tabs-right>.nav-tabs>li>a:focus{border-color:#eee #eee #eee #ddd}
.tabs-right>.nav-tabs .active>a,.tabs-right>.nav-tabs .active>a:hover,.tabs-right>.nav-tabs .active>a:focus{border-color:#ddd #ddd #ddd transparent;*border-left-color:#fff}
.nav>.disabled>a{color:#999}
.nav>.disabled>a:hover,.nav>.disabled>a:focus{text-decoration:none;background-color:transparent;cursor:default}
.navbar{overflow:visible;margin-bottom:20px;*position:relative;*z-index:2}
.navbar-inner{min-height:40px;padding-left:20px;padding-right:20px;background-color:#fafafa;background-image:-moz-linear-gradient(top,#fff,#f2f2f2);background-image:-webkit-gradient(linear,0 0,0 100%,from(#fff),to(#f2f2f2));background-image:-webkit-linear-gradient(top,#fff,#f2f2f2);background-image:-o-linear-gradient(top,#fff,#f2f2f2);background-image:linear-gradient(to bottom,#fff,#f2f2f2);background-repeat:repeat-x;filter:progid:DXImageTransform.Microsoft.gradient(startColorstr=''#fffff'',endColorstr=''#fff2f2f2'',GradientType=0);border:1px solid #d4d4d4;-webkit-border-radius:4px;-moz-border-radius:4px;border-radius:4px;-webkit-box-shadow:0 1px 4px rgba(0,0,0,0.065);-moz-box-shadow:0 1px 4px rgba(0,0,0,0.065);box-shadow:0 1px 4px rgba(0,0,0,0.065);*zoom:1}
.navbar-inner:before,.navbar-inner:after{display:table;content:"";line-height:0}
.navbar-inner:after{clear:both}
.navbar .container{width:auto}
.nav-collapse.collapse{height:auto;overflow:visible}
.navbar .brand{float:left;display:block;padding:10px 20px 10px;margin-left:-20px;font-size:20px;font-weight:200;color:#777;text-shadow:0 1px 0 #fff}
.navbar .brand:hover,.navbar .brand:focus{text-decoration:none}
.navbar-text{margin-bottom:0;line-height:40px;color:#777}
.navbar-link{color:#777}
.navbar-link:hover,.navbar-link:focus{color:#333}
.navbar .divider-vertical{height:40px;margin:0 9px;border-left:1px solid #f2f2f2;border-right:1px solid #fff}
.navbar .btn,.navbar .btn-group{margin-top:5px}
.navbar .btn-group .btn,.navbar .input-prepend .btn,.navbar .input-append .btn,.navbar .input-prepend .btn-group,.navbar .input-append .btn-group{margin-top:0}
.navbar-form{margin-bottom:0;*zoom:1}
.navbar-form:before,.navbar-form:after{display:table;content:"";line-height:0}
.navbar-form:after{clear:both}
.navbar-form input,.navbar-form select,.navbar-form .radio,.navbar-form .checkbox{margin-top:5px}
.navbar-form input,.navbar-form select,.navbar-form .btn{display:inline-block;margin-bottom:0}
.navbar-form input[type="image"],.navbar-form input[type="checkbox"],.navbar-form input[type="radio"]{margin-top:3px}
.navbar-form .input-append,.navbar-form .input-prepend{margin-top:5px;white-space:nowrap}
.navbar-form .input-append input,.navbar-form .input-prepend input{margin-top:0}
.navbar-static-top{position:static;margin-bottom:0}
.navbar-static-top .navbar-inner{-webkit-border-radius:0;-moz-border-radius:0;border-radius:0}
.navbar-fixed-top,.navbar-fixed-bottom{position:fixed;right:0;left:0;z-index:1030;margin-bottom:0}
.navbar-fixed-top .navbar-inner,.navbar-static-top .navbar-inner{border-width:0 0 1px}
.navbar-fixed-bottom .navbar-inner{border-width:1px 0 0}
.navbar-fixed-top .navbar-inner,.navbar-fixed-bottom .navbar-inner{padding-left:0;padding-right:0;-webkit-border-radius:0;-moz-border-radius:0;border-radius:0}
.navbar-static-top .container,.navbar-fixed-top .container,.navbar-fixed-bottom .container{width:940px}
.navbar-fixed-top{top:0}
.navbar-fixed-top .navbar-inner,.navbar-static-top .navbar-inner{-webkit-box-shadow:0 1px 10px rgba(0,0,0,.1);-moz-box-shadow:0 1px 10px rgba(0,0,0,.1);box-shadow:0 1px 10px rgba(0,0,0,.1)}
.navbar-fixed-bottom{bottom:0}
.navbar-fixed-bottom .navbar-inner{-webkit-box-shadow:0 -1px 10px rgba(0,0,0,.1);-moz-box-shadow:0 -1px 10px rgba(0,0,0,.1);box-shadow:0 -1px 10px rgba(0,0,0,.1)}
.navbar .nav{position:relative;left:0;display:block;float:right;margin:0 10px 0 0}
.navbar .nav.pull-right{float:right;margin-right:0}
.navbar .nav>li{float:left}
.navbar .nav>li>a{float:none;padding:10px 15px 10px;color:#777;text-decoration:none;text-shadow:0 1px 0 #fff}
.navbar .nav .dropdown-toggle .caret{margin-top:8px}
.navbar .nav>li>a:focus,.navbar .nav>li>a:hover{background-color:transparent;color:#333;text-decoration:none}
.navbar .nav>.active>a,.navbar .nav>.active>a:hover,.navbar .nav>.active>a:focus{color:#555;text-decoration:none;background-color:#e5e5e5;-webkit-box-shadow:inset 0 3px 8px rgba(0,0,0,0.125);-moz-box-shadow:inset 0 3px 8px rgba(0,0,0,0.125);box-shadow:inset 0 3px 8px rgba(0,0,0,0.125)}
.navbar .btn-navbar{display:none;float:right;padding:7px 10px;margin-left:5px;margin-right:5px;color:#fff;}
.navbar .nav>li>.dropdown-menu:before{content:'''';display:inline-block;border-left:7px solid transparent;border-right:7px solid transparent;border-bottom:7px solid #ccc;border-bottom-color:rgba(0,0,0,0.2);position:absolute;top:-7px;left:9px}
.navbar .nav>li>.dropdown-menu:after{content:'''';display:inline-block;border-left:6px solid transparent;border-right:6px solid transparent;border-bottom:6px solid #fff;position:absolute;top:-6px;left:10px}
.navbar-fixed-bottom .nav>li>.dropdown-menu:before{border-top:7px solid #ccc;border-top-color:rgba(0,0,0,0.2);border-bottom:0;bottom:-7px;top:auto}
.navbar-fixed-bottom .nav>li>.dropdown-menu:after{border-top:6px solid #fff;border-bottom:0;bottom:-6px;top:auto}
.navbar .nav li.dropdown>a:hover .caret,.navbar .nav li.dropdown>a:focus .caret{border-top-color:#333;border-bottom-color:#333}
.navbar .nav li.dropdown.open>.dropdown-toggle,.navbar .nav li.dropdown.active>.dropdown-toggle,.navbar .nav li.dropdown.open.active>.dropdown-toggle{background-color:#e5e5e5;color:#555}
.navbar .nav li.dropdown>.dropdown-toggle .caret{border-top-color:#777;border-bottom-color:#777}
.navbar .nav li.dropdown.open>.dropdown-toggle .caret,.navbar .nav li.dropdown.active>.dropdown-toggle .caret,.navbar .nav li.dropdown.open.active>.dropdown-toggle .caret{border-top-color:#555;border-bottom-color:#555}
.navbar .pull-right>li>.dropdown-menu,.navbar .nav>li>.dropdown-menu.pull-right{left:auto;right:0}
.navbar .pull-right>li>.dropdown-menu:before,.navbar .nav>li>.dropdown-menu.pull-right:before{left:auto;right:12px}
.navbar .pull-right>li>.dropdown-menu:after,.navbar .nav>li>.dropdown-menu.pull-right:after{left:auto;right:13px}
.navbar .pull-right>li>.dropdown-menu .dropdown-menu,.navbar .nav>li>.dropdown-menu.pull-right .dropdown-menu{left:auto;right:100%;margin-left:0;margin-right:-1px;-webkit-border-radius:6px 0 6px 6px;-moz-border-radius:6px 0 6px 6px;border-radius:6px 0 6px 6px}
.navbar-inverse .navbar-inner{background-color:#1b1b1b;background-image:-moz-linear-gradient(top,#222,#111);background-image:-webkit-gradient(linear,0 0,0 100%,from(#222),to(#111));background-image:-webkit-linear-gradient(top,#222,#111);background-image:-o-linear-gradient(top,#222,#111);background-image:linear-gradient(to bottom,#222,#111);background-repeat:repeat-x;filter:progid:DXImageTransform.Microsoft.gradient(startColorstr=''#f2222'',endColorstr=''#f1111'',GradientType=0);border-color:#252525}
.navbar-inverse .brand,.navbar-inverse .nav>li>a{color:#999;text-shadow:0 -1px 0 rgba(0,0,0,0.25)}
.navbar-inverse .brand:hover,.navbar-inverse .nav>li>a:hover,.navbar-inverse .brand:focus,.navbar-inverse .nav>li>a:focus{color:#fff}
.navbar-inverse .brand{color:#999}
.navbar-inverse .navbar-text{color:#999}
.navbar-inverse .nav>li>a:focus,.navbar-inverse .nav>li>a:hover{background-color:transparent;color:#fff}
.navbar-inverse .nav .active>a,.navbar-inverse .nav .active>a:hover,.navbar-inverse .nav .active>a:focus{color:#fff;background-color:#111}
.navbar-inverse .navbar-link{color:#999}
.navbar-inverse .navbar-link:hover,.navbar-inverse .navbar-link:focus{color:#fff}
.navbar-inverse .divider-vertical{border-left-color:#111;border-right-color:#222}
.navbar-inverse .nav li.dropdown.open>.dropdown-toggle,.navbar-inverse .nav li.dropdown.active>.dropdown-toggle,.navbar-inverse .nav li.dropdown.open.active>.dropdown-toggle{background-color:#111;color:#fff}
.navbar-inverse .nav li.dropdown>a:hover .caret,.navbar-inverse .nav li.dropdown>a:focus .caret{border-top-color:#fff;border-bottom-color:#fff}
.navbar-inverse .nav li.dropdown>.dropdown-toggle .caret{border-top-color:#999;border-bottom-color:#999}
.navbar-inverse .nav li.dropdown.open>.dropdown-toggle .caret,.navbar-inverse .nav li.dropdown.active>.dropdown-toggle .caret,.navbar-inverse .nav li.dropdown.open.active>.dropdown-toggle .caret{border-top-color:#fff;border-bottom-color:#fff}
.breadcrumb{padding:8px 15px;margin:0 0 20px;list-style:none;background-color:#f5f5f5;-webkit-border-radius:4px;-moz-border-radius:4px;border-radius:4px}
.breadcrumb>li{display:inline-block;*display:inline;*zoom:1;text-shadow:0 1px 0 #fff}
.breadcrumb>li>.divider{padding:0 5px;color:#ccc}
.breadcrumb>.active{color:#999}
.pagination{margin:20px 0}
.pagination ul{display:inline-block;*display:inline;*zoom:1;margin-left:0;margin-bottom:0;-webkit-border-radius:4px;-moz-border-radius:4px;border-radius:4px;-webkit-box-shadow:0 1px 2px rgba(0,0,0,0.05);-moz-box-shadow:0 1px 2px rgba(0,0,0,0.05);box-shadow:0 1px 2px rgba(0,0,0,0.05)}
.pagination ul>li{display:inline}
.pagination ul>li>a,.pagination ul>li>span{float:left;padding:4px 12px;line-height:20px;text-decoration:none;background-color:#fff;border:1px solid #ddd;border-left-width:0}
.pagination ul>li>a:hover,.pagination ul>li>a:focus,.pagination ul>.active>a,.pagination ul>.active>span{background-color:#f5f5f5}
.pagination ul>.active>a,.pagination ul>.active>span{color:#999;cursor:default}
.pagination ul>.disabled>span,.pagination ul>.disabled>a,.pagination ul>.disabled>a:hover,.pagination ul>.disabled>a:focus{color:#999;background-color:transparent;cursor:default}
.pagination ul>li:first-child>a,.pagination ul>li:first-child>span{border-left-width:1px;-webkit-border-top-left-radius:4px;-moz-border-radius-topleft:4px;border-top-left-radius:4px;-webkit-border-bottom-left-radius:4px;-moz-border-radius-bottomleft:4px;border-bottom-left-radius:4px}
.pagination ul>li:last-child>a,.pagination ul>li:last-child>span{-webkit-border-top-right-radius:4px;-moz-border-radius-topright:4px;border-top-right-radius:4px;-webkit-border-bottom-right-radius:4px;-moz-border-radius-bottomright:4px;border-bottom-right-radius:4px}
.pagination-centered{text-align:center}
.pagination-right{text-align:right}
.pagination-large ul>li>a,.pagination-large ul>li>span{padding:11px 19px;font-size:17.5px}
.pagination-large ul>li:first-child>a,.pagination-large ul>li:first-child>span{-webkit-border-top-left-radius:6px;-moz-border-radius-topleft:6px;border-top-left-radius:6px;-webkit-border-bottom-left-radius:6px;-moz-border-radius-bottomleft:6px;border-bottom-left-radius:6px}
.pagination-large ul>li:last-child>a,.pagination-large ul>li:last-child>span{-webkit-border-top-right-radius:6px;-moz-border-radius-topright:6px;border-top-right-radius:6px;-webkit-border-bottom-right-radius:6px;-moz-border-radius-bottomright:6px;border-bottom-right-radius:6px}
.pagination-mini ul>li:first-child>a,.pagination-small ul>li:first-child>a,.pagination-mini ul>li:first-child>span,.pagination-small ul>li:first-child>span{-webkit-border-top-left-radius:3px;-moz-border-radius-topleft:3px;border-top-left-radius:3px;-webkit-border-bottom-left-radius:3px;-moz-border-radius-bottomleft:3px;border-bottom-left-radius:3px}
.pagination-mini ul>li:last-child>a,.pagination-small ul>li:last-child>a,.pagination-mini ul>li:last-child>span,.pagination-small ul>li:last-child>span{-webkit-border-top-right-radius:3px;-moz-border-radius-topright:3px;border-top-right-radius:3px;-webkit-border-bottom-right-radius:3px;-moz-border-radius-bottomright:3px;border-bottom-right-radius:3px}
.pagination-small ul>li>a,.pagination-small ul>li>span{padding:2px 10px;font-size:11.9px}
.pagination-mini ul>li>a,.pagination-mini ul>li>span{padding:0 6px;font-size:10.5px}
.pager{margin:20px 0;list-style:none;text-align:center;*zoom:1}
.pager:before,.pager:after{display:table;content:"";line-height:0}
.pager:after{clear:both}
.pager li{display:inline}
.pager li>a,.pager li>span{display:inline-block;padding:5px 14px;background-color:#fff;border:1px solid #ddd;-webkit-border-radius:15px;-moz-border-radius:15px;border-radius:15px}
.pager li>a:hover,.pager li>a:focus{text-decoration:none;background-color:#f5f5f5}
.pager .next>a,.pager .next>span{float:right}
.pager .previous>a,.pager .previous>span{float:left}
.pager .disabled>a,.pager .disabled>a:hover,.pager .disabled>a:focus,.pager .disabled>span{color:#999;background-color:#fff;cursor:default}
.thumbnails{margin-left:-20px;list-style:none;*zoom:1}
.thumbnails:before,.thumbnails:after{display:table;content:"";line-height:0}
.thumbnails:after{clear:both}
.row-fluid .thumbnails{margin-left:0}
.thumbnails>li{float:left;margin-bottom:20px;margin-left:20px}
.thumbnail{display:block;padding:4px;line-height:20px;border:1px solid #ddd;-webkit-border-radius:4px;-moz-border-radius:4px;border-radius:4px;-webkit-box-shadow:0 1px 3px rgba(0,0,0,0.055);-moz-box-shadow:0 1px 3px rgba(0,0,0,0.055);box-shadow:0 1px 3px rgba(0,0,0,0.055);-webkit-transition:all 0.2s ease-in-out;-moz-transition:all 0.2s ease-in-out;-o-transition:all 0.2s ease-in-out;transition:all 0.2s ease-in-out}
a.thumbnail:hover,a.thumbnail:focus{border-color:#08c;-webkit-box-shadow:0 1px 4px rgba(0,105,214,0.25);-moz-box-shadow:0 1px 4px rgba(0,105,214,0.25);box-shadow:0 1px 4px rgba(0,105,214,0.25)}
.thumbnail>img{display:block;max-width:100%;margin-left:auto;margin-right:auto}
.thumbnail .caption{padding:9px;color:#555}
.alert{padding:8px 35px 8px 14px;margin-bottom:20px;text-shadow:0 1px 0 rgba(255,255,255,0.5);background-color:#fcf8e3;border:1px solid #fbeed5;-webkit-border-radius:4px;-moz-border-radius:4px;border-radius:4px}
.alert,.alert h4{color:#c09853}
.alert h4{margin:0}
.alert .close{position:relative;top:-2px;right:-21px;line-height:20px}
.alert-success{background-color:#dff0d8;border-color:#d6e9c6;color:#468847}
.alert-success h4{color:#468847}
.alert-danger,.alert-error{background-color:#f2dede;border-color:#eed3d7;color:#b94a48}
.alert-danger h4,.alert-error h4{color:#b94a48}
.alert-info{background-color:#d9edf7;border-color:#bce8f1;color:#3a87ad}
.alert-info h4{color:#3a87ad}
.alert-block{padding-top:14px;padding-bottom:14px}
.alert-block>p,.alert-block>ul{margin-bottom:0}
.alert-block p+p{margin-top:5px}
@-webkit-keyframes progress-bar-stripes{from{background-position:40px 0}
to{background-position:0 0}
}
@-moz-keyframes progress-bar-stripes{from{background-position:40px 0}
to{background-position:0 0}
}
@-ms-keyframes progress-bar-stripes{from{background-position:40px 0}
to{background-position:0 0}
}
@-o-keyframes progress-bar-stripes{from{background-position:0 0}
to{background-position:40px 0}
}
@keyframes progress-bar-stripes{from{background-position:40px 0}
to{background-position:0 0}
}
.progress{overflow:hidden;height:20px;margin-bottom:20px;background-color:#f7f7f7;background-image:-moz-linear-gradient(top,#f5f5f5,#f9f9f9);background-image:-webkit-gradient(linear,0 0,0 100%,from(#f5f5f5),to(#f9f9f9));background-image:-webkit-linear-gradient(top,#f5f5f5,#f9f9f9);background-image:-o-linear-gradient(top,#f5f5f5,#f9f9f9);background-image:linear-gradient(to bottom,#f5f5f5,#f9f9f9);background-repeat:repeat-x;filter:progid:DXImageTransform.Microsoft.gradient(startColorstr=''#fff5f5f5'',endColorstr=''#fff9f9f9'',GradientType=0);-webkit-box-shadow:inset 0 1px 2px rgba(0,0,0,0.1);-moz-box-shadow:inset 0 1px 2px rgba(0,0,0,0.1);box-shadow:inset 0 1px 2px rgba(0,0,0,0.1);-webkit-border-radius:4px;-moz-border-radius:4px;border-radius:4px}
.progress .bar{width:0%;height:100%;color:#fff;float:left;font-size:12px;text-align:center;text-shadow:0 -1px 0 rgba(0,0,0,0.25);background-color:#0e90d2;background-image:-moz-linear-gradient(top,#149bdf,#0480be);background-image:-webkit-gradient(linear,0 0,0 100%,from(#149bdf),to(#0480be));background-image:-webkit-linear-gradient(top,#149bdf,#0480be);background-image:-o-linear-gradient(top,#149bdf,#0480be);background-image:linear-gradient(to bottom,#149bdf,#0480be);background-repeat:repeat-x;filter:progid:DXImageTransform.Microsoft.gradient(startColorstr=''#ff149bdf'',endColorstr=''#ff0480be'',GradientType=0);-webkit-box-shadow:inset 0 -1px 0 rgba(0,0,0,0.15);-moz-box-shadow:inset 0 -1px 0 rgba(0,0,0,0.15);box-shadow:inset 0 -1px 0 rgba(0,0,0,0.15);-webkit-box-sizing:border-box;-moz-box-sizing:border-box;box-sizing:border-box;-webkit-transition:width 0.6s ease;-moz-transition:width 0.6s ease;-o-transition:width 0.6s ease;transition:width 0.6s ease}
.progress .bar+.bar{-webkit-box-shadow:inset 1px 0 0 rgba(0,0,0,.15),inset 0 -1px 0 rgba(0,0,0,.15);-moz-box-shadow:inset 1px 0 0 rgba(0,0,0,.15),inset 0 -1px 0 rgba(0,0,0,.15);box-shadow:inset 1px 0 0 rgba(0,0,0,.15),inset 0 -1px 0 rgba(0,0,0,.15)}
.progress-striped .bar{background-color:#149bdf;background-image:-webkit-gradient(linear,0 100%,100% 0,color-stop(0.25,rgba(255,255,255,0.15)),color-stop(0.25,transparent),color-stop(0.5,transparent),color-stop(0.5,rgba(255,255,255,0.15)),color-stop(0.75,rgba(255,255,255,0.15)),color-stop(0.75,transparent),to(transparent));background-image:-webkit-linear-gradient(45deg,rgba(255,255,255,0.15) 25%,transparent 25%,transparent 50%,rgba(255,255,255,0.15) 50%,rgba(255,255,255,0.15) 75%,transparent 75%,transparent);background-image:-moz-linear-gradient(45deg,rgba(255,255,255,0.15) 25%,transparent 25%,transparent 50%,rgba(255,255,255,0.15) 50%,rgba(255,255,255,0.15) 75%,transparent 75%,transparent);background-image:-o-linear-gradient(45deg,rgba(255,255,255,0.15) 25%,transparent 25%,transparent 50%,rgba(255,255,255,0.15) 50%,rgba(255,255,255,0.15) 75%,transparent 75%,transparent);background-image:linear-gradient(45deg,rgba(255,255,255,0.15) 25%,transparent 25%,transparent 50%,rgba(255,255,255,0.15) 50%,rgba(255,255,255,0.15) 75%,transparent 75%,transparent);-webkit-background-size:40px 40px;-moz-background-size:40px 40px;-o-background-size:40px 40px;background-size:40px 40px}
.progress.active .bar{-webkit-animation:progress-bar-stripes 2s linear infinite;-moz-animation:progress-bar-stripes 2s linear infinite;-ms-animation:progress-bar-stripes 2s linear infinite;-o-animation:progress-bar-stripes 2s linear infinite;animation:progress-bar-stripes 2s linear infinite}
.progress-danger .bar,.progress .bar-danger{background-color:#dd514c;background-image:-moz-linear-gradient(top,#ee5f5b,#c43c35);background-image:-webkit-gradient(linear,0 0,0 100%,from(#ee5f5b),to(#c43c35));background-image:-webkit-linear-gradient(top,#ee5f5b,#c43c35);background-image:-o-linear-gradient(top,#ee5f5b,#c43c35);background-image:linear-gradient(to bottom,#ee5f5b,#c43c35);background-repeat:repeat-x;filter:progid:DXImageTransform.Microsoft.gradient(startColorstr=''#ffee5f5b'',endColorstr=''#ffc43c35'',GradientType=0)}
.progress-danger.progress-striped .bar,.progress-striped .bar-danger{background-color:#ee5f5b;background-image:-webkit-gradient(linear,0 100%,100% 0,color-stop(0.25,rgba(255,255,255,0.15)),color-stop(0.25,transparent),color-stop(0.5,transparent),color-stop(0.5,rgba(255,255,255,0.15)),color-stop(0.75,rgba(255,255,255,0.15)),color-stop(0.75,transparent),to(transparent));background-image:-webkit-linear-gradient(45deg,rgba(255,255,255,0.15) 25%,transparent 25%,transparent 50%,rgba(255,255,255,0.15) 50%,rgba(255,255,255,0.15) 75%,transparent 75%,transparent);background-image:-moz-linear-gradient(45deg,rgba(255,255,255,0.15) 25%,transparent 25%,transparent 50%,rgba(255,255,255,0.15) 50%,rgba(255,255,255,0.15) 75%,transparent 75%,transparent);background-image:-o-linear-gradient(45deg,rgba(255,255,255,0.15) 25%,transparent 25%,transparent 50%,rgba(255,255,255,0.15) 50%,rgba(255,255,255,0.15) 75%,transparent 75%,transparent);background-image:linear-gradient(45deg,rgba(255,255,255,0.15) 25%,transparent 25%,transparent 50%,rgba(255,255,255,0.15) 50%,rgba(255,255,255,0.15) 75%,transparent 75%,transparent)}
.progress-success .bar,.progress .bar-success{background-color:#5eb95e;background-image:-moz-linear-gradient(top,#62c462,#57a957);background-image:-webkit-gradient(linear,0 0,0 100%,from(#62c462),to(#57a957));background-image:-webkit-linear-gradient(top,#62c462,#57a957);background-image:-o-linear-gradient(top,#62c462,#57a957);background-image:linear-gradient(to bottom,#62c462,#57a957);background-repeat:repeat-x;filter:progid:DXImageTransform.Microsoft.gradient(startColorstr=''#ff62c462'',endColorstr=''#ff57a957'',GradientType=0)}
.progress-success.progress-striped .bar,.progress-striped .bar-success{background-color:#62c462;background-image:-webkit-gradient(linear,0 100%,100% 0,color-stop(0.25,rgba(255,255,255,0.15)),color-stop(0.25,transparent),color-stop(0.5,transparent),color-stop(0.5,rgba(255,255,255,0.15)),color-stop(0.75,rgba(255,255,255,0.15)),color-stop(0.75,transparent),to(transparent));background-image:-webkit-linear-gradient(45deg,rgba(255,255,255,0.15) 25%,transparent 25%,transparent 50%,rgba(255,255,255,0.15) 50%,rgba(255,255,255,0.15) 75%,transparent 75%,transparent);background-image:-moz-linear-gradient(45deg,rgba(255,255,255,0.15) 25%,transparent 25%,transparent 50%,rgba(255,255,255,0.15) 50%,rgba(255,255,255,0.15) 75%,transparent 75%,transparent);background-image:-o-linear-gradient(45deg,rgba(255,255,255,0.15) 25%,transparent 25%,transparent 50%,rgba(255,255,255,0.15) 50%,rgba(255,255,255,0.15) 75%,transparent 75%,transparent);background-image:linear-gradient(45deg,rgba(255,255,255,0.15) 25%,transparent 25%,transparent 50%,rgba(255,255,255,0.15) 50%,rgba(255,255,255,0.15) 75%,transparent 75%,transparent)}
.progress-info .bar,.progress .bar-info{background-color:#4bb1cf;background-image:-moz-linear-gradient(top,#5bc0de,#339bb9);background-image:-webkit-gradient(linear,0 0,0 100%,from(#5bc0de),to(#339bb9));background-image:-webkit-linear-gradient(top,#5bc0de,#339bb9);background-image:-o-linear-gradient(top,#5bc0de,#339bb9);background-image:linear-gradient(to bottom,#5bc0de,#339bb9);background-repeat:repeat-x;filter:progid:DXImageTransform.Microsoft.gradient(startColorstr=''#ff5bc0de'',endColorstr=''#ff339bb9'',GradientType=0)}
.progress-info.progress-striped .bar,.progress-striped .bar-info{background-color:#5bc0de;background-image:-webkit-gradient(linear,0 100%,100% 0,color-stop(0.25,rgba(255,255,255,0.15)),color-stop(0.25,transparent),color-stop(0.5,transparent),color-stop(0.5,rgba(255,255,255,0.15)),color-stop(0.75,rgba(255,255,255,0.15)),color-stop(0.75,transparent),to(transparent));background-image:-webkit-linear-gradient(45deg,rgba(255,255,255,0.15) 25%,transparent 25%,transparent 50%,rgba(255,255,255,0.15) 50%,rgba(255,255,255,0.15) 75%,transparent 75%,transparent);background-image:-moz-linear-gradient(45deg,rgba(255,255,255,0.15) 25%,transparent 25%,transparent 50%,rgba(255,255,255,0.15) 50%,rgba(255,255,255,0.15) 75%,transparent 75%,transparent);background-image:-o-linear-gradient(45deg,rgba(255,255,255,0.15) 25%,transparent 25%,transparent 50%,rgba(255,255,255,0.15) 50%,rgba(255,255,255,0.15) 75%,transparent 75%,transparent);background-image:linear-gradient(45deg,rgba(255,255,255,0.15) 25%,transparent 25%,transparent 50%,rgba(255,255,255,0.15) 50%,rgba(255,255,255,0.15) 75%,transparent 75%,transparent)}
.progress-warning .bar,.progress .bar-warning{background-color:#faa732;background-image:-moz-linear-gradient(top,#fbb450,#f89406);background-image:-webkit-gradient(linear,0 0,0 100%,from(#fbb450),to(#f89406));background-image:-webkit-linear-gradient(top,#fbb450,#f89406);background-image:-o-linear-gradient(top,#fbb450,#f89406);background-image:linear-gradient(to bottom,#fbb450,#f89406);background-repeat:repeat-x;filter:progid:DXImageTransform.Microsoft.gradient(startColorstr=''#fffbb450'',endColorstr=''#fff89406'',GradientType=0)}
.progress-warning.progress-striped .bar,.progress-striped .bar-warning{background-color:#fbb450;background-image:-webkit-gradient(linear,0 100%,100% 0,color-stop(0.25,rgba(255,255,255,0.15)),color-stop(0.25,transparent),color-stop(0.5,transparent),color-stop(0.5,rgba(255,255,255,0.15)),color-stop(0.75,rgba(255,255,255,0.15)),color-stop(0.75,transparent),to(transparent));background-image:-webkit-linear-gradient(45deg,rgba(255,255,255,0.15) 25%,transparent 25%,transparent 50%,rgba(255,255,255,0.15) 50%,rgba(255,255,255,0.15) 75%,transparent 75%,transparent);background-image:-moz-linear-gradient(45deg,rgba(255,255,255,0.15) 25%,transparent 25%,transparent 50%,rgba(255,255,255,0.15) 50%,rgba(255,255,255,0.15) 75%,transparent 75%,transparent);background-image:-o-linear-gradient(45deg,rgba(255,255,255,0.15) 25%,transparent 25%,transparent 50%,rgba(255,255,255,0.15) 50%,rgba(255,255,255,0.15) 75%,transparent 75%,transparent);background-image:linear-gradient(45deg,rgba(255,255,255,0.15) 25%,transparent 25%,transparent 50%,rgba(255,255,255,0.15) 50%,rgba(255,255,255,0.15) 75%,transparent 75%,transparent)}
.media,.media-body{overflow:hidden;*overflow:visible;zoom:1}
.media,.media .media{margin-top:15px}
.media:first-child{margin-top:0}
.media-object{display:block}
.media-heading{margin:0 0 5px}
.media>.pull-left{margin-right:10px}
.media>.pull-right{margin-left:10px}
.media-list{margin-left:0;list-style:none}
.tooltip{position:absolute;z-index:1030;display:block;visibility:visible;font-size:11px;line-height:1.4;opacity:0;filter:alpha(opacity=0)}
.tooltip.in{opacity:0.8;filter:alpha(opacity=80)}
.tooltip.top{margin-top:-3px;padding:5px 0}
.tooltip.right{margin-left:3px;padding:0 5px}
.tooltip.bottom{margin-top:3px;padding:5px 0}
.tooltip.left{margin-left:-3px;padding:0 5px}
.tooltip-inner{max-width:200px;padding:8px;color:#fff;text-align:center;text-decoration:none;background-color:#000;-webkit-border-radius:4px;-moz-border-radius:4px;border-radius:4px}
.tooltip-arrow{position:absolute;width:0;height:0;border-color:transparent;border-style:solid}
.tooltip.top .tooltip-arrow{bottom:0;left:50%;margin-left:-5px;border-width:5px 5px 0;border-top-color:#000}
.tooltip.right .tooltip-arrow{top:50%;left:0;margin-top:-5px;border-width:5px 5px 5px 0;border-right-color:#000}
.tooltip.left .tooltip-arrow{top:50%;right:0;margin-top:-5px;border-width:5px 0 5px 5px;border-left-color:#000}
.tooltip.bottom .tooltip-arrow{top:0;left:50%;margin-left:-5px;border-width:0 5px 5px;border-bottom-color:#000}
.popover{position:absolute;top:0;left:0;z-index:1010;display:none;max-width:276px;padding:1px;text-align:left;background-color:#fff;-webkit-background-clip:padding-box;-moz-background-clip:padding;background-clip:padding-box;border:1px solid #ccc;border:1px solid rgba(0,0,0,0.2);-webkit-border-radius:6px;-moz-border-radius:6px;border-radius:6px;-webkit-box-shadow:0 5px 10px rgba(0,0,0,0.2);-moz-box-shadow:0 5px 10px rgba(0,0,0,0.2);box-shadow:0 5px 10px rgba(0,0,0,0.2);white-space:normal}
.popover.top{margin-top:-10px}
.popover.right{margin-left:10px}
.popover.bottom{margin-top:10px}
.popover.left{margin-left:-10px}
.popover-title{margin:0;padding:8px 14px;font-size:14px;font-weight:normal;line-height:18px;background-color:#f7f7f7;border-bottom:1px solid #ebebeb;-webkit-border-radius:5px 5px 0 0;-moz-border-radius:5px 5px 0 0;border-radius:5px 5px 0 0}
.popover-title:empty{display:none}
.popover-content{padding:9px 14px}
.popover .arrow,.popover .arrow:after{position:absolute;display:block;width:0;height:0;border-color:transparent;border-style:solid}
.popover .arrow{border-width:11px}
.popover .arrow:after{border-width:10px;content:""}
.popover.top .arrow{left:50%;margin-left:-11px;border-bottom-width:0;border-top-color:#999;border-top-color:rgba(0,0,0,0.25);bottom:-11px}
.popover.top .arrow:after{bottom:1px;margin-left:-10px;border-bottom-width:0;border-top-color:#fff}
.popover.right .arrow{top:50%;left:-11px;margin-top:-11px;border-left-width:0;border-right-color:#999;border-right-color:rgba(0,0,0,0.25)}
.popover.right .arrow:after{left:1px;bottom:-10px;border-left-width:0;border-right-color:#fff}
.popover.bottom .arrow{left:50%;margin-left:-11px;border-top-width:0;border-bottom-color:#999;border-bottom-color:rgba(0,0,0,0.25);top:-11px}
.popover.bottom .arrow:after{top:1px;margin-left:-10px;border-top-width:0;border-bottom-color:#fff}
.popover.left .arrow{top:50%;right:-11px;margin-top:-11px;border-right-width:0;border-left-color:#999;border-left-color:rgba(0,0,0,0.25)}
.popover.left .arrow:after{right:1px;border-right-width:0;border-left-color:#fff;bottom:-10px}
.modal-backdrop{position:fixed;top:0;right:0;bottom:0;left:0;z-index:1040;background-color:#000}
.modal-backdrop.fade{opacity:0}
.modal-backdrop,.modal-backdrop.fade.in{opacity:0.8;filter:alpha(opacity=80)}
.modal{position:fixed;top:10%;left:50%;z-index:1050;width:560px;margin-left:-280px;background-color:#fff;border:1px solid #999;border:1px solid rgba(0,0,0,0.3);*border:1px solid #999;-webkit-border-radius:6px;-moz-border-radius:6px;border-radius:6px;-webkit-box-shadow:0 3px 7px rgba(0,0,0,0.3);-moz-box-shadow:0 3px 7px rgba(0,0,0,0.3);box-shadow:0 3px 7px rgba(0,0,0,0.3);-webkit-background-clip:padding-box;-moz-background-clip:padding-box;background-clip:padding-box;outline:none}
.modal.fade{-webkit-transition:opacity .3s linear,top .3s ease-out;-moz-transition:opacity .3s linear,top .3s ease-out;-o-transition:opacity .3s linear,top .3s ease-out;transition:opacity .3s linear,top .3s ease-out;top:-25%}
.modal.fade.in{top:10%}
.modal-header{padding:9px 15px;border-bottom:1px solid #eee}
.modal-header .close{margin-top:2px}
.modal-header h3{margin:0;line-height:30px}
.modal-body{position:relative;overflow-y:auto;max-height:400px;padding:15px}
.modal-form{margin-bottom:0}
.modal-footer{padding:14px 15px 15px;margin-bottom:0;text-align:right;background-color:#f5f5f5;border-top:1px solid #ddd;-webkit-border-radius:0 0 6px 6px;-moz-border-radius:0 0 6px 6px;border-radius:0 0 6px 6px;-webkit-box-shadow:inset 0 1px 0 #fff;-moz-box-shadow:inset 0 1px 0 #fff;box-shadow:inset 0 1px 0 #fff;*zoom:1}
.modal-footer:before,.modal-footer:after{display:table;content:"";line-height:0}
.modal-footer:after{clear:both}
.modal-footer .btn+.btn{margin-left:5px;margin-bottom:0}
.modal-footer .btn-group .btn+.btn{margin-left:-1px}
.modal-footer .btn-block+.btn-block{margin-left:0}
.dropup,.dropdown{position:relative}
.dropdown-toggle{*margin-bottom:-3px}
.dropdown-toggle:active,.open .dropdown-toggle{outline:0}
.caret{display:inline-block;width:0;height:0;vertical-align:top;border-top:4px solid #000;border-right:4px solid transparent;border-left:4px solid transparent;content:""}
.dropdown .caret{margin-top:8px;margin-left:2px}
.dropdown-menu{position:absolute;top:100%;left:0;z-index:1000;display:none;float:left;min-width:160px;padding:5px 0;margin:2px 0 0;list-style:none;background-color:#fff;border:1px solid #ccc;border:1px solid rgba(0,0,0,0.2);*border-right-width:2px;*border-bottom-width:2px;-webkit-border-radius:6px;-moz-border-radius:6px;border-radius:6px;-webkit-box-shadow:0 5px 10px rgba(0,0,0,0.2);-moz-box-shadow:0 5px 10px rgba(0,0,0,0.2);box-shadow:0 5px 10px rgba(0,0,0,0.2);-webkit-background-clip:padding-box;-moz-background-clip:padding;background-clip:padding-box}
.dropdown-menu.pull-right{right:0;left:auto}
.dropdown-menu .divider{*width:100%;height:1px;margin:9px 1px;*margin:-5px 0 5px;overflow:hidden;background-color:#e5e5e5;border-bottom:1px solid #fff}
.dropdown-menu>li>a{display:block;padding:3px 20px;clear:both;font-weight:normal;line-height:20px;color:#333;white-space:nowrap}
.dropdown-menu>li>a:hover,.dropdown-menu>li>a:focus,.dropdown-submenu:hover>a,.dropdown-submenu:focus>a{text-decoration:none;color:#fff;background-color:#0081c2;background-image:-moz-linear-gradient(top,#08c,#0077b3);background-image:-webkit-gradient(linear,0 0,0 100%,from(#08c),to(#0077b3));background-image:-webkit-linear-gradient(top,#08c,#0077b3);background-image:-o-linear-gradient(top,#08c,#0077b3);background-image:linear-gradient(to bottom,#08c,#0077b3);background-repeat:repeat-x;filter:progid:DXImageTransform.Microsoft.gradient(startColorstr=''#f08cc'',endColorstr=''#f07b3'',GradientType=0)}
.dropdown-menu>.active>a,.dropdown-menu>.active>a:hover,.dropdown-menu>.active>a:focus{color:#fff;text-decoration:none;outline:0;background-color:#0081c2;background-image:-moz-linear-gradient(top,#08c,#0077b3);background-image:-webkit-gradient(linear,0 0,0 100%,from(#08c),to(#0077b3));background-image:-webkit-linear-gradient(top,#08c,#0077b3);background-image:-o-linear-gradient(top,#08c,#0077b3);background-image:linear-gradient(to bottom,#08c,#0077b3);background-repeat:repeat-x;filter:progid:DXImageTransform.Microsoft.gradient(startColorstr=''#f08cc'',endColorstr=''#f07b3'',GradientType=0)}
.dropdown-menu>.disabled>a,.dropdown-menu>.disabled>a:hover,.dropdown-menu>.disabled>a:focus{color:#999}
.dropdown-menu>.disabled>a:hover,.dropdown-menu>.disabled>a:focus{text-decoration:none;background-color:transparent;background-image:none;filter:progid:DXImageTransform.Microsoft.gradient(enabled = false);cursor:default}
.open{*z-index:1000}
.open>.dropdown-menu{display:block}
.dropdown-backdrop{position:fixed;left:0;right:0;bottom:0;top:0;z-index:990}
.pull-right>.dropdown-menu{right:0;left:auto}
.dropup .caret,.navbar-fixed-bottom .dropdown .caret{border-top:0;border-bottom:4px solid #000;content:""}
.dropup .dropdown-menu,.navbar-fixed-bottom .dropdown .dropdown-menu{top:auto;bottom:100%;margin-bottom:1px}
.dropdown-submenu{position:relative}
.dropdown-submenu>.dropdown-menu{top:0;left:100%;margin-top:-6px;margin-left:-1px;-webkit-border-radius:0 6px 6px 6px;-moz-border-radius:0 6px 6px 6px;border-radius:0 6px 6px 6px}
.dropdown-submenu:hover>.dropdown-menu{display:block}
.dropup .dropdown-submenu>.dropdown-menu{top:auto;bottom:0;margin-top:0;margin-bottom:-2px;-webkit-border-radius:5px 5px 5px 0;-moz-border-radius:5px 5px 5px 0;border-radius:5px 5px 5px 0}
.dropdown-submenu>a:after{display:block;content:" ";float:right;width:0;height:0;border-color:transparent;border-style:solid;border-width:5px 0 5px 5px;border-left-color:#ccc;margin-top:5px;margin-right:-10px}
.dropdown-submenu:hover>a:after{border-left-color:#fff}
.dropdown-submenu.pull-left{float:none}
.dropdown-submenu.pull-left>.dropdown-menu{left:-100%;margin-left:10px;-webkit-border-radius:6px 0 6px 6px;-moz-border-radius:6px 0 6px 6px;border-radius:6px 0 6px 6px}
.dropdown .dropdown-menu .nav-header{padding-left:20px;padding-right:20px}
.typeahead{z-index:1051;margin-top:2px;-webkit-border-radius:4px;-moz-border-radius:4px;border-radius:4px}
.accordion{margin-bottom:20px}
.accordion-group{margin-bottom:2px;border:1px solid #e5e5e5;-webkit-border-radius:4px;-moz-border-radius:4px;border-radius:4px}
.accordion-heading{border-bottom:0}
.accordion-heading .accordion-toggle{display:block;padding:8px 15px}
.accordion-toggle{cursor:pointer}
.accordion-inner{padding:9px 15px;border-top:1px solid #e5e5e5}
.well{min-height:20px;padding:19px;margin-bottom:20px;background-color:#f5f5f5;border:1px solid #e3e3e3;-webkit-border-radius:4px;-moz-border-radius:4px;border-radius:4px;-webkit-box-shadow:inset 0 1px 1px rgba(0,0,0,0.05);-moz-box-shadow:inset 0 1px 1px rgba(0,0,0,0.05);box-shadow:inset 0 1px 1px rgba(0,0,0,0.05)}
.well blockquote{border-color:#ddd;border-color:rgba(0,0,0,0.15)}
.well-large{padding:24px;-webkit-border-radius:6px;-moz-border-radius:6px;border-radius:6px}
.well-small{padding:9px;-webkit-border-radius:3px;-moz-border-radius:3px;border-radius:3px}
.close{float:right;font-size:20px;font-weight:bold;line-height:20px;color:#000;text-shadow:0 1px 0 #fff;opacity:0.2;filter:alpha(opacity=20)}
.close:hover,.close:focus{color:#000;text-decoration:none;cursor:pointer;opacity:0.4;filter:alpha(opacity=40)}
button.close{padding:0;cursor:pointer;background:transparent;border:0;-webkit-appearance:none}
.pull-right{float:right;margin-top: 12px;}
.pull-left{float:left}
.hide{display:none}
.show{display:block}
.invisible{visibility:hidden}
.affix{position:fixed}
.fade{opacity:0;-webkit-transition:opacity 0.15s linear;-moz-transition:opacity 0.15s linear;-o-transition:opacity 0.15s linear;transition:opacity 0.15s linear}
.fade.in{opacity:1}
.collapse{position:relative;height:0;overflow:hidden;-webkit-transition:height 0.35s ease;-moz-transition:height 0.35s ease;-o-transition:height 0.35s ease;transition:height 0.35s ease}
.collapse.in{height:auto}
@-ms-viewport{width:device-width}
.hidden{display:none;visibility:hidden}
.visible-phone{display:none !important}
.visible-tablet{display:none !important}
.hidden-desktop{display:none !important}
.visible-desktop{display:inherit !important}
#searchform label, #searchform input[type="submit"]{display: none;}
#side-bar #searchform input[type="submit"]{display: inline-block;width: 28%;}
#masthead .bl_search {float: right;margin: 20px 0;}
#masthead .bl_search form{margin: 0;}
.navbar-inverse .navbar-inner{background:transparent;-moz-border-radius:0;-webkit-border-radius:0;border-radius:0;-moz-box-shadow:none;-webkit-box-shadow:none;box-shadow:none;border:none;padding:5px 0px;filter:none}
.navbar{margin-bottom:0}
.navbar .brand{color:#FFF;height:70px;margin:0 30px 0 0;padding:13px 0 12px}
.navbar .brand-text{line-height:42px}
.navbar .brand img{height:45px}
.navbar .nav > li > a{color:#EFEFEF;display:block;font-size:16px;font-weight:300;line-height:25px;padding:23px 20px 27px;text-decoration:none;-webkit-transition:all 0.1s ease-in-out;-moz-transition:all 0.1s ease-in-out;-o-transition:all 0.1s ease-in-out;-ms-transition:all 0.1s ease-in-out;transition:all 0.1s ease-in-out}
.navbar a.brand p{font-size:12px;line-height:0;margin:0;opacity:0.8}
.navbar a.brand.brand-tagline{padding:5px 0 0}
.navbar .nav > li > a:focus + ul{display:block}
.navbar-inverse .brand,.navbar-inverse .nav > li > a{text-shadow:none}
.navbar-inverse .nav-collapse .nav > li > a,.navbar-inverse .nav-collapse .dropdown-menu a{color:#EFEFEF}
.navbar .nav > li.active,.navbar .nav > li:hover{background:none repeat scroll 0 0 rgba(255,255,255,0.02);color:#fff}
.dropdown-menu{background:none repeat scroll 0 0 #222;border-top:2px solid #F69087;border-left:0;border-right:0;border-radius:0;padding:0;margin:0}
.dropdown-menu > li > a{color:#FFF;font-size:16px;padding:15px 20px}
.navbar .nav > li > .dropdown-menu:after,.navbar .nav > li > .dropdown-menu:before{display:none}
.navbar .nav > li:hover > ul{display:block}
.dropdown-menu > li > a:hover{background:#272727}
.navbar-inverse .nav li.dropdown.open > .dropdown-toggle,.navbar-inverse .nav li.dropdown.active > .dropdown-toggle,.navbar-inverse .nav li.dropdown.open.active > .dropdown-toggle{background:none repeat scroll 0 0 #212833}
.dropdown-toggle i{font-size:12px;margin:0 0 0 4px}
.btn-navbar{cursor:pointer;margin:18px 15px 18px 0;padding:7px 10px}
.nav-collapse .nav > li > a,.nav-collapse .dropdown-menu a{-moz-border-radius:0;-webkit-border-radius:0;border-radius:0}
#masthead{height:82px;background:#222222;margin-bottom:50px;left:0;position:fixed;top:0;width:100%;z-index:999}
#page{position:relative}
.top-color div{float:left;height:5px;width:25%}
.container{margin-right:auto;margin-left:auto;*zoom:1}
.container:before,.container:after{display:table;content:"";line-height:0}
.container:after{clear:both}
#header{margin-right:30px;float:left}
#header,#header a{color:#FFF}
#header h1{font-weight:normal;line-height:30px;margin-top:20px}
#header img{margin-top:5px;width:auto;max-height:60px}
#side-bar{width:350px;margin-left:30px}
#content-wrapper{margin-bottom:50px;padding-top:100px;}
.post{display:block;margin-bottom:30px;overflow:hidden;border-bottom:2px solid #ddd}
.post h1{font-size:38.5px;font-weight:normal;line-height:100%;margin-bottom:20px}
.post img{max-width:100%}
.entry-video iframe,.thumb{display:block}
.entry-container{background:#FFF;position:relative}
.entry-content{padding:50px}
.entry-content p{color:#525252;font-size:18px}
.entry-image{overflow:hidden;background:#F4F4F4}
.entry-image img{width:100%;-webkit-transition:all .35s ease-in-out;-moz-transition:all .35s ease-in-out;-o-transition:all .35s ease-in-out;transition:all .35s ease-in-out}
.entry-meta{background:none repeat scroll 0 0 #FFF;padding:15px 30px 15px;border-color:#ddd;border-style:solid;border-width:1px 0 0;position:relative;background:#fcfcfc}
.entry-meta img{margin-right:15px;display:inline-block;padding: 1px;
border: 1px solid #DAD1D1;}
.entry-meta h4{display:inline-block;line-height:55px}
.entry-meta h4 a{color:#878787;font-weight:normal;text-shadow:0 1px 0 #FFF;text-decoration:none;cursor:pointer}
.entry-meta .author-meta{position:relative}
.share-story-container img{display:block;margin-right:5px}
.share-story-container ul{margin:0}
.share-story-container li{display:inline-block;width:33px;height:32px}
.sidebar .widget{background:#fff;margin-bottom:30px;}
.sidebar h2{line-height: 40px;
background: #FFFFFF;
font-size: 20px;
font-weight: normal;
padding: 10px 15px 0;
color: #292929;
border-bottom: 2px solid #eee;}
.sidebar ul{margin:0}
.sidebar li{line-height:20px;display:block;padding:8px 15px 8px 18px;border-bottom:1px solid #eee}
.sidebar li a{color:#717171;display:block;font-size:16px}
.sidebar li:hover{background:none repeat scroll 0 0 #F8F8F8;border-left:3px solid #F69087;padding:8px 15px}
#comments{overflow:hidden;background:#FFFFFF;border-bottom:2px solid #DDDDDD;padding:25px}
#comments h4{display:inline;padding:10px;line-height:40px}
#comments h4,.comments .comment-header,.comments .comment-thread.inline-thread .comment{position:relative}
#comments h4,.comments .continue a{background: #F35353}
#comments h4,.comments .user a,.comments .continue a{font-size:16px}
#comments h4,.comments .continue a{font-weight:normal;color:#fff}
#comments h4:after{content:"";position:absolute;bottom:-10px;left:10px;border-top:10px solid #F35353;border-right:20px solid transparent;width:0;height:0;line-height:0}
#comments .avatar-image-container img{border:0}
.comment-thread{color:#111}
.comment-thread a{color:#777}
.comment-thread ol{margin:0 0 20px}
.comment-thread .comment-content a,.comments .user a,.comments .comment-thread.inline-thread .user a{color:#F69087}
.comments .avatar-image-container,.comments .avatar-image-container img{width:48px;max-width:48px;height:48px;max-height:48px}
.comments .comment-block,.comments .comments-content .comment-replies,.comments .comment-replybox-single{margin-left:60px}
.comments .comment-block,.comments .comment-thread.inline-thread .comment{border:1px solid #ddd;background:#f9f9f9;padding:10px}
.comments .comments-content .comment{margin:15px 0 0;padding:0;width:100%;line-height:1em}
.comments .comments-content .icon.blog-author{position:absolute;top:-12px;right:-12px;margin:0;background-image: url(//lh4.googleusercontent.com/-yZr9CWeDr1M/UhbCd9bmLkI/AAAAAAAACjI/sllgyp7xoMc/s36/author.png);width:36px;height:36px}
.comments .comments-content .inline-thread{padding:0 0 0 20px}
.comments .comments-content .comment-replies{margin-top:0}
.comments .comment-content{padding:5px 0;line-height:1.4em}
.comments .comment-thread.inline-thread{border-left:1px solid #ddd;background:transparent}
.comments .comment-thread.inline-thread .comment{width:auto}
.comments .comment-thread.inline-thread .comment:after{content:"";position:absolute;top:10px;left:-20px;border-top:1px solid #ddd;width:10px;height:0px}
.comments .comment-thread.inline-thread .comment .comment-block{border:0;background:transparent;padding:0}
.comments .comment-thread.inline-thread .comment-block{margin-left:48px}
.comments .comment-thread.inline-thread .user a{font-size:13px}
.comments .comment-thread.inline-thread .avatar-image-container,.comments .comment-thread.inline-thread .avatar-image-container img{width:36px;max-width:36px;height:36px;max-height:36px}
.comments .continue{border-top:0;width:100%}
.comments .continue a{padding:10px 0;text-align:center}
.comment .continue{display:none}
#comment-editor{width:103%!important}
.comment-form{width:100%;max-width:100%}
.comments .comments-content .loadmore,.comments .comments-content {margin:0}
#blog-pager-newer-link {float: left;}
#blog-pager-older-link {float: right;}
#blog-pager { margin:0; padding:10px 0; text-align: center; clear:both; }
.pagenavi{text-align: center;}
.pagenavi > *{font-size:18px;margin-right:10px;padding:5px 13px;display:inline-block}
.pagenavi a,.pagenavi span{color:#F69087;background:none repeat scroll 0 0 #FFF;border-bottom:2px solid #DDD;-moz-border-radius:4px;-webkit-border-radius:4px;border-radius:4px;text-decoration:none;-webkit-transition:all .1s ease-in-out;-moz-transition:all .1s ease-in-out;-o-transition:all .1s ease-in-out;transition:all .1s ease-in-out}
.pagenavi .current{color:#525252}
.pagenavi > a:hover{-webkit-transform:scale(1.1);-moz-transform:scale(1.1);-ms-transform:scale(1.1);-o-transform:scale(1.1);transform:scale(1.1)}
.Image img{max-width:300px;height:auto}
#PopularPosts1 img{float:left;margin:0 20px 0 0;display:block;height:70px;position:relative;width:70px;padding:0}
#PopularPosts1 dd{line-height:22px;margin:0;padding:8px 15px 8px 10px;position:relative;min-height:55px;border-left:3px solid transparent}
#PopularPosts1 dd:hover{background:#F8F8F8;border-left:3px solid #F69087;cursor:pointer}
#footer-bottom a{color:#F69087}
.status-msg-body{position:relative !important}
.CSS_LIGHTBOX{z-index:9999 !important}
.span9{width:610px}
@media (min-width: 979px) and (max-width: 1200px) {
#content.span9{width:560px}
}
.popover{min-width:220px}
#colophon{background:#333;color:#FFF;position: relative;
z-index: 100;
background: #2d2d2d;font-size: 16px;}
.site-footer .container{padding:40px 0}
.container1{width:100%; margin: 0px auto}
#footer-body h2{font-size:20px;font-weight:normal}
#footer-body ul{margin:0}
#footer-body li{
margin: 5px 0;
padding: 0 0 0 0;}
#footer-body li a{color: #fff;
display: inline-block;
float: left;
font-size: 11px!important;
line-height: 12px;
margin: 0 2px 2px 0;
padding: 12px 18px;
border: 1px solid #222;}
#footer-body li a:hover{background:#F35353;}
.site-footer #footer-bottom{color:#B8B8B8;background: rgba(0,0,0,0.4);
padding: 10px 0;
font-size: 14px;text-align: center;}
.FollowByEmail .btn{ -webkit-transition: all .05s ease-in-out; -moz-transition: all .05s ease-in-out; -o-transition: all .05s ease-in-out; transition: all .05s ease-in-out; background-image: -moz-linear-gradient(top, rgba(255,255,255,0.10) 0%, rgba(255,255,255,0) 100%); /* FF3.6+ */ background-image: -webkit-gradient(linear, left top, left bottom, color-stop(0%,rgba(255,255,255,0.10)), color-stop(100%,rgba(255,255,255,0))); /* Chrome,Safari4+ */ background-image: -webkit-linear-gradient(top,  rgba(255,255,255,0.10) 0%,rgba(255,255,255,0) 100%); /* Chrome10+,Safari5.1+ */ background-image: -o-linear-gradient(top,  rgba(255,255,255,0.10) 0%,rgba(255,255,255,0) 100%); /* Opera 11.10+ */ background-image: -ms-linear-gradient(top,  rgba(255,255,255,0.10) 0%,rgba(255,255,255,0) 100%); /* IE10+ */ background-image: linear-gradient(to bottom,  rgba(255,255,255,0.10) 0%,rgba(255,255,255,0) 100%); /* W3C */ filter: progid:DXImageTransform.Microsoft.gradient( startColorstr=''#40ffffff'', endColorstr=''#00ffffff'',GradientType=0 ); /* IE6-9 */
border:none; -moz-box-shadow: 0 -2px 0 0 rgba(0, 0, 0, 0.1) inset; -webkit-box-shadow: 0 -2px 0 0 rgba(0, 0, 0, 0.1) inset; box-shadow: 0 -2px 0 0 rgba(0, 0, 0, 0.1) inset; padding: 8px 20px 10px;text-align: center;vertical-align: middle;display: inline-block;font-size: 14px;line-height: 20px;margin-bottom: 0;
-webkit-border-radius:0 4px 4px 0;-moz-border-radius:0 4px 4px 0;border-radius:0 4px 4px 0;background-repeat: repeat-x;background-color: #F5F5F5;color: #333;}
.FollowByEmail .btn:hover{background-position:0;}
.FollowByEmail .btn:active,.btn:focus{box-shadow:0 2px 0 0 rgba(0, 0, 0, 0.1) inset; padding: 10px 20px 8px; outline:none!important; }
.FollowByEmail p {color: #B0B0B0;margin: 0 0 15px;}
.FollowByEmail .bl_newsletter_email {padding:0 6px;height: 38px;width: 200px;}
.FollowByEmail .btn-primary{height: 40px;background-color: #F35353;color: #fff;}
.FollowByEmail .btn-primary:hover{background-color: #F46969;}
.FollowByEmail .btn-primary:active,.btn-primary:focus{background-color: #16A085;}
@media (min-width:768px) and (max-width:979px){.hidden-desktop{display:inherit !important;} .visible-desktop{display:none !important ;} .visible-tablet{display:inherit !important;} .hidden-tablet{display:none !important;}}@media (max-width:767px){.hidden-desktop{display:inherit !important;} .visible-desktop{display:none !important;} .visible-phone{display:inherit !important;} .hidden-phone{display:none !important;}}.visible-print{display:none !important;}
@media print{.visible-print{display:inherit !important;} .hidden-print{display:none !important;}}@media (max-width:767px){body{padding-left:20px;padding-right:20px;} .navbar-fixed-top,.navbar-fixed-bottom,.navbar-static-top{margin-left:-20px;margin-right:-20px;} .container-fluid{padding:0;} .dl-horizontal dt{float:none;clear:none;width:auto;text-align:left;} .dl-horizontal dd{margin-left:0;} .container{width:auto;} .row-fluid{width:100%;} .row,.thumbnails{margin-left:0;} .thumbnails>li{float:none;margin-left:0;} [class*="span"],.uneditable-input[class*="span"],.row-fluid [class*="span"]{float:none;display:block;width:100%;margin-left:0;-webkit-box-sizing:border-box;-moz-box-sizing:border-box;box-sizing:border-box;} .span12,.row-fluid .span12{width:100%;-webkit-box-sizing:border-box;-moz-box-sizing:border-box;box-sizing:border-box;} .row-fluid [class*="offset"]:first-child{margin-left:0;} .input-large,.input-xlarge,.input-xxlarge,input[class*="span"],select[class*="span"],textarea[class*="span"],.uneditable-input{display:block;width:100%;min-height:30px;-webkit-box-sizing:border-box;-moz-box-sizing:border-box;box-sizing:border-box;} .input-prepend input,.input-append input,.input-prepend input[class*="span"],.input-append input[class*="span"]{display:inline-block;width:auto;} .controls-row [class*="span"]+[class*="span"]{margin-left:0;} .modal{position:fixed;top:20px;left:20px;right:20px;width:auto;margin:0;}.modal.fade{top:-100px;} .modal.fade.in{top:20px;}}@media (max-width:480px){.nav-collapse{-webkit-transform:translate3d(0, 0, 0);} .page-header h1 small{display:block;line-height:20px;} input[type="checkbox"],input[type="radio"]{border:1px solid #ccc;} .form-horizontal .control-label{float:none;width:auto;padding-top:0;text-align:left;} .form-horizontal .controls{margin-left:0;} .form-horizontal .control-list{padding-top:0;} .form-horizontal .form-actions{padding-left:10px;padding-right:10px;} .media .pull-left,.media .pull-right{float:none;display:block;margin-bottom:10px;} .media-object{margin-right:0;margin-left:0;} .modal{top:10px;left:10px;right:10px;} .modal-header .close{padding:10px;margin:-10px;} .carousel-caption{position:static;}}@media (min-width:768px) and (max-width:979px){.row{margin-left:-20px;*zoom:1;}.row:before,.row:after{display:table;content:"";line-height:0;} .row:after{clear:both;} [class*="span"]{float:left;min-height:1px;margin-left:20px;} .container,.navbar-static-top .container,.navbar-fixed-top .container,.navbar-fixed-bottom .container{width:724px;} .span12{width:724px;} .span11{width:662px;} .span10{width:600px;} .span9{width:538px;} .span8{width:476px;} .span7{width:414px;} .span6{width:352px;} .span5{width:290px;} .span4{width:228px;} .span3{width:166px;} .span2{width:104px;} .span1{width:42px;} .offset12{margin-left:764px;} .offset11{margin-left:702px;} .offset10{margin-left:640px;} .offset9{margin-left:578px;} .offset8{margin-left:516px;} .offset7{margin-left:454px;} .offset6{margin-left:392px;} .offset5{margin-left:330px;} .offset4{margin-left:268px;} .offset3{margin-left:206px;} .offset2{margin-left:144px;} .offset1{margin-left:82px;} .row-fluid{width:100%;*zoom:1;}.row-fluid:before,.row-fluid:after{display:table;content:"";line-height:0;} .row-fluid:after{clear:both;} .row-fluid [class*="span"]{display:block;width:100%;min-height:30px;-webkit-box-sizing:border-box;-moz-box-sizing:border-box;box-sizing:border-box;float:left;margin-left:2.7624309392265194%;*margin-left:2.709239449864817%;} .row-fluid [class*="span"]:first-child{margin-left:0;} .row-fluid .controls-row [class*="span"]+[class*="span"]{margin-left:2.7624309392265194%;} .row-fluid .span12{width:100%;*width:99.94680851063829%;} .row-fluid .span11{width:91.43646408839778%;*width:91.38327259903608%;} .row-fluid .span10{width:82.87292817679558%;*width:82.81973668743387%;} .row-fluid .span9{width:74.30939226519337%;*width:74.25620077583166%;} .row-fluid .span8{width:65.74585635359117%;*width:65.69266486422946%;} .row-fluid .span7{width:57.18232044198895%;*width:57.12912895262725%;} .row-fluid .span6{width:48.61878453038674%;*width:48.56559304102504%;} .row-fluid .span5{width:40.05524861878453%;*width:40.00205712942283%;} .row-fluid .span4{width:31.491712707182323%;*width:31.43852121782062%;} .row-fluid .span3{width:22.92817679558011%;*width:22.87498530621841%;} .row-fluid .span2{width:14.3646408839779%;*width:14.311449394616199%;} .row-fluid .span1{width:5.801104972375691%;*width:5.747913483013988%;} .row-fluid .offset12{margin-left:105.52486187845304%;*margin-left:105.41847889972962%;} .row-fluid .offset12:first-child{margin-left:102.76243093922652%;*margin-left:102.6560479605031%;} .row-fluid .offset11{margin-left:96.96132596685082%;*margin-left:96.8549429881274%;} .row-fluid .offset11:first-child{margin-left:94.1988950276243%;*margin-left:94.09251204890089%;} .row-fluid .offset10{margin-left:88.39779005524862%;*margin-left:88.2914070765252%;} .row-fluid .offset10:first-child{margin-left:85.6353591160221%;*margin-left:85.52897613729868%;} .row-fluid .offset9{margin-left:79.8342541436464%;*margin-left:79.72787116492299%;} .row-fluid .offset9:first-child{margin-left:77.07182320441989%;*margin-left:76.96544022569647%;} .row-fluid .offset8{margin-left:71.2707182320442%;*margin-left:71.16433525332079%;} .row-fluid .offset8:first-child{margin-left:68.50828729281768%;*margin-left:68.40190431409427%;} .row-fluid .offset7{margin-left:62.70718232044199%;*margin-left:62.600799341718584%;} .row-fluid .offset7:first-child{margin-left:59.94475138121547%;*margin-left:59.838368402492065%;} .row-fluid .offset6{margin-left:54.14364640883978%;*margin-left:54.037263430116376%;} .row-fluid .offset6:first-child{margin-left:51.38121546961326%;*margin-left:51.27483249088986%;} .row-fluid .offset5{margin-left:45.58011049723757%;*margin-left:45.47372751851417%;} .row-fluid .offset5:first-child{margin-left:42.81767955801105%;*margin-left:42.71129657928765%;} .row-fluid .offset4{margin-left:37.01657458563536%;*margin-left:36.91019160691196%;} .row-fluid .offset4:first-child{margin-left:34.25414364640884%;*margin-left:34.14776066768544%;} .row-fluid .offset3{margin-left:28.45303867403315%;*margin-left:28.346655695309746%;} .row-fluid .offset3:first-child{margin-left:25.69060773480663%;*margin-left:25.584224756083227%;} .row-fluid .offset2{margin-left:19.88950276243094%;*margin-left:19.783119783707537%;} .row-fluid .offset2:first-child{margin-left:17.12707182320442%;*margin-left:17.02068884448102%;} .row-fluid .offset1{margin-left:11.32596685082873%;*margin-left:11.219583872105325%;} .row-fluid .offset1:first-child{margin-left:8.56353591160221%;*margin-left:8.457152932878806%;} input,textarea,.uneditable-input{margin-left:0;} .controls-row [class*="span"]+[class*="span"]{margin-left:20px;} input.span12,textarea.span12,.uneditable-input.span12{width:710px;} input.span11,textarea.span11,.uneditable-input.span11{width:648px;} input.span10,textarea.span10,.uneditable-input.span10{width:586px;} input.span9,textarea.span9,.uneditable-input.span9{width:524px;} input.span8,textarea.span8,.uneditable-input.span8{width:462px;} input.span7,textarea.span7,.uneditable-input.span7{width:400px;} input.span6,textarea.span6,.uneditable-input.span6{width:338px;} input.span5,textarea.span5,.uneditable-input.span5{width:276px;} input.span4,textarea.span4,.uneditable-input.span4{width:214px;} input.span3,textarea.span3,.uneditable-input.span3{width:152px;} input.span2,textarea.span2,.uneditable-input.span2{width:90px;} input.span1,textarea.span1,.uneditable-input.span1{width:28px;}}@media (min-width:1200px){.row{margin-left:-30px;*zoom:1;}.row:before,.row:after{display:table;content:"";line-height:0;} .row:after{clear:both;} [class*="span"]{float:left;min-height:1px;margin-left:30px;} .container,.navbar-static-top .container,.navbar-fixed-top .container,.navbar-fixed-bottom .container{width:1170px;} .span12{width:1170px;} .span11{width:1070px;} .span10{width:970px;} .span9{width:870px;} .span8{width:770px;} .span7{width:670px;} .span6{width:570px;} .span5{width:470px;} .span4{width:370px;} .span3{width:270px;} .span2{width:170px;} .span1{width:70px;} .offset12{margin-left:1230px;} .offset11{margin-left:1130px;} .offset10{margin-left:1030px;} .offset9{margin-left:930px;} .offset8{margin-left:830px;} .offset7{margin-left:730px;} .offset6{margin-left:630px;} .offset5{margin-left:530px;} .offset4{margin-left:430px;} .offset3{margin-left:330px;} .offset2{margin-left:230px;} .offset1{margin-left:130px;} .row-fluid{width:100%;*zoom:1;}.row-fluid:before,.row-fluid:after{display:table;content:"";line-height:0;} .row-fluid:after{clear:both;} .row-fluid [class*="span"]{display:block;width:100%;min-height:30px;-webkit-box-sizing:border-box;-moz-box-sizing:border-box;box-sizing:border-box;float:left;margin-left:2.564102564102564%;*margin-left:2.5109110747408616%;} .row-fluid [class*="span"]:first-child{margin-left:0;} .row-fluid .controls-row [class*="span"]+[class*="span"]{margin-left:2.564102564102564%;} .row-fluid .span12{width:100%;*width:99.94680851063829%;} .row-fluid .span11{width:91.45299145299145%;*width:91.39979996362975%;} .row-fluid .span10{width:82.90598290598291%;*width:82.8527914166212%;} .row-fluid .span9{width:74.35897435897436%;*width:74.30578286961266%;} .row-fluid .span8{width:65.81196581196582%;*width:65.75877432260411%;} .row-fluid .span7{width:57.26495726495726%;*width:57.21176577559556%;} .row-fluid .span6{width:48.717948717948715%;*width:48.664757228587014%;} .row-fluid .span5{width:40.17094017094017%;*width:40.11774868157847%;} .row-fluid .span4{width:31.623931623931625%;*width:31.570740134569924%;} .row-fluid .span3{width:23.076923076923077%;*width:23.023731587561375%;} .row-fluid .span2{width:14.52991452991453%;*width:14.476723040552828%;} .row-fluid .span1{width:5.982905982905983%;*width:5.929714493544281%;} .row-fluid .offset12{margin-left:105.12820512820512%;*margin-left:105.02182214948171%;} .row-fluid .offset12:first-child{margin-left:102.56410256410257%;*margin-left:102.45771958537915%;} .row-fluid .offset11{margin-left:96.58119658119658%;*margin-left:96.47481360247316%;} .row-fluid .offset11:first-child{margin-left:94.01709401709402%;*margin-left:93.91071103837061%;} .row-fluid .offset10{margin-left:88.03418803418803%;*margin-left:87.92780505546462%;} .row-fluid .offset10:first-child{margin-left:85.47008547008548%;*margin-left:85.36370249136206%;} .row-fluid .offset9{margin-left:79.48717948717949%;*margin-left:79.38079650845607%;} .row-fluid .offset9:first-child{margin-left:76.92307692307693%;*margin-left:76.81669394435352%;} .row-fluid .offset8{margin-left:70.94017094017094%;*margin-left:70.83378796144753%;} .row-fluid .offset8:first-child{margin-left:68.37606837606839%;*margin-left:68.26968539734497%;} .row-fluid .offset7{margin-left:62.393162393162385%;*margin-left:62.28677941443899%;} .row-fluid .offset7:first-child{margin-left:59.82905982905982%;*margin-left:59.72267685033642%;} .row-fluid .offset6{margin-left:53.84615384615384%;*margin-left:53.739770867430444%;} .row-fluid .offset6:first-child{margin-left:51.28205128205128%;*margin-left:51.175668303327875%;} .row-fluid .offset5{margin-left:45.299145299145295%;*margin-left:45.1927623204219%;} .row-fluid .offset5:first-child{margin-left:42.73504273504273%;*margin-left:42.62865975631933%;} .row-fluid .offset4{margin-left:36.75213675213675%;*margin-left:36.645753773413354%;} .row-fluid .offset4:first-child{margin-left:34.18803418803419%;*margin-left:34.081651209310785%;} .row-fluid .offset3{margin-left:28.205128205128204%;*margin-left:28.0987452264048%;} .row-fluid .offset3:first-child{margin-left:25.641025641025642%;*margin-left:25.53464266230224%;} .row-fluid .offset2{margin-left:19.65811965811966%;*margin-left:19.551736679396257%;} .row-fluid .offset2:first-child{margin-left:17.094017094017094%;*margin-left:16.98763411529369%;} .row-fluid .offset1{margin-left:11.11111111111111%;*margin-left:11.004728132387708%;} .row-fluid .offset1:first-child{margin-left:8.547008547008547%;*margin-left:8.440625568285142%;} input,textarea,.uneditable-input{margin-left:0;} .controls-row [class*="span"]+[class*="span"]{margin-left:30px;} input.span12,textarea.span12,.uneditable-input.span12{width:1156px;} input.span11,textarea.span11,.uneditable-input.span11{width:1056px;} input.span10,textarea.span10,.uneditable-input.span10{width:956px;} input.span9,textarea.span9,.uneditable-input.span9{width:856px;} input.span8,textarea.span8,.uneditable-input.span8{width:756px;} input.span7,textarea.span7,.uneditable-input.span7{width:656px;} input.span6,textarea.span6,.uneditable-input.span6{width:556px;} input.span5,textarea.span5,.uneditable-input.span5{width:456px;} input.span4,textarea.span4,.uneditable-input.span4{width:356px;} input.span3,textarea.span3,.uneditable-input.span3{width:256px;} input.span2,textarea.span2,.uneditable-input.span2{width:156px;} input.span1,textarea.span1,.uneditable-input.span1{width:56px;} .thumbnails{margin-left:-30px;} .thumbnails>li{margin-left:30px;} .row-fluid .thumbnails{margin-left:0;}}@media (max-width:979px){body{padding-top:0;} .navbar-fixed-top,.navbar-fixed-bottom{position:static;} .navbar-fixed-top{margin-bottom:20px;} .navbar-fixed-bottom{margin-top:20px;} .navbar-fixed-top .navbar-inner,.navbar-fixed-bottom .navbar-inner{padding:5px;} .navbar .container{width:auto;padding:0;} .navbar .brand{padding-left:20px;padding-right:20px;margin:0 0 0 -5px;} .nav-collapse{clear:both;} .nav-collapse .nav{float:none;margin:0 0 10px;} .nav-collapse .nav>li{float:none;} .nav-collapse .nav>li>a{margin-bottom:2px;} .nav-collapse .nav>.divider-vertical{display:none;} .nav-collapse .nav .nav-header{color:#777777;text-shadow:none;} .nav-collapse .nav>li>a,.nav-collapse .dropdown-menu a{padding:9px 15px;font-weight:bold;color:#777777;-webkit-border-radius:3px;-moz-border-radius:3px;border-radius:3px;} .nav-collapse .btn{padding:4px 10px 4px;font-weight:normal;-webkit-border-radius:4px;-moz-border-radius:4px;border-radius:4px;} .nav-collapse .dropdown-menu li+li a{margin-bottom:2px;} .nav-collapse .nav>li>a:hover,.nav-collapse .nav>li>a:focus,.nav-collapse .dropdown-menu a:hover,.nav-collapse .dropdown-menu a:focus{background-color:#f2f2f2;} .navbar-inverse .nav-collapse .nav>li>a,.navbar-inverse .nav-collapse .dropdown-menu a{color:#999999;} .navbar-inverse .nav-collapse .nav>li>a:hover,.navbar-inverse .nav-collapse .nav>li>a:focus,.navbar-inverse .nav-collapse .dropdown-menu a:hover,.navbar-inverse .nav-collapse .dropdown-menu a:focus{background-color:#111111;} .nav-collapse.in .btn-group{margin-top:5px;padding:0;} .nav-collapse .dropdown-menu{position:static;top:auto;left:auto;float:none;display:none;max-width:none;margin:0 15px;padding:0;background-color:transparent;border:none;-webkit-border-radius:0;-moz-border-radius:0;border-radius:0;-webkit-box-shadow:none;-moz-box-shadow:none;box-shadow:none;} .nav-collapse .open>.dropdown-menu{display:block;} .nav-collapse .dropdown-menu:before,.nav-collapse .dropdown-menu:after{display:none;} .nav-collapse .dropdown-menu .divider{display:none;} .nav-collapse .nav>li>.dropdown-menu:before,.nav-collapse .nav>li>.dropdown-menu:after{display:none;} .nav-collapse .navbar-form,.nav-collapse .navbar-search{float:none;padding:10px 15px;margin:10px 0;border-top:1px solid #f2f2f2;border-bottom:1px solid #f2f2f2;-webkit-box-shadow:inset 0 1px 0 rgba(255,255,255,.1), 0 1px 0 rgba(255,255,255,.1);-moz-box-shadow:inset 0 1px 0 rgba(255,255,255,.1), 0 1px 0 rgba(255,255,255,.1);box-shadow:inset 0 1px 0 rgba(255,255,255,.1), 0 1px 0 rgba(255,255,255,.1);} .navbar-inverse .nav-collapse .navbar-form,.navbar-inverse .nav-collapse .navbar-search{border-top-color:#111111;border-bottom-color:#111111;} .navbar .nav-collapse .nav.pull-right{float:none;margin-left:0;} .nav-collapse,.nav-collapse.collapse{overflow:hidden;height:0;} .navbar .btn-navbar{display:block;} .navbar-static .navbar-inner{padding-left:10px;padding-right:10px;}}@media (min-width:980px){.nav-collapse.collapse{height:auto !important;overflow:visible !important;}}
@media (min-width: 1200px) {
.span9{width:790px}
.share-story-container small{margin:19px;position:static}
.share-story{margin:13px 0 0}
.entry-video iframe,.entry-video object{min-height:472.5px}
}
@media (min-width: 768px) and (max-width: 979px) {
.entry-video iframe,.entry-video object{min-height:472.5px}
#primary,.site-footer .container{padding-left:20px;padding-right:20px}
#masthead{position:absolute!important}
.bl_instagram,.bl_instagram .widget-body{width:100%!important}
.container{width:auto}
[class*="span"],.uneditable-input[class*="span"],.row-fluid [class*="span"]{-moz-box-sizing:border-box;display:block;float:none;margin-left:0;width:100%}
.row{margin-left:0}
#side-bar{margin:0;width:100%}
#side-bar .bl_tweets #tweets iframe{min-width:100%!important}
#masthead .bl_search{float:none;margin:0}
#masthead .bl_search.collapse.in{margin:20px 15px}
.navbar-inverse .navbar-inner{padding:0;}
.navbar-inverse .nav-collapse .dropdown-menu a:hover,.navbar-inverse .nav-collapse .dropdown-menu a:focus{background:transparent;color:#efefefe}
.navbar .nav > li > a{border-left:3px solid transparent}
.navbar .nav > li > a:hover,.navbar .nav > li > a:active,.navbar .nav > li > a:focus{border-left:3px solid #85CCB1}
.navbar-inverse .nav-collapse .nav > li > a:hover,.navbar-inverse .nav-collapse .nav > li > a:focus,.navbar-inverse .nav-collapse .dropdown-menu a:hover,.navbar-inverse .nav-collapse .dropdown-menu a:focus{background:transparent}
.nav-collapse .nav > li > a,.nav-collapse .dropdown-menu a{font-weight:normal;padding:12px 15px;margin:0}
.nav-collapse .open > .dropdown-menu{background:#222;margin:0}
.instagram-images-container{width:100%;overflow-x:auto}
#footer-body > [class*="span"]{margin-bottom:20px}
}
@media (max-width: 767px) {
.share-story-container ul {
margin: 14px 0;
}
#primary,.site-footer .container{padding-left:20px;padding-right:20px}
.between_posts.box{padding:5px}
body{padding:0!important}
.entry-image{height:auto}
#masthead{position:absolute!important}
.container{width:auto}
[class*="span"],.uneditable-input[class*="span"],.row-fluid [class*="span"]{-moz-box-sizing:border-box;display:block;float:none;margin-left:0;width:100%}
.row{margin-left:0}
#side-bar{margin:0;width:100%}
#side-bar .bl_tweets #tweets iframe{min-width:100%!important}
.share-story{display:block;width:100%;float:none}
.share-story li{float:none;display:table-cell;width:1%;border-right:1px solid #E6E6E6;border-top:1px solid #E6E6E6}
.share-story li:first-child{border-left:1px solid #E6E6E6}
.share-story li a{background:none repeat scroll 0 0 #F0F0F0;border-radius:0;text-align:center;padding:6px 0;width:100%}
.share-story-container{margin:0 -30px -15px;position:relative}
.share-story-container small{top:-23px;left:0;margin:0;position:absolute;text-align:center;width:100%}
.entry-meta .author-meta{margin-bottom:30px}
.share-story-container img{margin:0 auto}
.share-story-container li{background:#f1eff2}
.entry-meta .author-meta{margin-bottom:30px}
.entry-meta > [class*="pull"]{float:none}
.site-footer #footer-body .menu a{display:block;font-size:17px;margin:5px 0;padding:7px 10px}
.bl_instagram,.bl_instagram .widget-body{width:100%!important}
.instagram-images-container{width:100%;overflow-x:auto}
.instagram-interactions li{display:none!important}
.instagram-interactions:before{content:''\261d'';position:absolute;left:50%;top:10px;width:40px;margin:0 -20px;color:#fff;font-size:27px}
.entry-container .entry-content{padding:50px 20px 30px}
.entry-meta h4{line-height:45px}
.entry-meta .avatar{width:45px;height:45px}
.entry-meta .author-meta{padding-left:60px}
.entry-title{font-size:32px}
#masthead .bl_search{float:none;margin:0}
#masthead .bl_search.collapse.in{margin:15px}
.navbar .brand{margin:0}
.navbar-inner{padding:0}
.nav-collapse .nav{margin-bottom:0}
.navbar .nav > li > a{border-left:3px solid transparent}
.navbar .nav > li > a:hover,.navbar .nav > li > a:active,.navbar .nav > li > a:focus{border-left:3px solid #85CCB1}
.nav-collapse .dropdown-menu{background:#222;margin:0}
.navbar-inverse .nav-collapse .dropdown-menu a:hover,.navbar-inverse .nav-collapse .dropdown-menu a:focus{background:transparent;color:#e1e1e1}
.navbar-inverse .navbar-inner{padding:0}
.navbar-inverse .navbar-inner{background: #2d2d2d;}
.navbar-inverse .nav-collapse .nav > li > a:hover,.navbar-inverse .nav-collapse .nav > li > a:focus,.navbar-inverse .nav-collapse .dropdown-menu a:hover,.navbar-inverse .nav-collapse .dropdown-menu a:focus{background:transparent}
.nav-collapse .nav > li > a,.nav-collapse .dropdown-menu a{font-weight:normal;padding:12px 15px;margin:0}
.nav-collapse .open > .dropdown-menu{background:#212833;margin:0}
article.type-page{padding:50px 20px 30px}
#footer-body > [class*="span"]{margin-bottom:20px}
}
@media (max-width: 480px) {
#primary{padding-left:5px;padding-right:5px}
.navbar .brand{padding-left:5px;padding-right:5px}
.bl_background{display:none}
.share-story-container ul {
margin: 14px 0;
}
}
.post-avatar{background:url(//lh3.googleusercontent.com/-6qwdHih3tFk/Vv6N0dTaICI/AAAAAAACuRA/AsKTNm9c_Bg/s0/post-avatar.png)}
.firstload-background {
background: url(//2.bp.blogspot.com/-h8fC3jrTphQ/U9Ywn5XUesI/AAAAAAAABGA/TOLe6IOXPtQ/s1600/pattern5.png) repeat scroll 0 0 transparent;;
height: 100%;
left: 0;
position: fixed;
top: 0;
width: 100%;
z-index: -1;
}
.author-box{
float: left;
width: 100%;
padding: 0;
}
.search-bar {
-moz-transition: .3s linear;
-webkit-transition: .3s ease-out;
transition: .3s linear;
float: right;
right: 0;
cursor: pointer;
background-image: url();
background-repeat: no-repeat;
padding: 0px 20px 23px;
background-size: 100px 100px;
top: 0;
z-index: 99999;
margin-top: -5px;
}
.search-bar:hover {
-moz-transition: .01s linear;
-webkit-transition: .01s ease-out;
transition: .01s linear;
/*opacity: 1; */
background-image:none;
}
.nav-search {
width: auto;
height: 30px;
position: relative;
left: 0;
float: left;
line-height: 10px;
color: #fff !important;
}
.nav-search label {
display: none;
}
.nav-search input {
float: left;
/*width: 0;*/
background: none;
height: 30px;
line-height: 20px;
margin: 22px 0 0;
padding: 0 10px 0 0;
font-size: 15px;
/*color: #fff !important;*/
outline: 0;
border-radius: 0;
border: 0;
/*opacity: 1;*/
/*opacity: 1;*/
/*-webkit-transition: all .8s ease-in-out;
-moz-transition: all .8s ease-in-out;
-o-transition: all .8s ease-in-out;
transition: all .8s ease-in-out;
-webkit-appearance: none;*/
width: 160px;
margin-left: 33px;
background: none;
border-bottom: 1px solid #f1f1f1;
opacity: 1;
}
/*
.search-bar:hover .nav-search input {
width: 160px;
margin-left: 33px;
background: none;
border-bottom: 1px solid #f1f1f1;
opacity: 1;
}
*/
/*
.nav-search input::-webkit-input-placeholder {
color: #eee;
}
.nav-search input::-moz-placeholder {
color: #eee;
}
.nav-search input:-moz-placeholder {
color: #eee;
}
.nav-search input:-ms-input-placeholder {
color: #eee;
}
.nav-search input:focus {
color: #fff;
}
*/
.nav-search .srch_btn {
height: 42px;
width: 23px;
margin-top: 0;
background: url(//3.bp.blogspot.com/-h-x1pzE69JE/U5sUcTyNfAI/AAAAAAAAAdg/PYKJ6twHM1M/s1600/search-icon.png) 2px center no-repeat;
text-indent: 9999px;
position: relative;
}
--></style>
<script src=''//pulipulichen.github.io/blogger/blogger/js/breeze.js'' type=''text/javascript''></script>
<script src=''//ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js'' type=''text/javascript''></script>
<link href=''//fonts.googleapis.com/css?family=Lato'' rel=''stylesheet'' type=''text/css''/>
<link href=''//fonts.googleapis.com/css?family=Crete+Round'' rel=''stylesheet'' type=''text/css''/>
<link href=''//netdna.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.css'' rel=''stylesheet'' type=''text/css''/>
<style>
div.post-avatar {
border: 3px solid #eaeaea;
width: 100px;
height: 100px;
overflow: hidden;
float: left;
-webkit-transition: all .2s ease-in-out;
    -moz-transition: all .2s ease-in-out;
    -o-transition: all .2s ease-in-out;
    transition: all .2s ease-in-out;
}
.foundation {
margin-bottom: 121px;
margin-top: -103px;
}

.meta {
margin-top: 63px;
position: absolute;
margin-left: 126px;
}

.avatar-name {
color: #fff;
font-size: 18px;
margin-left: 126px;
margin-bottom: -48px;
padding-top: 17px;
display:none;
}
.post-avatar:hover {
border-radius: 50%;
-webkit-transition: all .2s ease-in-out;
    -moz-transition: all .2s ease-in-out;
    -o-transition: all .2s ease-in-out;
    transition: all .2s ease-in-out;
}


.sidebar h2 > span {
position: relative;
bottom: -2px;
display: inline-block;
border-bottom: 2px solid #e23a3e;
padding-bottom: 5px;
margin-top: 0px;
}
.read-more {
display: block;
float: left;
border-radius: 3px;
font-size: 13px;
padding: 7px 20px;
background: #333;
color: #fff;
letter-spacing: 0.5px;
text-transform: uppercase;
border: 1px solid #1D1D1D;
margin-top: 13px;
margin-bottom: 12px;
}


#masthead.fixed-nav {
    position: fixed;
    top: 0;
    width: 100% !important;
    margin: 0px auto;
    z-index: 999;
    height: 50px;
    opacity: 0.9;
    -webkit-box-shadow: 0 5px 3px rgba(0, 0, 0, .1);
    -moz-box-shadow: 0 5px 3px rgba(0, 0, 0, .1);
    box-shadow: 0 5px 3px rgba(0, 0, 0, .1);
}

#masthead.fixed-nav li > a{padding: 6px 20px 10px;
}
  #masthead.fixed-nav img{margin-top: 0;
width: auto;
max-height: 85%;}


#masthead.fixed-nav form {
margin-top: -16px;
}
#masthead.fixed-nav h1 {
font-size: 20px;
margin-top: 9px;
}


 #related-posts #owl-demo {
    overflow: visible;
padding: 0px 20px;
  }
  #related-posts {
    height: 240px;
    overflow: hidden;
z-index: 100;
background: #fff;
  }
  #related-posts .title {
    background: none repeat scroll 0% 0% #FFF;
    padding: 5px 20px;
    margin: 0px 0px 15px;
border-top: 1px solid #ddd;
border-bottom: 1px solid #ddd;
    font-size: 22px;
    
  }
  #owl-demo {
    max-height: 233px;
  }
  .owl-wrapper-outer {
    overflow: hidden;
    max-height: 240px;
  }
  #related-posts .owl-controls.clickable {
    position: relative;
  }
  .owl-wrapper {
    position: relative;
  }
  .owl-item {
    float: left;
    padding: 0px 10px;
    width: 235px !important;
  }
  .owl-item:first-child {
    padding: 0px 10px 0px 0px;
  }
  .item-img {
    position: relative;
  }
  #related-posts .owl-controls.clickable .owl-pagination {
    position: absolute;
    right: 0px;
    top: -208px;
  }
  .owl-theme .owl-controls .owl-page {
    display: inline-block;
    width: 13px;
    height: 13px;
    margin: 5px 14px 5px -10px;
    opacity: 0.5;
    border-radius: 20px;
    background: none repeat scroll 0% 0% #DDD;
    cursor: pointer;
  }
  .owl-theme .owl-controls .owl-page.active, .owl-theme .owl-controls.clickable .owl-page:hover {
    opacity: 1;
    background: none repeat scroll 0% 0% #333;
  }
  #related-posts img {
    background: url(//1.bp.blogspot.com/-EpAZ7479vZU/U8q4-6oeF5I/AAAAAAAAB2w/mQFhf-xZRko/s1600/background.png) repeat scroll 0% 0% #fff;
    display: table-cell;
    text-align: center;
    color: #EB005D;
    font-size: 19px;
  }


div.meta1 p {
padding: 10px 0;
margin-bottom: -20px;
font-size: 16px;

}
.meta1 span{margin-right:10px}

.label,.badge{display:inline-block;padding:2px 4px;font-size:11.844px;font-weight:bold;line-height:14px;color:#fff;vertical-align:baseline;white-space:nowrap;text-shadow:0 -1px 0 rgba(0,0,0,0.25);background-color:#999}
.label{-webkit-border-radius:3px;-moz-border-radius:3px;border-radius:3px}
.badge{padding-left:9px;padding-right:9px;-webkit-border-radius:9px;-moz-border-radius:9px;border-radius:9px}
.label:empty,.badge:empty{display:none}
a.label:hover,a.label:focus,a.badge:hover,a.badge:focus{color:#fff;text-decoration:none;cursor:pointer}



#footer{line-height:30px;padding: 10px 0 0px 0;background-color:#1a1a1a}#footer
p{font-size:13px;float:left;line-height:30px}#footer .go-top{float:right;margin-left:20px;padding-left:20px;border-left:1px solid rgba(0,0,0,0.1)}#footer .go-top
a{display:block;width:30px;height:30px;color:#fff;font-size:14px;text-align:center;border-radius:2px;background-color:#F46B6B;transition:background-color 0.2s ease-in-out;-moz-transition:background-color 0.2s ease-in-out;-webkit-transition:background-color 0.2s ease-in-out;-o-transition:background-color 0.2s ease-in-out}#footer .go-top a:hover{background-color:#444}#footer .go-top a
i{line-height:30px}
#footer a{color:#F57676}
#header-inner {
    width: auto !important;
    /*padding-left: 60px !important;*/
    background-position: left top !important;
    background-image: none !important;
}

#header-inner .descriptionwrapper {
    margin-top:5px;
}

.fixed-nav.affix #header-inner .descriptionwrapper,
.fixed-nav.affix #header-inner img {
    display:none;

}

.fixed-nav.affix #header-inner {
    background-image: none !important;
}

#sidebar-popular-post .popular-posts > ul > dd {
    display:none;
}

#sidebar-popular-post .popular-posts > ul > dd:nth-of-type(1),
#sidebar-popular-post .popular-posts > ul > dd:nth-of-type(2),
#sidebar-popular-post .popular-posts > ul > dd:nth-of-type(3),
#sidebar-popular-post .popular-posts > ul > dd:nth-of-type(4),
#sidebar-popular-post .popular-posts > ul > dd:nth-of-type(5) {
    display:block;
}

.site-footer .cloud-label-widget-content a {
    color: #CCC;
}

.entry-image {
    max-height: 300px;
}

/* ****************** */

.entry-content {
    line-height: 200%;
}

.entry-content > article > p {
    text-indent: 2em;
}

.entry-content h4 {
    font-size: 24pt;
    color:#BD8A39;
}

.entry-content h5 {
    font-size: 20pt;
    color:#BD8A39;
}

.entry-content h6 {
    font-size: 18pt;
    font-style: italic;
    color:#BD8A39;
}

.entry-content hr {
    border-top: 2px solid #DEB46F;
    border-bottom: 2px solid #BD8A39;
}

.entry-content ul {

}


</style>
<link href=''//pulipulichen.github.io/blogger/blogger/css/style.css'' rel=''stylesheet'' type=''text/css''/>
<link href=''//pulipulichen.github.io/blogger/blogger/css/style-item.css'' rel=''stylesheet'' type=''text/css''/>
<meta content=''width=device-width, initial-scale=1, maximum-scale=1'' name=''viewport''/>
<link href=''//lh3.googleusercontent.com/-EJjh-ZlKl64/VvtjyofcjNI/AAAAAAACuME/hYJhk_ZuORs/s0/pulipuli192x192.jpg'' rel=''shortcut icon'' type=''image/vnd.microsoft.icon''/>
<meta content=''#A1501A'' name=''theme-color''/>
<link href=''//lh3.googleusercontent.com/-EJjh-ZlKl64/VvtjyofcjNI/AAAAAAACuME/hYJhk_ZuORs/s0/pulipuli192x192.jpg'' rel=''icon'' sizes=''192x192''/>
<link href=''//lh3.googleusercontent.com/-vjf_alp-zjQ/VvtkKVpqCjI/AAAAAAACuMI/HPJXcEemwok/s0/pulipuli144x144.jpg'' rel=''apple-touch-icon'' sizes=''144x144''/>
<meta content=''開箱即用的R運作環境！RStudio Server OpenVZ虛擬機器分享 / Standalone R Environment: RStudio Server in OpenVZ Virtual Machine'' property=''og:title''/>
<meta content=''http://blog.pulipuli.info/2016/11/rrstudio-server-openvz-standalone-r.html'' property=''og:url''/>
<meta content=''article'' property=''og:type''/>
<meta content=''布丁布丁吃什麼？'' property=''og:site_name''/>
<meta content=''https://lh3.googleusercontent.com/-ybNC09QREIo/WCAa8HLqr3I/AAAAAAAC82k/pVxbGmRI_ec/image_thumb%25255B4%25255D.png?imgmax=800'' property=''og:image''/>
<link href=''https://lh3.googleusercontent.com/-ybNC09QREIo/WCAa8HLqr3I/AAAAAAAC82k/pVxbGmRI_ec/image_thumb%25255B4%25255D.png?imgmax=800'' rel=''image_src''/>
<meta content=''131200250238772'' property=''fb:admins''/>
<!-- Facebook Instant Articles -->
<meta content=''131200250238772'' property=''fb:pages''/><meta content=''09F5F270E3016847B9723E71AEE3FC24'' name=''msvalidate.01''/>
<meta content=''0XST85Xh5F'' name=''baidu-site-verification''/>
<meta content=''102285e6f21741f433c6400b5ec23fa7'' name=''p:domain_verify''/>
<!-- ======================================== -->
<script src=''//pulipulichen.github.io/blogger/blogger/js/script.js'' type=''text/javascript''></script>
<script src=''//pulipulichen.github.io/blogger/blogger/js/script-item.js'' type=''text/javascript''></script>
<!-- ======================================== -->
<!-- <link rel="stylesheet" type="text/css" href="//pulipulichen.github.io/blogger/blogger/css/style-olw.css"/> -->
</head>
<body>
<script src=''https://connect.facebook.net/en_US/all.js#xfbml=1''></script>
<div class=''firstload-background''></div>
<div class=''site'' id=''page''>
<div id=''masthead'' role=''banner''>
<div class=''container''>
<div class=''navbar navbar-inverse''>
<div class=''navbar-inner''>
<div class=''btn-navbar'' data-target=''.nav-collapse'' data-toggle=''collapse'' type=''button''>
<img src=''//lh3.googleusercontent.com/-joQnbCCa6Jg/VwFqIuKnCCI/AAAAAAACuUo/iZTPC_EVSyE/s0/bmenu_brown.png''/></div>
<header>
<div class=''back-button'' onclick=''javascript: _header_back_button_click();''>
<i aria-hidden=''true'' class=''fa fa-arrow-left''></i>
</div>
<div class=''header section'' id=''header''><div class=''widget Header'' data-version=''1'' id=''Header1''>
<div id=''header-inner'' style=''background-image: url("http://puddingchen.35.googlepages.com/pudding50px.gif"); background-position: left; width: 50px; min-height: 50px; _height: 50px; background-repeat: no-repeat; ''>
<div class=''titlewrapper'' style=''background: transparent''>
<h1 class=''title'' style=''background: transparent; border-width: 0px''>
<a accesskey=''H'' href=''http://blog.pulipuli.info/''>布丁布丁吃什麼&#65311;</a>
</h1>
</div>
<div class=''descriptionwrapper'' url=''http://blog.pulipuli.info/2016/11/rrstudio-server-openvz-standalone-r.html''>
<p class=''description''><span>我不是在實驗室&#65292;就是在前往實驗室的路上&#12290;</span></p>
</div>
</div>
</div></div>
</header>
<div class=''search-bar''>
<div class=''nav-search''>
<!-- <form action=''/search'' id=''searchform'' method=''get'' role=''search''> <input class=''search_input'' id=''s'' name=''q'' onblur=''if(this.value==&apos;&apos;)this.value=this.defaultValue;'' onfocus=''if(this.value==this.defaultValue)this.value=&apos;&apos;'' type=''text'' value=''Search and hit''/> </form> -->
<script type=''text/javascript''>
        (function () {
            var cx = ''017270649262638447003:o6vaq9on3vs'';
            var gcse = document.createElement(''script'');
            gcse.type = ''text/javascript'';
            gcse.async = true;
            gcse.src = ''//cse.google.com/cse.js?cx='' + cx;
            var s = document.getElementsByTagName(''script'')[0];
            s.parentNode.insertBefore(gcse, s);
        })();
    </script>
<div class=''gcse''>
<gcse:search enableAutoComplete=''true''></gcse:search>
</div>
<div class=''srch_btn'' id=''gsce_submit'' onclick=''$(&#39;input.gsc-search-button&#39;).click();''></div>
</div>
</div>
<nav>
<div class=''nav-collapse collapse''>
<ul class=''nav'' id=''menu-primary''>
<li class=''search''>
<form action=''#'' id=''searchform'' method=''get'' onsubmit=''return menu_search_submit(this);'' role=''search''>
<input class=''srch_btn'' id=''menu_gsce_submit'' type=''submit''/>
<input class=''search_input'' id=''s'' name=''q'' onblur=''if(this.value==&#39;&#39;)this.value=this.defaultValue;'' onfocus=''if(this.value==this.defaultValue)this.value=&#39;&#39;'' type=''text'' value=''Search and hit''/>
</form>
</li>
<li class=''home''>
<a accesskey=''U'' class=''accesskey-menu'' href=''#menu-anchor'' id=''menu-anchor'' title=''accesskey: menu''> ::: </a>
<a accesskey=''N'' class=''accesskey-menu'' href=''#menu-anchor'' title=''accesskey: menu''></a>
<a href=''http://blog.pulipuli.info/''>HOME</a>
</li>
<li><a href=''/p/sitemap.html#sitemap''>SITEMAP</a></li>
<li><a href=''/p/about_38.html''>ABOUT</a></li>
<li class=''dropdown''><a class=''dropdown-toggle'' data-toggle=''dropdown'' href=''#''>MENU<i class=''icon-angle-down''></i></a>
<ul class=''dropdown-menu''>
<li><a href=''/p/publications.html''>PUBLICATIONS</a></li>
<li><a href=''/search/label/作品''>WORKS</a></li>
<li><a href=''/p/archives.html''>ARCHIVES</a></li>
<li><a href=''/p/labels.html''>LABELS</a></li>
<li><a href=''/2005/12/blogger_113544406852218769.html''>CONTACT</a></li>
</ul>
</li>
<li class=''help''>
<a href=''/p/sitemap.html''>
<span class=''icon'' title=''HELP''>?</span>
<span class=''title''>HELP</span>
</a>
</li>
</ul>
</div>
</nav>
</div>
</div>
</div>
<div class=''clear''></div>
</div>
<div class=''clear''></div>
<div class=''container'' id=''content-wrapper''>
<div class=''row'' id=''primary''>
<div class=''span9 main'' id=''content'' role=''main''>
<a accesskey=''C'' href=''#content-anchor'' id=''content-anchor'' title=''accesskey: main section''> ::: </a>
<div class=''main section'' id=''main''><div class=''widget Blog'' data-version=''1'' id=''Blog1''>
<div class=''post''>
<div class=''entry-container''>
<div class=''entry-content''><article>
<h1>
開箱即用的R運作環境&#65281;RStudio Server OpenVZ虛擬機器分享 / Standalone R Environment: RStudio Server in OpenVZ Virtual Machine
<div class=''meta1''>
<p>
<small>
<span>
<i class=''fa fa-clock-o''></i>
11月 07, 2016
</span>
<span>
<i class=''fa fa-tags''></i>
<span class=''label-info''>
<a href=''http://blog.pulipuli.info/search/label/Programming%2FR'' rel=''tag''>
Programming/R
</a>

                                    ,
                                
<a href=''http://blog.pulipuli.info/search/label/Software%2FR'' rel=''tag''>
Software/R
</a>
</span>
</span>
<span>
<i class=''fa fa-comments''></i>
0 Comments
                </span>
<span class=''item-control blog-admin pid-1225433249''>
<a href=''https://www.blogger.com/post-edit.g?blogID=16607461&postID=3945870409398834382&from=pencil'' target=''_blank'' title=''編輯文章''>
<i aria-hidden=''true'' class=''fa fa-pencil-square-o''></i>
        Edit Post
      </a>
</span>
</small>
</p></div>
</h1>
<p><a href="https://lh3.googleusercontent.com/-Ok5hkVKObTw/WCAa2krd-aI/AAAAAAAC82g/b8D723jHwxI/s1600-h/image%25255B12%25255D.png"><img title="image" style="border-top: 0px; border-right: 0px; background-image: none; border-bottom: 0px; padding-top: 0px; padding-left: 0px; border-left: 0px; display: inline; padding-right: 0px" border="0" alt="image" src="https://lh3.googleusercontent.com/-ybNC09QREIo/WCAa8HLqr3I/AAAAAAAC82k/pVxbGmRI_ec/image_thumb%25255B4%25255D.png?imgmax=800" width="1018" height="553" /></a></p>  <p>我以<a href="http://blog.pulipuli.info/search/label/Virtual%20Machine%2FOpenVZ">OpenVZ虛擬機器</a>建立了一個獨立運作的<a href="https://www.rstudio.com/products/rstudio/download-server/">RStudio Server</a>&#65292;架設起來之後就能夠直接用網頁來開啟可以正常運作的<a href="https://www.r-project.org/">R環境</a>&#12290;它不僅預先裝好了<a href="http://rstudio-pubs-static.s3.amazonaws.com/12422_b2b48bb2da7942acaca5ace45bd8c60c.html">文字探勘</a>與資料庫所需要的套件&#65292;而且不會受到在<a href="http://blog.csdn.net/cl1143015961/article/details/46453495">Windows環境下處理中文發生亂碼問題</a>的限制&#12290;架設這樣的環境費時費工&#65292;所以我決定將它做成開箱即可用的OpenVZ虛擬機器&#65292;在此跟大家分享&#12290;</p>  <a name=''more''></a>  <hr />  <h4>OpenVZ虛擬機器應用範本檔 / RStudio Server OpenVZ Virtual Template</h4>  <p><a href="https://lh3.googleusercontent.com/-npt51SOdwMw/WCAbA1sfz9I/AAAAAAAC82o/9fZP4H2z-Pk/s1600-h/2016-11-07_124958%25255B2%25255D.png"><img title="2016-11-07_124958" style="border-left-width: 0px; border-right-width: 0px; background-image: none; border-bottom-width: 0px; padding-top: 0px; padding-left: 0px; display: inline; padding-right: 0px; border-top-width: 0px" border="0" alt="2016-11-07_124958" src="https://lh3.googleusercontent.com/-h3MoFM5KVLM/WCAbEZAW4FI/AAAAAAAC82s/-9FOmHkv-pw/2016-11-07_124958_thumb.png?imgmax=800" width="109" height="152" /></a></p>  <ul>   <li>Google Drive備份&#65306;<a title="https://drive.google.com/file/d/0B5UXWzdIPpm0R3pKZXllb3N0aHM/view?usp=sharing" href="https://drive.google.com/file/d/0B5UXWzdIPpm0R3pKZXllb3N0aHM/view?usp=sharing">https://drive.google.com/file/d/0B5UXWzdIPpm0R3pKZXllb3N0aHM/view?usp=sharing</a> </li> </ul>  <p>檔案大小非常大&#65292;有1.27GB&#12290;</p>  <p>下載完成之後&#65292;請照著<a href="http://blog.pulipuli.info/2013/07/proxmox-ve-3openvz.html">Proxmox VE 3安裝與建立OpenVZ虛擬機器</a>這篇來架設OpenVZ虛擬機器&#12290;架設時沒有特別需要調整的參數&#65292;但是網路一定要設定&#65292;因為RStudio Server主要都是透過網頁來連線的&#12290;</p>  <h4>虛擬機器使用方法 / Virtual Machine Usage</h4>  <p><a href="https://lh3.googleusercontent.com/-rb-9JWt1ZOU/WCAbIlR0ssI/AAAAAAAC82w/RyMqSbYIWiM/s1600-h/image%25255B2%25255D.png"><img title="image" style="border-left-width: 0px; border-right-width: 0px; background-image: none; border-bottom-width: 0px; padding-top: 0px; padding-left: 0px; margin: 0px; display: inline; padding-right: 0px; border-top-width: 0px" border="0" alt="image" src="https://lh3.googleusercontent.com/-ISKk-dTENiA/WCAbM0rEXWI/AAAAAAAC820/AI6DLh15IUc/image_thumb.png?imgmax=800" width="454" height="270" /></a></p>  <p>以下本片以虛擬機器網路設定為<u>192.168.56.152</u>為例來說明如何使用這個RStudio虛擬機器&#12290;</p>  <h5>RStudio Server</h5>  <p>RStudio Server是透過網頁來控制&#65292;網址是IP加上連接埠8787&#65292;舉例如下&#65306;</p>  <ul>   <li><a href="http://192.168.56.152:8787/">http://192.168.56.152:8787/</a>&#160; </li> </ul>  <p>連線順利的話可以看到以下RStudio登入畫面&#65306;</p>  <p><a href="https://lh3.googleusercontent.com/-0y592tuz98E/WCAbRff174I/AAAAAAAC824/FnEyuXbT6Js/s1600-h/2016-11-07_130354%25255B2%25255D.png"><img title="2016-11-07_130354" style="border-left-width: 0px; border-right-width: 0px; background-image: none; border-bottom-width: 0px; padding-top: 0px; padding-left: 0px; display: inline; padding-right: 0px; border-top-width: 0px" border="0" alt="2016-11-07_130354" src="https://lh3.googleusercontent.com/-kddxweM1afI/WCAbTmzePUI/AAAAAAAC828/OLrEcZTA-wM/2016-11-07_130354_thumb.png?imgmax=800" width="454" height="442" /></a></p>  <p>登入帳號與密碼預設為&#65306;</p>  <ul>   <li>Username: <u>rstudio</u> </li>    <li>Password: <u>password</u> </li> </ul>  <p><a href="https://lh3.googleusercontent.com/-qypSxOXeTPE/WCAbWMETOnI/AAAAAAAC83A/mleIJGWL70s/s1600-h/image%25255B5%25255D.png"><img title="image" style="border-left-width: 0px; border-right-width: 0px; background-image: none; border-bottom-width: 0px; padding-top: 0px; padding-left: 0px; margin: 0px; display: inline; padding-right: 0px; border-top-width: 0px" border="0" alt="image" src="https://lh3.googleusercontent.com/-xeC1dBe24o0/WCAbYUw3GpI/AAAAAAAC83E/gPQWWGfjykY/image_thumb%25255B1%25255D.png?imgmax=800" width="454" height="307" /></a></p>  <p>登入之後就會看到上圖的畫面&#12290;這個畫面跟桌面版RStudio很像&#65292;左邊就是R Console&#65292;可以在此執行腳本&#12290;</p>  <p>此版本的RStudio Server已經安裝套件的列表如下&#65306;</p>  <table dir="ltr" cellspacing="0" cellpadding="0" border="1"><colgroup><col /><col /><col /><col /></colgroup><tbody>     <tr>       <td data-sheets-value="{&quot;1&quot;:2,&quot;2&quot;:&quot;ape&quot;}">ape</td>        <td data-sheets-value="{&quot;1&quot;:2,&quot;2&quot;:&quot;flexmix&quot;}">flexmix</td>        <td data-sheets-value="{&quot;1&quot;:2,&quot;2&quot;:&quot;memoise&quot;}">memoise</td>        <td data-sheets-value="{&quot;1&quot;:2,&quot;2&quot;:&quot;rngtools&quot;}">rngtools</td>     </tr>      <tr>       <td data-sheets-value="{&quot;1&quot;:2,&quot;2&quot;:&quot;biclust&quot;}">biclust</td>        <td data-sheets-value="{&quot;1&quot;:2,&quot;2&quot;:&quot;foreach&quot;}">foreach</td>        <td data-sheets-value="{&quot;1&quot;:2,&quot;2&quot;:&quot;mime&quot;}">mime</td>        <td data-sheets-value="{&quot;1&quot;:2,&quot;2&quot;:&quot;robustbase&quot;}">robustbase</td>     </tr>      <tr>       <td data-sheets-value="{&quot;1&quot;:2,&quot;2&quot;:&quot;bitops&quot;}">bitops</td>        <td data-sheets-value="{&quot;1&quot;:2,&quot;2&quot;:&quot;fpc&quot;}">fpc</td>        <td data-sheets-value="{&quot;1&quot;:2,&quot;2&quot;:&quot;modeltools&quot;}">modeltools</td>        <td data-sheets-value="{&quot;1&quot;:2,&quot;2&quot;:&quot;RPostgreSQL&quot;}">RPostgreSQL</td>     </tr>      <tr>       <td data-sheets-value="{&quot;1&quot;:2,&quot;2&quot;:&quot;cluster&quot;}">cluster</td>        <td data-sheets-value="{&quot;1&quot;:2,&quot;2&quot;:&quot;git2r&quot;}">git2r</td>        <td data-sheets-value="{&quot;1&quot;:2,&quot;2&quot;:&quot;munsell&quot;}">munsell</td>        <td data-sheets-value="{&quot;1&quot;:2,&quot;2&quot;:&quot;RSQLite&quot;}">RSQLite</td>     </tr>      <tr>       <td data-sheets-value="{&quot;1&quot;:2,&quot;2&quot;:&quot;colorspace&quot;}">colorspace</td>        <td data-sheets-value="{&quot;1&quot;:2,&quot;2&quot;:&quot;gridBase&quot;}">gridBase</td>        <td data-sheets-value="{&quot;1&quot;:2,&quot;2&quot;:&quot;mvtnorm&quot;}">mvtnorm</td>        <td data-sheets-value="{&quot;1&quot;:2,&quot;2&quot;:&quot;rstudioapi&quot;}">rstudioapi</td>     </tr>      <tr>       <td data-sheets-value="{&quot;1&quot;:2,&quot;2&quot;:&quot;curl&quot;}">curl</td>        <td data-sheets-value="{&quot;1&quot;:2,&quot;2&quot;:&quot;httr&quot;}">httr</td>        <td data-sheets-value="{&quot;1&quot;:2,&quot;2&quot;:&quot;openssl&quot;}">openssl</td>        <td data-sheets-value="{&quot;1&quot;:2,&quot;2&quot;:&quot;Rttf2pt1&quot;}">Rttf2pt1</td>     </tr>      <tr>       <td data-sheets-value="{&quot;1&quot;:2,&quot;2&quot;:&quot;DBI&quot;}">DBI</td>        <td data-sheets-value="{&quot;1&quot;:2,&quot;2&quot;:&quot;igraphdata&quot;}">igraphdata</td>        <td data-sheets-value="{&quot;1&quot;:2,&quot;2&quot;:&quot;pkgmaker&quot;}">pkgmaker</td>        <td data-sheets-value="{&quot;1&quot;:2,&quot;2&quot;:&quot;RWeka&quot;}">RWeka</td>     </tr>      <tr>       <td data-sheets-value="{&quot;1&quot;:2,&quot;2&quot;:&quot;DEoptimR&quot;}">DEoptimR</td>        <td data-sheets-value="{&quot;1&quot;:2,&quot;2&quot;:&quot;irlba&quot;}">irlba</td>        <td data-sheets-value="{&quot;1&quot;:2,&quot;2&quot;:&quot;prabclus&quot;}">prabclus</td>        <td data-sheets-value="{&quot;1&quot;:2,&quot;2&quot;:&quot;RWekajars&quot;}">RWekajars</td>     </tr>      <tr>       <td data-sheets-value="{&quot;1&quot;:2,&quot;2&quot;:&quot;devtools&quot;}">devtools</td>        <td data-sheets-value="{&quot;1&quot;:2,&quot;2&quot;:&quot;isa2&quot;}">isa2</td>        <td data-sheets-value="{&quot;1&quot;:2,&quot;2&quot;:&quot;R6&quot;}">R6</td>        <td data-sheets-value="{&quot;1&quot;:2,&quot;2&quot;:&quot;Rwordseg&quot;}">Rwordseg</td>     </tr>      <tr>       <td data-sheets-value="{&quot;1&quot;:2,&quot;2&quot;:&quot;dichromat&quot;}">dichromat</td>        <td data-sheets-value="{&quot;1&quot;:2,&quot;2&quot;:&quot;iterators&quot;}">iterators</td>        <td data-sheets-value="{&quot;1&quot;:2,&quot;2&quot;:&quot;Rcampdf&quot;}">Rcampdf</td>        <td data-sheets-value="{&quot;1&quot;:2,&quot;2&quot;:&quot;slam&quot;}">slam</td>     </tr>      <tr>       <td data-sheets-value="{&quot;1&quot;:2,&quot;2&quot;:&quot;digest&quot;}">digest</td>        <td data-sheets-value="{&quot;1&quot;:2,&quot;2&quot;:&quot;jiebaRD&quot;}">jiebaRD</td>        <td data-sheets-value="{&quot;1&quot;:2,&quot;2&quot;:&quot;RColorBrewer&quot;}">RColorBrewer</td>        <td data-sheets-value="{&quot;1&quot;:2,&quot;2&quot;:&quot;Snowball&quot;}">Snowball</td>     </tr>      <tr>       <td data-sheets-value="{&quot;1&quot;:2,&quot;2&quot;:&quot;diptest&quot;}">diptest</td>        <td data-sheets-value="{&quot;1&quot;:2,&quot;2&quot;:&quot;jsonlite&quot;}">jsonlite</td>        <td data-sheets-value="{&quot;1&quot;:2,&quot;2&quot;:&quot;Rcpp&quot;}">Rcpp</td>        <td data-sheets-value="{&quot;1&quot;:2,&quot;2&quot;:&quot;SnowballC&quot;}">SnowballC</td>     </tr>      <tr>       <td data-sheets-value="{&quot;1&quot;:2,&quot;2&quot;:&quot;doParallel&quot;}">doParallel</td>        <td data-sheets-value="{&quot;1&quot;:2,&quot;2&quot;:&quot;kernlab&quot;}">kernlab</td>        <td data-sheets-value="{&quot;1&quot;:2,&quot;2&quot;:&quot;RCurl&quot;}">RCurl</td>        <td data-sheets-value="{&quot;1&quot;:2,&quot;2&quot;:&quot;stringi&quot;}">stringi</td>     </tr>      <tr>       <td data-sheets-value="{&quot;1&quot;:2,&quot;2&quot;:&quot;extrafont&quot;}">extrafont</td>        <td data-sheets-value="{&quot;1&quot;:2,&quot;2&quot;:&quot;labeling&quot;}">labeling</td>        <td data-sheets-value="{&quot;1&quot;:2,&quot;2&quot;:&quot;registry&quot;}">registry</td>        <td data-sheets-value="{&quot;1&quot;:2,&quot;2&quot;:&quot;stringr&quot;}">stringr</td>     </tr>      <tr>       <td data-sheets-value="{&quot;1&quot;:2,&quot;2&quot;:&quot;extrafontdb&quot;}">extrafontdb</td>        <td data-sheets-value="{&quot;1&quot;:2,&quot;2&quot;:&quot;magrittr&quot;}">magrittr</td>        <td data-sheets-value="{&quot;1&quot;:2,&quot;2&quot;:&quot;rJava&quot;}">rJava</td>        <td>&#160;</td>     </tr>      <tr>       <td data-sheets-value="{&quot;1&quot;:2,&quot;2&quot;:&quot;flexclust&quot;}">flexclust</td>        <td data-sheets-value="{&quot;1&quot;:2,&quot;2&quot;:&quot;mclust&quot;}">mclust</td>        <td data-sheets-value="{&quot;1&quot;:2,&quot;2&quot;:&quot;RMySQL&quot;}">RMySQL</td>        <td>&#160;</td>     </tr>   </tbody></table>  <p>附帶一提&#65292;<a href="https://stat.ethz.ch/R-manual/R-devel/library/utils/html/installed.packages.html">查詢已經安裝套件的R語法</a>如下&#65306;</p>  <pre><code class="r">installed.packages()</code></pre>

<h5>SSH連線 / SSH Connect</h5>

<p>SSH的連線資訊如下&#65306;</p>

<ul>
  <li>Host: 伺服器的IP&#65292;例如192.168.56.152 </li>

  <li>Port: 22 (預設值) </li>

  <li>Username / Password: 
    <ul>
      <li>root / 你建立OpenVZ時設定的Password </li>

      <li>rstudio / password </li>
    </ul>
  </li>
</ul>

<p><a href="https://lh3.googleusercontent.com/-Gi4RMo_mRLs/WCAba0bbRgI/AAAAAAAC83I/KcdL5CbPNaM/s1600-h/image%25255B8%25255D.png"><img title="image" style="border-top: 0px; border-right: 0px; background-image: none; border-bottom: 0px; padding-top: 0px; padding-left: 0px; margin: 0px; border-left: 0px; display: inline; padding-right: 0px" border="0" alt="image" src="https://lh3.googleusercontent.com/-aB3MqO8tlaI/WCAbdT0Nu2I/AAAAAAAC83M/qxtv3UN3FE8/image_thumb%25255B2%25255D.png?imgmax=800" width="454" height="317" /></a></p>

<p>RStudio Server虛擬機器的SSH連線就跟大部分Linux伺服器一樣&#65292;你可以用<a href="http://blog.pulipuli.info/2012/12/mremotengpiettyxulrunner.html">PieTTY</a>來連線到命令列&#65292;也可以用<a href="http://blog.pulipuli.info/2014/08/mremotengsftp-setup-mremotenss-ext-app.html">FileZilla</a>來管理檔案&#12290;我推薦使用<a href="http://blog.pulipuli.info/search/label/Software%2FmRemoteNG">mRemoteNG</a>來管理這些連線&#65292;這樣管理伺服器的工作會輕鬆許多&#12290;</p>

<h5>帳號管理 / Account</h5>

<p>RStudio Server的帳號跟密碼是跟Linux的作業系統綁在一起&#12290;如果進行帳號或密碼的管理&#65292;需要以SSH用root帳號登入Linux的Bash命令列來操作&#12290;</p>

<p>以rstudio帳號為例&#65292;更換密碼的指令為&#65306;</p>

<pre><code class="bash">passwd rstudio</code></pre>

<p>如果要建立帳號&#65292;除了用useradd指令建立之外&#65292;還需要設定密碼&#12289;建立該帳號的家目錄&#65292;然後轉移家目錄的擁有權給該帳號&#12290;以帳號pudding為例&#65292;建立帳號的指令為&#65306;</p>

<pre><code class="bash">useradd pudding<br />passwd pudding<br />mkdir /home/pudding -p<br />chown pudding:pudding /home/pudding</code></pre>

<p>特別是建立家目錄跟轉移擁有權這個動作&#65292;如果沒有這樣做的話&#65292;登入RStudio Server的時候就會變成&#12300;server note respond&#12301;的空白畫面&#65292;無法正常使用&#12290;</p>

<p>Linux帳號管理的教學細節可以參考<a href="http://linux.vbird.org/linux_basic/0410accountmanager.php#users">鳥哥的Linux私房菜</a>&#12290;</p>

<hr />

<h4>結語 / Conclusion</h4>

<p>不知不覺之間&#65292;R已經變成程式設計裡面的顯學&#12290;以前許多程式設計課程是以C++&#12289;Java為基礎&#65292;最近聽到竟然已經有系所將R作為程式設計課程的授課內容&#65292;真讓我感嘆這個世界變化的迅速&#12290;就我個人用到現在的看法&#65292;跟上述的C++&#12289;Java&#12289;甚至是JavaScript等一般的程式語言相比&#65292;我認為R還是很不一樣&#12290;</p>

<p><a href="https://lh3.googleusercontent.com/-DmzwjUyheCk/WCAbgPNSszI/AAAAAAAC83Q/WEmzaCaD8D0/s1600-h/image%25255B26%25255D%25255B2%25255D.png"><img title="image[26]" style="border-top: 0px; border-right: 0px; background-image: none; border-bottom: 0px; padding-top: 0px; padding-left: 0px; border-left: 0px; display: inline; padding-right: 0px" border="0" alt="image[26]" src="https://lh3.googleusercontent.com/-8ydOZ4zTq5Q/WCAbi-3GWqI/AAAAAAAC83U/wuuV65XjP9w/image%25255B26%25255D_thumb.png?imgmax=800" width="454" height="324" /></a></p>

<p>一般的程式語言給我的感覺是&#12300;創造物品的工具&#12301;&#65292;就像是我們可以用<a href="http://blog.pulipuli.info/2015/07/mit-app-inventor-thoughts-about.html">MIT APP Inventor</a>來建立一個可以解決問題&#12289;改善生活的工具一樣(上圖是我之前做的晚餐抽籤APP)&#12290;</p>

<p>相較之下&#65292;R是專門用來&#12300;分析資料&#12289;處理資料&#12301;&#12290;雖然寫法上有if / else / for迴圈等程序控制&#65292;讓人覺得它就像是一般的程式語言一樣&#12290;但是使用一陣子之後&#65292;我覺得它的分類還是比較接近SQL這種語言&#12290;當然&#65292;像是<a href="http://shiny.rstudio.com/gallery/kmeans-example.html">Shiny</a>這種複雜程度的儀表板操作&#65292;可說已經是達到&#12300;創造應用&#12301;的程度了&#12290;但是我還是不太喜歡Shiny輸出的靜態圖表&#65292;真的要使用的話&#65292;我寧願改用<a href="http://www.chartjs.org/docs/#line-chart-introduction">Chart.js</a>這種動態的圖表工具&#65292;R還是在背後處理資料就好了&#12290;</p>

<p>最後&#65292;如果想要學習R的話&#65292;可以從<a href="https://joe11051105.gitbooks.io/r_basic/content/">Joe所撰寫的R Basic</a>開始認識&#12290;特別是R的各種變數類型&#65292;這跟一般的程式語言有很大的差別&#65292;請務必認真學習&#12290;</p>
</article></div></div>
<div class=''clear''></div>
<div class=''entry-meta clearfix''>
<div class=''up_arrow''></div>
<aside>
<div class=''pull-left author-meta''>
<script src=''/feeds/posts/default/3945870409398834382?alt=json-in-script&amp;callback=av''></script>
<h4 class=''bl_popover'' data-content=''這個布丁是在無聊的世界中找尋樂趣的一種不能吃的食物，喜愛動漫畫、遊戲、程式，以及跟世間脫節的生活步調。'' data-placement=''top'' data-title=''Admin'' data-trigger=''hover''>
<a href=''/p/about.html''>

                布丁布丁吃布丁
                <i aria-hidden=''true'' class=''fa fa-info-circle''></i>
</a>
</h4>
<div class=''creative-commons''>
<a class=''img'' href=''http://creativecommons.org/licenses/by-nc-sa/3.0/tw/'' rel=''license''>
<img alt=''創用 CC 授權條款'' src=''https://i.creativecommons.org/l/by-nc-sa/3.0/tw/80x15.png''/>
</a>
<span class=''title'' href=''http://purl.org/dc/dcmitype/Text'' property=''dct:title'' rel=''dct:type'' xmlns:dct=''http://purl.org/dc/terms/''>
開箱即用的R運作環境&#65281;RStudio Server OpenVZ虛擬機器分享 / Standalone R Environment: RStudio Server in OpenVZ Virtual Machine
</span>
        是由
        <a class=''author'' href='''' property=''cc:attributionName'' rel=''cc:attributionURL'' xmlns:cc=''http://creativecommons.org/ns#''>布丁布丁吃布丁</a>
        製作&#65292;以<a href=''http://creativecommons.org/licenses/by-nc-sa/3.0/tw/'' rel=''license''>創用CC 姓名標示-非商業性-相同方式分享 3.0 台灣 授權條款</a>釋出&#12290;
    </div>
</div>
<div class=''pull-right share-story-container''>
<ul class=''share-story''>
<li><a class=''tips social-button facebook'' data-title=''Facebook'' href=''http://www.addthis.com/bookmark.php?v=300&winname=addthis&pub=pulipuli&s=facebook&source=msd-1.0&url=http://blog.pulipuli.info/2016/11/rrstudio-server-openvz-standalone-r.html&title=開箱即用的R運作環境！RStudio Server OpenVZ虛擬機器分享 / Standalone R Environment: RStudio Server in OpenVZ Virtual Machine&ate=AT-pulipuli/-/per-13/-/4&frommenu=1&ips=1&uud=1&ct=1&pre=http%3A%2F%2Fblog.pulipuli.info%2F&tt=0&captcha_provider=nucaptcha&pro=1'' target=''_blank''>
<i class=''fa fa-facebook''></i>
</a></li>
<li><a class=''tips social-button line'' data-title=''LINE'' href=''http://www.addthis.com/bookmark.php?v=300&winname=addthis&pub=pulipuli&s=lineme&source=msd-1.0&url=http://blog.pulipuli.info/2016/11/rrstudio-server-openvz-standalone-r.html&title=開箱即用的R運作環境！RStudio Server OpenVZ虛擬機器分享 / Standalone R Environment: RStudio Server in OpenVZ Virtual Machine&ate=AT-pulipuli/-/per-13/-/4&frommenu=1&ips=1&uud=1&ct=1&pre=http%3A%2F%2Fblog.pulipuli.info%2F&tt=0&captcha_provider=nucaptcha&pro=1'' target=''_blank''>
<strong>L</strong>
</a></li>
<li><a class=''tips social-button plurk'' data-title=''Plurk'' href=''http://www.addthis.com/bookmark.php?v=300&winname=addthis&pub=pulipuli&s=plurk&source=msd-1.0&url=http://blog.pulipuli.info/2016/11/rrstudio-server-openvz-standalone-r.html&title=開箱即用的R運作環境！RStudio Server OpenVZ虛擬機器分享 / Standalone R Environment: RStudio Server in OpenVZ Virtual Machine&ate=AT-pulipuli/-/per-13/-/4&frommenu=1&ips=1&uud=1&ct=1&pre=http%3A%2F%2Fblog.pulipuli.info%2F&tt=0&captcha_provider=nucaptcha&pro=1'' target=''_blank''>
<strong>P</strong>
</a></li>
<li><a class=''tips social-button google-plus'' data-title=''Google Plus'' href=''http://www.addthis.com/bookmark.php?v=300&winname=addthis&pub=pulipuli&s=google_plusone_share&source=msd-1.0&url=http://blog.pulipuli.info/2016/11/rrstudio-server-openvz-standalone-r.html&title=開箱即用的R運作環境！RStudio Server OpenVZ虛擬機器分享 / Standalone R Environment: RStudio Server in OpenVZ Virtual Machine&ate=AT-pulipuli/-/per-13/-/4&frommenu=1&ips=1&uud=1&ct=1&pre=http%3A%2F%2Fblog.pulipuli.info%2F&tt=0&captcha_provider=nucaptcha&pro=1'' target=''_blank''>
<i class=''fa fa-google-plus''></i>
</a></li>
<li><a class=''tips social-button email'' data-title=''Email'' href=''http://www.addthis.com/bookmark.php?v=300&winname=addthis&pub=pulipuli&s=email&source=msd-1.0&url=http://blog.pulipuli.info/2016/11/rrstudio-server-openvz-standalone-r.html&title=開箱即用的R運作環境！RStudio Server OpenVZ虛擬機器分享 / Standalone R Environment: RStudio Server in OpenVZ Virtual Machine&ate=AT-pulipuli/-/per-13/-/4&frommenu=1&ips=1&uud=1&ct=1&pre=http%3A%2F%2Fblog.pulipuli.info%2F&tt=0&captcha_provider=nucaptcha&pro=1'' target=''_blank''>
<i class=''fa fa-envelope''></i>
</a></li>
<li><a class=''tips social-button addthis'' data-title=''More Share'' href=''http://www.addthis.com/bookmark.php?v=300&winname=addthis&pub=pulipuli&source=msd-1.0&url=http://blog.pulipuli.info/2016/11/rrstudio-server-openvz-standalone-r.html&title=開箱即用的R運作環境！RStudio Server OpenVZ虛擬機器分享 / Standalone R Environment: RStudio Server in OpenVZ Virtual Machine&ate=AT-pulipuli/-/per-13/-/4&frommenu=1&ips=1&uud=1&ct=1&pre=http%3A%2F%2Fblog.pulipuli.info%2F&tt=0&captcha_provider=nucaptcha&pro=1'' target=''_blank''>
<i class=''fa fa-plus''></i>
</a></li>
</ul>
</div>
<div class=''clear''></div>
</aside>
</div>
<div class=''related_posts''>
<script type=''text/javascript''>
          var maxresults=10;
          var splittercolor="";
          var relatedpoststitle="Related Posts";
        </script>
<div id=''related-posts''>
<script src=''/feeds/posts/default/-/Programming/R?alt=json-in-script&callback=pulipuli_related_results_labels_thumbs&max-results=6'' type=''text/javascript''></script>
<script src=''/feeds/posts/default/-/Software/R?alt=json-in-script&callback=pulipuli_related_results_labels_thumbs&max-results=6'' type=''text/javascript''></script>
<script type=''text/javascript''>
                    removeRelatedDuplicates_thumbs();
                    printRelatedLabels_thumbs("http://blog.pulipuli.info/2016/11/rrstudio-server-openvz-standalone-r.html");
                </script>
</div>
<div style=''clear:both''></div>
</div>
</div>
<div class=''comments'' id=''disqus_thread''></div>
<div class=''comments'' id=''comments''>
<a name=''comments''></a>
<h4>
0
意見:
        
</h4>
<div id=''Blog1_comments-block-wrapper''>
<div class=''avatar-comment-indent'' id=''comments-block''>
</div>
</div>
<p class=''comment-footer''>
<div class=''comment-form''>
<a name=''comment-form''></a>
<p>
</p>
<a href=''https://www.blogger.com/comment-iframe.g?blogID=16607461&postID=3945870409398834382'' id=''comment-editor-src''></a>
<a href=''https://www.blogger.com/comment-iframe.g?blogID=16607461&postID=3945870409398834382'' id=''c'' name=''c''></a>
<iframe allowtransparency=''true'' class=''blogger-iframe-colorize blogger-comment-from-post'' frameborder=''0'' height=''210'' id=''comment-editor'' name=''comment-editor'' src='''' width=''100%''></iframe>
<script type="text/javascript" src="https://www.blogger.com/static/v1/jsbin/1718213449-comment_from_post_iframe.js"></script>
<script type=''text/javascript''>
      BLOG_CMT_createIframe(''https://www.blogger.com/rpc_relay.html'', ''04122398539701750448'');
    </script>
</div>
</p>
<div id=''backlinks-container''>
<div id=''Blog1_backlinks-container''>
<script type=''text/javascript''>
                var disqus_shortname = ''pulipuli'';
                var disqus_blogger_current_url = "http://blog.pulipuli.info/2016/11/rrstudio-server-openvz-standalone-r.html";
                if (!disqus_blogger_current_url.length) {
                    disqus_blogger_current_url = "http://blog.pulipuli.info/2016/11/rrstudio-server-openvz-standalone-r.html";
                }
                var disqus_blogger_homepage_url = "http://blog.pulipuli.info/";
                var disqus_blogger_canonical_homepage_url = "http://blog.pulipuli.info/";
            </script>
<style type=''text/css''>
                    #comments {display:none;}
                </style>
<script type=''text/javascript''>
                    $(function() {
                        var bloggerjs = document.createElement(''script'');
                        bloggerjs.type = ''text/javascript'';
                        bloggerjs.async = true;
                        bloggerjs.src = ''//''+disqus_shortname+''.disqus.com/blogger_item.js'';
                        //(document.getElementsByTagName(''head'')[0] || document.getElementsByTagName(''body'')[0]).appendChild(bloggerjs);
                        _disqus_embed();
                    });
                </script>
<style type=''text/css''>
                    .post-comment-link { visibility: hidden; }
                </style>
<script type=''text/javascript''>
                (function() {
                    var bloggerjs = document.createElement(''script'');
                    bloggerjs.type = ''text/javascript'';
                    bloggerjs.async = true;
                    bloggerjs.src = ''//''+disqus_shortname+''.disqus.com/blogger_index.js'';
                    (document.getElementsByTagName(''head'')[0] || document.getElementsByTagName(''body'')[0]).appendChild(bloggerjs);
                })();
                </script>
<a name=''links''></a><h4>
</h4>
<p class=''comment-footer''>
<a id=''comment-form-anchor'' name=''comment-form-anchor''></a>
<a class=''comment-link'' href='''' id=''Blog1_backlinks-create-link'' target=''_blank''>
</a>
</p>
</div>
</div>
</div>
<div class=''blog-pager'' id=''blog-pager''>
<nav>
<ul class=''pager''>
<li class=''previous hidden link''>
<span id=''blog-pager-newer-link''>
<a class=''blog-pager-newer-link'' href=''#''>
<i class=''fa fa-chevron-left''></i>
</a>
</span>
</li>
<li>
<a class=''home-link'' href=''http://blog.pulipuli.info/''>首頁</a>
</li>
<li class=''next link''>
<span id=''blog-pager-older-link''>
<a class=''blog-pager-older-link'' href=''http://blog.pulipuli.info/2016/11/rwordcloud-why-rs-wordcloud-draws.html'' id=''Blog1_blog-pager-older-link'' title=''較舊的文章''>
<i class=''fa fa-chevron-right''></i>
較舊的文章
</a>
</span>
</li>
</ul>
</nav>
</div>
<div class=''clear''></div>
<div class=''post-feeds''>
<div class=''feed-links''>
訂閱&#65306;
<a class=''feed-link'' href=''http://blog.pulipuli.info/feeds/3945870409398834382/comments/default'' target=''_blank'' type=''application/atom+xml''>張貼留言 (Atom)</a>
</div>
</div>
<script type="text/javascript">window.___gcfg = {''lang'': ''zh_TW''};</script>
</div></div>
</div>
<div class=''span3'' id=''side-bar''>
<a accesskey=''R'' href=''#side-bar-anchor'' id=''side-bar-anchor'' title=''accesskey: sidebar section''> ::: </a>
<div class=''sidebar section'' id=''sidebar''>
<div class=''widget HTML about-me''>
<a class=''icon'' href=''/p/about_38.html'' target=''_blank''><i aria-hidden=''true'' class=''fa fa-info-circle''></i></a>
<h2 class=''title''>
<span>About Me</span>
</h2>
<div class=''widget-content''>
<h3>布丁布丁吃布丁</h3>
<a class=''avatar-image-container'' href=''//lh3.googleusercontent.com/-tkBPlsBsFJg/V0M0b-gPKNI/AAAAAAACw9Y/Y-2BGg4z3H4/Image.jpg?imgmax=800''>
<img align=''right'' alt=''pudding(500px)'' border=''0'' height=''54'' src=''//lh3.googleusercontent.com/-tkBPlsBsFJg/V0M0b-gPKNI/AAAAAAACw9Y/Y-2BGg4z3H4/Image.jpg?imgmax=50'' style=''border-right-width: 0px; border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px;margin-left: 0.5rem;'' width=''54''/>
</a>
<div class=''description''>
            這個布丁是在無聊的世界中找尋樂趣的一種不能吃的食物&#65292;喜愛動漫畫&#12289;遊戲&#12289;程式&#65292;以及跟世間脫節的生活步調&#12290;
        </div>
<div class=''about-link''>
<span class=''social-button-wrapper''>
<a class=''social-button facebook'' href=''http://fb.blog.pulipuli.info/'' target=''_blank'' title=''Facebook''>
<i class=''fa fa-facebook''></i>
</a>
</span>
<span class=''social-button-wrapper''>
<a class=''social-button plurk'' href=''http://plurk.pulipuli.info'' target=''_blank'' title=''Plurk''>
<strong>P</strong>
</a>
</span>
<span class=''social-button-wrapper''>
<a class=''social-button rss'' href=''http://rss.blog.pulipuli.info'' target=''_blank'' title=''RSS''>
<i class=''fa fa-rss''></i>
</a>
</span>
<span class=''social-button-wrapper''>
<a class=''social-button email'' href=''mailto:blog@pulipuli.info'' target=''_blank'' title=''Email''>
<i class=''fa fa-envelope''></i>
</a>
</span>
<a class=''read-more about'' href=''/p/sitemap.html#subscribe''>訂閱</a>
<a class=''read-more about'' href=''/p/about_38.html''>自我介紹...</a>
</div>
<div class=''clear''></div>
</div>
</div>
<!-- =================================================== -->
<!-- 隨機文章 -->
<div class=''widget HTML random''>
<a class=''icon'' onclick=''_load_random_posts()''><i aria-hidden=''true'' class=''fa fa-refresh''></i></a>
<h2 class=''title''>
<span>Random Posts</span>
</h2>
<div class=''widget-content''>
<ul id=''random_posts''></ul>
</div>
<!-- <div class="widget-content"> -->
<div class=''clear''></div>
</div>
<!-- =================================================== -->
<div class=''widget HTML guestbook''>
<a class=''icon'' href=''/feeds/113544406852218769/comments/default'' target=''_blank''><i aria-hidden=''true'' class=''fa fa-rss-square''></i></a>
<h2 class=''title''>
<span>Guestbook</span>
</h2>
<div class=''widget-content''>
<!-- <script type="text/javascript" src="https://dl.dropboxusercontent.com/u/717137/blogger/js/puliGuestBook.js"></script> -->
<script src=''//pulipulichen.github.io/blogger/blogger/js/puliGuestBook.js'' type=''text/javascript''></script>
<script type=''text/javascript''>
// 布丁式Blogger留言板
// @param {Object} config 設定
jQuery.puliGuestBook({
    blogID: "16607461",    //blog的ID
    postID: "113544406852218769",    //post的ID
    url: "/2005/12/blogger_113544406852218769.html",    //訂閱張貼意見的網址&#65292;或是文章ID:115667103250300740
    css: "//pulipulichen.github.io/blogger/blogger/css/puliGuestBook.css",    //CSS樣式表
    container: "#puliGuestBook",    //顯示留言的元素
    listNumber: 20,    //顯示留言數量&#12290;超過此數量時&#65292;會顯示&#12300;閱讀全部留言&#12301;的連結&#12290;
    adminName: ''布丁布丁吃布丁'',    //Blog主人的名字
    adminPhoto: ''//1.bp.blogspot.com/_yr4MQB4zDus/SZ4Mb30N0aI/AAAAAAAAFUg/3OGhwhzBUOg/S45/'',    //部落格主人的照片
    anonymous: ''匿名'',    //匿名者的名字
    readMore: ''閱讀全部留言'',    //閱讀全部留言連結的名稱
    write: ''撰寫留言'',    //撰寫留言連結的名稱
    reload: ''重新讀取'',    //重新讀取連結的名稱
    addLink: "/2005/12/blogger_113544406852218769.html" //撰寫留言的按鈕連結
});
</script>
</div>
<div class=''clear''></div>
</div>
<!-- =================================================== -->
<div class=''widget HTML new''>
<a class=''icon'' href=''/feeds/posts/default'' target=''_blank''><i aria-hidden=''true'' class=''fa fa-rss-square''></i></a>
<h2 class=''title''>
<span>Recent Posts</span>
</h2>
<div class=''widget-content''>
<div id=''puliHandlePostNode''></div>
</div>
<div class=''clear''></div>
</div>
<!-- =================================================== -->
<div class=''widget HTML comments''>
<a class=''icon'' href=''/feeds/comments/default'' target=''_blank''><i aria-hidden=''true'' class=''fa fa-rss-square''></i></a>
<h2 class=''title''>
<span>Comments</span>
</h2>
<div class=''widget-content''>
<div id=''puliCommentsNode''></div>
<script type=''text/javascript''>
jQuery.getScript("//pulipulichen.github.io/blogger/blogger/js/puliHandleRecentFunction.js", function () {
    
    var pHP = puliHandlePost();
    pHP.bloggerName = "pulipuli";
    pHP.postshow = 10;
    pHP.titlelen = "";
    pHP.layout = decodeURI("%25title%25%20(%25Y%25-%25M%25-%25D%25%20)");
    pHP.tagname = "";
    pHP.callback = function () {
        var pHC = puliHandleComments();
        pHC.bloggerName = "pulipuli";
        pHC.postshow = 10;
        pHC.titlelen = "20";
        pHC.layout = decodeURI("%3Cstrong%3E%25authorname%25%3C/strong%3E(%25Y%25-%25M%25-%25D%25)%3Cbr%20/%3E%25comment%25");
        pHC.load("puliCommentsNode");
    };
    pHP.load("puliHandlePostNode");
    
});</script>
</div>
<div class=''clear''></div>
</div>
</div>
</div>
<div class=''clear''></div>
</div>
</div>
<div class=''site-footer'' id=''colophon'' role=''contentinfo''>
<div class=''container''>
<a accesskey=''B'' href=''#footer-anchor'' id=''footer-anchor'' title=''accesskey: footer section''> ::: </a>
<div class=''row-fluid'' id=''footer-body''>
<div class=''cleanwidget  nopadding span4 bl_html section'' id=''column1''>
<!-- <b:section class=''cleanwidget nopadding span4 bl_html'' id=''column1'' preferred=''yes''> <b:widget id=''Text1'' locked=''false'' title=''About us'' type=''Text''> <b:includable id=''main''> <b:if cond=''data:title != &quot;&quot;''> <h2 class=''title''><data:title/></h2> </b:if> <div class=''widget-content''> <data:content/> </div> <b:include name=''quickedit''/> </b:includable> </b:widget> </b:section> -->
<div class=''widget Text donation'' id=''donation''>
<h2 class=''title''>Buy Me A Coffee</h2>
<div class=''widget-content''>
<form action=''https://www.paypal.com/cgi-bin/webscr'' method=''post'' onclick=''this.submit()'' style=''cursor:pointer;'' target=''paypal''>
<input name=''cmd'' type=''hidden'' value=''_s-xclick''/>
<input name=''encrypted'' type=''hidden'' value=''-----BEGIN PKCS7-----MIIHXwYJKoZIhvcNAQcEoIIHUDCCB0wCAQExggEwMIIBLAIBADCBlDCBjjELMAkGA1UEBhMCVVMxCzAJBgNVBAgTAkNBMRYwFAYDVQQHEw1Nb3VudGFpbiBWaWV3MRQwEgYDVQQKEwtQYXlQYWwgSW5jLjETMBEGA1UECxQKbGl2ZV9jZXJ0czERMA8GA1UEAxQIbGl2ZV9hcGkxHDAaBgkqhkiG9w0BCQEWDXJlQHBheXBhbC5jb20CAQAwDQYJKoZIhvcNAQEBBQAEgYBUrz0/1hIxEEO4OFdQXZdH0QZZ9mqRwFIkOYemriO7DSLPhH2etiCoLYf6zzTMfX66UoAydIhqUE35I8357WIywvKAaBO6SPhtkxWvprNmU7EUft/MUweL94Smh4Zw0NQ0fc4bRJgN+q3p4kapCqb0wS8Ec0ekpo83wNKZp6AZBTELMAkGBSsOAwIaBQAwgdwGCSqGSIb3DQEHATAUBggqhkiG9w0DBwQIJzrc2jfLw7qAgbhyHOESq1SPpM5wIiZ65HWoLFpvVgU1x5ykpsFGW+Ojp7gEOlJA5HKLjgCZv8wOPls4iHzrOGXv3e5BIYUu/eA3/nOdqo4GVnsfEQ69+umd8szbBXkBjXOauOVeJdW8X0JGIyQjt+iMjovX7ronARKjlThbZBuSJgx9/OSNJRunbsPlbHJr7fN66AHIbL4B4w+BkRnWPu5DhFYfZdjOdSBLxfcit6RpwOOAQ+1nTnqhGbr8aEROSpMRoIIDhzCCA4MwggLsoAMCAQICAQAwDQYJKoZIhvcNAQEFBQAwgY4xCzAJBgNVBAYTAlVTMQswCQYDVQQIEwJDQTEWMBQGA1UEBxMNTW91bnRhaW4gVmlldzEUMBIGA1UEChMLUGF5UGFsIEluYy4xEzARBgNVBAsUCmxpdmVfY2VydHMxETAPBgNVBAMUCGxpdmVfYXBpMRwwGgYJKoZIhvcNAQkBFg1yZUBwYXlwYWwuY29tMB4XDTA0MDIxMzEwMTMxNVoXDTM1MDIxMzEwMTMxNVowgY4xCzAJBgNVBAYTAlVTMQswCQYDVQQIEwJDQTEWMBQGA1UEBxMNTW91bnRhaW4gVmlldzEUMBIGA1UEChMLUGF5UGFsIEluYy4xEzARBgNVBAsUCmxpdmVfY2VydHMxETAPBgNVBAMUCGxpdmVfYXBpMRwwGgYJKoZIhvcNAQkBFg1yZUBwYXlwYWwuY29tMIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQDBR07d/ETMS1ycjtkpkvjXZe9k+6CieLuLsPumsJ7QC1odNz3sJiCbs2wC0nLE0uLGaEtXynIgRqIddYCHx88pb5HTXv4SZeuv0Rqq4+axW9PLAAATU8w04qqjaSXgbGLP3NmohqM6bV9kZZwZLR/klDaQGo1u9uDb9lr4Yn+rBQIDAQABo4HuMIHrMB0GA1UdDgQWBBSWn3y7xm8XvVk/UtcKG+wQ1mSUazCBuwYDVR0jBIGzMIGwgBSWn3y7xm8XvVk/UtcKG+wQ1mSUa6GBlKSBkTCBjjELMAkGA1UEBhMCVVMxCzAJBgNVBAgTAkNBMRYwFAYDVQQHEw1Nb3VudGFpbiBWaWV3MRQwEgYDVQQKEwtQYXlQYWwgSW5jLjETMBEGA1UECxQKbGl2ZV9jZXJ0czERMA8GA1UEAxQIbGl2ZV9hcGkxHDAaBgkqhkiG9w0BCQEWDXJlQHBheXBhbC5jb22CAQAwDAYDVR0TBAUwAwEB/zANBgkqhkiG9w0BAQUFAAOBgQCBXzpWmoBa5e9fo6ujionW1hUhPkOBakTr3YCDjbYfvJEiv/2P+IobhOGJr85+XHhN0v4gUkEDI8r2/rNk1m0GA8HKddvTjyGw/XqXa+LSTlDYkqI8OwR8GEYj4efEtcRpRYBxV8KxAW93YDWzFGvruKnnLbDAF6VR5w/cCMn5hzGCAZowggGWAgEBMIGUMIGOMQswCQYDVQQGEwJVUzELMAkGA1UECBMCQ0ExFjAUBgNVBAcTDU1vdW50YWluIFZpZXcxFDASBgNVBAoTC1BheVBhbCBJbmMuMRMwEQYDVQQLFApsaXZlX2NlcnRzMREwDwYDVQQDFAhsaXZlX2FwaTEcMBoGCSqGSIb3DQEJARYNcmVAcGF5cGFsLmNvbQIBADAJBgUrDgMCGgUAoF0wGAYJKoZIhvcNAQkDMQsGCSqGSIb3DQEHATAcBgkqhkiG9w0BCQUxDxcNMTYwMjI5MDcwMDUyWjAjBgkqhkiG9w0BCQQxFgQUN7BuShMI5TMd75rse5P5FWUUuZAwDQYJKoZIhvcNAQEBBQAEgYCcP7uxVRe1E4W+6Am2a419jCX1yQTkB9BNNx2qlBybTWPlhQ30/h7nHswfdHFzwJ/2B349iZhFKb6M3XAubXsFPQdBQTJhKlIb48iUbOsMFBIeqpsAlvMsPHvqzraRmxg/EX4bnrPmd+40eaXGoGzX/PMpuwTEl2m+cBurBK+Eew==-----END PKCS7-----''/>
<div style=''width: 100%;    margin: 0 auto;font-size: 12pt;''>
<!-- <input type="image" src="https://lh3.googleusercontent.com/-kmGazSfZHxQ/VwFfE864o2I/AAAAAAACuUU/428W8WOmSAg/s0/coffee.png" border="0" name="submit" alt="PayPal &#65293; 更安全&#12289;更簡單的線上付款方式&#65281;" style="float:left" /> -->
<i aria-hidden=''true'' class=''fa fa-paypal'' style=''float: left;font-size: 40px;display:block; margin-top: 15px; margin-right: 10px;''></i>
<div style=''padding-top: 5px;    margin-left: 50px;''>
                    如果有幫到您的話&#65292;請布丁喝杯咖啡吧&#65281;
  <div style=''''><input class=''btn btn-default btn-small'' type=''submit'' value=''OK''/></div>
</div>
<img alt=''paypal pixel'' border=''0'' height=''1'' src=''https://www.paypalobjects.com/zh_TW/i/scr/pixel.gif'' width=''1''/>
</div>
</form>
</div>
<div class=''clear''></div>
</div>
<div class=''section'' id=''column1-stats''><div class=''widget Stats'' data-version=''1'' id=''Stats1''>
<h2>Hit Count</h2>
<div class=''widget-content''>
<div id=''Stats1_content'' style=''display: none;''>
<img alt=''Sparkline'' height=''30'' id=''Stats1_sparkline'' width=''75''/>
<span class=''counter-wrapper text-counter-wrapper'' id=''Stats1_totalCount''>
</span>
<div class=''clear''></div>
<span class=''widget-item-control''>
<span class=''item-control blog-admin''>
<a class=''quickedit'' href=''//www.blogger.com/rearrange?blogID=16607461&widgetType=Stats&widgetId=Stats1&action=editWidget&sectionId=column1-stats'' onclick=''return _WidgetManager._PopupConfig(document.getElementById("Stats1"));'' target=''configStats1'' title=''編輯''>
<img alt='''' height=''18'' src=''https://resources.blogblog.com/img/icon18_wrench_allbkg.png'' width=''18''/>
</a>
</span>
</span>
<div class=''clear''></div>
</div>
</div>
</div></div>
</div>
<div class=''cleanwidget  nopadding span8 bl_html section'' id=''column2''>
<div class=''Label section'' id=''column2-section''><div class=''widget Label'' data-version=''1'' id=''Label2''>
<h2>Labels</h2>
<div class=''widget-content cloud-label-widget-content''>
<span class=''label-size label-size-5''>
<a dir=''ltr'' href=''http://blog.pulipuli.info/search/label/%E6%97%A5%E8%A8%98''>日記</a>
<span class=''label-count'' dir=''ltr''>(231)</span>
</span>
<span class=''label-size label-size-5''>
<a dir=''ltr'' href=''http://blog.pulipuli.info/search/label/%E8%BC%94%E5%A4%A7%E5%9C%96%E8%B3%87''>輔大圖資</a>
<span class=''label-count'' dir=''ltr''>(166)</span>
</span>
<span class=''label-size label-size-5''>
<a dir=''ltr'' href=''http://blog.pulipuli.info/search/label/%E9%9B%BB%E8%85%A6%E8%BB%9F%E9%AB%94''>電腦軟體</a>
<span class=''label-count'' dir=''ltr''>(127)</span>
</span>
<span class=''label-size label-size-4''>
<a dir=''ltr'' href=''http://blog.pulipuli.info/search/label/%E6%94%BF%E5%A4%A7%E5%9C%96%E6%AA%94''>政大圖檔</a>
<span class=''label-count'' dir=''ltr''>(112)</span>
</span>
<span class=''label-size label-size-4''>
<a dir=''ltr'' href=''http://blog.pulipuli.info/search/label/%E6%9C%9F%E5%88%8A%E8%AB%96%E6%96%87%E9%96%B1%E8%AE%80''>期刊論文閱讀</a>
<span class=''label-count'' dir=''ltr''>(92)</span>
</span>
<span class=''label-size label-size-4''>
<a dir=''ltr'' href=''http://blog.pulipuli.info/search/label/%E4%BD%9C%E5%93%81''>作品</a>
<span class=''label-count'' dir=''ltr''>(75)</span>
</span>
<span class=''label-size label-size-4''>
<a dir=''ltr'' href=''http://blog.pulipuli.info/search/label/Blogger''>Blogger</a>
<span class=''label-count'' dir=''ltr''>(69)</span>
</span>
<span class=''label-size label-size-4''>
<a dir=''ltr'' href=''http://blog.pulipuli.info/search/label/%E7%B6%B2%E8%B7%AF%E7%AE%A1%E7%90%86''>網路管理</a>
<span class=''label-count'' dir=''ltr''>(69)</span>
</span>
<span class=''label-size label-size-4''>
<a dir=''ltr'' href=''http://blog.pulipuli.info/search/label/%E8%A8%98%E4%BA%8B''>記事</a>
<span class=''label-count'' dir=''ltr''>(57)</span>
</span>
<span class=''label-size label-size-4''>
<a dir=''ltr'' href=''http://blog.pulipuli.info/search/label/DSpace''>DSpace</a>
<span class=''label-count'' dir=''ltr''>(55)</span>
</span>
<span class=''label-size label-size-4''>
<a dir=''ltr'' href=''http://blog.pulipuli.info/search/label/%E7%A8%8B%E5%BC%8F%E5%AF%AB%E4%BD%9C''>程式寫作</a>
<span class=''label-count'' dir=''ltr''>(48)</span>
</span>
<span class=''label-size label-size-4''>
<a dir=''ltr'' href=''http://blog.pulipuli.info/search/label/%E7%A2%A9%E5%A3%AB%E7%95%A2%E6%A5%AD%E8%AB%96%E6%96%87''>碩士畢業論文</a>
<span class=''label-count'' dir=''ltr''>(46)</span>
</span>
<span class=''label-size label-size-4''>
<a dir=''ltr'' href=''http://blog.pulipuli.info/search/label/Proxmox''>Proxmox</a>
<span class=''label-count'' dir=''ltr''>(39)</span>
</span>
<span class=''label-size label-size-4''>
<a dir=''ltr'' href=''http://blog.pulipuli.info/search/label/JavaScript''>JavaScript</a>
<span class=''label-count'' dir=''ltr''>(32)</span>
</span>
<span class=''label-size label-size-4''>
<a dir=''ltr'' href=''http://blog.pulipuli.info/search/label/OS%2FProxmox%20VE''>OS/Proxmox VE</a>
<span class=''label-count'' dir=''ltr''>(32)</span>
</span>
<span class=''label-size label-size-3''>
<a dir=''ltr'' href=''http://blog.pulipuli.info/search/label/%E8%99%9B%E6%93%AC%E6%A9%9F%E5%99%A8''>虛擬機器</a>
<span class=''label-count'' dir=''ltr''>(28)</span>
</span>
<span class=''label-size label-size-3''>
<a dir=''ltr'' href=''http://blog.pulipuli.info/search/label/DLLL-CIAS''>DLLL-CIAS</a>
<span class=''label-count'' dir=''ltr''>(25)</span>
</span>
<span class=''label-size label-size-3''>
<a dir=''ltr'' href=''http://blog.pulipuli.info/search/label/%E7%A0%94%E7%A9%B6%E6%96%B9%E6%B3%95''>研究方法</a>
<span class=''label-count'' dir=''ltr''>(25)</span>
</span>
<span class=''label-size label-size-3''>
<a dir=''ltr'' href=''http://blog.pulipuli.info/search/label/Android''>Android</a>
<span class=''label-count'' dir=''ltr''>(24)</span>
</span>
<span class=''label-size label-size-3''>
<a dir=''ltr'' href=''http://blog.pulipuli.info/search/label/%E7%B6%B2%E7%AB%99%E6%9C%8D%E5%8B%99''>網站服務</a>
<span class=''label-count'' dir=''ltr''>(24)</span>
</span>
<span class=''label-size label-size-3''>
<a dir=''ltr'' href=''http://blog.pulipuli.info/search/label/%E9%9B%B2%E7%AB%AF%E7%A7%91%E6%8A%80%E8%88%87%E5%9C%96%E6%9B%B8%E9%A4%A8%E8%A1%8C%E5%8B%95%E6%9C%8D%E5%8B%99%E7%A0%94%E7%BF%92%E7%8F%AD%282014%29''>雲端科技與圖書館行動服務研習班(2014)</a>
<span class=''label-count'' dir=''ltr''>(24)</span>
</span>
<span class=''label-size label-size-3''>
<a dir=''ltr'' href=''http://blog.pulipuli.info/search/label/%E6%96%B0%E7%8E%A9%E5%85%B7''>新玩具</a>
<span class=''label-count'' dir=''ltr''>(23)</span>
</span>
<span class=''label-size label-size-3''>
<a dir=''ltr'' href=''http://blog.pulipuli.info/search/label/%E4%BD%9C%E6%A5%AD%E5%A0%B1%E5%91%8A''>作業報告</a>
<span class=''label-count'' dir=''ltr''>(22)</span>
</span>
<span class=''label-size label-size-3''>
<a dir=''ltr'' href=''http://blog.pulipuli.info/search/label/%E7%A0%94%E7%A9%B6%E6%89%80%E6%8E%A8%E7%94%84''>研究所推甄</a>
<span class=''label-count'' dir=''ltr''>(19)</span>
</span>
<span class=''label-size label-size-3''>
<a dir=''ltr'' href=''http://blog.pulipuli.info/search/label/Linux''>Linux</a>
<span class=''label-count'' dir=''ltr''>(18)</span>
</span>
<span class=''label-size label-size-3''>
<a dir=''ltr'' href=''http://blog.pulipuli.info/search/label/%E6%BC%94%E8%AC%9B%E5%BF%83%E5%BE%97''>演講心得</a>
<span class=''label-count'' dir=''ltr''>(18)</span>
</span>
<span class=''label-size label-size-3''>
<a dir=''ltr'' href=''http://blog.pulipuli.info/search/label/%E8%B3%87%E8%A8%8A%E8%A8%88%E9%87%8F%E5%AD%B8''>資訊計量學</a>
<span class=''label-count'' dir=''ltr''>(17)</span>
</span>
<span class=''label-size label-size-3''>
<a dir=''ltr'' href=''http://blog.pulipuli.info/search/label/%E7%84%A1%E9%A1%8C''>無題</a>
<span class=''label-count'' dir=''ltr''>(16)</span>
</span>
<span class=''label-size label-size-3''>
<a dir=''ltr'' href=''http://blog.pulipuli.info/search/label/%E8%AA%B2%E7%A8%8B%2F%E5%9C%96%E6%9B%B8%E8%B3%87%E8%A8%8A%E5%AD%B8%E7%A0%94%E7%A9%B6%E8%B6%A8%E5%8B%A2''>課程/圖書資訊學研究趨勢</a>
<span class=''label-count'' dir=''ltr''>(16)</span>
</span>
<span class=''label-size label-size-3''>
<a dir=''ltr'' href=''http://blog.pulipuli.info/search/label/Programming%2FJavaScript''>Programming/JavaScript</a>
<span class=''label-count'' dir=''ltr''>(14)</span>
</span>
<span class=''label-size label-size-3''>
<a dir=''ltr'' href=''http://blog.pulipuli.info/search/label/Zotero''>Zotero</a>
<span class=''label-count'' dir=''ltr''>(14)</span>
</span>
<span class=''label-size label-size-3''>
<a dir=''ltr'' href=''http://blog.pulipuli.info/search/label/%E5%9C%96%E8%B3%87%E5%AD%B8%E8%A1%93%E7%95%8C''>圖資學術界</a>
<span class=''label-count'' dir=''ltr''>(13)</span>
</span>
<span class=''label-size label-size-3''>
<a dir=''ltr'' href=''http://blog.pulipuli.info/search/label/PHP''>PHP</a>
<span class=''label-count'' dir=''ltr''>(12)</span>
</span>
<span class=''label-size label-size-3''>
<a dir=''ltr'' href=''http://blog.pulipuli.info/search/label/%E8%AA%B2%E7%A8%8B%2F%E5%9C%8B%E9%9A%9B%E6%AA%94%E6%A1%88%E5%AD%B8''>課程/國際檔案學</a>
<span class=''label-count'' dir=''ltr''>(12)</span>
</span>
<span class=''label-size label-size-3''>
<a dir=''ltr'' href=''http://blog.pulipuli.info/search/label/VirtualBox''>VirtualBox</a>
<span class=''label-count'' dir=''ltr''>(11)</span>
</span>
<span class=''label-size label-size-3''>
<a dir=''ltr'' href=''http://blog.pulipuli.info/search/label/%E6%A5%B5%E7%9F%AD''>極短</a>
<span class=''label-count'' dir=''ltr''>(11)</span>
</span>
<span class=''label-size label-size-3''>
<a dir=''ltr'' href=''http://blog.pulipuli.info/search/label/GitHub''>GitHub</a>
<span class=''label-count'' dir=''ltr''>(10)</span>
</span>
<span class=''label-size label-size-3''>
<a dir=''ltr'' href=''http://blog.pulipuli.info/search/label/Zentyal''>Zentyal</a>
<span class=''label-count'' dir=''ltr''>(10)</span>
</span>
<span class=''label-size label-size-3''>
<a dir=''ltr'' href=''http://blog.pulipuli.info/search/label/%E8%AA%B2%E7%A8%8B%2F%E6%AA%94%E6%A1%88%E6%87%89%E7%94%A8%E7%A0%94%E7%A9%B6''>課程/檔案應用研究</a>
<span class=''label-count'' dir=''ltr''>(9)</span>
</span>
<span class=''label-size label-size-3''>
<a dir=''ltr'' href=''http://blog.pulipuli.info/search/label/%E8%BC%94%E6%BC%AB''>輔漫</a>
<span class=''label-count'' dir=''ltr''>(9)</span>
</span>
<span class=''label-size label-size-3''>
<a dir=''ltr'' href=''http://blog.pulipuli.info/search/label/GLPI''>GLPI</a>
<span class=''label-count'' dir=''ltr''>(8)</span>
</span>
<span class=''label-size label-size-3''>
<a dir=''ltr'' href=''http://blog.pulipuli.info/search/label/Koha''>Koha</a>
<span class=''label-count'' dir=''ltr''>(8)</span>
</span>
<span class=''label-size label-size-3''>
<a dir=''ltr'' href=''http://blog.pulipuli.info/search/label/Server%2FownCloud''>Server/ownCloud</a>
<span class=''label-count'' dir=''ltr''>(8)</span>
</span>
<span class=''label-size label-size-3''>
<a dir=''ltr'' href=''http://blog.pulipuli.info/search/label/Windows%2F%E9%9B%BB%E8%85%A6%E8%BB%9F%E9%AB%94''>Windows/電腦軟體</a>
<span class=''label-count'' dir=''ltr''>(8)</span>
</span>
<span class=''label-size label-size-3''>
<a dir=''ltr'' href=''http://blog.pulipuli.info/search/label/%E6%94%BF%E5%A4%A7%E5%B9%B3%E5%83%B9%E7%BE%8E%E9%A3%9F''>政大平價美食</a>
<span class=''label-count'' dir=''ltr''>(8)</span>
</span>
<span class=''label-size label-size-3''>
<a dir=''ltr'' href=''http://blog.pulipuli.info/search/label/%E6%95%99%E5%AD%B8%E8%AA%B2%E7%A8%8B''>教學課程</a>
<span class=''label-count'' dir=''ltr''>(8)</span>
</span>
<span class=''label-size label-size-3''>
<a dir=''ltr'' href=''http://blog.pulipuli.info/search/label/%E6%95%B8%E4%BD%8D%E5%9C%96%E6%9B%B8%E9%A4%A8''>數位圖書館</a>
<span class=''label-count'' dir=''ltr''>(8)</span>
</span>
<span class=''label-size label-size-2''>
<a dir=''ltr'' href=''http://blog.pulipuli.info/search/label/KALS''>KALS</a>
<span class=''label-count'' dir=''ltr''>(7)</span>
</span>
<span class=''label-size label-size-2''>
<a dir=''ltr'' href=''http://blog.pulipuli.info/search/label/Plurk''>Plurk</a>
<span class=''label-count'' dir=''ltr''>(7)</span>
</span>
<span class=''label-size label-size-2''>
<a dir=''ltr'' href=''http://blog.pulipuli.info/search/label/CSS''>CSS</a>
<span class=''label-count'' dir=''ltr''>(6)</span>
</span>
<span class=''label-size label-size-2''>
<a dir=''ltr'' href=''http://blog.pulipuli.info/search/label/OS%2FFreeNAS''>OS/FreeNAS</a>
<span class=''label-count'' dir=''ltr''>(6)</span>
</span>
<span class=''label-size label-size-2''>
<a dir=''ltr'' href=''http://blog.pulipuli.info/search/label/OS%2FZentyal''>OS/Zentyal</a>
<span class=''label-count'' dir=''ltr''>(6)</span>
</span>
<span class=''label-size label-size-2''>
<a dir=''ltr'' href=''http://blog.pulipuli.info/search/label/Programming%2FAPP''>Programming/APP</a>
<span class=''label-count'' dir=''ltr''>(6)</span>
</span>
<span class=''label-size label-size-2''>
<a dir=''ltr'' href=''http://blog.pulipuli.info/search/label/%E5%A0%B1%E5%91%8A%2F%E6%95%99%E5%AD%B8%E8%AA%B2%E7%A8%8B''>報告/教學課程</a>
<span class=''label-count'' dir=''ltr''>(6)</span>
</span>
<span class=''label-size label-size-2''>
<a dir=''ltr'' href=''http://blog.pulipuli.info/search/label/%E7%99%BC%E8%A1%A8''>發表</a>
<span class=''label-count'' dir=''ltr''>(6)</span>
</span>
<span class=''label-size label-size-2''>
<a dir=''ltr'' href=''http://blog.pulipuli.info/search/label/2009%E8%A9%90%E6%AC%BA%E6%A1%88%E4%BB%B6''>2009詐欺案件</a>
<span class=''label-count'' dir=''ltr''>(5)</span>
</span>
<span class=''label-size label-size-2''>
<a dir=''ltr'' href=''http://blog.pulipuli.info/search/label/Programing%2FPHP''>Programing/PHP</a>
<span class=''label-count'' dir=''ltr''>(5)</span>
</span>
<span class=''label-size label-size-2''>
<a dir=''ltr'' href=''http://blog.pulipuli.info/search/label/Software%2FLibreOffice''>Software/LibreOffice</a>
<span class=''label-count'' dir=''ltr''>(5)</span>
</span>
<span class=''label-size label-size-2''>
<a dir=''ltr'' href=''http://blog.pulipuli.info/search/label/Software%2FR''>Software/R</a>
<span class=''label-count'' dir=''ltr''>(5)</span>
</span>
<span class=''label-size label-size-2''>
<a dir=''ltr'' href=''http://blog.pulipuli.info/search/label/Software%2FWindows''>Software/Windows</a>
<span class=''label-count'' dir=''ltr''>(5)</span>
</span>
<span class=''label-size label-size-2''>
<a dir=''ltr'' href=''http://blog.pulipuli.info/search/label/Virtual%20Machine%2FOpenVZ''>Virtual Machine/OpenVZ</a>
<span class=''label-count'' dir=''ltr''>(5)</span>
</span>
<span class=''label-size label-size-2''>
<a dir=''ltr'' href=''http://blog.pulipuli.info/search/label/%E7%A8%8B%E5%BC%8F%E8%AA%9E%E8%A8%80%2FJavaScript''>程式語言/JavaScript</a>
<span class=''label-count'' dir=''ltr''>(5)</span>
</span>
<span class=''label-size label-size-2''>
<a dir=''ltr'' href=''http://blog.pulipuli.info/search/label/%E8%A9%95%E8%AB%96''>評論</a>
<span class=''label-count'' dir=''ltr''>(5)</span>
</span>
<span class=''label-size label-size-2''>
<a dir=''ltr'' href=''http://blog.pulipuli.info/search/label/Library%2FORCID''>Library/ORCID</a>
<span class=''label-count'' dir=''ltr''>(4)</span>
</span>
<span class=''label-size label-size-2''>
<a dir=''ltr'' href=''http://blog.pulipuli.info/search/label/NetBeans''>NetBeans</a>
<span class=''label-count'' dir=''ltr''>(4)</span>
</span>
<span class=''label-size label-size-2''>
<a dir=''ltr'' href=''http://blog.pulipuli.info/search/label/Programming%2FPhoneGap''>Programming/PhoneGap</a>
<span class=''label-count'' dir=''ltr''>(4)</span>
</span>
<span class=''label-size label-size-2''>
<a dir=''ltr'' href=''http://blog.pulipuli.info/search/label/Selenium''>Selenium</a>
<span class=''label-count'' dir=''ltr''>(4)</span>
</span>
<span class=''label-size label-size-2''>
<a dir=''ltr'' href=''http://blog.pulipuli.info/search/label/Server%2FOCS''>Server/OCS</a>
<span class=''label-count'' dir=''ltr''>(4)</span>
</span>
<span class=''label-size label-size-2''>
<a dir=''ltr'' href=''http://blog.pulipuli.info/search/label/Software%2FZotero''>Software/Zotero</a>
<span class=''label-count'' dir=''ltr''>(4)</span>
</span>
<span class=''label-size label-size-2''>
<a dir=''ltr'' href=''http://blog.pulipuli.info/search/label/%E5%8D%9A%E5%A3%AB%E7%8F%AD%E8%80%83%E8%A9%A6''>博士班考試</a>
<span class=''label-count'' dir=''ltr''>(4)</span>
</span>
<span class=''label-size label-size-2''>
<a dir=''ltr'' href=''http://blog.pulipuli.info/search/label/%E5%95%8F%E7%AD%94%E8%A8%AA%E8%AB%87''>問答訪談</a>
<span class=''label-count'' dir=''ltr''>(4)</span>
</span>
<span class=''label-size label-size-2''>
<a dir=''ltr'' href=''http://blog.pulipuli.info/search/label/%E8%AA%B2%E7%A8%8B%2F%E8%B3%87%E8%A8%8A%E8%A1%8C%E7%82%BA%E8%88%87%E8%B3%87%E8%A8%8A%E6%9C%8D%E5%8B%99''>課程/資訊行為與資訊服務</a>
<span class=''label-count'' dir=''ltr''>(4)</span>
</span>
<span class=''label-size label-size-2''>
<a dir=''ltr'' href=''http://blog.pulipuli.info/search/label/%E8%AE%80%E8%80%85%E6%9C%8D%E5%8B%99%E7%A0%94%E8%A8%8E''>讀者服務研討</a>
<span class=''label-count'' dir=''ltr''>(4)</span>
</span>
<span class=''label-size label-size-2''>
<a dir=''ltr'' href=''http://blog.pulipuli.info/search/label/CKEditor''>CKEditor</a>
<span class=''label-count'' dir=''ltr''>(3)</span>
</span>
<span class=''label-size label-size-2''>
<a dir=''ltr'' href=''http://blog.pulipuli.info/search/label/Drupal''>Drupal</a>
<span class=''label-count'' dir=''ltr''>(3)</span>
</span>
<span class=''label-size label-size-2''>
<a dir=''ltr'' href=''http://blog.pulipuli.info/search/label/OCS''>OCS</a>
<span class=''label-count'' dir=''ltr''>(3)</span>
</span>
<span class=''label-size label-size-2''>
<a dir=''ltr'' href=''http://blog.pulipuli.info/search/label/OS%2FLinux''>OS/Linux</a>
<span class=''label-count'' dir=''ltr''>(3)</span>
</span>
<span class=''label-size label-size-2''>
<a dir=''ltr'' href=''http://blog.pulipuli.info/search/label/Programming%2FR''>Programming/R</a>
<span class=''label-count'' dir=''ltr''>(3)</span>
</span>
<span class=''label-size label-size-2''>
<a dir=''ltr'' href=''http://blog.pulipuli.info/search/label/Software''>Software</a>
<span class=''label-count'' dir=''ltr''>(3)</span>
</span>
<span class=''label-size label-size-2''>
<a dir=''ltr'' href=''http://blog.pulipuli.info/search/label/Software%2FPostreSQL''>Software/PostreSQL</a>
<span class=''label-count'' dir=''ltr''>(3)</span>
</span>
<span class=''label-size label-size-2''>
<a dir=''ltr'' href=''http://blog.pulipuli.info/search/label/Statistics''>Statistics</a>
<span class=''label-count'' dir=''ltr''>(3)</span>
</span>
<span class=''label-size label-size-2''>
<a dir=''ltr'' href=''http://blog.pulipuli.info/search/label/Web%20Service''>Web Service</a>
<span class=''label-count'' dir=''ltr''>(3)</span>
</span>
<span class=''label-size label-size-2''>
<a dir=''ltr'' href=''http://blog.pulipuli.info/search/label/%E6%B4%BB%E5%8B%95%E7%B1%8C%E8%BE%A6''>活動籌辦</a>
<span class=''label-count'' dir=''ltr''>(3)</span>
</span>
<span class=''label-size label-size-2''>
<a dir=''ltr'' href=''http://blog.pulipuli.info/search/label/%E6%BC%94%E8%AC%9B''>演講</a>
<span class=''label-count'' dir=''ltr''>(3)</span>
</span>
<span class=''label-size label-size-2''>
<a dir=''ltr'' href=''http://blog.pulipuli.info/search/label/%E7%94%9F%E6%B4%BB%2F%E6%97%A5%E8%A8%98''>生活/日記</a>
<span class=''label-count'' dir=''ltr''>(3)</span>
</span>
<span class=''label-size label-size-2''>
<a dir=''ltr'' href=''http://blog.pulipuli.info/search/label/%E8%AA%B2%E7%A8%8B%2F%E6%AA%94%E6%A1%88%E5%AD%B8''>課程/檔案學</a>
<span class=''label-count'' dir=''ltr''>(3)</span>
</span>
<span class=''label-size label-size-2''>
<a dir=''ltr'' href=''http://blog.pulipuli.info/search/label/%E9%96%B1%E8%AE%80%E5%AD%B8%E7%BF%92''>閱讀學習</a>
<span class=''label-count'' dir=''ltr''>(3)</span>
</span>
<span class=''label-size label-size-2''>
<a dir=''ltr'' href=''http://blog.pulipuli.info/search/label/3C''>3C</a>
<span class=''label-count'' dir=''ltr''>(2)</span>
</span>
<span class=''label-size label-size-2''>
<a dir=''ltr'' href=''http://blog.pulipuli.info/search/label/EMAIL-KM''>EMAIL-KM</a>
<span class=''label-count'' dir=''ltr''>(2)</span>
</span>
<span class=''label-size label-size-2''>
<a dir=''ltr'' href=''http://blog.pulipuli.info/search/label/IDE''>IDE</a>
<span class=''label-count'' dir=''ltr''>(2)</span>
</span>
<span class=''label-size label-size-2''>
<a dir=''ltr'' href=''http://blog.pulipuli.info/search/label/IPFire''>IPFire</a>
<span class=''label-count'' dir=''ltr''>(2)</span>
</span>
<span class=''label-size label-size-2''>
<a dir=''ltr'' href=''http://blog.pulipuli.info/search/label/OSSIM''>OSSIM</a>
<span class=''label-count'' dir=''ltr''>(2)</span>
</span>
<span class=''label-size label-size-2''>
<a dir=''ltr'' href=''http://blog.pulipuli.info/search/label/Programming%2FJava''>Programming/Java</a>
<span class=''label-count'' dir=''ltr''>(2)</span>
</span>
<span class=''label-size label-size-2''>
<a dir=''ltr'' href=''http://blog.pulipuli.info/search/label/Programming%2FPHP''>Programming/PHP</a>
<span class=''label-count'' dir=''ltr''>(2)</span>
</span>
<span class=''label-size label-size-2''>
<a dir=''ltr'' href=''http://blog.pulipuli.info/search/label/Server%2FGitLab''>Server/GitLab</a>
<span class=''label-count'' dir=''ltr''>(2)</span>
</span>
<span class=''label-size label-size-2''>
<a dir=''ltr'' href=''http://blog.pulipuli.info/search/label/Software%2FOpen%20Live%20Writer''>Software/Open Live Writer</a>
<span class=''label-count'' dir=''ltr''>(2)</span>
</span>
<span class=''label-size label-size-2''>
<a dir=''ltr'' href=''http://blog.pulipuli.info/search/label/Software%2FmRemoteNG''>Software/mRemoteNG</a>
<span class=''label-count'' dir=''ltr''>(2)</span>
</span>
<span class=''label-size label-size-2''>
<a dir=''ltr'' href=''http://blog.pulipuli.info/search/label/Virtual%20Machine''>Virtual Machine</a>
<span class=''label-count'' dir=''ltr''>(2)</span>
</span>
<span class=''label-size label-size-2''>
<a dir=''ltr'' href=''http://blog.pulipuli.info/search/label/pfSense''>pfSense</a>
<span class=''label-count'' dir=''ltr''>(2)</span>
</span>
<span class=''label-size label-size-2''>
<a dir=''ltr'' href=''http://blog.pulipuli.info/search/label/%E3%83%8B%E3%82%B3%E3%83%8B%E3%82%B3%E5%8B%95%E7%94%BB''>ニコニコ動画</a>
<span class=''label-count'' dir=''ltr''>(2)</span>
</span>
<span class=''label-size label-size-2''>
<a dir=''ltr'' href=''http://blog.pulipuli.info/search/label/%E4%BD%9C%E6%A5%AD%E7%B3%BB%E7%B5%B1%2FLinux''>作業系統/Linux</a>
<span class=''label-count'' dir=''ltr''>(2)</span>
</span>
<span class=''label-size label-size-2''>
<a dir=''ltr'' href=''http://blog.pulipuli.info/search/label/%E5%9C%96%E6%9B%B8%E8%B3%87%E8%A8%8A%E5%AD%B8%E7%A0%94%E8%A8%8E''>圖書資訊學研討</a>
<span class=''label-count'' dir=''ltr''>(2)</span>
</span>
<span class=''label-size label-size-2''>
<a dir=''ltr'' href=''http://blog.pulipuli.info/search/label/%E5%B8%83%E4%B8%81%E9%80%9A%E4%BF%A1''>布丁通信</a>
<span class=''label-count'' dir=''ltr''>(2)</span>
</span>
<span class=''label-size label-size-2''>
<a dir=''ltr'' href=''http://blog.pulipuli.info/search/label/%E6%8A%80%E8%A1%93%E6%9C%8D%E5%8B%99%E7%A0%94%E8%A8%8E''>技術服務研討</a>
<span class=''label-count'' dir=''ltr''>(2)</span>
</span>
<span class=''label-size label-size-2''>
<a dir=''ltr'' href=''http://blog.pulipuli.info/search/label/%E7%94%9F%E6%B4%BB%2F%E6%94%BF%E5%A4%A7%E5%B9%B3%E5%83%B9%E7%BE%8E%E9%A3%9F''>生活/政大平價美食</a>
<span class=''label-count'' dir=''ltr''>(2)</span>
</span>
<span class=''label-size label-size-2''>
<a dir=''ltr'' href=''http://blog.pulipuli.info/search/label/%E7%A0%94%E7%A9%B6%E6%96%B9%E6%B3%95%5C%E5%BA%8F%E5%88%97%E5%88%86%E6%9E%90''>研究方法\序列分析</a>
<span class=''label-count'' dir=''ltr''>(2)</span>
</span>
<span class=''label-size label-size-2''>
<a dir=''ltr'' href=''http://blog.pulipuli.info/search/label/%E7%A0%94%E7%A9%B6%E9%A0%98%E5%9F%9F%2F%E9%96%B1%E8%AE%80%E5%AD%B8%E7%BF%92''>研究領域/閱讀學習</a>
<span class=''label-count'' dir=''ltr''>(2)</span>
</span>
<span class=''label-size label-size-2''>
<a dir=''ltr'' href=''http://blog.pulipuli.info/search/label/%E7%A1%AC%E9%AB%94%E8%A8%AD%E5%82%99''>硬體設備</a>
<span class=''label-count'' dir=''ltr''>(2)</span>
</span>
<span class=''label-size label-size-2''>
<a dir=''ltr'' href=''http://blog.pulipuli.info/search/label/%E7%B3%BB%E7%B5%B1%2FWordPress''>系統/WordPress</a>
<span class=''label-count'' dir=''ltr''>(2)</span>
</span>
<span class=''label-size label-size-2''>
<a dir=''ltr'' href=''http://blog.pulipuli.info/search/label/%E7%B6%B2%E7%AB%99%E7%B3%BB%E7%B5%B1%2FownCloud''>網站系統/ownCloud</a>
<span class=''label-count'' dir=''ltr''>(2)</span>
</span>
<span class=''label-size label-size-2''>
<a dir=''ltr'' href=''http://blog.pulipuli.info/search/label/%E8%BC%95%E5%B0%8F%E8%AA%AA''>輕小說</a>
<span class=''label-count'' dir=''ltr''>(2)</span>
</span>
<span class=''label-size label-size-2''>
<a dir=''ltr'' href=''http://blog.pulipuli.info/search/label/%E9%81%8A%E6%88%B2''>遊戲</a>
<span class=''label-count'' dir=''ltr''>(2)</span>
</span>
<span class=''label-size label-size-1''>
<a dir=''ltr'' href=''http://blog.pulipuli.info/search/label/3C%2FNote%208''>3C/Note 8</a>
<span class=''label-count'' dir=''ltr''>(1)</span>
</span>
<span class=''label-size label-size-1''>
<a dir=''ltr'' href=''http://blog.pulipuli.info/search/label/AngularJS''>AngularJS</a>
<span class=''label-count'' dir=''ltr''>(1)</span>
</span>
<span class=''label-size label-size-1''>
<a dir=''ltr'' href=''http://blog.pulipuli.info/search/label/AutoIt''>AutoIt</a>
<span class=''label-count'' dir=''ltr''>(1)</span>
</span>
<span class=''label-size label-size-1''>
<a dir=''ltr'' href=''http://blog.pulipuli.info/search/label/Cbox%20Google%20Analytics''>Cbox Google Analytics</a>
<span class=''label-count'' dir=''ltr''>(1)</span>
</span>
<span class=''label-size label-size-1''>
<a dir=''ltr'' href=''http://blog.pulipuli.info/search/label/Data%20Mining''>Data Mining</a>
<span class=''label-count'' dir=''ltr''>(1)</span>
</span>
<span class=''label-size label-size-1''>
<a dir=''ltr'' href=''http://blog.pulipuli.info/search/label/Hardware''>Hardware</a>
<span class=''label-count'' dir=''ltr''>(1)</span>
</span>
<span class=''label-size label-size-1''>
<a dir=''ltr'' href=''http://blog.pulipuli.info/search/label/Hardware%2FNotebook''>Hardware/Notebook</a>
<span class=''label-count'' dir=''ltr''>(1)</span>
</span>
<span class=''label-size label-size-1''>
<a dir=''ltr'' href=''http://blog.pulipuli.info/search/label/OS%2FAndroid''>OS/Android</a>
<span class=''label-count'' dir=''ltr''>(1)</span>
</span>
<span class=''label-size label-size-1''>
<a dir=''ltr'' href=''http://blog.pulipuli.info/search/label/Programe%2FCSS''>Programe/CSS</a>
<span class=''label-count'' dir=''ltr''>(1)</span>
</span>
<span class=''label-size label-size-1''>
<a dir=''ltr'' href=''http://blog.pulipuli.info/search/label/Programming%2FDatabase''>Programming/Database</a>
<span class=''label-count'' dir=''ltr''>(1)</span>
</span>
<span class=''label-size label-size-1''>
<a dir=''ltr'' href=''http://blog.pulipuli.info/search/label/Programming%2FWeb%20Design''>Programming/Web Design</a>
<span class=''label-count'' dir=''ltr''>(1)</span>
</span>
<span class=''label-size label-size-1''>
<a dir=''ltr'' href=''http://blog.pulipuli.info/search/label/Second%20Life''>Second Life</a>
<span class=''label-count'' dir=''ltr''>(1)</span>
</span>
<span class=''label-size label-size-1''>
<a dir=''ltr'' href=''http://blog.pulipuli.info/search/label/Server%2FApache''>Server/Apache</a>
<span class=''label-count'' dir=''ltr''>(1)</span>
</span>
<span class=''label-size label-size-1''>
<a dir=''ltr'' href=''http://blog.pulipuli.info/search/label/Server%2FApache%20Solr''>Server/Apache Solr</a>
<span class=''label-count'' dir=''ltr''>(1)</span>
</span>
<span class=''label-size label-size-1''>
<a dir=''ltr'' href=''http://blog.pulipuli.info/search/label/Software%2FBrowser''>Software/Browser</a>
<span class=''label-count'' dir=''ltr''>(1)</span>
</span>
<span class=''label-size label-size-1''>
<a dir=''ltr'' href=''http://blog.pulipuli.info/search/label/Software%2FCWISE''>Software/CWISE</a>
<span class=''label-count'' dir=''ltr''>(1)</span>
</span>
<span class=''label-size label-size-1''>
<a dir=''ltr'' href=''http://blog.pulipuli.info/search/label/Software%2FOffice''>Software/Office</a>
<span class=''label-count'' dir=''ltr''>(1)</span>
</span>
<span class=''label-size label-size-1''>
<a dir=''ltr'' href=''http://blog.pulipuli.info/search/label/Software%2FWeka''>Software/Weka</a>
<span class=''label-count'' dir=''ltr''>(1)</span>
</span>
<span class=''label-size label-size-1''>
<a dir=''ltr'' href=''http://blog.pulipuli.info/search/label/Software%2F%E4%B8%AD%E5%B7%9E%E9%9F%BB%E8%BC%B8%E5%85%A5%E6%B3%95''>Software/中州韻輸入法</a>
<span class=''label-count'' dir=''ltr''>(1)</span>
</span>
<span class=''label-size label-size-1''>
<a dir=''ltr'' href=''http://blog.pulipuli.info/search/label/Timemark%20to%20SSA''>Timemark to SSA</a>
<span class=''label-count'' dir=''ltr''>(1)</span>
</span>
<span class=''label-size label-size-1''>
<a dir=''ltr'' href=''http://blog.pulipuli.info/search/label/Tool%2FNetBeans''>Tool/NetBeans</a>
<span class=''label-count'' dir=''ltr''>(1)</span>
</span>
<span class=''label-size label-size-1''>
<a dir=''ltr'' href=''http://blog.pulipuli.info/search/label/Userscript''>Userscript</a>
<span class=''label-count'' dir=''ltr''>(1)</span>
</span>
<span class=''label-size label-size-1''>
<a dir=''ltr'' href=''http://blog.pulipuli.info/search/label/Virtual%20Machine%2FDocker''>Virtual Machine/Docker</a>
<span class=''label-count'' dir=''ltr''>(1)</span>
</span>
<span class=''label-size label-size-1''>
<a dir=''ltr'' href=''http://blog.pulipuli.info/search/label/Virtual%20Machine%2FVirtualBox''>Virtual Machine/VirtualBox</a>
<span class=''label-count'' dir=''ltr''>(1)</span>
</span>
<span class=''label-size label-size-1''>
<a dir=''ltr'' href=''http://blog.pulipuli.info/search/label/%E5%9C%8B%E5%AE%B6%E8%80%83%E8%A9%A6''>國家考試</a>
<span class=''label-count'' dir=''ltr''>(1)</span>
</span>
<span class=''label-size label-size-1''>
<a dir=''ltr'' href=''http://blog.pulipuli.info/search/label/%E5%9C%8B%E7%AB%8B%E7%A9%BA%E4%B8%AD%E5%A4%A7%E5%AD%B8''>國立空中大學</a>
<span class=''label-count'' dir=''ltr''>(1)</span>
</span>
<span class=''label-size label-size-1''>
<a dir=''ltr'' href=''http://blog.pulipuli.info/search/label/%E5%B0%88%E9%A1%8C''>專題</a>
<span class=''label-count'' dir=''ltr''>(1)</span>
</span>
<span class=''label-size label-size-1''>
<a dir=''ltr'' href=''http://blog.pulipuli.info/search/label/%E8%AA%B2%E7%A8%8B%2F%E8%A8%88%E7%AE%97%E6%99%BA%E8%83%BD%E8%88%87%E5%95%86%E6%A5%AD%E5%88%86%E6%9E%90''>課程/計算智能與商業分析</a>
<span class=''label-count'' dir=''ltr''>(1)</span>
</span>
<span class=''label-size label-size-1''>
<a dir=''ltr'' href=''http://blog.pulipuli.info/search/label/%E8%B2%A9%E5%94%AE''>販售</a>
<span class=''label-count'' dir=''ltr''>(1)</span>
</span>
<span class=''label-size label-size-1''>
<a dir=''ltr'' href=''http://blog.pulipuli.info/search/label/%E8%B3%87%E8%A8%8A%E7%AE%A1%E7%90%86%2F%E7%B6%B2%E7%AB%99%E7%AE%A1%E7%90%86''>資訊管理/網站管理</a>
<span class=''label-count'' dir=''ltr''>(1)</span>
</span>
<span class=''label-size label-size-1''>
<a dir=''ltr'' href=''http://blog.pulipuli.info/search/label/%E9%9B%BB%E8%85%A6%E8%BB%9F%E9%AB%94%2FR''>電腦軟體/R</a>
<span class=''label-count'' dir=''ltr''>(1)</span>
</span>
<span class=''label-size label-size-1''>
<a dir=''ltr'' href=''http://blog.pulipuli.info/search/label/%E9%9B%BB%E8%A6%96''>電視</a>
<span class=''label-count'' dir=''ltr''>(1)</span>
</span>
<a class=''btn'' href=''/p/labels.html''>View All Labels</a>
<div class=''clear''></div>
<span class=''widget-item-control''>
<span class=''item-control blog-admin''>
<a class=''quickedit'' href=''//www.blogger.com/rearrange?blogID=16607461&widgetType=Label&widgetId=Label2&action=editWidget&sectionId=column2-section'' onclick=''return _WidgetManager._PopupConfig(document.getElementById("Label2"));'' target=''configLabel2'' title=''編輯''>
<img alt='''' height=''18'' src=''https://resources.blogblog.com/img/icon18_wrench_allbkg.png'' width=''18''/>
</a>
</span>
</span>
<div class=''clear''></div>
</div>
</div></div>
<div class=''span4 bl_newsletter no-items section'' id=''column3''>
</div>
</div>
<div class=''clear''></div>
</div>
</div>
<div class=''footer'' id=''footer''>
<footer>
<div class=''container clearfix''>
<div class=''go-top''>
<a href=''#''><i class=''fa fa-angle-up''></i></a>
</div>
<p>
<span class=''blog-copyright''>
                &#169; Copyright 2016 
                <a href=''http://blog.pulipuli.info/''>布丁布丁吃什麼&#65311;</a>
</span>
<span class=''themexpose''>
            / Created by <a href=''http://themexpose.com/'' id=''mycontent''>ThemeXpose</a>
            / Published By <a href=''http://gooyaabitemplates.com/'' rel=''dofollow'' target=''_blank'' title=''Blogger Templates''>Gooyaabi Templates</a>
</span>
</p>
<p class=''management''>
<a href=''https://www.blogger.com/blogger.g?blogID=16607461#templatehtml'' target=''_blank''>Template</a>
|
<a href=''https://www.blogger.com/blogger.g?blogID=16607461#stats'' target=''_blank''>Stats</a>
|
<a href=''https://analytics.google.com/analytics/web/#report/content-overview/a37178375w65476980p67298151/?et=reset'' target=''_blank''>Google Analytics</a>
|
<a href=''https://www.blogger.com/blogger.g?blogID=16607461#publishedposts'' target=''_blank''>Posts</a>
|
<a href=''https://www.blogger.com/blogger.g?blogID=16607461#spamcomments'' target=''_blank''>Spam Comments</a>
<!--| <a href="https://www.addthis.com/dashboard#dashboard-analytics/" target="_blank">AddThis</a>-->
|
<a href=''https://pulipuli.disqus.com/admin/moderate/#/all'' target=''_blank''>DisQus</a>
|
<a href=''https://developers.google.com/speed/pagespeed/insights/?utm_source=analytics'' target=''_blank''>PageSpeed</a>
|
<a href=''#'' onclick=''$(&#39;body > a:last&#39;).css(&#39;visibility&#39;, &#39;visible&#39;);''>SumoMe</a>
|
<a href=''https://cse.google.com/cse/setup/basic?cx=017270649262638447003:o6vaq9on3vs'' target=''_blank''>Google自訂搜尋</a>
|
<a href=''http://timdream.org/wordcloud/#feed:http://pulipuli.blogspot.com/feeds/posts/default'' target=''_blank''>HTML5 Word Cloud</a>
</p>
</div>
</footer>
</div>
</div>
</div>
<!-- JAVASCRIPT -->
<script async=''async'' data-sumo-site-id=''91b6a5a67cc23845f0765da427a8ac1c0b918c4e9226f12ea32abf1e8110df0c'' src=''//load.sumome.com/''></script>
<script src=''//pulipulichen.github.io/blogger/blogger/js/google-analytics.js'' type=''text/javascript''></script>
<script src=''//pulipulichen.github.io/blogger/blogger/js/related-posts.js'' type=''text/javascript''></script>
<script src=''//pulipulichen.github.io/blogger/blogger/lib/lightbox2-lokeshdhakar/init.js'' type=''text/javascript''></script>
<script src=''//pulipulichen.github.io/blogger/blogger/lib/highlight/init.js'' type=''text/javascript''></script>

<script type="text/javascript" src="https://www.blogger.com/static/v1/widgets/3200813190-widgets.js"></script>
<script type="text/javascript" src="https://apis.google.com/js/plusone.js"></script>
<script type=''text/javascript''>
window[''__wavt''] = ''AOuZoY5KuCIsoWKB_d6s0CdrGtfiKu4EcQ:1478500643919'';_WidgetManager._Init(''//www.blogger.com/rearrange?blogID\x3d16607461'',''//blog.pulipuli.info/2016/11/rrstudio-server-openvz-standalone-r.html'',''16607461'');
_WidgetManager._SetDataContext([{''name'': ''blog'', ''data'': {''blogId'': ''16607461'', ''bloggerUrl'': ''https://www.blogger.com'', ''title'': ''布丁布丁吃什麼&#65311;'', ''pageType'': ''item'', ''postId'': ''3945870409398834382'', ''url'': ''http://blog.pulipuli.info/2016/11/rrstudio-server-openvz-standalone-r.html'', ''canonicalUrl'': ''http://blog.pulipuli.info/2016/11/rrstudio-server-openvz-standalone-r.html'', ''homepageUrl'': ''http://blog.pulipuli.info/'', ''searchUrl'': ''http://blog.pulipuli.info/search'', ''canonicalHomepageUrl'': ''http://blog.pulipuli.info/'', ''blogspotFaviconUrl'': ''http://blog.pulipuli.info/favicon.ico'', ''enabledCommentProfileImages'': true, ''gPlusViewType'': ''FILTERED_POSTMOD'', ''adultContent'': false, ''analyticsAccountNumber'': ''UA-37178375-1'', ''useUniversalAnalytics'': false, ''pageName'': ''開箱即用的R運作環境&#65281;RStudio Server OpenVZ虛擬機器分享 / Standalone R Environment: RStudio Server in OpenVZ Virtual Machine'', ''pageTitle'': ''布丁布丁吃什麼&#65311;: 開箱即用的R運作環境&#65281;RStudio Server OpenVZ虛擬機器分享 / Standalone R Environment: RStudio Server in OpenVZ Virtual Machine'', ''metaDescription'': '''', ''encoding'': ''UTF-8'', ''locale'': ''zh_TW'', ''localeUnderscoreDelimited'': ''zh_tw'', ''isPrivate'': false, ''isMobile'': false, ''isMobileRequest'': false, ''mobileClass'': '''', ''isPrivateBlog'': false, ''languageDirection'': ''ltr'', ''feedLinks'': ''\x3clink rel\x3d\x22alternate\x22 type\x3d\x22application/atom+xml\x22 title\x3d\x22布丁布丁吃什麼&#65311; - Atom\x22 href\x3d\x22http://blog.pulipuli.info/feeds/posts/default\x22 /\x3e\n\x3clink rel\x3d\x22alternate\x22 type\x3d\x22application/rss+xml\x22 title\x3d\x22布丁布丁吃什麼&#65311; - RSS\x22 href\x3d\x22http://blog.pulipuli.info/feeds/posts/default?alt\x3drss\x22 /\x3e\n\x3clink rel\x3d\x22service.post\x22 type\x3d\x22application/atom+xml\x22 title\x3d\x22布丁布丁吃什麼&#65311; - Atom\x22 href\x3d\x22https://www.blogger.com/feeds/16607461/posts/default\x22 /\x3e\n\n\x3clink rel\x3d\x22alternate\x22 type\x3d\x22application/atom+xml\x22 title\x3d\x22布丁布丁吃什麼&#65311; - Atom\x22 href\x3d\x22http://blog.pulipuli.info/feeds/3945870409398834382/comments/default\x22 /\x3e\n'', ''meTag'': '''', ''openIdOpTag'': '''', ''postImageThumbnailUrl'': ''https://lh3.googleusercontent.com/-ybNC09QREIo/WCAa8HLqr3I/AAAAAAAC82k/pVxbGmRI_ec/s72-c/image_thumb%25255B4%25255D.png?imgmax\x3d800'', ''postImageUrl'': ''https://lh3.googleusercontent.com/-ybNC09QREIo/WCAa8HLqr3I/AAAAAAAC82k/pVxbGmRI_ec/image_thumb%25255B4%25255D.png?imgmax\x3d800'', ''mobileHeadScript'': '''', ''adsenseHostId'': ''ca-host-pub-1556223355139109'', ''view'': '''', ''dynamicViewsCommentsSrc'': ''//www.blogblog.com/dynamicviews/4224c15c4e7c9321/js/comments.js'', ''dynamicViewsScriptSrc'': ''//www.blogblog.com/dynamicviews/ca3f6ae6da5cb0f3'', ''plusOneApiSrc'': ''https://apis.google.com/js/plusone.js'', ''sharing'': {''platforms'': [{''name'': ''取得連結'', ''key'': ''link'', ''shareMessage'': ''取得連結'', ''target'': ''''}, {''name'': ''Facebook'', ''key'': ''facebook'', ''shareMessage'': ''分享到 Facebook'', ''target'': ''facebook''}, {''name'': ''BlogThis&#65281;'', ''key'': ''blogThis'', ''shareMessage'': ''BlogThis&#65281;'', ''target'': ''blog''}, {''name'': ''Twitter'', ''key'': ''twitter'', ''shareMessage'': ''分享到 Twitter'', ''target'': ''twitter''}, {''name'': ''Pinterest'', ''key'': ''pinterest'', ''shareMessage'': ''分享到 Pinterest'', ''target'': ''pinterest''}, {''name'': ''Google+'', ''key'': ''googlePlus'', ''shareMessage'': ''分享到 Google+'', ''target'': ''googleplus''}, {''name'': ''以電子郵件傳送'', ''key'': ''email'', ''shareMessage'': ''以電子郵件傳送'', ''target'': ''email''}], ''googlePlusShareButtonWidth'': 300, ''googlePlusBootstrap'': ''\x3cscript type\x3d\x22text/javascript\x22\x3ewindow.___gcfg \x3d {\x27lang\x27: \x27zh_TW\x27};\x3c/script\x3e''}}}, {''name'': ''features'', ''data'': {''widgetVisibility'': true}}, {''name'': ''messages'', ''data'': {''linkCopiedToClipboard'': ''已將連結複製到剪貼簿&#65281;'', ''postLink'': ''文章連結''}}, {''name'': ''template'', ''data'': {''name'': ''custom'', ''localizedName'': ''自訂'', ''isResponsive'': false, ''isAlternateRendering'': false, ''isCustom'': true}}, {''name'': ''view'', ''data'': {''classic'': {''name'': ''classic'', ''url'': ''?view\x3dclassic''}, ''flipcard'': {''name'': ''flipcard'', ''url'': ''?view\x3dflipcard''}, ''magazine'': {''name'': ''magazine'', ''url'': ''?view\x3dmagazine''}, ''mosaic'': {''name'': ''mosaic'', ''url'': ''?view\x3dmosaic''}, ''sidebar'': {''name'': ''sidebar'', ''url'': ''?view\x3dsidebar''}, ''snapshot'': {''name'': ''snapshot'', ''url'': ''?view\x3dsnapshot''}, ''timeslide'': {''name'': ''timeslide'', ''url'': ''?view\x3dtimeslide''}, ''isMobile'': false, ''title'': ''開箱即用的R運作環境&#65281;RStudio Server OpenVZ虛擬機器分享 / Standalone R Environment: RStudio Server in OpenVZ Virtual Machine'', ''description'': ''布丁布丁吃布丁分享網頁技術&#12289;讀書心得的園地&#12290;'', ''featuredImage'': ''https://lh3.googleusercontent.com/-ybNC09QREIo/WCAa8HLqr3I/AAAAAAAC82k/pVxbGmRI_ec/image_thumb%25255B4%25255D.png?imgmax\x3d800'', ''url'': ''http://blog.pulipuli.info/2016/11/rrstudio-server-openvz-standalone-r.html'', ''type'': ''item'', ''isSingleItem'': true, ''isMultipleItems'': false, ''isError'': false, ''isPage'': false, ''isPost'': true, ''isHomepage'': false, ''isArchive'': false, ''isSearch'': false, ''isLabelSearch'': false, ''postId'': 3945870409398834382}}]);
_WidgetManager._RegisterWidget(''_HeaderView'', new _WidgetInfo(''Header1'', ''header'', null, document.getElementById(''Header1''), {}, ''displayModeFull''));
_WidgetManager._RegisterWidget(''_BlogArchiveView'', new _WidgetInfo(''BlogArchive1'', ''archivespage'', null, document.getElementById(''BlogArchive1''), {''languageDirection'': ''ltr'', ''loadingMessage'': ''Loading\x26hellip;''}, ''displayModeFull''));
_WidgetManager._RegisterWidget(''_LabelView'', new _WidgetInfo(''Label3'', ''labels-page'', null, document.getElementById(''Label3''), {}, ''displayModeFull''));
_WidgetManager._RegisterWidget(''_BlogView'', new _WidgetInfo(''Blog1'', ''main'', null, document.getElementById(''Blog1''), {''cmtInteractionsEnabled'': false, ''showBacklinks'': true, ''postId'': ''3945870409398834382'', ''lightboxEnabled'': true, ''lightboxModuleUrl'': ''https://www.blogger.com/static/v1/jsbin/3405095422-lbx__zh_tw.js'', ''lightboxCssUrl'': ''https://www.blogger.com/static/v1/v-css/368954415-lightbox_bundle.css''}, ''displayModeFull''));
_WidgetManager._RegisterWidget(''_StatsView'', new _WidgetInfo(''Stats1'', ''column1-stats'', null, document.getElementById(''Stats1''), {''title'': ''Hit Count'', ''showGraphicalCounter'': false, ''showAnimatedCounter'': false, ''showSparkline'': true, ''statsUrl'': ''//blog.pulipuli.info/b/stats?style\x3dWHITE_TRANSPARENT\x26timeRange\x3dALL_TIME\x26token\x3dUOg4P1gBAAA.E5jz7gHfJRBSg7W4LhwNXQ.nvbV8I2HnLFMp-rLfsoNJA''}, ''displayModeFull''));
_WidgetManager._RegisterWidget(''_LabelView'', new _WidgetInfo(''Label2'', ''column2-section'', null, document.getElementById(''Label2''), {}, ''displayModeFull''));
</script>
</body>
</html>');
INSERT INTO doc (fulltext) VALUES ('
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html dir=''ltr'' xmlns=''http://www.w3.org/1999/xhtml'' xmlns:b=''http://www.google.com/2005/gml/b'' xmlns:data=''http://www.google.com/2005/gml/data'' xmlns:expr=''http://www.google.com/2005/gml/expr''>
<head>
<title>
R的文字雲怎麼都是&#9633;亂碼&#65311;wordcloud套件需要中文字形 / Why R&#8217;s wordcloud draws Chinese in &#9633;? - 布丁布丁吃什麼&#65311;
</title>
<meta content=''text/html; charset=UTF-8'' http-equiv=''Content-Type''/>
<meta content=''blogger'' name=''generator''/>
<link href=''http://blog.pulipuli.info/favicon.ico'' rel=''icon'' type=''image/x-icon''/>
<link href=''http://blog.pulipuli.info/2016/11/rwordcloud-why-rs-wordcloud-draws.html'' rel=''canonical''/>
<link rel="alternate" type="application/atom+xml" title="布丁布丁吃什麼&#65311; - Atom" href="http://blog.pulipuli.info/feeds/posts/default" />
<link rel="alternate" type="application/rss+xml" title="布丁布丁吃什麼&#65311; - RSS" href="http://blog.pulipuli.info/feeds/posts/default?alt=rss" />
<link rel="service.post" type="application/atom+xml" title="布丁布丁吃什麼&#65311; - Atom" href="https://www.blogger.com/feeds/16607461/posts/default" />

<link rel="alternate" type="application/atom+xml" title="布丁布丁吃什麼&#65311; - Atom" href="http://blog.pulipuli.info/feeds/7531801512378558602/comments/default" />
<link href=''https://lh3.googleusercontent.com/-jlcNpnoN3KI/WB7p5iPhBBI/AAAAAAAC818/6THEZ4Y5Ytw/image_thumb%25255B1%25255D.png?imgmax=800'' rel=''image_src''/>
<meta content=''http://blog.pulipuli.info/2016/11/rwordcloud-why-rs-wordcloud-draws.html'' property=''og:url''/>
<meta content=''R的文字雲怎麼都是□亂碼？wordcloud套件需要中文字形 / Why R’s wordcloud draws Chinese in □?'' property=''og:title''/>
<meta content=''布丁布丁吃布丁分享網頁技術、讀書心得的園地。'' property=''og:description''/>
<meta content=''https://lh3.googleusercontent.com/-jlcNpnoN3KI/WB7p5iPhBBI/AAAAAAAC818/6THEZ4Y5Ytw/w1200-h630-p-nu/image_thumb%25255B1%25255D.png?imgmax=800'' property=''og:image''/>
<!--[if IE]> <script> (function() { var html5 = ("abbr,article,aside,audio,canvas,datalist,details," + "figure,footer,header,hgroup,mark,menu,meter,nav,output," + "progress,section,time,video").split('',''); for (var i = 0; i < html5.length; i++) { document.createElement(html5[i]); } try { document.execCommand(''BackgroundImageCache'', false, true); } catch(e) {} })(); </script> <![endif]-->
<link type=''text/css'' rel=''stylesheet'' href=''https://www.blogger.com/static/v1/widgets/2210556531-widget_css_bundle.css'' />
<link type=''text/css'' rel=''stylesheet'' href=''https://www.blogger.com/dyn-css/authorization.css?targetBlogID=16607461&zx=e20bc493-f1f6-430c-83e5-2630113db056'' />
<style id=''page-skin-1'' type=''text/css''><!--
/*
-----------------------------------------------
Blogger Template Style
Name:        Breeze
Created by:  ThemeXpose
Url:         http://www.themexpose.com/
License:     Full version
----------------------------------------------- */
body#layout .nav-collapse,.no-image,.pagenavi .pages,#navbar,.date-header,.feed-links,.post-location,.post-share-buttons,.post-icons{display: none !important;}
.section,.widget,.widget-content,.widget ul,.widget li,body,h1,h2,h3,h4,h5,ul,li,a,p,span,img,dd{margin:0;padding:0;list-style:none;text-decoration:none;border:none;outline:none}
body#layout #content {float:left;width:600px;margin-left:30px}
body#layout #side-bar {float:right;width:300px;}
#column1,#column2,#column3 {float:left}
body,.body-fauxcolumn-outer{font-family: "Lato",Helvetica,sans-serif;background:#E9F0F4;font-size:18px;font-weight:300;line-height:1.75;overflow-x:hidden;position:relative}
a{color:#333}
a:hover{color:#F69087}
h1,h2,h3,h4,h5{font-family:"Lato",serif}
.bl_background{position:fixed;z-index:-1;width:100%;height:100%;left:0;top:0}
.bl_background img{width:100%;height:100%}
#background_pattern{background-repeat:repeat;height:100%;left:0;position:fixed;top:0;width:100%;z-index:-1}
.clearfix{*zoom:1}
.clearfix:before,.clearfix:after{display:table;content:"";line-height:0}
.clearfix:after{clear:both}
.hide-text{font:0/0 a;color:transparent;text-shadow:none;background-color:transparent;border:0}
.input-block-level{display:block;width:100%;min-height:30px;-webkit-box-sizing:border-box;-moz-box-sizing:border-box;box-sizing:border-box}
article,aside,details,figcaption,figure,footer,header,hgroup,nav,section{display:block}
audio,canvas,video{display:inline-block;*display:inline;*zoom:1}
audio:not([controls]){display:none}
html{font-size:100%;-webkit-text-size-adjust:100%;-ms-text-size-adjust:100%}
a:focus{outline:thin dotted #333;outline:5px auto -webkit-focus-ring-color;outline-offset:-2px}
a:hover,a:active{outline:0}
sub,sup{position:relative;font-size:75%;line-height:0;vertical-align:baseline}
sup{top:-0.5em}
sub{bottom:-0.25em}
img{max-width:100%;width:auto\9;height:auto;vertical-align:middle;border:0;-ms-interpolation-mode:bicubic}
#map_canvas img,.google-maps img{max-width:none}
button,input,select,textarea{margin:0;font-size:100%;vertical-align:middle}
button,input{*overflow:visible;line-height:normal}
button::-moz-focus-inner,input::-moz-focus-inner{padding:0;border:0}
button,html input[type="button"],input[type="reset"],input[type="submit"]{-webkit-appearance:button;cursor:pointer}
label,select,button,input[type="button"],input[type="reset"],input[type="submit"],input[type="radio"],input[type="checkbox"]{cursor:pointer}
input[type="search"]{-webkit-box-sizing:content-box;-moz-box-sizing:content-box;box-sizing:content-box;-webkit-appearance:textfield}
input[type="search"]::-webkit-search-decoration,input[type="search"]::-webkit-search-cancel-button{-webkit-appearance:none}
textarea{overflow:auto;vertical-align:top}
@media print{*{text-shadow:none !important;color:#000 !important;background:transparent !important;box-shadow:none !important}
a,a:visited{text-decoration:underline}
a[href]:after{content:" (" attr(href) ")"}
abbr[title]:after{content:" (" attr(title) ")"}
.ir a:after,a[href^="javascript:"]:after,a[href^="#"]:after{content:""}
thead{display:table-header-group}
tr,img{page-break-inside:avoid}
img{max-width:100% !important}
@page{margin:0.5cm}
p,h2,h3{orphans:3;widows:3}
h2,h3{page-break-after:avoid}
}
.img-rounded{-webkit-border-radius:6px;-moz-border-radius:6px;border-radius:6px}
.img-polaroid{padding:4px;background-color:#fff;border:1px solid #ccc;border:1px solid rgba(0,0,0,0.2);-webkit-box-shadow:0 1px 3px rgba(0,0,0,0.1);-moz-box-shadow:0 1px 3px rgba(0,0,0,0.1);box-shadow:0 1px 3px rgba(0,0,0,0.1)}
.img-circle{-webkit-border-radius:500px;-moz-border-radius:500px;border-radius:500px}
.row{margin-left:-20px;*zoom:1}
.row:before,.row:after{display:table;content:"";line-height:0}
.row:after{clear:both}
[class*="span"]{float:left;min-height:1px;margin-left:20px}
.container,.navbar-static-top .container,.navbar-fixed-top .container,.navbar-fixed-bottom .container{width:940px}
.span12{width:940px}
.span11{width:860px}
.span10{width:780px}
.span9{width:700px}
.span8{width:620px}
.span7{width:540px}
.span6{width:460px}
.span5{width:380px}
.span4{width:300px}
.span3{width:220px}
.span2{width:140px}
.span1{width:60px}
.offset12{margin-left:980px}
.offset11{margin-left:900px}
.offset10{margin-left:820px}
.offset9{margin-left:740px}
.offset8{margin-left:660px}
.offset7{margin-left:580px}
.offset6{margin-left:500px}
.offset5{margin-left:420px}
.offset4{margin-left:340px}
.offset3{margin-left:260px}
.offset2{margin-left:180px}
.offset1{margin-left:100px}
.row-fluid{width:100%;*zoom:1}
.row-fluid:before,.row-fluid:after{display:table;content:"";line-height:0}
.row-fluid:after{clear:both}
.row-fluid > [class*="span"]{display:block;width:100%;min-height:30px;-webkit-box-sizing:border-box;-moz-box-sizing:border-box;box-sizing:border-box;float:left;margin-left:2.127659574468085%;*margin-left:2.074468085106383%}
.row-fluid > [class*="span"]:first-child{margin-left:0}
.row-fluid .controls-row [class*="span"]+[class*="span"]{margin-left:2.127659574468085%}
.row-fluid .span12{width:100%;*width:99.94680851063829%}
.row-fluid .span11{width:91.48936170212765%;*width:91.43617021276594%}
.row-fluid .span10{width:82.97872340425532%;*width:82.92553191489361%}
.row-fluid .span9{width:74.46808510638297%;*width:74.41489361702126%}
.row-fluid .span8{width:65.95744680851064%;*width:65.90425531914893%}
.row-fluid .span7{width:57.44680851063829%;*width:57.39361702127659%}
.row-fluid .span6{width:48.93617021276595%;*width:48.88297872340425%}
.row-fluid .span5{width:40.42553191489362%;*width:40.37234042553192%}
.row-fluid .span4{width:31.914893617021278%;*width:31.861702127659576%}
.row-fluid .span3{width:23.404255319148934%;*width:23.351063829787233%}
.row-fluid .span2{width:14.893617021276595%;*width:14.840425531914894%}
.row-fluid .span1{width:6.382978723404255%;*width:6.329787234042553%}
.row-fluid .offset12{margin-left:104.25531914893617%;*margin-left:104.14893617021275%}
.row-fluid .offset12:first-child{margin-left:102.12765957446808%;*margin-left:102.02127659574467%}
.row-fluid .offset11{margin-left:95.74468085106382%;*margin-left:95.6382978723404%}
.row-fluid .offset11:first-child{margin-left:93.61702127659574%;*margin-left:93.51063829787232%}
.row-fluid .offset10{margin-left:87.23404255319149%;*margin-left:87.12765957446807%}
.row-fluid .offset10:first-child{margin-left:85.1063829787234%;*margin-left:84.99999999999999%}
.row-fluid .offset9{margin-left:78.72340425531914%;*margin-left:78.61702127659572%}
.row-fluid .offset9:first-child{margin-left:76.59574468085106%;*margin-left:76.48936170212764%}
.row-fluid .offset8{margin-left:70.2127659574468%;*margin-left:70.10638297872339%}
.row-fluid .offset8:first-child{margin-left:68.08510638297872%;*margin-left:67.9787234042553%}
.row-fluid .offset7{margin-left:61.70212765957446%;*margin-left:61.59574468085106%}
.row-fluid .offset7:first-child{margin-left:59.574468085106375%;*margin-left:59.46808510638297%}
.row-fluid .offset6{margin-left:53.191489361702125%;*margin-left:53.085106382978715%}
.row-fluid .offset6:first-child{margin-left:51.063829787234035%;*margin-left:50.95744680851063%}
.row-fluid .offset5{margin-left:44.68085106382979%;*margin-left:44.57446808510638%}
.row-fluid .offset5:first-child{margin-left:42.5531914893617%;*margin-left:42.4468085106383%}
.row-fluid .offset4{margin-left:36.170212765957444%;*margin-left:36.06382978723405%}
.row-fluid .offset4:first-child{margin-left:34.04255319148936%;*margin-left:33.93617021276596%}
.row-fluid .offset3{margin-left:27.659574468085104%;*margin-left:27.5531914893617%}
.row-fluid .offset3:first-child{margin-left:25.53191489361702%;*margin-left:25.425531914893618%}
.row-fluid .offset2{margin-left:19.148936170212764%;*margin-left:19.04255319148936%}
.row-fluid .offset2:first-child{margin-left:17.02127659574468%;*margin-left:16.914893617021278%}
.row-fluid .offset1{margin-left:10.638297872340425%;*margin-left:10.53191489361702%}
.row-fluid .offset1:first-child{margin-left:8.51063829787234%;*margin-left:8.404255319148938%}
[class*="span"].hide,.row-fluid [class*="span"].hide{display:none}
[class*="span"].pull-right,.row-fluid [class*="span"].pull-right{float:right;}
.container{margin-right:auto;margin-left:auto;*zoom:1}
.container:before,.container:after{display:table;content:"";line-height:0}
.container:after{clear:both}
.container-fluid{padding-right:20px;padding-left:20px;*zoom:1}
.container-fluid:before,.container-fluid:after{display:table;content:"";line-height:0}
.container-fluid:after{clear:both}
p{margin:0 0 10px}
.lead{margin-bottom:20px;font-size:21px;font-weight:200;line-height:30px}
small{font-size:85%}
strong{font-weight:bold}
em{font-style:italic}
cite{font-style:normal}
.muted{color:#999}
a.muted:hover,a.muted:focus{color:#808080}
.text-warning{color:#c09853}
a.text-warning:hover,a.text-warning:focus{color:#a47e3c}
.text-error{color:#b94a48}
a.text-error:hover,a.text-error:focus{color:#953b39}
.text-info{color:#3a87ad}
a.text-info:hover,a.text-info:focus{color:#2d6987}
.text-success{color:#468847}
a.text-success:hover,a.text-success:focus{color:#356635}
.text-left{text-align:left}
.text-right{text-align:right}
.text-center{text-align:center}
.page-header{padding-bottom:9px;margin:20px 0 30px;border-bottom:1px solid #eee}
ul,ol{padding:0;margin:0 0 10px 25px}
ul ul,ul ol,ol ol,ol ul{margin-bottom:0}
li{line-height:20px}
ul.unstyled,ol.unstyled{margin-left:0;list-style:none}
ul.inline,ol.inline{margin-left:0;list-style:none}
ul.inline>li,ol.inline>li{display:inline-block;*display:inline;*zoom:1;padding-left:5px;padding-right:5px}
dl{margin-bottom:20px}
dt,dd{line-height:20px}
dt{font-weight:bold}
dd{margin-left:10px}
.dl-horizontal{*zoom:1}
.dl-horizontal:before,.dl-horizontal:after{display:table;content:"";line-height:0}
.dl-horizontal:after{clear:both}
.dl-horizontal dt{float:left;width:160px;clear:left;text-align:right;overflow:hidden;text-overflow:ellipsis;white-space:nowrap}
.dl-horizontal dd{margin-left:180px}
hr{margin:20px 0;border:0;border-top:1px solid #eee;border-bottom:1px solid #fff}
abbr[title],abbr[data-original-title]{cursor:help;border-bottom:1px dotted #999}
abbr.initialism{font-size:90%;text-transform:uppercase}
blockquote{padding:0 0 0 15px;margin:0 0 20px;border-left:5px solid #eee}
blockquote p{margin-bottom:0;font-size:17.5px;font-weight:300;line-height:1.25}
blockquote small{display:block;line-height:20px;color:#999}
blockquote small:before{content:''\2014 \00A0''}
blockquote.pull-right{float:right;padding-right:15px;padding-left:0;border-right:5px solid #eee;border-left:0}
blockquote.pull-right p,blockquote.pull-right small{text-align:right}
blockquote.pull-right small:before{content:''''}
blockquote.pull-right small:after{content:''\00A0 \2014''}
q:before,q:after,blockquote:before,blockquote:after{content:""}
address{display:block;margin-bottom:20px;font-style:normal;line-height:20px}
code,pre{padding:0 3px 2px;font-family:Monaco,Menlo,Consolas,"Courier New",monospace;font-size:12px;color:#333;-webkit-border-radius:3px;-moz-border-radius:3px;border-radius:3px}
code{padding:2px 4px;color:#d14;background-color:#f7f7f9;border:1px solid #e1e1e8;white-space:nowrap}
pre{display:block;padding:9.5px;margin:0 0 10px;font-size:13px;line-height:20px;word-break:break-all;word-wrap:break-word;white-space:pre;white-space:pre-wrap;background-color:#f5f5f5;border:1px solid #ccc;border:1px solid rgba(0,0,0,0.15);-webkit-border-radius:4px;-moz-border-radius:4px;border-radius:4px}
pre.prettyprint{margin-bottom:20px}
pre code{padding:0;color:inherit;white-space:pre;white-space:pre-wrap;background-color:transparent;border:0}
.pre-scrollable{max-height:340px;overflow-y:scroll}
.label,.badge{display:inline-block;padding:2px 4px;font-size:11.844px;font-weight:bold;line-height:14px;color:#fff;vertical-align:baseline;white-space:nowrap;text-shadow:0 -1px 0 rgba(0,0,0,0.25);background-color:#999}
.label{-webkit-border-radius:3px;-moz-border-radius:3px;border-radius:3px}
.badge{padding-left:9px;padding-right:9px;-webkit-border-radius:9px;-moz-border-radius:9px;border-radius:9px}
.label:empty,.badge:empty{display:none}
a.label:hover,a.label:focus,a.badge:hover,a.badge:focus{color:#fff;text-decoration:none;cursor:pointer}
.label-important,.badge-important{background-color:#b94a48}
.label-important[href],.badge-important[href]{background-color:#953b39}
.label-warning,.badge-warning{background-color:#f89406}
.label-warning[href],.badge-warning[href]{background-color:#c67605}
.label-success,.badge-success{background-color:#468847}
.label-success[href],.badge-success[href]{background-color:#356635}
.label-info[href],.badge-info[href]{background-color:#2d6987}
.label-inverse,.badge-inverse{background-color:#333}
.label-inverse[href],.badge-inverse[href]{background-color:#1a1a1a}
.btn .label,.btn .badge{position:relative;top:-1px}
.btn-mini .label,.btn-mini .badge{top:0}
table{max-width:100%;background-color:transparent;border-collapse:collapse;border-spacing:0}
.table{width:100%;margin-bottom:20px}
.table th,.table td{padding:8px;line-height:20px;text-align:left;vertical-align:top;border-top:1px solid #ddd}
.table th{font-weight:bold}
.table thead th{vertical-align:bottom}
.table caption+thead tr:first-child th,.table caption+thead tr:first-child td,.table colgroup+thead tr:first-child th,.table colgroup+thead tr:first-child td,.table thead:first-child tr:first-child th,.table thead:first-child tr:first-child td{border-top:0}
.table tbody+tbody{border-top:2px solid #ddd}
.table .table{background-color:#fff}
.table-condensed th,.table-condensed td{padding:4px 5px}
.table-bordered{border:1px solid #ddd;border-collapse:seblte;*border-collapse:collapse;border-left:0;-webkit-border-radius:4px;-moz-border-radius:4px;border-radius:4px}
.table-bordered th,.table-bordered td{border-left:1px solid #ddd}
.table-bordered caption+thead tr:first-child th,.table-bordered caption+tbody tr:first-child th,.table-bordered caption+tbody tr:first-child td,.table-bordered colgroup+thead tr:first-child th,.table-bordered colgroup+tbody tr:first-child th,.table-bordered colgroup+tbody tr:first-child td,.table-bordered thead:first-child tr:first-child th,.table-bordered tbody:first-child tr:first-child th,.table-bordered tbody:first-child tr:first-child td{border-top:0}
.table-bordered thead:first-child tr:first-child>th:first-child,.table-bordered tbody:first-child tr:first-child>td:first-child,.table-bordered tbody:first-child tr:first-child>th:first-child{-webkit-border-top-left-radius:4px;-moz-border-radius-topleft:4px;border-top-left-radius:4px}
.table-bordered thead:first-child tr:first-child>th:last-child,.table-bordered tbody:first-child tr:first-child>td:last-child,.table-bordered tbody:first-child tr:first-child>th:last-child{-webkit-border-top-right-radius:4px;-moz-border-radius-topright:4px;border-top-right-radius:4px}
.table-bordered thead:last-child tr:last-child>th:first-child,.table-bordered tbody:last-child tr:last-child>td:first-child,.table-bordered tbody:last-child tr:last-child>th:first-child,.table-bordered tfoot:last-child tr:last-child>td:first-child,.table-bordered tfoot:last-child tr:last-child>th:first-child{-webkit-border-bottom-left-radius:4px;-moz-border-radius-bottomleft:4px;border-bottom-left-radius:4px}
.table-bordered thead:last-child tr:last-child>th:last-child,.table-bordered tbody:last-child tr:last-child>td:last-child,.table-bordered tbody:last-child tr:last-child>th:last-child,.table-bordered tfoot:last-child tr:last-child>td:last-child,.table-bordered tfoot:last-child tr:last-child>th:last-child{-webkit-border-bottom-right-radius:4px;-moz-border-radius-bottomright:4px;border-bottom-right-radius:4px}
.table-bordered tfoot+tbody:last-child tr:last-child td:first-child{-webkit-border-bottom-left-radius:0;-moz-border-radius-bottomleft:0;border-bottom-left-radius:0}
.table-bordered tfoot+tbody:last-child tr:last-child td:last-child{-webkit-border-bottom-right-radius:0;-moz-border-radius-bottomright:0;border-bottom-right-radius:0}
.table-bordered caption+thead tr:first-child th:first-child,.table-bordered caption+tbody tr:first-child td:first-child,.table-bordered colgroup+thead tr:first-child th:first-child,.table-bordered colgroup+tbody tr:first-child td:first-child{-webkit-border-top-left-radius:4px;-moz-border-radius-topleft:4px;border-top-left-radius:4px}
.table-bordered caption+thead tr:first-child th:last-child,.table-bordered caption+tbody tr:first-child td:last-child,.table-bordered colgroup+thead tr:first-child th:last-child,.table-bordered colgroup+tbody tr:first-child td:last-child{-webkit-border-top-right-radius:4px;-moz-border-radius-topright:4px;border-top-right-radius:4px}
.table-striped tbody>tr:nth-child(odd)>td,.table-striped tbody>tr:nth-child(odd)>th{background-color:#f9f9f9}
.table-hover tbody tr:hover>td,.table-hover tbody tr:hover>th{background-color:#f5f5f5}
table td[class*="span"],table th[class*="span"],.row-fluid table td[class*="span"],.row-fluid table th[class*="span"]{display:table-cell;float:none;margin-left:0}
.table td.span1,.table th.span1{float:none;width:44px;margin-left:0}
.table td.span2,.table th.span2{float:none;width:124px;margin-left:0}
.table td.span3,.table th.span3{float:none;width:204px;margin-left:0}
.table td.span4,.table th.span4{float:none;width:284px;margin-left:0}
.table td.span5,.table th.span5{float:none;width:364px;margin-left:0}
.table td.span6,.table th.span6{float:none;width:444px;margin-left:0}
.table td.span7,.table th.span7{float:none;width:524px;margin-left:0}
.table td.span8,.table th.span8{float:none;width:604px;margin-left:0}
.table td.span9,.table th.span9{float:none;width:684px;margin-left:0}
.table td.span10,.table th.span10{float:none;width:764px;margin-left:0}
.table td.span11,.table th.span11{float:none;width:844px;margin-left:0}
.table td.span12,.table th.span12{float:none;width:924px;margin-left:0}
.table tbody tr.success>td{background-color:#dff0d8}
.table tbody tr.error>td{background-color:#f2dede}
.table tbody tr.warning>td{background-color:#fcf8e3}
.table tbody tr.info>td{background-color:#d9edf7}
.table-hover tbody tr.success:hover>td{background-color:#d0e9c6}
.table-hover tbody tr.error:hover>td{background-color:#ebcccc}
.table-hover tbody tr.warning:hover>td{background-color:#faf2cc}
.table-hover tbody tr.info:hover>td{background-color:#c4e3f3}
form{margin:0 0 20px}
fieldset{padding:0;margin:0;border:0}
legend{display:block;width:100%;padding:0;margin-bottom:20px;font-size:21px;line-height:40px;color:#333;border:0;border-bottom:1px solid #e5e5e5}
legend small{font-size:15px;color:#999}
label,input,button,select,textarea{font-size:14px;font-weight:normal;line-height:20px}
input,button,select,textarea{font-family:"Helvetica Neue",Helvetica,Arial,sans-serif}
label{display:block;margin-bottom:5px}
select,textarea,input[type="text"],input[type="password"],input[type="datetime"],input[type="datetime-local"],input[type="date"],input[type="month"],input[type="time"],input[type="week"],input[type="number"],input[type="email"],input[type="url"],input[type="search"],input[type="tel"],input[type="color"],.uneditable-input{display:inline-block;height:20px;padding:4px 6px;margin-bottom:10px;font-size:14px;line-height:20px;color:#555;-webkit-border-radius:4px;-moz-border-radius:4px;border-radius:4px;vertical-align:middle}
input,textarea,.uneditable-input{width:206px}
textarea{height:auto}
textarea,input[type="text"],input[type="password"],input[type="datetime"],input[type="datetime-local"],input[type="date"],input[type="month"],input[type="time"],input[type="week"],input[type="number"],input[type="email"],input[type="url"],input[type="search"],input[type="tel"],input[type="color"],.uneditable-input{background-color:#fff;border:1px solid #ccc;-webkit-box-shadow:inset 0 1px 1px rgba(0,0,0,0.075);-moz-box-shadow:inset 0 1px 1px rgba(0,0,0,0.075);box-shadow:inset 0 1px 1px rgba(0,0,0,0.075);-webkit-transition:border linear .2s,box-shadow linear .2s;-moz-transition:border linear .2s,box-shadow linear .2s;-o-transition:border linear .2s,box-shadow linear .2s;transition:border linear .2s,box-shadow linear .2s}
textarea:focus,input[type="text"]:focus,input[type="password"]:focus,input[type="datetime"]:focus,input[type="datetime-local"]:focus,input[type="date"]:focus,input[type="month"]:focus,input[type="time"]:focus,input[type="week"]:focus,input[type="number"]:focus,input[type="email"]:focus,input[type="url"]:focus,input[type="search"]:focus,input[type="tel"]:focus,input[type="color"]:focus,.uneditable-input:focus{border-color:rgba(82,168,236,0.8);outline:0;outline:thin dotted \9;-webkit-box-shadow:inset 0 1px 1px rgba(0,0,0,.075),0 0 8px rgba(82,168,236,.6);-moz-box-shadow:inset 0 1px 1px rgba(0,0,0,.075),0 0 8px rgba(82,168,236,.6);box-shadow:inset 0 1px 1px rgba(0,0,0,.075),0 0 8px rgba(82,168,236,.6)}
input[type="radio"],input[type="checkbox"]{margin:4px 0 0;*margin-top:0;margin-top:1px \9;line-height:normal}
input[type="file"],input[type="image"],input[type="submit"],input[type="reset"],input[type="button"],input[type="radio"],input[type="checkbox"]{width:auto}
select,input[type="file"]{height:30px;*margin-top:4px;line-height:30px}
select{width:220px;border:1px solid #ccc;background-color:#fff}
select[multiple],select[size]{height:auto}
select:focus,input[type="file"]:focus,input[type="radio"]:focus,input[type="checkbox"]:focus{outline:thin dotted #333;outline:5px auto -webkit-focus-ring-color;outline-offset:-2px}
.uneditable-input,.uneditable-textarea{color:#999;background-color:#fcfcfc;border-color:#ccc;-webkit-box-shadow:inset 0 1px 2px rgba(0,0,0,0.025);-moz-box-shadow:inset 0 1px 2px rgba(0,0,0,0.025);box-shadow:inset 0 1px 2px rgba(0,0,0,0.025);cursor:not-allowed}
.uneditable-input{overflow:hidden;white-space:nowrap}
.uneditable-textarea{width:auto;height:auto}
input:-moz-placeholder,textarea:-moz-placeholder{color:#999}
input:-ms-input-placeholder,textarea:-ms-input-placeholder{color:#999}
input::-webkit-input-placeholder,textarea::-webkit-input-placeholder{color:#999}
.radio,.checkbox{min-height:20px;padding-left:20px}
.radio input[type="radio"],.checkbox input[type="checkbox"]{float:left;margin-left:-20px}
.controls>.radio:first-child,.controls>.checkbox:first-child{padding-top:5px}
.radio.inline,.checkbox.inline{display:inline-block;padding-top:5px;margin-bottom:0;vertical-align:middle}
.radio.inline+.radio.inline,.checkbox.inline+.checkbox.inline{margin-left:10px}
.input-mini{width:60px}
.input-small{width:90px}
.input-medium{width:150px}
.input-large{width:210px}
.input-xlarge{width:270px}
.input-xxlarge{width:530px}
input[class*="span"],select[class*="span"],textarea[class*="span"],.uneditable-input[class*="span"],.row-fluid input[class*="span"],.row-fluid select[class*="span"],.row-fluid textarea[class*="span"],.row-fluid .uneditable-input[class*="span"]{float:none;margin-left:0}
.input-append input[class*="span"],.input-append .uneditable-input[class*="span"],.input-prepend input[class*="span"],.input-prepend .uneditable-input[class*="span"],.row-fluid input[class*="span"],.row-fluid select[class*="span"],.row-fluid textarea[class*="span"],.row-fluid .uneditable-input[class*="span"],.row-fluid .input-prepend [class*="span"],.row-fluid .input-append [class*="span"]{display:inline-block}
input,textarea,.uneditable-input{margin-left:0}
.controls-row [class*="span"]+[class*="span"]{margin-left:20px}
input.span12,textarea.span12,.uneditable-input.span12{width:926px}
input.span11,textarea.span11,.uneditable-input.span11{width:846px}
input.span10,textarea.span10,.uneditable-input.span10{width:766px}
input.span9,textarea.span9,.uneditable-input.span9{width:686px}
input.span8,textarea.span8,.uneditable-input.span8{width:606px}
input.span7,textarea.span7,.uneditable-input.span7{width:526px}
input.span6,textarea.span6,.uneditable-input.span6{width:446px}
input.span5,textarea.span5,.uneditable-input.span5{width:366px}
input.span4,textarea.span4,.uneditable-input.span4{width:286px}
input.span3,textarea.span3,.uneditable-input.span3{width:206px}
input.span2,textarea.span2,.uneditable-input.span2{width:126px}
input.span1,textarea.span1,.uneditable-input.span1{width:46px}
.controls-row{*zoom:1}
.controls-row:before,.controls-row:after{display:table;content:"";line-height:0}
.controls-row:after{clear:both}
.controls-row [class*="span"],.row-fluid .controls-row [class*="span"]{float:left}
.controls-row .checkbox[class*="span"],.controls-row .radio[class*="span"]{padding-top:5px}
input[disabled],select[disabled],textarea[disabled],input[readonly],select[readonly],textarea[readonly]{cursor:not-allowed;background-color:#eee}
input[type="radio"][disabled],input[type="checkbox"][disabled],input[type="radio"][readonly],input[type="checkbox"][readonly]{background-color:transparent}
.control-group.warning .control-label,.control-group.warning .help-block,.control-group.warning .help-inline{color:#c09853}
.control-group.warning .checkbox,.control-group.warning .radio,.control-group.warning input,.control-group.warning select,.control-group.warning textarea{color:#c09853}
.control-group.warning input,.control-group.warning select,.control-group.warning textarea{border-color:#c09853;-webkit-box-shadow:inset 0 1px 1px rgba(0,0,0,0.075);-moz-box-shadow:inset 0 1px 1px rgba(0,0,0,0.075);box-shadow:inset 0 1px 1px rgba(0,0,0,0.075)}
.control-group.warning input:focus,.control-group.warning select:focus,.control-group.warning textarea:focus{border-color:#a47e3c;-webkit-box-shadow:inset 0 1px 1px rgba(0,0,0,0.075),0 0 6px #dbc59e;-moz-box-shadow:inset 0 1px 1px rgba(0,0,0,0.075),0 0 6px #dbc59e;box-shadow:inset 0 1px 1px rgba(0,0,0,0.075),0 0 6px #dbc59e}
.control-group.warning .input-prepend .add-on,.control-group.warning .input-append .add-on{color:#c09853;background-color:#fcf8e3;border-color:#c09853}
.control-group.error .control-label,.control-group.error .help-block,.control-group.error .help-inline{color:#b94a48}
.control-group.error .checkbox,.control-group.error .radio,.control-group.error input,.control-group.error select,.control-group.error textarea{color:#b94a48}
.control-group.error input,.control-group.error select,.control-group.error textarea{border-color:#b94a48;-webkit-box-shadow:inset 0 1px 1px rgba(0,0,0,0.075);-moz-box-shadow:inset 0 1px 1px rgba(0,0,0,0.075);box-shadow:inset 0 1px 1px rgba(0,0,0,0.075)}
.control-group.error input:focus,.control-group.error select:focus,.control-group.error textarea:focus{border-color:#953b39;-webkit-box-shadow:inset 0 1px 1px rgba(0,0,0,0.075),0 0 6px #d59392;-moz-box-shadow:inset 0 1px 1px rgba(0,0,0,0.075),0 0 6px #d59392;box-shadow:inset 0 1px 1px rgba(0,0,0,0.075),0 0 6px #d59392}
.control-group.error .input-prepend .add-on,.control-group.error .input-append .add-on{color:#b94a48;background-color:#f2dede;border-color:#b94a48}
.control-group.success .control-label,.control-group.success .help-block,.control-group.success .help-inline{color:#468847}
.control-group.success .checkbox,.control-group.success .radio,.control-group.success input,.control-group.success select,.control-group.success textarea{color:#468847}
.control-group.success input,.control-group.success select,.control-group.success textarea{border-color:#468847;-webkit-box-shadow:inset 0 1px 1px rgba(0,0,0,0.075);-moz-box-shadow:inset 0 1px 1px rgba(0,0,0,0.075);box-shadow:inset 0 1px 1px rgba(0,0,0,0.075)}
.control-group.success input:focus,.control-group.success select:focus,.control-group.success textarea:focus{border-color:#356635;-webkit-box-shadow:inset 0 1px 1px rgba(0,0,0,0.075),0 0 6px #7aba7b;-moz-box-shadow:inset 0 1px 1px rgba(0,0,0,0.075),0 0 6px #7aba7b;box-shadow:inset 0 1px 1px rgba(0,0,0,0.075),0 0 6px #7aba7b}
.control-group.success .input-prepend .add-on,.control-group.success .input-append .add-on{color:#468847;background-color:#dff0d8;border-color:#468847}
.control-group.info .control-label,.control-group.info .help-block,.control-group.info .help-inline{color:#3a87ad}
.control-group.info .checkbox,.control-group.info .radio,.control-group.info input,.control-group.info select,.control-group.info textarea{color:#3a87ad}
.control-group.info input,.control-group.info select,.control-group.info textarea{border-color:#3a87ad;-webkit-box-shadow:inset 0 1px 1px rgba(0,0,0,0.075);-moz-box-shadow:inset 0 1px 1px rgba(0,0,0,0.075);box-shadow:inset 0 1px 1px rgba(0,0,0,0.075)}
.control-group.info input:focus,.control-group.info select:focus,.control-group.info textarea:focus{border-color:#2d6987;-webkit-box-shadow:inset 0 1px 1px rgba(0,0,0,0.075),0 0 6px #7ab5d3;-moz-box-shadow:inset 0 1px 1px rgba(0,0,0,0.075),0 0 6px #7ab5d3;box-shadow:inset 0 1px 1px rgba(0,0,0,0.075),0 0 6px #7ab5d3}
.control-group.info .input-prepend .add-on,.control-group.info .input-append .add-on{color:#3a87ad;background-color:#d9edf7;border-color:#3a87ad}
input:focus:invalid,textarea:focus:invalid,select:focus:invalid{color:#b94a48;border-color:#ee5f5b}
input:focus:invalid:focus,textarea:focus:invalid:focus,select:focus:invalid:focus{border-color:#e9322d;-webkit-box-shadow:0 0 6px #f8b9b7;-moz-box-shadow:0 0 6px #f8b9b7;box-shadow:0 0 6px #f8b9b7}
.form-actions{padding:19px 20px 20px;margin-top:20px;margin-bottom:20px;background-color:#f5f5f5;border-top:1px solid #e5e5e5;*zoom:1}
.form-actions:before,.form-actions:after{display:table;content:"";line-height:0}
.form-actions:after{clear:both}
.help-block,.help-inline{color:#595959}
.help-block{display:block;margin-bottom:10px}
.help-inline{display:inline-block;*display:inline;*zoom:1;vertical-align:middle;padding-left:5px}
.input-append,.input-prepend{display:inline-block;margin-bottom:10px;vertical-align:middle;font-size:0;white-space:nowrap}
.input-append input,.input-prepend input,.input-append select,.input-prepend select,.input-append .uneditable-input,.input-prepend .uneditable-input,.input-append .dropdown-menu,.input-prepend .dropdown-menu,.input-append .popover,.input-prepend .popover{font-size:14px}
.input-append input,.input-prepend input,.input-append select,.input-prepend select,.input-append .uneditable-input,.input-prepend .uneditable-input{position:relative;margin-bottom:0;*margin-left:0;vertical-align:top;-webkit-border-radius:0 4px 4px 0;-moz-border-radius:0 4px 4px 0;border-radius:0 4px 4px 0}
.input-append input:focus,.input-prepend input:focus,.input-append select:focus,.input-prepend select:focus,.input-append .uneditable-input:focus,.input-prepend .uneditable-input:focus{z-index:2}
.input-append .add-on,.input-prepend .add-on{display:inline-block;width:auto;height:20px;min-width:16px;padding:4px 5px;font-size:14px;font-weight:normal;line-height:20px;text-align:center;text-shadow:0 1px 0 #fff;background-color:#eee;border:1px solid #ccc}
.input-append .add-on,.input-prepend .add-on,.input-append .btn,.input-prepend .btn,.input-append .btn-group>.dropdown-toggle,.input-prepend .btn-group>.dropdown-toggle{vertical-align:top;-webkit-border-radius:0;-moz-border-radius:0;border-radius:0}
.input-append .active,.input-prepend .active{background-color:#a9dba9;border-color:#46a546}
.input-prepend .add-on,.input-prepend .btn{margin-right:-1px}
.input-prepend .add-on:first-child,.input-prepend .btn:first-child{-webkit-border-radius:4px 0 0 4px;-moz-border-radius:4px 0 0 4px;border-radius:4px 0 0 4px}
.input-append input,.input-append select,.input-append .uneditable-input{-webkit-border-radius:4px 0 0 4px;-moz-border-radius:4px 0 0 4px;border-radius:4px 0 0 4px}
.input-append input+.btn-group .btn:last-child,.input-append select+.btn-group .btn:last-child,.input-append .uneditable-input+.btn-group .btn:last-child{-webkit-border-radius:0 4px 4px 0;-moz-border-radius:0 4px 4px 0;border-radius:0 4px 4px 0}
.input-append .add-on,.input-append .btn,.input-append .btn-group{margin-left:-1px}
.input-append .add-on:last-child,.input-append .btn:last-child,.input-append .btn-group:last-child>.dropdown-toggle{-webkit-border-radius:0 4px 4px 0;-moz-border-radius:0 4px 4px 0;border-radius:0 4px 4px 0}
.input-prepend.input-append input,.input-prepend.input-append select,.input-prepend.input-append .uneditable-input{-webkit-border-radius:0;-moz-border-radius:0;border-radius:0}
.input-prepend.input-append input+.btn-group .btn,.input-prepend.input-append select+.btn-group .btn,.input-prepend.input-append .uneditable-input+.btn-group .btn{-webkit-border-radius:0 4px 4px 0;-moz-border-radius:0 4px 4px 0;border-radius:0 4px 4px 0}
.input-prepend.input-append .add-on:first-child,.input-prepend.input-append .btn:first-child{margin-right:-1px;-webkit-border-radius:4px 0 0 4px;-moz-border-radius:4px 0 0 4px;border-radius:4px 0 0 4px}
.input-prepend.input-append .add-on:last-child,.input-prepend.input-append .btn:last-child{margin-left:-1px;-webkit-border-radius:0 4px 4px 0;-moz-border-radius:0 4px 4px 0;border-radius:0 4px 4px 0}
.control-group{margin-bottom:10px}
legend+.control-group{margin-top:20px;-webkit-margin-top-collapse:separate}
.form-horizontal .control-group{margin-bottom:20px;*zoom:1}
.form-horizontal .control-group:before,.form-horizontal .control-group:after{display:table;content:"";line-height:0}
.form-horizontal .control-group:after{clear:both}
.form-horizontal .control-label{float:left;width:160px;padding-top:5px;text-align:right}
.form-horizontal .controls{*display:inline-block;*padding-left:20px;margin-left:180px;*margin-left:0}
.form-horizontal .controls:first-child{*padding-left:180px}
.form-horizontal .help-block{margin-bottom:0}
.form-horizontal input+.help-block,.form-horizontal select+.help-block,.form-horizontal textarea+.help-block,.form-horizontal .uneditable-input+.help-block,.form-horizontal .input-prepend+.help-block,.form-horizontal .input-append+.help-block{margin-top:10px}
.form-horizontal .form-actions{padding-left:180px}
.btn{display:inline-block;*display:inline;*zoom:1;padding:4px 12px;margin-bottom:0;font-size:14px;line-height:20px;text-align:center;vertical-align:middle;cursor:pointer;color:#333;text-shadow:0 1px 1px rgba(255,255,255,0.75);background-color:#f5f5f5;background-image:-moz-linear-gradient(top,#fff,#e6e6e6);background-image:-webkit-gradient(linear,0 0,0 100%,from(#fff),to(#e6e6e6));background-image:-webkit-linear-gradient(top,#fff,#e6e6e6);background-image:-o-linear-gradient(top,#fff,#e6e6e6);background-image:linear-gradient(to bottom,#fff,#e6e6e6);background-repeat:repeat-x;filter:progid:DXImageTransform.Microsoft.gradient(startColorstr=''#fffff'',endColorstr=''#ffe6e6e6'',GradientType=0);border-color:#e6e6e6 #e6e6e6 #bfbfbf;border-color:rgba(0,0,0,0.1) rgba(0,0,0,0.1) rgba(0,0,0,0.25);*background-color:#e6e6e6;filter:progid:DXImageTransform.Microsoft.gradient(enabled = false);border:1px solid #ccc;*border:0;border-bottom-color:#b3b3b3;-webkit-border-radius:4px;-moz-border-radius:4px;border-radius:4px;*margin-left:.3em;-webkit-box-shadow:inset 0 1px 0 rgba(255,255,255,.2),0 1px 2px rgba(0,0,0,.05);-moz-box-shadow:inset 0 1px 0 rgba(255,255,255,.2),0 1px 2px rgba(0,0,0,.05);box-shadow:inset 0 1px 0 rgba(255,255,255,.2),0 1px 2px rgba(0,0,0,.05)}
.btn:hover,.btn:focus,.btn:active,.btn.active,.btn.disabled,.btn[disabled]{color:#333;background-color:#e6e6e6;*background-color:#d9d9d9}
.btn:active,.btn.active{background-color:#ccc \9}
.btn:first-child{*margin-left:0}
.btn:hover,.btn:focus{color:#333;text-decoration:none;background-position:0 -15px;-webkit-transition:background-position 0.1s linear;-moz-transition:background-position 0.1s linear;-o-transition:background-position 0.1s linear;transition:background-position 0.1s linear}
.btn:focus{outline:thin dotted #333;outline:5px auto -webkit-focus-ring-color;outline-offset:-2px}
.btn.active,.btn:active{background-image:none;outline:0;-webkit-box-shadow:inset 0 2px 4px rgba(0,0,0,.15),0 1px 2px rgba(0,0,0,.05);-moz-box-shadow:inset 0 2px 4px rgba(0,0,0,.15),0 1px 2px rgba(0,0,0,.05);box-shadow:inset 0 2px 4px rgba(0,0,0,.15),0 1px 2px rgba(0,0,0,.05)}
.btn.disabled,.btn[disabled]{cursor:default;background-image:none;opacity:0.65;filter:alpha(opacity=65);-webkit-box-shadow:none;-moz-box-shadow:none;box-shadow:none}
.btn-large{padding:11px 19px;font-size:17.5px;-webkit-border-radius:6px;-moz-border-radius:6px;border-radius:6px}
.btn-large [class^="icon-"],.btn-large [class*=" icon-"]{margin-top:4px}
.btn-small{padding:2px 10px;font-size:11.9px;-webkit-border-radius:3px;-moz-border-radius:3px;border-radius:3px}
.btn-small [class^="icon-"],.btn-small [class*=" icon-"]{margin-top:0}
.btn-mini [class^="icon-"],.btn-mini [class*=" icon-"]{margin-top:-1px}
.btn-mini{padding:0 6px;font-size:10.5px;-webkit-border-radius:3px;-moz-border-radius:3px;border-radius:3px}
.btn-block{display:block;width:100%;padding-left:0;padding-right:0;-webkit-box-sizing:border-box;-moz-box-sizing:border-box;box-sizing:border-box}
.btn-block+.btn-block{margin-top:5px}
input[type="submit"].btn-block,input[type="reset"].btn-block,input[type="button"].btn-block{width:100%}
.btn-primary.active,.btn-warning.active,.btn-danger.active,.btn-success.active,.btn-info.active,.btn-inverse.active{color:rgba(255,255,255,0.75)}
.btn-primary{color:#fff;text-shadow:0 -1px 0 rgba(0,0,0,0.25);background-image:-moz-linear-gradient(top,#08c,#04c);background-image:-webkit-gradient(linear,0 0,0 100%,from(#08c),to(#04c));background-image:-webkit-linear-gradient(top,#08c,#04c);background-image:-o-linear-gradient(top,#08c,#04c);background-image:linear-gradient(to bottom,#08c,#04c);background-repeat:repeat-x;filter:progid:DXImageTransform.Microsoft.gradient(startColorstr=''#f08cc'',endColorstr=''#f04cc'',GradientType=0);border-color:#04c #04c #002a80;border-color:rgba(0,0,0,0.1) rgba(0,0,0,0.1) rgba(0,0,0,0.25);*background-color:#04c;filter:progid:DXImageTransform.Microsoft.gradient(enabled = false)}
.btn-primary:hover,.btn-primary:focus,.btn-primary:active,.btn-primary.active,.btn-primary.disabled,.btn-primary[disabled]{color:#fff;background-color:#04c;*background-color:#003bb3}
.btn-primary:active,.btn-primary.active{background-color:#039 \9}
.btn-warning{color:#fff;text-shadow:0 -1px 0 rgba(0,0,0,0.25);background-color:#faa732;background-image:-moz-linear-gradient(top,#fbb450,#f89406);background-image:-webkit-gradient(linear,0 0,0 100%,from(#fbb450),to(#f89406));background-image:-webkit-linear-gradient(top,#fbb450,#f89406);background-image:-o-linear-gradient(top,#fbb450,#f89406);background-image:linear-gradient(to bottom,#fbb450,#f89406);background-repeat:repeat-x;filter:progid:DXImageTransform.Microsoft.gradient(startColorstr=''#fffbb450'',endColorstr=''#fff89406'',GradientType=0);border-color:#f89406 #f89406 #ad6704;border-color:rgba(0,0,0,0.1) rgba(0,0,0,0.1) rgba(0,0,0,0.25);*background-color:#f89406;filter:progid:DXImageTransform.Microsoft.gradient(enabled = false)}
.btn-warning:hover,.btn-warning:focus,.btn-warning:active,.btn-warning.active,.btn-warning.disabled,.btn-warning[disabled]{color:#fff;background-color:#f89406;*background-color:#df8505}
.btn-warning:active,.btn-warning.active{background-color:#c67605 \9}
.btn-danger{color:#fff;text-shadow:0 -1px 0 rgba(0,0,0,0.25);background-color:#da4f49;background-image:-moz-linear-gradient(top,#ee5f5b,#bd362f);background-image:-webkit-gradient(linear,0 0,0 100%,from(#ee5f5b),to(#bd362f));background-image:-webkit-linear-gradient(top,#ee5f5b,#bd362f);background-image:-o-linear-gradient(top,#ee5f5b,#bd362f);background-image:linear-gradient(to bottom,#ee5f5b,#bd362f);background-repeat:repeat-x;filter:progid:DXImageTransform.Microsoft.gradient(startColorstr=''#ffee5f5b'',endColorstr=''#ffbd362f'',GradientType=0);border-color:#bd362f #bd362f #802420;border-color:rgba(0,0,0,0.1) rgba(0,0,0,0.1) rgba(0,0,0,0.25);*background-color:#bd362f;filter:progid:DXImageTransform.Microsoft.gradient(enabled = false)}
.btn-danger:hover,.btn-danger:focus,.btn-danger:active,.btn-danger.active,.btn-danger.disabled,.btn-danger[disabled]{color:#fff;background-color:#bd362f;*background-color:#a9302a}
.btn-danger:active,.btn-danger.active{background-color:#942a25 \9}
.btn-success{color:#fff;text-shadow:0 -1px 0 rgba(0,0,0,0.25);background-color:#5bb75b;background-image:-moz-linear-gradient(top,#62c462,#51a351);background-image:-webkit-gradient(linear,0 0,0 100%,from(#62c462),to(#51a351));background-image:-webkit-linear-gradient(top,#62c462,#51a351);background-image:-o-linear-gradient(top,#62c462,#51a351);background-image:linear-gradient(to bottom,#62c462,#51a351);background-repeat:repeat-x;filter:progid:DXImageTransform.Microsoft.gradient(startColorstr=''#ff62c462'',endColorstr=''#ff51a351'',GradientType=0);border-color:#51a351 #51a351 #387038;border-color:rgba(0,0,0,0.1) rgba(0,0,0,0.1) rgba(0,0,0,0.25);*background-color:#51a351;filter:progid:DXImageTransform.Microsoft.gradient(enabled = false)}
.btn-success:hover,.btn-success:focus,.btn-success:active,.btn-success.active,.btn-success.disabled,.btn-success[disabled]{color:#fff;background-color:#51a351;*background-color:#499249}
.btn-success:active,.btn-success.active{background-color:#408140 \9}
.btn-info{color:#fff;text-shadow:0 -1px 0 rgba(0,0,0,0.25);background-color:#49afcd;background-image:-moz-linear-gradient(top,#5bc0de,#2f96b4);background-image:-webkit-gradient(linear,0 0,0 100%,from(#5bc0de),to(#2f96b4));background-image:-webkit-linear-gradient(top,#5bc0de,#2f96b4);background-image:-o-linear-gradient(top,#5bc0de,#2f96b4);background-image:linear-gradient(to bottom,#5bc0de,#2f96b4);background-repeat:repeat-x;filter:progid:DXImageTransform.Microsoft.gradient(startColorstr=''#ff5bc0de'',endColorstr=''#ff2f96b4'',GradientType=0);border-color:#2f96b4 #2f96b4 #1f6377;border-color:rgba(0,0,0,0.1) rgba(0,0,0,0.1) rgba(0,0,0,0.25);*background-color:#2f96b4;filter:progid:DXImageTransform.Microsoft.gradient(enabled = false)}
.btn-info:hover,.btn-info:focus,.btn-info:active,.btn-info.active,.btn-info.disabled,.btn-info[disabled]{color:#fff;background-color:#2f96b4;*background-color:#2a85a0}
.btn-info:active,.btn-info.active{background-color:#24748c \9}
.btn-inverse{color:#fff;text-shadow:0 -1px 0 rgba(0,0,0,0.25);background-color:#363636;background-image:-moz-linear-gradient(top,#444,#222);background-image:-webkit-gradient(linear,0 0,0 100%,from(#444),to(#222));background-image:-webkit-linear-gradient(top,#444,#222);background-image:-o-linear-gradient(top,#444,#222);background-image:linear-gradient(to bottom,#444,#222);background-repeat:repeat-x;filter:progid:DXImageTransform.Microsoft.gradient(startColorstr=''#f4444'',endColorstr=''#f2222'',GradientType=0);border-color:#222 #222 #000;border-color:rgba(0,0,0,0.1) rgba(0,0,0,0.1) rgba(0,0,0,0.25);*background-color:#222;filter:progid:DXImageTransform.Microsoft.gradient(enabled = false)}
.btn-inverse:hover,.btn-inverse:focus,.btn-inverse:active,.btn-inverse.active,.btn-inverse.disabled,.btn-inverse[disabled]{color:#fff;background-color:#222;*background-color:#151515}
.btn-inverse:active,.btn-inverse.active{background-color:#080808 \9}
button.btn,input[type="submit"].btn{*padding-top:3px;*padding-bottom:3px}
button.btn::-moz-focus-inner,input[type="submit"].btn::-moz-focus-inner{padding:0;border:0}
button.btn.btn-large,input[type="submit"].btn.btn-large{*padding-top:7px;*padding-bottom:7px}
button.btn.btn-small,input[type="submit"].btn.btn-small{*padding-top:3px;*padding-bottom:3px}
button.btn.btn-mini,input[type="submit"].btn.btn-mini{*padding-top:1px;*padding-bottom:1px}
.btn-link,.btn-link:active,.btn-link[disabled]{background-color:transparent;background-image:none;-webkit-box-shadow:none;-moz-box-shadow:none;box-shadow:none}
.btn-link{border-color:transparent;cursor:pointer;color:#08c;-webkit-border-radius:0;-moz-border-radius:0;border-radius:0}
.btn-link:hover,.btn-link:focus{color:#005580;text-decoration:underline;background-color:transparent}
.btn-link[disabled]:hover,.btn-link[disabled]:focus{color:#333;text-decoration:none}
.btn-group{position:relative;display:inline-block;*display:inline;*zoom:1;font-size:0;vertical-align:middle;white-space:nowrap;*margin-left:.3em}
.btn-group:first-child{*margin-left:0}
.btn-group+.btn-group{margin-left:5px}
.btn-toolbar{font-size:0;margin-top:10px;margin-bottom:10px}
.btn-toolbar>.btn+.btn,.btn-toolbar>.btn-group+.btn,.btn-toolbar>.btn+.btn-group{margin-left:5px}
.btn-group>.btn{position:relative;-webkit-border-radius:0;-moz-border-radius:0;border-radius:0}
.btn-group>.btn+.btn{margin-left:-1px}
.btn-group>.btn,.btn-group>.dropdown-menu,.btn-group>.popover{font-size:14px}
.btn-group>.btn-mini{font-size:10.5px}
.btn-group>.btn-small{font-size:11.9px}
.btn-group>.btn-large{font-size:17.5px}
.btn-group>.btn:first-child{margin-left:0;-webkit-border-top-left-radius:4px;-moz-border-radius-topleft:4px;border-top-left-radius:4px;-webkit-border-bottom-left-radius:4px;-moz-border-radius-bottomleft:4px;border-bottom-left-radius:4px}
.btn-group>.btn:last-child,.btn-group>.dropdown-toggle{-webkit-border-top-right-radius:4px;-moz-border-radius-topright:4px;border-top-right-radius:4px;-webkit-border-bottom-right-radius:4px;-moz-border-radius-bottomright:4px;border-bottom-right-radius:4px}
.btn-group>.btn.large:first-child{margin-left:0;-webkit-border-top-left-radius:6px;-moz-border-radius-topleft:6px;border-top-left-radius:6px;-webkit-border-bottom-left-radius:6px;-moz-border-radius-bottomleft:6px;border-bottom-left-radius:6px}
.btn-group>.btn.large:last-child,.btn-group>.large.dropdown-toggle{-webkit-border-top-right-radius:6px;-moz-border-radius-topright:6px;border-top-right-radius:6px;-webkit-border-bottom-right-radius:6px;-moz-border-radius-bottomright:6px;border-bottom-right-radius:6px}
.btn-group>.btn:hover,.btn-group>.btn:focus,.btn-group>.btn:active,.btn-group>.btn.active{z-index:2}
.btn-group .dropdown-toggle:active,.btn-group.open .dropdown-toggle{outline:0}
.btn-group>.btn+.dropdown-toggle{padding-left:8px;padding-right:8px;-webkit-box-shadow:inset 1px 0 0 rgba(255,255,255,.125),inset 0 1px 0 rgba(255,255,255,.2),0 1px 2px rgba(0,0,0,.05);-moz-box-shadow:inset 1px 0 0 rgba(255,255,255,.125),inset 0 1px 0 rgba(255,255,255,.2),0 1px 2px rgba(0,0,0,.05);box-shadow:inset 1px 0 0 rgba(255,255,255,.125),inset 0 1px 0 rgba(255,255,255,.2),0 1px 2px rgba(0,0,0,.05);*padding-top:5px;*padding-bottom:5px}
.btn-group>.btn-mini+.dropdown-toggle{padding-left:5px;padding-right:5px;*padding-top:2px;*padding-bottom:2px}
.btn-group>.btn-small+.dropdown-toggle{*padding-top:5px;*padding-bottom:4px}
.btn-group>.btn-large+.dropdown-toggle{padding-left:12px;padding-right:12px;*padding-top:7px;*padding-bottom:7px}
.btn-group.open .dropdown-toggle{background-image:none;-webkit-box-shadow:inset 0 2px 4px rgba(0,0,0,.15),0 1px 2px rgba(0,0,0,.05);-moz-box-shadow:inset 0 2px 4px rgba(0,0,0,.15),0 1px 2px rgba(0,0,0,.05);box-shadow:inset 0 2px 4px rgba(0,0,0,.15),0 1px 2px rgba(0,0,0,.05)}
.btn-group.open .btn.dropdown-toggle{background-color:#e6e6e6}
.btn-group.open .btn-primary.dropdown-toggle{background-color:#04c}
.btn-group.open .btn-warning.dropdown-toggle{background-color:#f89406}
.btn-group.open .btn-danger.dropdown-toggle{background-color:#bd362f}
.btn-group.open .btn-success.dropdown-toggle{background-color:#51a351}
.btn-group.open .btn-info.dropdown-toggle{background-color:#2f96b4}
.btn-group.open .btn-inverse.dropdown-toggle{background-color:#222}
.btn .caret{margin-top:8px;margin-left:0}
.btn-large .caret{margin-top:6px}
.btn-large .caret{border-left-width:5px;border-right-width:5px;border-top-width:5px}
.btn-mini .caret,.btn-small .caret{margin-top:8px}
.dropup .btn-large .caret{border-bottom-width:5px}
.btn-primary .caret,.btn-warning .caret,.btn-danger .caret,.btn-info .caret,.btn-success .caret,.btn-inverse .caret{border-top-color:#fff;border-bottom-color:#fff}
.btn-group-vertical{display:inline-block;*display:inline;*zoom:1}
.btn-group-vertical>.btn{display:block;float:none;max-width:100%;-webkit-border-radius:0;-moz-border-radius:0;border-radius:0}
.btn-group-vertical>.btn+.btn{margin-left:0;margin-top:-1px}
.btn-group-vertical>.btn:first-child{-webkit-border-radius:4px 4px 0 0;-moz-border-radius:4px 4px 0 0;border-radius:4px 4px 0 0}
.btn-group-vertical>.btn:last-child{-webkit-border-radius:0 0 4px 4px;-moz-border-radius:0 0 4px 4px;border-radius:0 0 4px 4px}
.btn-group-vertical>.btn-large:first-child{-webkit-border-radius:6px 6px 0 0;-moz-border-radius:6px 6px 0 0;border-radius:6px 6px 0 0}
.btn-group-vertical>.btn-large:last-child{-webkit-border-radius:0 0 6px 6px;-moz-border-radius:0 0 6px 6px;border-radius:0 0 6px 6px}
.nav{margin-left:0;margin-bottom:20px;list-style:none}
.nav>li>a{display:block}
.nav>li>a:hover,.nav>li>a:focus{text-decoration:none;background-color:#eee}
.nav>li>a>img{max-width:none}
.nav>.pull-right{float:right}
.nav-header{display:block;padding:3px 15px;font-size:11px;font-weight:bold;line-height:20px;color:#999;text-shadow:0 1px 0 rgba(255,255,255,0.5);text-transform:uppercase}
.nav li+.nav-header{margin-top:9px}
.nav-list{padding-left:15px;padding-right:15px;margin-bottom:0}
.nav-list>li>a,.nav-list .nav-header{margin-left:-15px;margin-right:-15px;text-shadow:0 1px 0 rgba(255,255,255,0.5)}
.nav-list>li>a{padding:3px 15px}
.nav-list>.active>a,.nav-list>.active>a:hover,.nav-list>.active>a:focus{color:#fff;text-shadow:0 -1px 0 rgba(0,0,0,0.2);background-color:#08c}
.nav-list [class^="icon-"],.nav-list [class*=" icon-"]{margin-right:2px}
.nav-list .divider{*width:100%;height:1px;margin:9px 1px;*margin:-5px 0 5px;overflow:hidden;background-color:#e5e5e5;border-bottom:1px solid #fff}
.nav-tabs,.nav-pills{*zoom:1}
.nav-tabs:before,.nav-pills:before,.nav-tabs:after,.nav-pills:after{display:table;content:"";line-height:0}
.nav-tabs:after,.nav-pills:after{clear:both}
.nav-tabs>li,.nav-pills>li{float:left}
.nav-tabs>li>a,.nav-pills>li>a{padding-right:12px;padding-left:12px;margin-right:2px;line-height:14px}
.nav-tabs{border-bottom:1px solid #ddd}
.nav-tabs>li{margin-bottom:-1px}
.nav-tabs>li>a{padding-top:8px;padding-bottom:8px;line-height:20px;border:1px solid transparent;-webkit-border-radius:4px 4px 0 0;-moz-border-radius:4px 4px 0 0;border-radius:4px 4px 0 0}
.nav-tabs>li>a:hover,.nav-tabs>li>a:focus{border-color:#eee #eee #ddd}
.nav-tabs>.active>a,.nav-tabs>.active>a:hover,.nav-tabs>.active>a:focus{color:#555;background-color:#fff;border:1px solid #ddd;border-bottom-color:transparent;cursor:default}
.nav-pills>li>a{padding-top:8px;padding-bottom:8px;margin-top:2px;margin-bottom:2px;-webkit-border-radius:5px;-moz-border-radius:5px;border-radius:5px}
.nav-pills>.active>a,.nav-pills>.active>a:hover,.nav-pills>.active>a:focus{color:#fff;background-color:#08c}
.nav-stacked>li{float:none}
.nav-stacked>li>a{margin-right:0}
.nav-tabs.nav-stacked{border-bottom:0}
.nav-tabs.nav-stacked>li>a{border:1px solid #ddd;-webkit-border-radius:0;-moz-border-radius:0;border-radius:0}
.nav-tabs.nav-stacked>li:first-child>a{-webkit-border-top-right-radius:4px;-moz-border-radius-topright:4px;border-top-right-radius:4px;-webkit-border-top-left-radius:4px;-moz-border-radius-topleft:4px;border-top-left-radius:4px}
.nav-tabs.nav-stacked>li:last-child>a{-webkit-border-bottom-right-radius:4px;-moz-border-radius-bottomright:4px;border-bottom-right-radius:4px;-webkit-border-bottom-left-radius:4px;-moz-border-radius-bottomleft:4px;border-bottom-left-radius:4px}
.nav-tabs.nav-stacked>li>a:hover,.nav-tabs.nav-stacked>li>a:focus{border-color:#ddd;z-index:2}
.nav-pills.nav-stacked>li>a{margin-bottom:3px}
.nav-pills.nav-stacked>li:last-child>a{margin-bottom:1px}
.nav-tabs .dropdown-menu{-webkit-border-radius:0 0 6px 6px;-moz-border-radius:0 0 6px 6px;border-radius:0 0 6px 6px}
.nav-pills .dropdown-menu{-webkit-border-radius:6px;-moz-border-radius:6px;border-radius:6px}
.nav .dropdown-toggle .caret{border-top-color:#08c;border-bottom-color:#08c;margin-top:6px}
.nav .dropdown-toggle:hover .caret,.nav .dropdown-toggle:focus .caret{border-top-color:#005580;border-bottom-color:#005580}
.nav-tabs .dropdown-toggle .caret{margin-top:8px}
.nav .active .dropdown-toggle .caret{border-top-color:#fff;border-bottom-color:#fff}
.nav-tabs .active .dropdown-toggle .caret{border-top-color:#555;border-bottom-color:#555}
.nav>.dropdown.active>a:hover,.nav>.dropdown.active>a:focus{cursor:pointer}
.nav-tabs .open .dropdown-toggle,.nav-pills .open .dropdown-toggle,.nav>li.dropdown.open.active>a:hover,.nav>li.dropdown.open.active>a:focus{color:#fff;background-color:#999;border-color:#999}
.nav li.dropdown.open .caret,.nav li.dropdown.open.active .caret,.nav li.dropdown.open a:hover .caret,.nav li.dropdown.open a:focus .caret{border-top-color:#fff;border-bottom-color:#fff;opacity:1;filter:alpha(opacity=100)}
.tabs-stacked .open>a:hover,.tabs-stacked .open>a:focus{border-color:#999}
.tabbable{*zoom:1}
.tabbable:before,.tabbable:after{display:table;content:"";line-height:0}
.tabbable:after{clear:both}
.tab-content{overflow:auto}
.tabs-below>.nav-tabs,.tabs-right>.nav-tabs,.tabs-left>.nav-tabs{border-bottom:0}
.tab-content>.tab-pane,.pill-content>.pill-pane{display:none}
.tab-content>.active,.pill-content>.active{display:block}
.tabs-below>.nav-tabs{border-top:1px solid #ddd}
.tabs-below>.nav-tabs>li{margin-top:-1px;margin-bottom:0}
.tabs-below>.nav-tabs>li>a{-webkit-border-radius:0 0 4px 4px;-moz-border-radius:0 0 4px 4px;border-radius:0 0 4px 4px}
.tabs-below>.nav-tabs>li>a:hover,.tabs-below>.nav-tabs>li>a:focus{border-bottom-color:transparent;border-top-color:#ddd}
.tabs-below>.nav-tabs>.active>a,.tabs-below>.nav-tabs>.active>a:hover,.tabs-below>.nav-tabs>.active>a:focus{border-color:transparent #ddd #ddd #ddd}
.tabs-left>.nav-tabs>li,.tabs-right>.nav-tabs>li{float:none}
.tabs-left>.nav-tabs>li>a,.tabs-right>.nav-tabs>li>a{min-width:74px;margin-right:0;margin-bottom:3px}
.tabs-left>.nav-tabs{float:left;margin-right:19px;border-right:1px solid #ddd}
.tabs-left>.nav-tabs>li>a{margin-right:-1px;-webkit-border-radius:4px 0 0 4px;-moz-border-radius:4px 0 0 4px;border-radius:4px 0 0 4px}
.tabs-left>.nav-tabs>li>a:hover,.tabs-left>.nav-tabs>li>a:focus{border-color:#eee #ddd #eee #eee}
.tabs-left>.nav-tabs .active>a,.tabs-left>.nav-tabs .active>a:hover,.tabs-left>.nav-tabs .active>a:focus{border-color:#ddd transparent #ddd #ddd;*border-right-color:#fff}
.tabs-right>.nav-tabs{float:right;margin-left:19px;border-left:1px solid #ddd}
.tabs-right>.nav-tabs>li>a{margin-left:-1px;-webkit-border-radius:0 4px 4px 0;-moz-border-radius:0 4px 4px 0;border-radius:0 4px 4px 0}
.tabs-right>.nav-tabs>li>a:hover,.tabs-right>.nav-tabs>li>a:focus{border-color:#eee #eee #eee #ddd}
.tabs-right>.nav-tabs .active>a,.tabs-right>.nav-tabs .active>a:hover,.tabs-right>.nav-tabs .active>a:focus{border-color:#ddd #ddd #ddd transparent;*border-left-color:#fff}
.nav>.disabled>a{color:#999}
.nav>.disabled>a:hover,.nav>.disabled>a:focus{text-decoration:none;background-color:transparent;cursor:default}
.navbar{overflow:visible;margin-bottom:20px;*position:relative;*z-index:2}
.navbar-inner{min-height:40px;padding-left:20px;padding-right:20px;background-color:#fafafa;background-image:-moz-linear-gradient(top,#fff,#f2f2f2);background-image:-webkit-gradient(linear,0 0,0 100%,from(#fff),to(#f2f2f2));background-image:-webkit-linear-gradient(top,#fff,#f2f2f2);background-image:-o-linear-gradient(top,#fff,#f2f2f2);background-image:linear-gradient(to bottom,#fff,#f2f2f2);background-repeat:repeat-x;filter:progid:DXImageTransform.Microsoft.gradient(startColorstr=''#fffff'',endColorstr=''#fff2f2f2'',GradientType=0);border:1px solid #d4d4d4;-webkit-border-radius:4px;-moz-border-radius:4px;border-radius:4px;-webkit-box-shadow:0 1px 4px rgba(0,0,0,0.065);-moz-box-shadow:0 1px 4px rgba(0,0,0,0.065);box-shadow:0 1px 4px rgba(0,0,0,0.065);*zoom:1}
.navbar-inner:before,.navbar-inner:after{display:table;content:"";line-height:0}
.navbar-inner:after{clear:both}
.navbar .container{width:auto}
.nav-collapse.collapse{height:auto;overflow:visible}
.navbar .brand{float:left;display:block;padding:10px 20px 10px;margin-left:-20px;font-size:20px;font-weight:200;color:#777;text-shadow:0 1px 0 #fff}
.navbar .brand:hover,.navbar .brand:focus{text-decoration:none}
.navbar-text{margin-bottom:0;line-height:40px;color:#777}
.navbar-link{color:#777}
.navbar-link:hover,.navbar-link:focus{color:#333}
.navbar .divider-vertical{height:40px;margin:0 9px;border-left:1px solid #f2f2f2;border-right:1px solid #fff}
.navbar .btn,.navbar .btn-group{margin-top:5px}
.navbar .btn-group .btn,.navbar .input-prepend .btn,.navbar .input-append .btn,.navbar .input-prepend .btn-group,.navbar .input-append .btn-group{margin-top:0}
.navbar-form{margin-bottom:0;*zoom:1}
.navbar-form:before,.navbar-form:after{display:table;content:"";line-height:0}
.navbar-form:after{clear:both}
.navbar-form input,.navbar-form select,.navbar-form .radio,.navbar-form .checkbox{margin-top:5px}
.navbar-form input,.navbar-form select,.navbar-form .btn{display:inline-block;margin-bottom:0}
.navbar-form input[type="image"],.navbar-form input[type="checkbox"],.navbar-form input[type="radio"]{margin-top:3px}
.navbar-form .input-append,.navbar-form .input-prepend{margin-top:5px;white-space:nowrap}
.navbar-form .input-append input,.navbar-form .input-prepend input{margin-top:0}
.navbar-static-top{position:static;margin-bottom:0}
.navbar-static-top .navbar-inner{-webkit-border-radius:0;-moz-border-radius:0;border-radius:0}
.navbar-fixed-top,.navbar-fixed-bottom{position:fixed;right:0;left:0;z-index:1030;margin-bottom:0}
.navbar-fixed-top .navbar-inner,.navbar-static-top .navbar-inner{border-width:0 0 1px}
.navbar-fixed-bottom .navbar-inner{border-width:1px 0 0}
.navbar-fixed-top .navbar-inner,.navbar-fixed-bottom .navbar-inner{padding-left:0;padding-right:0;-webkit-border-radius:0;-moz-border-radius:0;border-radius:0}
.navbar-static-top .container,.navbar-fixed-top .container,.navbar-fixed-bottom .container{width:940px}
.navbar-fixed-top{top:0}
.navbar-fixed-top .navbar-inner,.navbar-static-top .navbar-inner{-webkit-box-shadow:0 1px 10px rgba(0,0,0,.1);-moz-box-shadow:0 1px 10px rgba(0,0,0,.1);box-shadow:0 1px 10px rgba(0,0,0,.1)}
.navbar-fixed-bottom{bottom:0}
.navbar-fixed-bottom .navbar-inner{-webkit-box-shadow:0 -1px 10px rgba(0,0,0,.1);-moz-box-shadow:0 -1px 10px rgba(0,0,0,.1);box-shadow:0 -1px 10px rgba(0,0,0,.1)}
.navbar .nav{position:relative;left:0;display:block;float:right;margin:0 10px 0 0}
.navbar .nav.pull-right{float:right;margin-right:0}
.navbar .nav>li{float:left}
.navbar .nav>li>a{float:none;padding:10px 15px 10px;color:#777;text-decoration:none;text-shadow:0 1px 0 #fff}
.navbar .nav .dropdown-toggle .caret{margin-top:8px}
.navbar .nav>li>a:focus,.navbar .nav>li>a:hover{background-color:transparent;color:#333;text-decoration:none}
.navbar .nav>.active>a,.navbar .nav>.active>a:hover,.navbar .nav>.active>a:focus{color:#555;text-decoration:none;background-color:#e5e5e5;-webkit-box-shadow:inset 0 3px 8px rgba(0,0,0,0.125);-moz-box-shadow:inset 0 3px 8px rgba(0,0,0,0.125);box-shadow:inset 0 3px 8px rgba(0,0,0,0.125)}
.navbar .btn-navbar{display:none;float:right;padding:7px 10px;margin-left:5px;margin-right:5px;color:#fff;}
.navbar .nav>li>.dropdown-menu:before{content:'''';display:inline-block;border-left:7px solid transparent;border-right:7px solid transparent;border-bottom:7px solid #ccc;border-bottom-color:rgba(0,0,0,0.2);position:absolute;top:-7px;left:9px}
.navbar .nav>li>.dropdown-menu:after{content:'''';display:inline-block;border-left:6px solid transparent;border-right:6px solid transparent;border-bottom:6px solid #fff;position:absolute;top:-6px;left:10px}
.navbar-fixed-bottom .nav>li>.dropdown-menu:before{border-top:7px solid #ccc;border-top-color:rgba(0,0,0,0.2);border-bottom:0;bottom:-7px;top:auto}
.navbar-fixed-bottom .nav>li>.dropdown-menu:after{border-top:6px solid #fff;border-bottom:0;bottom:-6px;top:auto}
.navbar .nav li.dropdown>a:hover .caret,.navbar .nav li.dropdown>a:focus .caret{border-top-color:#333;border-bottom-color:#333}
.navbar .nav li.dropdown.open>.dropdown-toggle,.navbar .nav li.dropdown.active>.dropdown-toggle,.navbar .nav li.dropdown.open.active>.dropdown-toggle{background-color:#e5e5e5;color:#555}
.navbar .nav li.dropdown>.dropdown-toggle .caret{border-top-color:#777;border-bottom-color:#777}
.navbar .nav li.dropdown.open>.dropdown-toggle .caret,.navbar .nav li.dropdown.active>.dropdown-toggle .caret,.navbar .nav li.dropdown.open.active>.dropdown-toggle .caret{border-top-color:#555;border-bottom-color:#555}
.navbar .pull-right>li>.dropdown-menu,.navbar .nav>li>.dropdown-menu.pull-right{left:auto;right:0}
.navbar .pull-right>li>.dropdown-menu:before,.navbar .nav>li>.dropdown-menu.pull-right:before{left:auto;right:12px}
.navbar .pull-right>li>.dropdown-menu:after,.navbar .nav>li>.dropdown-menu.pull-right:after{left:auto;right:13px}
.navbar .pull-right>li>.dropdown-menu .dropdown-menu,.navbar .nav>li>.dropdown-menu.pull-right .dropdown-menu{left:auto;right:100%;margin-left:0;margin-right:-1px;-webkit-border-radius:6px 0 6px 6px;-moz-border-radius:6px 0 6px 6px;border-radius:6px 0 6px 6px}
.navbar-inverse .navbar-inner{background-color:#1b1b1b;background-image:-moz-linear-gradient(top,#222,#111);background-image:-webkit-gradient(linear,0 0,0 100%,from(#222),to(#111));background-image:-webkit-linear-gradient(top,#222,#111);background-image:-o-linear-gradient(top,#222,#111);background-image:linear-gradient(to bottom,#222,#111);background-repeat:repeat-x;filter:progid:DXImageTransform.Microsoft.gradient(startColorstr=''#f2222'',endColorstr=''#f1111'',GradientType=0);border-color:#252525}
.navbar-inverse .brand,.navbar-inverse .nav>li>a{color:#999;text-shadow:0 -1px 0 rgba(0,0,0,0.25)}
.navbar-inverse .brand:hover,.navbar-inverse .nav>li>a:hover,.navbar-inverse .brand:focus,.navbar-inverse .nav>li>a:focus{color:#fff}
.navbar-inverse .brand{color:#999}
.navbar-inverse .navbar-text{color:#999}
.navbar-inverse .nav>li>a:focus,.navbar-inverse .nav>li>a:hover{background-color:transparent;color:#fff}
.navbar-inverse .nav .active>a,.navbar-inverse .nav .active>a:hover,.navbar-inverse .nav .active>a:focus{color:#fff;background-color:#111}
.navbar-inverse .navbar-link{color:#999}
.navbar-inverse .navbar-link:hover,.navbar-inverse .navbar-link:focus{color:#fff}
.navbar-inverse .divider-vertical{border-left-color:#111;border-right-color:#222}
.navbar-inverse .nav li.dropdown.open>.dropdown-toggle,.navbar-inverse .nav li.dropdown.active>.dropdown-toggle,.navbar-inverse .nav li.dropdown.open.active>.dropdown-toggle{background-color:#111;color:#fff}
.navbar-inverse .nav li.dropdown>a:hover .caret,.navbar-inverse .nav li.dropdown>a:focus .caret{border-top-color:#fff;border-bottom-color:#fff}
.navbar-inverse .nav li.dropdown>.dropdown-toggle .caret{border-top-color:#999;border-bottom-color:#999}
.navbar-inverse .nav li.dropdown.open>.dropdown-toggle .caret,.navbar-inverse .nav li.dropdown.active>.dropdown-toggle .caret,.navbar-inverse .nav li.dropdown.open.active>.dropdown-toggle .caret{border-top-color:#fff;border-bottom-color:#fff}
.breadcrumb{padding:8px 15px;margin:0 0 20px;list-style:none;background-color:#f5f5f5;-webkit-border-radius:4px;-moz-border-radius:4px;border-radius:4px}
.breadcrumb>li{display:inline-block;*display:inline;*zoom:1;text-shadow:0 1px 0 #fff}
.breadcrumb>li>.divider{padding:0 5px;color:#ccc}
.breadcrumb>.active{color:#999}
.pagination{margin:20px 0}
.pagination ul{display:inline-block;*display:inline;*zoom:1;margin-left:0;margin-bottom:0;-webkit-border-radius:4px;-moz-border-radius:4px;border-radius:4px;-webkit-box-shadow:0 1px 2px rgba(0,0,0,0.05);-moz-box-shadow:0 1px 2px rgba(0,0,0,0.05);box-shadow:0 1px 2px rgba(0,0,0,0.05)}
.pagination ul>li{display:inline}
.pagination ul>li>a,.pagination ul>li>span{float:left;padding:4px 12px;line-height:20px;text-decoration:none;background-color:#fff;border:1px solid #ddd;border-left-width:0}
.pagination ul>li>a:hover,.pagination ul>li>a:focus,.pagination ul>.active>a,.pagination ul>.active>span{background-color:#f5f5f5}
.pagination ul>.active>a,.pagination ul>.active>span{color:#999;cursor:default}
.pagination ul>.disabled>span,.pagination ul>.disabled>a,.pagination ul>.disabled>a:hover,.pagination ul>.disabled>a:focus{color:#999;background-color:transparent;cursor:default}
.pagination ul>li:first-child>a,.pagination ul>li:first-child>span{border-left-width:1px;-webkit-border-top-left-radius:4px;-moz-border-radius-topleft:4px;border-top-left-radius:4px;-webkit-border-bottom-left-radius:4px;-moz-border-radius-bottomleft:4px;border-bottom-left-radius:4px}
.pagination ul>li:last-child>a,.pagination ul>li:last-child>span{-webkit-border-top-right-radius:4px;-moz-border-radius-topright:4px;border-top-right-radius:4px;-webkit-border-bottom-right-radius:4px;-moz-border-radius-bottomright:4px;border-bottom-right-radius:4px}
.pagination-centered{text-align:center}
.pagination-right{text-align:right}
.pagination-large ul>li>a,.pagination-large ul>li>span{padding:11px 19px;font-size:17.5px}
.pagination-large ul>li:first-child>a,.pagination-large ul>li:first-child>span{-webkit-border-top-left-radius:6px;-moz-border-radius-topleft:6px;border-top-left-radius:6px;-webkit-border-bottom-left-radius:6px;-moz-border-radius-bottomleft:6px;border-bottom-left-radius:6px}
.pagination-large ul>li:last-child>a,.pagination-large ul>li:last-child>span{-webkit-border-top-right-radius:6px;-moz-border-radius-topright:6px;border-top-right-radius:6px;-webkit-border-bottom-right-radius:6px;-moz-border-radius-bottomright:6px;border-bottom-right-radius:6px}
.pagination-mini ul>li:first-child>a,.pagination-small ul>li:first-child>a,.pagination-mini ul>li:first-child>span,.pagination-small ul>li:first-child>span{-webkit-border-top-left-radius:3px;-moz-border-radius-topleft:3px;border-top-left-radius:3px;-webkit-border-bottom-left-radius:3px;-moz-border-radius-bottomleft:3px;border-bottom-left-radius:3px}
.pagination-mini ul>li:last-child>a,.pagination-small ul>li:last-child>a,.pagination-mini ul>li:last-child>span,.pagination-small ul>li:last-child>span{-webkit-border-top-right-radius:3px;-moz-border-radius-topright:3px;border-top-right-radius:3px;-webkit-border-bottom-right-radius:3px;-moz-border-radius-bottomright:3px;border-bottom-right-radius:3px}
.pagination-small ul>li>a,.pagination-small ul>li>span{padding:2px 10px;font-size:11.9px}
.pagination-mini ul>li>a,.pagination-mini ul>li>span{padding:0 6px;font-size:10.5px}
.pager{margin:20px 0;list-style:none;text-align:center;*zoom:1}
.pager:before,.pager:after{display:table;content:"";line-height:0}
.pager:after{clear:both}
.pager li{display:inline}
.pager li>a,.pager li>span{display:inline-block;padding:5px 14px;background-color:#fff;border:1px solid #ddd;-webkit-border-radius:15px;-moz-border-radius:15px;border-radius:15px}
.pager li>a:hover,.pager li>a:focus{text-decoration:none;background-color:#f5f5f5}
.pager .next>a,.pager .next>span{float:right}
.pager .previous>a,.pager .previous>span{float:left}
.pager .disabled>a,.pager .disabled>a:hover,.pager .disabled>a:focus,.pager .disabled>span{color:#999;background-color:#fff;cursor:default}
.thumbnails{margin-left:-20px;list-style:none;*zoom:1}
.thumbnails:before,.thumbnails:after{display:table;content:"";line-height:0}
.thumbnails:after{clear:both}
.row-fluid .thumbnails{margin-left:0}
.thumbnails>li{float:left;margin-bottom:20px;margin-left:20px}
.thumbnail{display:block;padding:4px;line-height:20px;border:1px solid #ddd;-webkit-border-radius:4px;-moz-border-radius:4px;border-radius:4px;-webkit-box-shadow:0 1px 3px rgba(0,0,0,0.055);-moz-box-shadow:0 1px 3px rgba(0,0,0,0.055);box-shadow:0 1px 3px rgba(0,0,0,0.055);-webkit-transition:all 0.2s ease-in-out;-moz-transition:all 0.2s ease-in-out;-o-transition:all 0.2s ease-in-out;transition:all 0.2s ease-in-out}
a.thumbnail:hover,a.thumbnail:focus{border-color:#08c;-webkit-box-shadow:0 1px 4px rgba(0,105,214,0.25);-moz-box-shadow:0 1px 4px rgba(0,105,214,0.25);box-shadow:0 1px 4px rgba(0,105,214,0.25)}
.thumbnail>img{display:block;max-width:100%;margin-left:auto;margin-right:auto}
.thumbnail .caption{padding:9px;color:#555}
.alert{padding:8px 35px 8px 14px;margin-bottom:20px;text-shadow:0 1px 0 rgba(255,255,255,0.5);background-color:#fcf8e3;border:1px solid #fbeed5;-webkit-border-radius:4px;-moz-border-radius:4px;border-radius:4px}
.alert,.alert h4{color:#c09853}
.alert h4{margin:0}
.alert .close{position:relative;top:-2px;right:-21px;line-height:20px}
.alert-success{background-color:#dff0d8;border-color:#d6e9c6;color:#468847}
.alert-success h4{color:#468847}
.alert-danger,.alert-error{background-color:#f2dede;border-color:#eed3d7;color:#b94a48}
.alert-danger h4,.alert-error h4{color:#b94a48}
.alert-info{background-color:#d9edf7;border-color:#bce8f1;color:#3a87ad}
.alert-info h4{color:#3a87ad}
.alert-block{padding-top:14px;padding-bottom:14px}
.alert-block>p,.alert-block>ul{margin-bottom:0}
.alert-block p+p{margin-top:5px}
@-webkit-keyframes progress-bar-stripes{from{background-position:40px 0}
to{background-position:0 0}
}
@-moz-keyframes progress-bar-stripes{from{background-position:40px 0}
to{background-position:0 0}
}
@-ms-keyframes progress-bar-stripes{from{background-position:40px 0}
to{background-position:0 0}
}
@-o-keyframes progress-bar-stripes{from{background-position:0 0}
to{background-position:40px 0}
}
@keyframes progress-bar-stripes{from{background-position:40px 0}
to{background-position:0 0}
}
.progress{overflow:hidden;height:20px;margin-bottom:20px;background-color:#f7f7f7;background-image:-moz-linear-gradient(top,#f5f5f5,#f9f9f9);background-image:-webkit-gradient(linear,0 0,0 100%,from(#f5f5f5),to(#f9f9f9));background-image:-webkit-linear-gradient(top,#f5f5f5,#f9f9f9);background-image:-o-linear-gradient(top,#f5f5f5,#f9f9f9);background-image:linear-gradient(to bottom,#f5f5f5,#f9f9f9);background-repeat:repeat-x;filter:progid:DXImageTransform.Microsoft.gradient(startColorstr=''#fff5f5f5'',endColorstr=''#fff9f9f9'',GradientType=0);-webkit-box-shadow:inset 0 1px 2px rgba(0,0,0,0.1);-moz-box-shadow:inset 0 1px 2px rgba(0,0,0,0.1);box-shadow:inset 0 1px 2px rgba(0,0,0,0.1);-webkit-border-radius:4px;-moz-border-radius:4px;border-radius:4px}
.progress .bar{width:0%;height:100%;color:#fff;float:left;font-size:12px;text-align:center;text-shadow:0 -1px 0 rgba(0,0,0,0.25);background-color:#0e90d2;background-image:-moz-linear-gradient(top,#149bdf,#0480be);background-image:-webkit-gradient(linear,0 0,0 100%,from(#149bdf),to(#0480be));background-image:-webkit-linear-gradient(top,#149bdf,#0480be);background-image:-o-linear-gradient(top,#149bdf,#0480be);background-image:linear-gradient(to bottom,#149bdf,#0480be);background-repeat:repeat-x;filter:progid:DXImageTransform.Microsoft.gradient(startColorstr=''#ff149bdf'',endColorstr=''#ff0480be'',GradientType=0);-webkit-box-shadow:inset 0 -1px 0 rgba(0,0,0,0.15);-moz-box-shadow:inset 0 -1px 0 rgba(0,0,0,0.15);box-shadow:inset 0 -1px 0 rgba(0,0,0,0.15);-webkit-box-sizing:border-box;-moz-box-sizing:border-box;box-sizing:border-box;-webkit-transition:width 0.6s ease;-moz-transition:width 0.6s ease;-o-transition:width 0.6s ease;transition:width 0.6s ease}
.progress .bar+.bar{-webkit-box-shadow:inset 1px 0 0 rgba(0,0,0,.15),inset 0 -1px 0 rgba(0,0,0,.15);-moz-box-shadow:inset 1px 0 0 rgba(0,0,0,.15),inset 0 -1px 0 rgba(0,0,0,.15);box-shadow:inset 1px 0 0 rgba(0,0,0,.15),inset 0 -1px 0 rgba(0,0,0,.15)}
.progress-striped .bar{background-color:#149bdf;background-image:-webkit-gradient(linear,0 100%,100% 0,color-stop(0.25,rgba(255,255,255,0.15)),color-stop(0.25,transparent),color-stop(0.5,transparent),color-stop(0.5,rgba(255,255,255,0.15)),color-stop(0.75,rgba(255,255,255,0.15)),color-stop(0.75,transparent),to(transparent));background-image:-webkit-linear-gradient(45deg,rgba(255,255,255,0.15) 25%,transparent 25%,transparent 50%,rgba(255,255,255,0.15) 50%,rgba(255,255,255,0.15) 75%,transparent 75%,transparent);background-image:-moz-linear-gradient(45deg,rgba(255,255,255,0.15) 25%,transparent 25%,transparent 50%,rgba(255,255,255,0.15) 50%,rgba(255,255,255,0.15) 75%,transparent 75%,transparent);background-image:-o-linear-gradient(45deg,rgba(255,255,255,0.15) 25%,transparent 25%,transparent 50%,rgba(255,255,255,0.15) 50%,rgba(255,255,255,0.15) 75%,transparent 75%,transparent);background-image:linear-gradient(45deg,rgba(255,255,255,0.15) 25%,transparent 25%,transparent 50%,rgba(255,255,255,0.15) 50%,rgba(255,255,255,0.15) 75%,transparent 75%,transparent);-webkit-background-size:40px 40px;-moz-background-size:40px 40px;-o-background-size:40px 40px;background-size:40px 40px}
.progress.active .bar{-webkit-animation:progress-bar-stripes 2s linear infinite;-moz-animation:progress-bar-stripes 2s linear infinite;-ms-animation:progress-bar-stripes 2s linear infinite;-o-animation:progress-bar-stripes 2s linear infinite;animation:progress-bar-stripes 2s linear infinite}
.progress-danger .bar,.progress .bar-danger{background-color:#dd514c;background-image:-moz-linear-gradient(top,#ee5f5b,#c43c35);background-image:-webkit-gradient(linear,0 0,0 100%,from(#ee5f5b),to(#c43c35));background-image:-webkit-linear-gradient(top,#ee5f5b,#c43c35);background-image:-o-linear-gradient(top,#ee5f5b,#c43c35);background-image:linear-gradient(to bottom,#ee5f5b,#c43c35);background-repeat:repeat-x;filter:progid:DXImageTransform.Microsoft.gradient(startColorstr=''#ffee5f5b'',endColorstr=''#ffc43c35'',GradientType=0)}
.progress-danger.progress-striped .bar,.progress-striped .bar-danger{background-color:#ee5f5b;background-image:-webkit-gradient(linear,0 100%,100% 0,color-stop(0.25,rgba(255,255,255,0.15)),color-stop(0.25,transparent),color-stop(0.5,transparent),color-stop(0.5,rgba(255,255,255,0.15)),color-stop(0.75,rgba(255,255,255,0.15)),color-stop(0.75,transparent),to(transparent));background-image:-webkit-linear-gradient(45deg,rgba(255,255,255,0.15) 25%,transparent 25%,transparent 50%,rgba(255,255,255,0.15) 50%,rgba(255,255,255,0.15) 75%,transparent 75%,transparent);background-image:-moz-linear-gradient(45deg,rgba(255,255,255,0.15) 25%,transparent 25%,transparent 50%,rgba(255,255,255,0.15) 50%,rgba(255,255,255,0.15) 75%,transparent 75%,transparent);background-image:-o-linear-gradient(45deg,rgba(255,255,255,0.15) 25%,transparent 25%,transparent 50%,rgba(255,255,255,0.15) 50%,rgba(255,255,255,0.15) 75%,transparent 75%,transparent);background-image:linear-gradient(45deg,rgba(255,255,255,0.15) 25%,transparent 25%,transparent 50%,rgba(255,255,255,0.15) 50%,rgba(255,255,255,0.15) 75%,transparent 75%,transparent)}
.progress-success .bar,.progress .bar-success{background-color:#5eb95e;background-image:-moz-linear-gradient(top,#62c462,#57a957);background-image:-webkit-gradient(linear,0 0,0 100%,from(#62c462),to(#57a957));background-image:-webkit-linear-gradient(top,#62c462,#57a957);background-image:-o-linear-gradient(top,#62c462,#57a957);background-image:linear-gradient(to bottom,#62c462,#57a957);background-repeat:repeat-x;filter:progid:DXImageTransform.Microsoft.gradient(startColorstr=''#ff62c462'',endColorstr=''#ff57a957'',GradientType=0)}
.progress-success.progress-striped .bar,.progress-striped .bar-success{background-color:#62c462;background-image:-webkit-gradient(linear,0 100%,100% 0,color-stop(0.25,rgba(255,255,255,0.15)),color-stop(0.25,transparent),color-stop(0.5,transparent),color-stop(0.5,rgba(255,255,255,0.15)),color-stop(0.75,rgba(255,255,255,0.15)),color-stop(0.75,transparent),to(transparent));background-image:-webkit-linear-gradient(45deg,rgba(255,255,255,0.15) 25%,transparent 25%,transparent 50%,rgba(255,255,255,0.15) 50%,rgba(255,255,255,0.15) 75%,transparent 75%,transparent);background-image:-moz-linear-gradient(45deg,rgba(255,255,255,0.15) 25%,transparent 25%,transparent 50%,rgba(255,255,255,0.15) 50%,rgba(255,255,255,0.15) 75%,transparent 75%,transparent);background-image:-o-linear-gradient(45deg,rgba(255,255,255,0.15) 25%,transparent 25%,transparent 50%,rgba(255,255,255,0.15) 50%,rgba(255,255,255,0.15) 75%,transparent 75%,transparent);background-image:linear-gradient(45deg,rgba(255,255,255,0.15) 25%,transparent 25%,transparent 50%,rgba(255,255,255,0.15) 50%,rgba(255,255,255,0.15) 75%,transparent 75%,transparent)}
.progress-info .bar,.progress .bar-info{background-color:#4bb1cf;background-image:-moz-linear-gradient(top,#5bc0de,#339bb9);background-image:-webkit-gradient(linear,0 0,0 100%,from(#5bc0de),to(#339bb9));background-image:-webkit-linear-gradient(top,#5bc0de,#339bb9);background-image:-o-linear-gradient(top,#5bc0de,#339bb9);background-image:linear-gradient(to bottom,#5bc0de,#339bb9);background-repeat:repeat-x;filter:progid:DXImageTransform.Microsoft.gradient(startColorstr=''#ff5bc0de'',endColorstr=''#ff339bb9'',GradientType=0)}
.progress-info.progress-striped .bar,.progress-striped .bar-info{background-color:#5bc0de;background-image:-webkit-gradient(linear,0 100%,100% 0,color-stop(0.25,rgba(255,255,255,0.15)),color-stop(0.25,transparent),color-stop(0.5,transparent),color-stop(0.5,rgba(255,255,255,0.15)),color-stop(0.75,rgba(255,255,255,0.15)),color-stop(0.75,transparent),to(transparent));background-image:-webkit-linear-gradient(45deg,rgba(255,255,255,0.15) 25%,transparent 25%,transparent 50%,rgba(255,255,255,0.15) 50%,rgba(255,255,255,0.15) 75%,transparent 75%,transparent);background-image:-moz-linear-gradient(45deg,rgba(255,255,255,0.15) 25%,transparent 25%,transparent 50%,rgba(255,255,255,0.15) 50%,rgba(255,255,255,0.15) 75%,transparent 75%,transparent);background-image:-o-linear-gradient(45deg,rgba(255,255,255,0.15) 25%,transparent 25%,transparent 50%,rgba(255,255,255,0.15) 50%,rgba(255,255,255,0.15) 75%,transparent 75%,transparent);background-image:linear-gradient(45deg,rgba(255,255,255,0.15) 25%,transparent 25%,transparent 50%,rgba(255,255,255,0.15) 50%,rgba(255,255,255,0.15) 75%,transparent 75%,transparent)}
.progress-warning .bar,.progress .bar-warning{background-color:#faa732;background-image:-moz-linear-gradient(top,#fbb450,#f89406);background-image:-webkit-gradient(linear,0 0,0 100%,from(#fbb450),to(#f89406));background-image:-webkit-linear-gradient(top,#fbb450,#f89406);background-image:-o-linear-gradient(top,#fbb450,#f89406);background-image:linear-gradient(to bottom,#fbb450,#f89406);background-repeat:repeat-x;filter:progid:DXImageTransform.Microsoft.gradient(startColorstr=''#fffbb450'',endColorstr=''#fff89406'',GradientType=0)}
.progress-warning.progress-striped .bar,.progress-striped .bar-warning{background-color:#fbb450;background-image:-webkit-gradient(linear,0 100%,100% 0,color-stop(0.25,rgba(255,255,255,0.15)),color-stop(0.25,transparent),color-stop(0.5,transparent),color-stop(0.5,rgba(255,255,255,0.15)),color-stop(0.75,rgba(255,255,255,0.15)),color-stop(0.75,transparent),to(transparent));background-image:-webkit-linear-gradient(45deg,rgba(255,255,255,0.15) 25%,transparent 25%,transparent 50%,rgba(255,255,255,0.15) 50%,rgba(255,255,255,0.15) 75%,transparent 75%,transparent);background-image:-moz-linear-gradient(45deg,rgba(255,255,255,0.15) 25%,transparent 25%,transparent 50%,rgba(255,255,255,0.15) 50%,rgba(255,255,255,0.15) 75%,transparent 75%,transparent);background-image:-o-linear-gradient(45deg,rgba(255,255,255,0.15) 25%,transparent 25%,transparent 50%,rgba(255,255,255,0.15) 50%,rgba(255,255,255,0.15) 75%,transparent 75%,transparent);background-image:linear-gradient(45deg,rgba(255,255,255,0.15) 25%,transparent 25%,transparent 50%,rgba(255,255,255,0.15) 50%,rgba(255,255,255,0.15) 75%,transparent 75%,transparent)}
.media,.media-body{overflow:hidden;*overflow:visible;zoom:1}
.media,.media .media{margin-top:15px}
.media:first-child{margin-top:0}
.media-object{display:block}
.media-heading{margin:0 0 5px}
.media>.pull-left{margin-right:10px}
.media>.pull-right{margin-left:10px}
.media-list{margin-left:0;list-style:none}
.tooltip{position:absolute;z-index:1030;display:block;visibility:visible;font-size:11px;line-height:1.4;opacity:0;filter:alpha(opacity=0)}
.tooltip.in{opacity:0.8;filter:alpha(opacity=80)}
.tooltip.top{margin-top:-3px;padding:5px 0}
.tooltip.right{margin-left:3px;padding:0 5px}
.tooltip.bottom{margin-top:3px;padding:5px 0}
.tooltip.left{margin-left:-3px;padding:0 5px}
.tooltip-inner{max-width:200px;padding:8px;color:#fff;text-align:center;text-decoration:none;background-color:#000;-webkit-border-radius:4px;-moz-border-radius:4px;border-radius:4px}
.tooltip-arrow{position:absolute;width:0;height:0;border-color:transparent;border-style:solid}
.tooltip.top .tooltip-arrow{bottom:0;left:50%;margin-left:-5px;border-width:5px 5px 0;border-top-color:#000}
.tooltip.right .tooltip-arrow{top:50%;left:0;margin-top:-5px;border-width:5px 5px 5px 0;border-right-color:#000}
.tooltip.left .tooltip-arrow{top:50%;right:0;margin-top:-5px;border-width:5px 0 5px 5px;border-left-color:#000}
.tooltip.bottom .tooltip-arrow{top:0;left:50%;margin-left:-5px;border-width:0 5px 5px;border-bottom-color:#000}
.popover{position:absolute;top:0;left:0;z-index:1010;display:none;max-width:276px;padding:1px;text-align:left;background-color:#fff;-webkit-background-clip:padding-box;-moz-background-clip:padding;background-clip:padding-box;border:1px solid #ccc;border:1px solid rgba(0,0,0,0.2);-webkit-border-radius:6px;-moz-border-radius:6px;border-radius:6px;-webkit-box-shadow:0 5px 10px rgba(0,0,0,0.2);-moz-box-shadow:0 5px 10px rgba(0,0,0,0.2);box-shadow:0 5px 10px rgba(0,0,0,0.2);white-space:normal}
.popover.top{margin-top:-10px}
.popover.right{margin-left:10px}
.popover.bottom{margin-top:10px}
.popover.left{margin-left:-10px}
.popover-title{margin:0;padding:8px 14px;font-size:14px;font-weight:normal;line-height:18px;background-color:#f7f7f7;border-bottom:1px solid #ebebeb;-webkit-border-radius:5px 5px 0 0;-moz-border-radius:5px 5px 0 0;border-radius:5px 5px 0 0}
.popover-title:empty{display:none}
.popover-content{padding:9px 14px}
.popover .arrow,.popover .arrow:after{position:absolute;display:block;width:0;height:0;border-color:transparent;border-style:solid}
.popover .arrow{border-width:11px}
.popover .arrow:after{border-width:10px;content:""}
.popover.top .arrow{left:50%;margin-left:-11px;border-bottom-width:0;border-top-color:#999;border-top-color:rgba(0,0,0,0.25);bottom:-11px}
.popover.top .arrow:after{bottom:1px;margin-left:-10px;border-bottom-width:0;border-top-color:#fff}
.popover.right .arrow{top:50%;left:-11px;margin-top:-11px;border-left-width:0;border-right-color:#999;border-right-color:rgba(0,0,0,0.25)}
.popover.right .arrow:after{left:1px;bottom:-10px;border-left-width:0;border-right-color:#fff}
.popover.bottom .arrow{left:50%;margin-left:-11px;border-top-width:0;border-bottom-color:#999;border-bottom-color:rgba(0,0,0,0.25);top:-11px}
.popover.bottom .arrow:after{top:1px;margin-left:-10px;border-top-width:0;border-bottom-color:#fff}
.popover.left .arrow{top:50%;right:-11px;margin-top:-11px;border-right-width:0;border-left-color:#999;border-left-color:rgba(0,0,0,0.25)}
.popover.left .arrow:after{right:1px;border-right-width:0;border-left-color:#fff;bottom:-10px}
.modal-backdrop{position:fixed;top:0;right:0;bottom:0;left:0;z-index:1040;background-color:#000}
.modal-backdrop.fade{opacity:0}
.modal-backdrop,.modal-backdrop.fade.in{opacity:0.8;filter:alpha(opacity=80)}
.modal{position:fixed;top:10%;left:50%;z-index:1050;width:560px;margin-left:-280px;background-color:#fff;border:1px solid #999;border:1px solid rgba(0,0,0,0.3);*border:1px solid #999;-webkit-border-radius:6px;-moz-border-radius:6px;border-radius:6px;-webkit-box-shadow:0 3px 7px rgba(0,0,0,0.3);-moz-box-shadow:0 3px 7px rgba(0,0,0,0.3);box-shadow:0 3px 7px rgba(0,0,0,0.3);-webkit-background-clip:padding-box;-moz-background-clip:padding-box;background-clip:padding-box;outline:none}
.modal.fade{-webkit-transition:opacity .3s linear,top .3s ease-out;-moz-transition:opacity .3s linear,top .3s ease-out;-o-transition:opacity .3s linear,top .3s ease-out;transition:opacity .3s linear,top .3s ease-out;top:-25%}
.modal.fade.in{top:10%}
.modal-header{padding:9px 15px;border-bottom:1px solid #eee}
.modal-header .close{margin-top:2px}
.modal-header h3{margin:0;line-height:30px}
.modal-body{position:relative;overflow-y:auto;max-height:400px;padding:15px}
.modal-form{margin-bottom:0}
.modal-footer{padding:14px 15px 15px;margin-bottom:0;text-align:right;background-color:#f5f5f5;border-top:1px solid #ddd;-webkit-border-radius:0 0 6px 6px;-moz-border-radius:0 0 6px 6px;border-radius:0 0 6px 6px;-webkit-box-shadow:inset 0 1px 0 #fff;-moz-box-shadow:inset 0 1px 0 #fff;box-shadow:inset 0 1px 0 #fff;*zoom:1}
.modal-footer:before,.modal-footer:after{display:table;content:"";line-height:0}
.modal-footer:after{clear:both}
.modal-footer .btn+.btn{margin-left:5px;margin-bottom:0}
.modal-footer .btn-group .btn+.btn{margin-left:-1px}
.modal-footer .btn-block+.btn-block{margin-left:0}
.dropup,.dropdown{position:relative}
.dropdown-toggle{*margin-bottom:-3px}
.dropdown-toggle:active,.open .dropdown-toggle{outline:0}
.caret{display:inline-block;width:0;height:0;vertical-align:top;border-top:4px solid #000;border-right:4px solid transparent;border-left:4px solid transparent;content:""}
.dropdown .caret{margin-top:8px;margin-left:2px}
.dropdown-menu{position:absolute;top:100%;left:0;z-index:1000;display:none;float:left;min-width:160px;padding:5px 0;margin:2px 0 0;list-style:none;background-color:#fff;border:1px solid #ccc;border:1px solid rgba(0,0,0,0.2);*border-right-width:2px;*border-bottom-width:2px;-webkit-border-radius:6px;-moz-border-radius:6px;border-radius:6px;-webkit-box-shadow:0 5px 10px rgba(0,0,0,0.2);-moz-box-shadow:0 5px 10px rgba(0,0,0,0.2);box-shadow:0 5px 10px rgba(0,0,0,0.2);-webkit-background-clip:padding-box;-moz-background-clip:padding;background-clip:padding-box}
.dropdown-menu.pull-right{right:0;left:auto}
.dropdown-menu .divider{*width:100%;height:1px;margin:9px 1px;*margin:-5px 0 5px;overflow:hidden;background-color:#e5e5e5;border-bottom:1px solid #fff}
.dropdown-menu>li>a{display:block;padding:3px 20px;clear:both;font-weight:normal;line-height:20px;color:#333;white-space:nowrap}
.dropdown-menu>li>a:hover,.dropdown-menu>li>a:focus,.dropdown-submenu:hover>a,.dropdown-submenu:focus>a{text-decoration:none;color:#fff;background-color:#0081c2;background-image:-moz-linear-gradient(top,#08c,#0077b3);background-image:-webkit-gradient(linear,0 0,0 100%,from(#08c),to(#0077b3));background-image:-webkit-linear-gradient(top,#08c,#0077b3);background-image:-o-linear-gradient(top,#08c,#0077b3);background-image:linear-gradient(to bottom,#08c,#0077b3);background-repeat:repeat-x;filter:progid:DXImageTransform.Microsoft.gradient(startColorstr=''#f08cc'',endColorstr=''#f07b3'',GradientType=0)}
.dropdown-menu>.active>a,.dropdown-menu>.active>a:hover,.dropdown-menu>.active>a:focus{color:#fff;text-decoration:none;outline:0;background-color:#0081c2;background-image:-moz-linear-gradient(top,#08c,#0077b3);background-image:-webkit-gradient(linear,0 0,0 100%,from(#08c),to(#0077b3));background-image:-webkit-linear-gradient(top,#08c,#0077b3);background-image:-o-linear-gradient(top,#08c,#0077b3);background-image:linear-gradient(to bottom,#08c,#0077b3);background-repeat:repeat-x;filter:progid:DXImageTransform.Microsoft.gradient(startColorstr=''#f08cc'',endColorstr=''#f07b3'',GradientType=0)}
.dropdown-menu>.disabled>a,.dropdown-menu>.disabled>a:hover,.dropdown-menu>.disabled>a:focus{color:#999}
.dropdown-menu>.disabled>a:hover,.dropdown-menu>.disabled>a:focus{text-decoration:none;background-color:transparent;background-image:none;filter:progid:DXImageTransform.Microsoft.gradient(enabled = false);cursor:default}
.open{*z-index:1000}
.open>.dropdown-menu{display:block}
.dropdown-backdrop{position:fixed;left:0;right:0;bottom:0;top:0;z-index:990}
.pull-right>.dropdown-menu{right:0;left:auto}
.dropup .caret,.navbar-fixed-bottom .dropdown .caret{border-top:0;border-bottom:4px solid #000;content:""}
.dropup .dropdown-menu,.navbar-fixed-bottom .dropdown .dropdown-menu{top:auto;bottom:100%;margin-bottom:1px}
.dropdown-submenu{position:relative}
.dropdown-submenu>.dropdown-menu{top:0;left:100%;margin-top:-6px;margin-left:-1px;-webkit-border-radius:0 6px 6px 6px;-moz-border-radius:0 6px 6px 6px;border-radius:0 6px 6px 6px}
.dropdown-submenu:hover>.dropdown-menu{display:block}
.dropup .dropdown-submenu>.dropdown-menu{top:auto;bottom:0;margin-top:0;margin-bottom:-2px;-webkit-border-radius:5px 5px 5px 0;-moz-border-radius:5px 5px 5px 0;border-radius:5px 5px 5px 0}
.dropdown-submenu>a:after{display:block;content:" ";float:right;width:0;height:0;border-color:transparent;border-style:solid;border-width:5px 0 5px 5px;border-left-color:#ccc;margin-top:5px;margin-right:-10px}
.dropdown-submenu:hover>a:after{border-left-color:#fff}
.dropdown-submenu.pull-left{float:none}
.dropdown-submenu.pull-left>.dropdown-menu{left:-100%;margin-left:10px;-webkit-border-radius:6px 0 6px 6px;-moz-border-radius:6px 0 6px 6px;border-radius:6px 0 6px 6px}
.dropdown .dropdown-menu .nav-header{padding-left:20px;padding-right:20px}
.typeahead{z-index:1051;margin-top:2px;-webkit-border-radius:4px;-moz-border-radius:4px;border-radius:4px}
.accordion{margin-bottom:20px}
.accordion-group{margin-bottom:2px;border:1px solid #e5e5e5;-webkit-border-radius:4px;-moz-border-radius:4px;border-radius:4px}
.accordion-heading{border-bottom:0}
.accordion-heading .accordion-toggle{display:block;padding:8px 15px}
.accordion-toggle{cursor:pointer}
.accordion-inner{padding:9px 15px;border-top:1px solid #e5e5e5}
.well{min-height:20px;padding:19px;margin-bottom:20px;background-color:#f5f5f5;border:1px solid #e3e3e3;-webkit-border-radius:4px;-moz-border-radius:4px;border-radius:4px;-webkit-box-shadow:inset 0 1px 1px rgba(0,0,0,0.05);-moz-box-shadow:inset 0 1px 1px rgba(0,0,0,0.05);box-shadow:inset 0 1px 1px rgba(0,0,0,0.05)}
.well blockquote{border-color:#ddd;border-color:rgba(0,0,0,0.15)}
.well-large{padding:24px;-webkit-border-radius:6px;-moz-border-radius:6px;border-radius:6px}
.well-small{padding:9px;-webkit-border-radius:3px;-moz-border-radius:3px;border-radius:3px}
.close{float:right;font-size:20px;font-weight:bold;line-height:20px;color:#000;text-shadow:0 1px 0 #fff;opacity:0.2;filter:alpha(opacity=20)}
.close:hover,.close:focus{color:#000;text-decoration:none;cursor:pointer;opacity:0.4;filter:alpha(opacity=40)}
button.close{padding:0;cursor:pointer;background:transparent;border:0;-webkit-appearance:none}
.pull-right{float:right;margin-top: 12px;}
.pull-left{float:left}
.hide{display:none}
.show{display:block}
.invisible{visibility:hidden}
.affix{position:fixed}
.fade{opacity:0;-webkit-transition:opacity 0.15s linear;-moz-transition:opacity 0.15s linear;-o-transition:opacity 0.15s linear;transition:opacity 0.15s linear}
.fade.in{opacity:1}
.collapse{position:relative;height:0;overflow:hidden;-webkit-transition:height 0.35s ease;-moz-transition:height 0.35s ease;-o-transition:height 0.35s ease;transition:height 0.35s ease}
.collapse.in{height:auto}
@-ms-viewport{width:device-width}
.hidden{display:none;visibility:hidden}
.visible-phone{display:none !important}
.visible-tablet{display:none !important}
.hidden-desktop{display:none !important}
.visible-desktop{display:inherit !important}
#searchform label, #searchform input[type="submit"]{display: none;}
#side-bar #searchform input[type="submit"]{display: inline-block;width: 28%;}
#masthead .bl_search {float: right;margin: 20px 0;}
#masthead .bl_search form{margin: 0;}
.navbar-inverse .navbar-inner{background:transparent;-moz-border-radius:0;-webkit-border-radius:0;border-radius:0;-moz-box-shadow:none;-webkit-box-shadow:none;box-shadow:none;border:none;padding:5px 0px;filter:none}
.navbar{margin-bottom:0}
.navbar .brand{color:#FFF;height:70px;margin:0 30px 0 0;padding:13px 0 12px}
.navbar .brand-text{line-height:42px}
.navbar .brand img{height:45px}
.navbar .nav > li > a{color:#EFEFEF;display:block;font-size:16px;font-weight:300;line-height:25px;padding:23px 20px 27px;text-decoration:none;-webkit-transition:all 0.1s ease-in-out;-moz-transition:all 0.1s ease-in-out;-o-transition:all 0.1s ease-in-out;-ms-transition:all 0.1s ease-in-out;transition:all 0.1s ease-in-out}
.navbar a.brand p{font-size:12px;line-height:0;margin:0;opacity:0.8}
.navbar a.brand.brand-tagline{padding:5px 0 0}
.navbar .nav > li > a:focus + ul{display:block}
.navbar-inverse .brand,.navbar-inverse .nav > li > a{text-shadow:none}
.navbar-inverse .nav-collapse .nav > li > a,.navbar-inverse .nav-collapse .dropdown-menu a{color:#EFEFEF}
.navbar .nav > li.active,.navbar .nav > li:hover{background:none repeat scroll 0 0 rgba(255,255,255,0.02);color:#fff}
.dropdown-menu{background:none repeat scroll 0 0 #222;border-top:2px solid #F69087;border-left:0;border-right:0;border-radius:0;padding:0;margin:0}
.dropdown-menu > li > a{color:#FFF;font-size:16px;padding:15px 20px}
.navbar .nav > li > .dropdown-menu:after,.navbar .nav > li > .dropdown-menu:before{display:none}
.navbar .nav > li:hover > ul{display:block}
.dropdown-menu > li > a:hover{background:#272727}
.navbar-inverse .nav li.dropdown.open > .dropdown-toggle,.navbar-inverse .nav li.dropdown.active > .dropdown-toggle,.navbar-inverse .nav li.dropdown.open.active > .dropdown-toggle{background:none repeat scroll 0 0 #212833}
.dropdown-toggle i{font-size:12px;margin:0 0 0 4px}
.btn-navbar{cursor:pointer;margin:18px 15px 18px 0;padding:7px 10px}
.nav-collapse .nav > li > a,.nav-collapse .dropdown-menu a{-moz-border-radius:0;-webkit-border-radius:0;border-radius:0}
#masthead{height:82px;background:#222222;margin-bottom:50px;left:0;position:fixed;top:0;width:100%;z-index:999}
#page{position:relative}
.top-color div{float:left;height:5px;width:25%}
.container{margin-right:auto;margin-left:auto;*zoom:1}
.container:before,.container:after{display:table;content:"";line-height:0}
.container:after{clear:both}
#header{margin-right:30px;float:left}
#header,#header a{color:#FFF}
#header h1{font-weight:normal;line-height:30px;margin-top:20px}
#header img{margin-top:5px;width:auto;max-height:60px}
#side-bar{width:350px;margin-left:30px}
#content-wrapper{margin-bottom:50px;padding-top:100px;}
.post{display:block;margin-bottom:30px;overflow:hidden;border-bottom:2px solid #ddd}
.post h1{font-size:38.5px;font-weight:normal;line-height:100%;margin-bottom:20px}
.post img{max-width:100%}
.entry-video iframe,.thumb{display:block}
.entry-container{background:#FFF;position:relative}
.entry-content{padding:50px}
.entry-content p{color:#525252;font-size:18px}
.entry-image{overflow:hidden;background:#F4F4F4}
.entry-image img{width:100%;-webkit-transition:all .35s ease-in-out;-moz-transition:all .35s ease-in-out;-o-transition:all .35s ease-in-out;transition:all .35s ease-in-out}
.entry-meta{background:none repeat scroll 0 0 #FFF;padding:15px 30px 15px;border-color:#ddd;border-style:solid;border-width:1px 0 0;position:relative;background:#fcfcfc}
.entry-meta img{margin-right:15px;display:inline-block;padding: 1px;
border: 1px solid #DAD1D1;}
.entry-meta h4{display:inline-block;line-height:55px}
.entry-meta h4 a{color:#878787;font-weight:normal;text-shadow:0 1px 0 #FFF;text-decoration:none;cursor:pointer}
.entry-meta .author-meta{position:relative}
.share-story-container img{display:block;margin-right:5px}
.share-story-container ul{margin:0}
.share-story-container li{display:inline-block;width:33px;height:32px}
.sidebar .widget{background:#fff;margin-bottom:30px;}
.sidebar h2{line-height: 40px;
background: #FFFFFF;
font-size: 20px;
font-weight: normal;
padding: 10px 15px 0;
color: #292929;
border-bottom: 2px solid #eee;}
.sidebar ul{margin:0}
.sidebar li{line-height:20px;display:block;padding:8px 15px 8px 18px;border-bottom:1px solid #eee}
.sidebar li a{color:#717171;display:block;font-size:16px}
.sidebar li:hover{background:none repeat scroll 0 0 #F8F8F8;border-left:3px solid #F69087;padding:8px 15px}
#comments{overflow:hidden;background:#FFFFFF;border-bottom:2px solid #DDDDDD;padding:25px}
#comments h4{display:inline;padding:10px;line-height:40px}
#comments h4,.comments .comment-header,.comments .comment-thread.inline-thread .comment{position:relative}
#comments h4,.comments .continue a{background: #F35353}
#comments h4,.comments .user a,.comments .continue a{font-size:16px}
#comments h4,.comments .continue a{font-weight:normal;color:#fff}
#comments h4:after{content:"";position:absolute;bottom:-10px;left:10px;border-top:10px solid #F35353;border-right:20px solid transparent;width:0;height:0;line-height:0}
#comments .avatar-image-container img{border:0}
.comment-thread{color:#111}
.comment-thread a{color:#777}
.comment-thread ol{margin:0 0 20px}
.comment-thread .comment-content a,.comments .user a,.comments .comment-thread.inline-thread .user a{color:#F69087}
.comments .avatar-image-container,.comments .avatar-image-container img{width:48px;max-width:48px;height:48px;max-height:48px}
.comments .comment-block,.comments .comments-content .comment-replies,.comments .comment-replybox-single{margin-left:60px}
.comments .comment-block,.comments .comment-thread.inline-thread .comment{border:1px solid #ddd;background:#f9f9f9;padding:10px}
.comments .comments-content .comment{margin:15px 0 0;padding:0;width:100%;line-height:1em}
.comments .comments-content .icon.blog-author{position:absolute;top:-12px;right:-12px;margin:0;background-image: url(//lh4.googleusercontent.com/-yZr9CWeDr1M/UhbCd9bmLkI/AAAAAAAACjI/sllgyp7xoMc/s36/author.png);width:36px;height:36px}
.comments .comments-content .inline-thread{padding:0 0 0 20px}
.comments .comments-content .comment-replies{margin-top:0}
.comments .comment-content{padding:5px 0;line-height:1.4em}
.comments .comment-thread.inline-thread{border-left:1px solid #ddd;background:transparent}
.comments .comment-thread.inline-thread .comment{width:auto}
.comments .comment-thread.inline-thread .comment:after{content:"";position:absolute;top:10px;left:-20px;border-top:1px solid #ddd;width:10px;height:0px}
.comments .comment-thread.inline-thread .comment .comment-block{border:0;background:transparent;padding:0}
.comments .comment-thread.inline-thread .comment-block{margin-left:48px}
.comments .comment-thread.inline-thread .user a{font-size:13px}
.comments .comment-thread.inline-thread .avatar-image-container,.comments .comment-thread.inline-thread .avatar-image-container img{width:36px;max-width:36px;height:36px;max-height:36px}
.comments .continue{border-top:0;width:100%}
.comments .continue a{padding:10px 0;text-align:center}
.comment .continue{display:none}
#comment-editor{width:103%!important}
.comment-form{width:100%;max-width:100%}
.comments .comments-content .loadmore,.comments .comments-content {margin:0}
#blog-pager-newer-link {float: left;}
#blog-pager-older-link {float: right;}
#blog-pager { margin:0; padding:10px 0; text-align: center; clear:both; }
.pagenavi{text-align: center;}
.pagenavi > *{font-size:18px;margin-right:10px;padding:5px 13px;display:inline-block}
.pagenavi a,.pagenavi span{color:#F69087;background:none repeat scroll 0 0 #FFF;border-bottom:2px solid #DDD;-moz-border-radius:4px;-webkit-border-radius:4px;border-radius:4px;text-decoration:none;-webkit-transition:all .1s ease-in-out;-moz-transition:all .1s ease-in-out;-o-transition:all .1s ease-in-out;transition:all .1s ease-in-out}
.pagenavi .current{color:#525252}
.pagenavi > a:hover{-webkit-transform:scale(1.1);-moz-transform:scale(1.1);-ms-transform:scale(1.1);-o-transform:scale(1.1);transform:scale(1.1)}
.Image img{max-width:300px;height:auto}
#PopularPosts1 img{float:left;margin:0 20px 0 0;display:block;height:70px;position:relative;width:70px;padding:0}
#PopularPosts1 dd{line-height:22px;margin:0;padding:8px 15px 8px 10px;position:relative;min-height:55px;border-left:3px solid transparent}
#PopularPosts1 dd:hover{background:#F8F8F8;border-left:3px solid #F69087;cursor:pointer}
#footer-bottom a{color:#F69087}
.status-msg-body{position:relative !important}
.CSS_LIGHTBOX{z-index:9999 !important}
.span9{width:610px}
@media (min-width: 979px) and (max-width: 1200px) {
#content.span9{width:560px}
}
.popover{min-width:220px}
#colophon{background:#333;color:#FFF;position: relative;
z-index: 100;
background: #2d2d2d;font-size: 16px;}
.site-footer .container{padding:40px 0}
.container1{width:100%; margin: 0px auto}
#footer-body h2{font-size:20px;font-weight:normal}
#footer-body ul{margin:0}
#footer-body li{
margin: 5px 0;
padding: 0 0 0 0;}
#footer-body li a{color: #fff;
display: inline-block;
float: left;
font-size: 11px!important;
line-height: 12px;
margin: 0 2px 2px 0;
padding: 12px 18px;
border: 1px solid #222;}
#footer-body li a:hover{background:#F35353;}
.site-footer #footer-bottom{color:#B8B8B8;background: rgba(0,0,0,0.4);
padding: 10px 0;
font-size: 14px;text-align: center;}
.FollowByEmail .btn{ -webkit-transition: all .05s ease-in-out; -moz-transition: all .05s ease-in-out; -o-transition: all .05s ease-in-out; transition: all .05s ease-in-out; background-image: -moz-linear-gradient(top, rgba(255,255,255,0.10) 0%, rgba(255,255,255,0) 100%); /* FF3.6+ */ background-image: -webkit-gradient(linear, left top, left bottom, color-stop(0%,rgba(255,255,255,0.10)), color-stop(100%,rgba(255,255,255,0))); /* Chrome,Safari4+ */ background-image: -webkit-linear-gradient(top,  rgba(255,255,255,0.10) 0%,rgba(255,255,255,0) 100%); /* Chrome10+,Safari5.1+ */ background-image: -o-linear-gradient(top,  rgba(255,255,255,0.10) 0%,rgba(255,255,255,0) 100%); /* Opera 11.10+ */ background-image: -ms-linear-gradient(top,  rgba(255,255,255,0.10) 0%,rgba(255,255,255,0) 100%); /* IE10+ */ background-image: linear-gradient(to bottom,  rgba(255,255,255,0.10) 0%,rgba(255,255,255,0) 100%); /* W3C */ filter: progid:DXImageTransform.Microsoft.gradient( startColorstr=''#40ffffff'', endColorstr=''#00ffffff'',GradientType=0 ); /* IE6-9 */
border:none; -moz-box-shadow: 0 -2px 0 0 rgba(0, 0, 0, 0.1) inset; -webkit-box-shadow: 0 -2px 0 0 rgba(0, 0, 0, 0.1) inset; box-shadow: 0 -2px 0 0 rgba(0, 0, 0, 0.1) inset; padding: 8px 20px 10px;text-align: center;vertical-align: middle;display: inline-block;font-size: 14px;line-height: 20px;margin-bottom: 0;
-webkit-border-radius:0 4px 4px 0;-moz-border-radius:0 4px 4px 0;border-radius:0 4px 4px 0;background-repeat: repeat-x;background-color: #F5F5F5;color: #333;}
.FollowByEmail .btn:hover{background-position:0;}
.FollowByEmail .btn:active,.btn:focus{box-shadow:0 2px 0 0 rgba(0, 0, 0, 0.1) inset; padding: 10px 20px 8px; outline:none!important; }
.FollowByEmail p {color: #B0B0B0;margin: 0 0 15px;}
.FollowByEmail .bl_newsletter_email {padding:0 6px;height: 38px;width: 200px;}
.FollowByEmail .btn-primary{height: 40px;background-color: #F35353;color: #fff;}
.FollowByEmail .btn-primary:hover{background-color: #F46969;}
.FollowByEmail .btn-primary:active,.btn-primary:focus{background-color: #16A085;}
@media (min-width:768px) and (max-width:979px){.hidden-desktop{display:inherit !important;} .visible-desktop{display:none !important ;} .visible-tablet{display:inherit !important;} .hidden-tablet{display:none !important;}}@media (max-width:767px){.hidden-desktop{display:inherit !important;} .visible-desktop{display:none !important;} .visible-phone{display:inherit !important;} .hidden-phone{display:none !important;}}.visible-print{display:none !important;}
@media print{.visible-print{display:inherit !important;} .hidden-print{display:none !important;}}@media (max-width:767px){body{padding-left:20px;padding-right:20px;} .navbar-fixed-top,.navbar-fixed-bottom,.navbar-static-top{margin-left:-20px;margin-right:-20px;} .container-fluid{padding:0;} .dl-horizontal dt{float:none;clear:none;width:auto;text-align:left;} .dl-horizontal dd{margin-left:0;} .container{width:auto;} .row-fluid{width:100%;} .row,.thumbnails{margin-left:0;} .thumbnails>li{float:none;margin-left:0;} [class*="span"],.uneditable-input[class*="span"],.row-fluid [class*="span"]{float:none;display:block;width:100%;margin-left:0;-webkit-box-sizing:border-box;-moz-box-sizing:border-box;box-sizing:border-box;} .span12,.row-fluid .span12{width:100%;-webkit-box-sizing:border-box;-moz-box-sizing:border-box;box-sizing:border-box;} .row-fluid [class*="offset"]:first-child{margin-left:0;} .input-large,.input-xlarge,.input-xxlarge,input[class*="span"],select[class*="span"],textarea[class*="span"],.uneditable-input{display:block;width:100%;min-height:30px;-webkit-box-sizing:border-box;-moz-box-sizing:border-box;box-sizing:border-box;} .input-prepend input,.input-append input,.input-prepend input[class*="span"],.input-append input[class*="span"]{display:inline-block;width:auto;} .controls-row [class*="span"]+[class*="span"]{margin-left:0;} .modal{position:fixed;top:20px;left:20px;right:20px;width:auto;margin:0;}.modal.fade{top:-100px;} .modal.fade.in{top:20px;}}@media (max-width:480px){.nav-collapse{-webkit-transform:translate3d(0, 0, 0);} .page-header h1 small{display:block;line-height:20px;} input[type="checkbox"],input[type="radio"]{border:1px solid #ccc;} .form-horizontal .control-label{float:none;width:auto;padding-top:0;text-align:left;} .form-horizontal .controls{margin-left:0;} .form-horizontal .control-list{padding-top:0;} .form-horizontal .form-actions{padding-left:10px;padding-right:10px;} .media .pull-left,.media .pull-right{float:none;display:block;margin-bottom:10px;} .media-object{margin-right:0;margin-left:0;} .modal{top:10px;left:10px;right:10px;} .modal-header .close{padding:10px;margin:-10px;} .carousel-caption{position:static;}}@media (min-width:768px) and (max-width:979px){.row{margin-left:-20px;*zoom:1;}.row:before,.row:after{display:table;content:"";line-height:0;} .row:after{clear:both;} [class*="span"]{float:left;min-height:1px;margin-left:20px;} .container,.navbar-static-top .container,.navbar-fixed-top .container,.navbar-fixed-bottom .container{width:724px;} .span12{width:724px;} .span11{width:662px;} .span10{width:600px;} .span9{width:538px;} .span8{width:476px;} .span7{width:414px;} .span6{width:352px;} .span5{width:290px;} .span4{width:228px;} .span3{width:166px;} .span2{width:104px;} .span1{width:42px;} .offset12{margin-left:764px;} .offset11{margin-left:702px;} .offset10{margin-left:640px;} .offset9{margin-left:578px;} .offset8{margin-left:516px;} .offset7{margin-left:454px;} .offset6{margin-left:392px;} .offset5{margin-left:330px;} .offset4{margin-left:268px;} .offset3{margin-left:206px;} .offset2{margin-left:144px;} .offset1{margin-left:82px;} .row-fluid{width:100%;*zoom:1;}.row-fluid:before,.row-fluid:after{display:table;content:"";line-height:0;} .row-fluid:after{clear:both;} .row-fluid [class*="span"]{display:block;width:100%;min-height:30px;-webkit-box-sizing:border-box;-moz-box-sizing:border-box;box-sizing:border-box;float:left;margin-left:2.7624309392265194%;*margin-left:2.709239449864817%;} .row-fluid [class*="span"]:first-child{margin-left:0;} .row-fluid .controls-row [class*="span"]+[class*="span"]{margin-left:2.7624309392265194%;} .row-fluid .span12{width:100%;*width:99.94680851063829%;} .row-fluid .span11{width:91.43646408839778%;*width:91.38327259903608%;} .row-fluid .span10{width:82.87292817679558%;*width:82.81973668743387%;} .row-fluid .span9{width:74.30939226519337%;*width:74.25620077583166%;} .row-fluid .span8{width:65.74585635359117%;*width:65.69266486422946%;} .row-fluid .span7{width:57.18232044198895%;*width:57.12912895262725%;} .row-fluid .span6{width:48.61878453038674%;*width:48.56559304102504%;} .row-fluid .span5{width:40.05524861878453%;*width:40.00205712942283%;} .row-fluid .span4{width:31.491712707182323%;*width:31.43852121782062%;} .row-fluid .span3{width:22.92817679558011%;*width:22.87498530621841%;} .row-fluid .span2{width:14.3646408839779%;*width:14.311449394616199%;} .row-fluid .span1{width:5.801104972375691%;*width:5.747913483013988%;} .row-fluid .offset12{margin-left:105.52486187845304%;*margin-left:105.41847889972962%;} .row-fluid .offset12:first-child{margin-left:102.76243093922652%;*margin-left:102.6560479605031%;} .row-fluid .offset11{margin-left:96.96132596685082%;*margin-left:96.8549429881274%;} .row-fluid .offset11:first-child{margin-left:94.1988950276243%;*margin-left:94.09251204890089%;} .row-fluid .offset10{margin-left:88.39779005524862%;*margin-left:88.2914070765252%;} .row-fluid .offset10:first-child{margin-left:85.6353591160221%;*margin-left:85.52897613729868%;} .row-fluid .offset9{margin-left:79.8342541436464%;*margin-left:79.72787116492299%;} .row-fluid .offset9:first-child{margin-left:77.07182320441989%;*margin-left:76.96544022569647%;} .row-fluid .offset8{margin-left:71.2707182320442%;*margin-left:71.16433525332079%;} .row-fluid .offset8:first-child{margin-left:68.50828729281768%;*margin-left:68.40190431409427%;} .row-fluid .offset7{margin-left:62.70718232044199%;*margin-left:62.600799341718584%;} .row-fluid .offset7:first-child{margin-left:59.94475138121547%;*margin-left:59.838368402492065%;} .row-fluid .offset6{margin-left:54.14364640883978%;*margin-left:54.037263430116376%;} .row-fluid .offset6:first-child{margin-left:51.38121546961326%;*margin-left:51.27483249088986%;} .row-fluid .offset5{margin-left:45.58011049723757%;*margin-left:45.47372751851417%;} .row-fluid .offset5:first-child{margin-left:42.81767955801105%;*margin-left:42.71129657928765%;} .row-fluid .offset4{margin-left:37.01657458563536%;*margin-left:36.91019160691196%;} .row-fluid .offset4:first-child{margin-left:34.25414364640884%;*margin-left:34.14776066768544%;} .row-fluid .offset3{margin-left:28.45303867403315%;*margin-left:28.346655695309746%;} .row-fluid .offset3:first-child{margin-left:25.69060773480663%;*margin-left:25.584224756083227%;} .row-fluid .offset2{margin-left:19.88950276243094%;*margin-left:19.783119783707537%;} .row-fluid .offset2:first-child{margin-left:17.12707182320442%;*margin-left:17.02068884448102%;} .row-fluid .offset1{margin-left:11.32596685082873%;*margin-left:11.219583872105325%;} .row-fluid .offset1:first-child{margin-left:8.56353591160221%;*margin-left:8.457152932878806%;} input,textarea,.uneditable-input{margin-left:0;} .controls-row [class*="span"]+[class*="span"]{margin-left:20px;} input.span12,textarea.span12,.uneditable-input.span12{width:710px;} input.span11,textarea.span11,.uneditable-input.span11{width:648px;} input.span10,textarea.span10,.uneditable-input.span10{width:586px;} input.span9,textarea.span9,.uneditable-input.span9{width:524px;} input.span8,textarea.span8,.uneditable-input.span8{width:462px;} input.span7,textarea.span7,.uneditable-input.span7{width:400px;} input.span6,textarea.span6,.uneditable-input.span6{width:338px;} input.span5,textarea.span5,.uneditable-input.span5{width:276px;} input.span4,textarea.span4,.uneditable-input.span4{width:214px;} input.span3,textarea.span3,.uneditable-input.span3{width:152px;} input.span2,textarea.span2,.uneditable-input.span2{width:90px;} input.span1,textarea.span1,.uneditable-input.span1{width:28px;}}@media (min-width:1200px){.row{margin-left:-30px;*zoom:1;}.row:before,.row:after{display:table;content:"";line-height:0;} .row:after{clear:both;} [class*="span"]{float:left;min-height:1px;margin-left:30px;} .container,.navbar-static-top .container,.navbar-fixed-top .container,.navbar-fixed-bottom .container{width:1170px;} .span12{width:1170px;} .span11{width:1070px;} .span10{width:970px;} .span9{width:870px;} .span8{width:770px;} .span7{width:670px;} .span6{width:570px;} .span5{width:470px;} .span4{width:370px;} .span3{width:270px;} .span2{width:170px;} .span1{width:70px;} .offset12{margin-left:1230px;} .offset11{margin-left:1130px;} .offset10{margin-left:1030px;} .offset9{margin-left:930px;} .offset8{margin-left:830px;} .offset7{margin-left:730px;} .offset6{margin-left:630px;} .offset5{margin-left:530px;} .offset4{margin-left:430px;} .offset3{margin-left:330px;} .offset2{margin-left:230px;} .offset1{margin-left:130px;} .row-fluid{width:100%;*zoom:1;}.row-fluid:before,.row-fluid:after{display:table;content:"";line-height:0;} .row-fluid:after{clear:both;} .row-fluid [class*="span"]{display:block;width:100%;min-height:30px;-webkit-box-sizing:border-box;-moz-box-sizing:border-box;box-sizing:border-box;float:left;margin-left:2.564102564102564%;*margin-left:2.5109110747408616%;} .row-fluid [class*="span"]:first-child{margin-left:0;} .row-fluid .controls-row [class*="span"]+[class*="span"]{margin-left:2.564102564102564%;} .row-fluid .span12{width:100%;*width:99.94680851063829%;} .row-fluid .span11{width:91.45299145299145%;*width:91.39979996362975%;} .row-fluid .span10{width:82.90598290598291%;*width:82.8527914166212%;} .row-fluid .span9{width:74.35897435897436%;*width:74.30578286961266%;} .row-fluid .span8{width:65.81196581196582%;*width:65.75877432260411%;} .row-fluid .span7{width:57.26495726495726%;*width:57.21176577559556%;} .row-fluid .span6{width:48.717948717948715%;*width:48.664757228587014%;} .row-fluid .span5{width:40.17094017094017%;*width:40.11774868157847%;} .row-fluid .span4{width:31.623931623931625%;*width:31.570740134569924%;} .row-fluid .span3{width:23.076923076923077%;*width:23.023731587561375%;} .row-fluid .span2{width:14.52991452991453%;*width:14.476723040552828%;} .row-fluid .span1{width:5.982905982905983%;*width:5.929714493544281%;} .row-fluid .offset12{margin-left:105.12820512820512%;*margin-left:105.02182214948171%;} .row-fluid .offset12:first-child{margin-left:102.56410256410257%;*margin-left:102.45771958537915%;} .row-fluid .offset11{margin-left:96.58119658119658%;*margin-left:96.47481360247316%;} .row-fluid .offset11:first-child{margin-left:94.01709401709402%;*margin-left:93.91071103837061%;} .row-fluid .offset10{margin-left:88.03418803418803%;*margin-left:87.92780505546462%;} .row-fluid .offset10:first-child{margin-left:85.47008547008548%;*margin-left:85.36370249136206%;} .row-fluid .offset9{margin-left:79.48717948717949%;*margin-left:79.38079650845607%;} .row-fluid .offset9:first-child{margin-left:76.92307692307693%;*margin-left:76.81669394435352%;} .row-fluid .offset8{margin-left:70.94017094017094%;*margin-left:70.83378796144753%;} .row-fluid .offset8:first-child{margin-left:68.37606837606839%;*margin-left:68.26968539734497%;} .row-fluid .offset7{margin-left:62.393162393162385%;*margin-left:62.28677941443899%;} .row-fluid .offset7:first-child{margin-left:59.82905982905982%;*margin-left:59.72267685033642%;} .row-fluid .offset6{margin-left:53.84615384615384%;*margin-left:53.739770867430444%;} .row-fluid .offset6:first-child{margin-left:51.28205128205128%;*margin-left:51.175668303327875%;} .row-fluid .offset5{margin-left:45.299145299145295%;*margin-left:45.1927623204219%;} .row-fluid .offset5:first-child{margin-left:42.73504273504273%;*margin-left:42.62865975631933%;} .row-fluid .offset4{margin-left:36.75213675213675%;*margin-left:36.645753773413354%;} .row-fluid .offset4:first-child{margin-left:34.18803418803419%;*margin-left:34.081651209310785%;} .row-fluid .offset3{margin-left:28.205128205128204%;*margin-left:28.0987452264048%;} .row-fluid .offset3:first-child{margin-left:25.641025641025642%;*margin-left:25.53464266230224%;} .row-fluid .offset2{margin-left:19.65811965811966%;*margin-left:19.551736679396257%;} .row-fluid .offset2:first-child{margin-left:17.094017094017094%;*margin-left:16.98763411529369%;} .row-fluid .offset1{margin-left:11.11111111111111%;*margin-left:11.004728132387708%;} .row-fluid .offset1:first-child{margin-left:8.547008547008547%;*margin-left:8.440625568285142%;} input,textarea,.uneditable-input{margin-left:0;} .controls-row [class*="span"]+[class*="span"]{margin-left:30px;} input.span12,textarea.span12,.uneditable-input.span12{width:1156px;} input.span11,textarea.span11,.uneditable-input.span11{width:1056px;} input.span10,textarea.span10,.uneditable-input.span10{width:956px;} input.span9,textarea.span9,.uneditable-input.span9{width:856px;} input.span8,textarea.span8,.uneditable-input.span8{width:756px;} input.span7,textarea.span7,.uneditable-input.span7{width:656px;} input.span6,textarea.span6,.uneditable-input.span6{width:556px;} input.span5,textarea.span5,.uneditable-input.span5{width:456px;} input.span4,textarea.span4,.uneditable-input.span4{width:356px;} input.span3,textarea.span3,.uneditable-input.span3{width:256px;} input.span2,textarea.span2,.uneditable-input.span2{width:156px;} input.span1,textarea.span1,.uneditable-input.span1{width:56px;} .thumbnails{margin-left:-30px;} .thumbnails>li{margin-left:30px;} .row-fluid .thumbnails{margin-left:0;}}@media (max-width:979px){body{padding-top:0;} .navbar-fixed-top,.navbar-fixed-bottom{position:static;} .navbar-fixed-top{margin-bottom:20px;} .navbar-fixed-bottom{margin-top:20px;} .navbar-fixed-top .navbar-inner,.navbar-fixed-bottom .navbar-inner{padding:5px;} .navbar .container{width:auto;padding:0;} .navbar .brand{padding-left:20px;padding-right:20px;margin:0 0 0 -5px;} .nav-collapse{clear:both;} .nav-collapse .nav{float:none;margin:0 0 10px;} .nav-collapse .nav>li{float:none;} .nav-collapse .nav>li>a{margin-bottom:2px;} .nav-collapse .nav>.divider-vertical{display:none;} .nav-collapse .nav .nav-header{color:#777777;text-shadow:none;} .nav-collapse .nav>li>a,.nav-collapse .dropdown-menu a{padding:9px 15px;font-weight:bold;color:#777777;-webkit-border-radius:3px;-moz-border-radius:3px;border-radius:3px;} .nav-collapse .btn{padding:4px 10px 4px;font-weight:normal;-webkit-border-radius:4px;-moz-border-radius:4px;border-radius:4px;} .nav-collapse .dropdown-menu li+li a{margin-bottom:2px;} .nav-collapse .nav>li>a:hover,.nav-collapse .nav>li>a:focus,.nav-collapse .dropdown-menu a:hover,.nav-collapse .dropdown-menu a:focus{background-color:#f2f2f2;} .navbar-inverse .nav-collapse .nav>li>a,.navbar-inverse .nav-collapse .dropdown-menu a{color:#999999;} .navbar-inverse .nav-collapse .nav>li>a:hover,.navbar-inverse .nav-collapse .nav>li>a:focus,.navbar-inverse .nav-collapse .dropdown-menu a:hover,.navbar-inverse .nav-collapse .dropdown-menu a:focus{background-color:#111111;} .nav-collapse.in .btn-group{margin-top:5px;padding:0;} .nav-collapse .dropdown-menu{position:static;top:auto;left:auto;float:none;display:none;max-width:none;margin:0 15px;padding:0;background-color:transparent;border:none;-webkit-border-radius:0;-moz-border-radius:0;border-radius:0;-webkit-box-shadow:none;-moz-box-shadow:none;box-shadow:none;} .nav-collapse .open>.dropdown-menu{display:block;} .nav-collapse .dropdown-menu:before,.nav-collapse .dropdown-menu:after{display:none;} .nav-collapse .dropdown-menu .divider{display:none;} .nav-collapse .nav>li>.dropdown-menu:before,.nav-collapse .nav>li>.dropdown-menu:after{display:none;} .nav-collapse .navbar-form,.nav-collapse .navbar-search{float:none;padding:10px 15px;margin:10px 0;border-top:1px solid #f2f2f2;border-bottom:1px solid #f2f2f2;-webkit-box-shadow:inset 0 1px 0 rgba(255,255,255,.1), 0 1px 0 rgba(255,255,255,.1);-moz-box-shadow:inset 0 1px 0 rgba(255,255,255,.1), 0 1px 0 rgba(255,255,255,.1);box-shadow:inset 0 1px 0 rgba(255,255,255,.1), 0 1px 0 rgba(255,255,255,.1);} .navbar-inverse .nav-collapse .navbar-form,.navbar-inverse .nav-collapse .navbar-search{border-top-color:#111111;border-bottom-color:#111111;} .navbar .nav-collapse .nav.pull-right{float:none;margin-left:0;} .nav-collapse,.nav-collapse.collapse{overflow:hidden;height:0;} .navbar .btn-navbar{display:block;} .navbar-static .navbar-inner{padding-left:10px;padding-right:10px;}}@media (min-width:980px){.nav-collapse.collapse{height:auto !important;overflow:visible !important;}}
@media (min-width: 1200px) {
.span9{width:790px}
.share-story-container small{margin:19px;position:static}
.share-story{margin:13px 0 0}
.entry-video iframe,.entry-video object{min-height:472.5px}
}
@media (min-width: 768px) and (max-width: 979px) {
.entry-video iframe,.entry-video object{min-height:472.5px}
#primary,.site-footer .container{padding-left:20px;padding-right:20px}
#masthead{position:absolute!important}
.bl_instagram,.bl_instagram .widget-body{width:100%!important}
.container{width:auto}
[class*="span"],.uneditable-input[class*="span"],.row-fluid [class*="span"]{-moz-box-sizing:border-box;display:block;float:none;margin-left:0;width:100%}
.row{margin-left:0}
#side-bar{margin:0;width:100%}
#side-bar .bl_tweets #tweets iframe{min-width:100%!important}
#masthead .bl_search{float:none;margin:0}
#masthead .bl_search.collapse.in{margin:20px 15px}
.navbar-inverse .navbar-inner{padding:0;}
.navbar-inverse .nav-collapse .dropdown-menu a:hover,.navbar-inverse .nav-collapse .dropdown-menu a:focus{background:transparent;color:#efefefe}
.navbar .nav > li > a{border-left:3px solid transparent}
.navbar .nav > li > a:hover,.navbar .nav > li > a:active,.navbar .nav > li > a:focus{border-left:3px solid #85CCB1}
.navbar-inverse .nav-collapse .nav > li > a:hover,.navbar-inverse .nav-collapse .nav > li > a:focus,.navbar-inverse .nav-collapse .dropdown-menu a:hover,.navbar-inverse .nav-collapse .dropdown-menu a:focus{background:transparent}
.nav-collapse .nav > li > a,.nav-collapse .dropdown-menu a{font-weight:normal;padding:12px 15px;margin:0}
.nav-collapse .open > .dropdown-menu{background:#222;margin:0}
.instagram-images-container{width:100%;overflow-x:auto}
#footer-body > [class*="span"]{margin-bottom:20px}
}
@media (max-width: 767px) {
.share-story-container ul {
margin: 14px 0;
}
#primary,.site-footer .container{padding-left:20px;padding-right:20px}
.between_posts.box{padding:5px}
body{padding:0!important}
.entry-image{height:auto}
#masthead{position:absolute!important}
.container{width:auto}
[class*="span"],.uneditable-input[class*="span"],.row-fluid [class*="span"]{-moz-box-sizing:border-box;display:block;float:none;margin-left:0;width:100%}
.row{margin-left:0}
#side-bar{margin:0;width:100%}
#side-bar .bl_tweets #tweets iframe{min-width:100%!important}
.share-story{display:block;width:100%;float:none}
.share-story li{float:none;display:table-cell;width:1%;border-right:1px solid #E6E6E6;border-top:1px solid #E6E6E6}
.share-story li:first-child{border-left:1px solid #E6E6E6}
.share-story li a{background:none repeat scroll 0 0 #F0F0F0;border-radius:0;text-align:center;padding:6px 0;width:100%}
.share-story-container{margin:0 -30px -15px;position:relative}
.share-story-container small{top:-23px;left:0;margin:0;position:absolute;text-align:center;width:100%}
.entry-meta .author-meta{margin-bottom:30px}
.share-story-container img{margin:0 auto}
.share-story-container li{background:#f1eff2}
.entry-meta .author-meta{margin-bottom:30px}
.entry-meta > [class*="pull"]{float:none}
.site-footer #footer-body .menu a{display:block;font-size:17px;margin:5px 0;padding:7px 10px}
.bl_instagram,.bl_instagram .widget-body{width:100%!important}
.instagram-images-container{width:100%;overflow-x:auto}
.instagram-interactions li{display:none!important}
.instagram-interactions:before{content:''\261d'';position:absolute;left:50%;top:10px;width:40px;margin:0 -20px;color:#fff;font-size:27px}
.entry-container .entry-content{padding:50px 20px 30px}
.entry-meta h4{line-height:45px}
.entry-meta .avatar{width:45px;height:45px}
.entry-meta .author-meta{padding-left:60px}
.entry-title{font-size:32px}
#masthead .bl_search{float:none;margin:0}
#masthead .bl_search.collapse.in{margin:15px}
.navbar .brand{margin:0}
.navbar-inner{padding:0}
.nav-collapse .nav{margin-bottom:0}
.navbar .nav > li > a{border-left:3px solid transparent}
.navbar .nav > li > a:hover,.navbar .nav > li > a:active,.navbar .nav > li > a:focus{border-left:3px solid #85CCB1}
.nav-collapse .dropdown-menu{background:#222;margin:0}
.navbar-inverse .nav-collapse .dropdown-menu a:hover,.navbar-inverse .nav-collapse .dropdown-menu a:focus{background:transparent;color:#e1e1e1}
.navbar-inverse .navbar-inner{padding:0}
.navbar-inverse .navbar-inner{background: #2d2d2d;}
.navbar-inverse .nav-collapse .nav > li > a:hover,.navbar-inverse .nav-collapse .nav > li > a:focus,.navbar-inverse .nav-collapse .dropdown-menu a:hover,.navbar-inverse .nav-collapse .dropdown-menu a:focus{background:transparent}
.nav-collapse .nav > li > a,.nav-collapse .dropdown-menu a{font-weight:normal;padding:12px 15px;margin:0}
.nav-collapse .open > .dropdown-menu{background:#212833;margin:0}
article.type-page{padding:50px 20px 30px}
#footer-body > [class*="span"]{margin-bottom:20px}
}
@media (max-width: 480px) {
#primary{padding-left:5px;padding-right:5px}
.navbar .brand{padding-left:5px;padding-right:5px}
.bl_background{display:none}
.share-story-container ul {
margin: 14px 0;
}
}
.post-avatar{background:url(//lh3.googleusercontent.com/-6qwdHih3tFk/Vv6N0dTaICI/AAAAAAACuRA/AsKTNm9c_Bg/s0/post-avatar.png)}
.firstload-background {
background: url(//2.bp.blogspot.com/-h8fC3jrTphQ/U9Ywn5XUesI/AAAAAAAABGA/TOLe6IOXPtQ/s1600/pattern5.png) repeat scroll 0 0 transparent;;
height: 100%;
left: 0;
position: fixed;
top: 0;
width: 100%;
z-index: -1;
}
.author-box{
float: left;
width: 100%;
padding: 0;
}
.search-bar {
-moz-transition: .3s linear;
-webkit-transition: .3s ease-out;
transition: .3s linear;
float: right;
right: 0;
cursor: pointer;
background-image: url();
background-repeat: no-repeat;
padding: 0px 20px 23px;
background-size: 100px 100px;
top: 0;
z-index: 99999;
margin-top: -5px;
}
.search-bar:hover {
-moz-transition: .01s linear;
-webkit-transition: .01s ease-out;
transition: .01s linear;
/*opacity: 1; */
background-image:none;
}
.nav-search {
width: auto;
height: 30px;
position: relative;
left: 0;
float: left;
line-height: 10px;
color: #fff !important;
}
.nav-search label {
display: none;
}
.nav-search input {
float: left;
/*width: 0;*/
background: none;
height: 30px;
line-height: 20px;
margin: 22px 0 0;
padding: 0 10px 0 0;
font-size: 15px;
/*color: #fff !important;*/
outline: 0;
border-radius: 0;
border: 0;
/*opacity: 1;*/
/*opacity: 1;*/
/*-webkit-transition: all .8s ease-in-out;
-moz-transition: all .8s ease-in-out;
-o-transition: all .8s ease-in-out;
transition: all .8s ease-in-out;
-webkit-appearance: none;*/
width: 160px;
margin-left: 33px;
background: none;
border-bottom: 1px solid #f1f1f1;
opacity: 1;
}
/*
.search-bar:hover .nav-search input {
width: 160px;
margin-left: 33px;
background: none;
border-bottom: 1px solid #f1f1f1;
opacity: 1;
}
*/
/*
.nav-search input::-webkit-input-placeholder {
color: #eee;
}
.nav-search input::-moz-placeholder {
color: #eee;
}
.nav-search input:-moz-placeholder {
color: #eee;
}
.nav-search input:-ms-input-placeholder {
color: #eee;
}
.nav-search input:focus {
color: #fff;
}
*/
.nav-search .srch_btn {
height: 42px;
width: 23px;
margin-top: 0;
background: url(//3.bp.blogspot.com/-h-x1pzE69JE/U5sUcTyNfAI/AAAAAAAAAdg/PYKJ6twHM1M/s1600/search-icon.png) 2px center no-repeat;
text-indent: 9999px;
position: relative;
}
--></style>
<script src=''//pulipulichen.github.io/blogger/blogger/js/breeze.js'' type=''text/javascript''></script>
<script src=''//ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js'' type=''text/javascript''></script>
<link href=''//fonts.googleapis.com/css?family=Lato'' rel=''stylesheet'' type=''text/css''/>
<link href=''//fonts.googleapis.com/css?family=Crete+Round'' rel=''stylesheet'' type=''text/css''/>
<link href=''//netdna.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.css'' rel=''stylesheet'' type=''text/css''/>
<style>
div.post-avatar {
border: 3px solid #eaeaea;
width: 100px;
height: 100px;
overflow: hidden;
float: left;
-webkit-transition: all .2s ease-in-out;
    -moz-transition: all .2s ease-in-out;
    -o-transition: all .2s ease-in-out;
    transition: all .2s ease-in-out;
}
.foundation {
margin-bottom: 121px;
margin-top: -103px;
}

.meta {
margin-top: 63px;
position: absolute;
margin-left: 126px;
}

.avatar-name {
color: #fff;
font-size: 18px;
margin-left: 126px;
margin-bottom: -48px;
padding-top: 17px;
display:none;
}
.post-avatar:hover {
border-radius: 50%;
-webkit-transition: all .2s ease-in-out;
    -moz-transition: all .2s ease-in-out;
    -o-transition: all .2s ease-in-out;
    transition: all .2s ease-in-out;
}


.sidebar h2 > span {
position: relative;
bottom: -2px;
display: inline-block;
border-bottom: 2px solid #e23a3e;
padding-bottom: 5px;
margin-top: 0px;
}
.read-more {
display: block;
float: left;
border-radius: 3px;
font-size: 13px;
padding: 7px 20px;
background: #333;
color: #fff;
letter-spacing: 0.5px;
text-transform: uppercase;
border: 1px solid #1D1D1D;
margin-top: 13px;
margin-bottom: 12px;
}


#masthead.fixed-nav {
    position: fixed;
    top: 0;
    width: 100% !important;
    margin: 0px auto;
    z-index: 999;
    height: 50px;
    opacity: 0.9;
    -webkit-box-shadow: 0 5px 3px rgba(0, 0, 0, .1);
    -moz-box-shadow: 0 5px 3px rgba(0, 0, 0, .1);
    box-shadow: 0 5px 3px rgba(0, 0, 0, .1);
}

#masthead.fixed-nav li > a{padding: 6px 20px 10px;
}
  #masthead.fixed-nav img{margin-top: 0;
width: auto;
max-height: 85%;}


#masthead.fixed-nav form {
margin-top: -16px;
}
#masthead.fixed-nav h1 {
font-size: 20px;
margin-top: 9px;
}


 #related-posts #owl-demo {
    overflow: visible;
padding: 0px 20px;
  }
  #related-posts {
    height: 240px;
    overflow: hidden;
z-index: 100;
background: #fff;
  }
  #related-posts .title {
    background: none repeat scroll 0% 0% #FFF;
    padding: 5px 20px;
    margin: 0px 0px 15px;
border-top: 1px solid #ddd;
border-bottom: 1px solid #ddd;
    font-size: 22px;
    
  }
  #owl-demo {
    max-height: 233px;
  }
  .owl-wrapper-outer {
    overflow: hidden;
    max-height: 240px;
  }
  #related-posts .owl-controls.clickable {
    position: relative;
  }
  .owl-wrapper {
    position: relative;
  }
  .owl-item {
    float: left;
    padding: 0px 10px;
    width: 235px !important;
  }
  .owl-item:first-child {
    padding: 0px 10px 0px 0px;
  }
  .item-img {
    position: relative;
  }
  #related-posts .owl-controls.clickable .owl-pagination {
    position: absolute;
    right: 0px;
    top: -208px;
  }
  .owl-theme .owl-controls .owl-page {
    display: inline-block;
    width: 13px;
    height: 13px;
    margin: 5px 14px 5px -10px;
    opacity: 0.5;
    border-radius: 20px;
    background: none repeat scroll 0% 0% #DDD;
    cursor: pointer;
  }
  .owl-theme .owl-controls .owl-page.active, .owl-theme .owl-controls.clickable .owl-page:hover {
    opacity: 1;
    background: none repeat scroll 0% 0% #333;
  }
  #related-posts img {
    background: url(//1.bp.blogspot.com/-EpAZ7479vZU/U8q4-6oeF5I/AAAAAAAAB2w/mQFhf-xZRko/s1600/background.png) repeat scroll 0% 0% #fff;
    display: table-cell;
    text-align: center;
    color: #EB005D;
    font-size: 19px;
  }


div.meta1 p {
padding: 10px 0;
margin-bottom: -20px;
font-size: 16px;

}
.meta1 span{margin-right:10px}

.label,.badge{display:inline-block;padding:2px 4px;font-size:11.844px;font-weight:bold;line-height:14px;color:#fff;vertical-align:baseline;white-space:nowrap;text-shadow:0 -1px 0 rgba(0,0,0,0.25);background-color:#999}
.label{-webkit-border-radius:3px;-moz-border-radius:3px;border-radius:3px}
.badge{padding-left:9px;padding-right:9px;-webkit-border-radius:9px;-moz-border-radius:9px;border-radius:9px}
.label:empty,.badge:empty{display:none}
a.label:hover,a.label:focus,a.badge:hover,a.badge:focus{color:#fff;text-decoration:none;cursor:pointer}



#footer{line-height:30px;padding: 10px 0 0px 0;background-color:#1a1a1a}#footer
p{font-size:13px;float:left;line-height:30px}#footer .go-top{float:right;margin-left:20px;padding-left:20px;border-left:1px solid rgba(0,0,0,0.1)}#footer .go-top
a{display:block;width:30px;height:30px;color:#fff;font-size:14px;text-align:center;border-radius:2px;background-color:#F46B6B;transition:background-color 0.2s ease-in-out;-moz-transition:background-color 0.2s ease-in-out;-webkit-transition:background-color 0.2s ease-in-out;-o-transition:background-color 0.2s ease-in-out}#footer .go-top a:hover{background-color:#444}#footer .go-top a
i{line-height:30px}
#footer a{color:#F57676}
#header-inner {
    width: auto !important;
    /*padding-left: 60px !important;*/
    background-position: left top !important;
    background-image: none !important;
}

#header-inner .descriptionwrapper {
    margin-top:5px;
}

.fixed-nav.affix #header-inner .descriptionwrapper,
.fixed-nav.affix #header-inner img {
    display:none;

}

.fixed-nav.affix #header-inner {
    background-image: none !important;
}

#sidebar-popular-post .popular-posts > ul > dd {
    display:none;
}

#sidebar-popular-post .popular-posts > ul > dd:nth-of-type(1),
#sidebar-popular-post .popular-posts > ul > dd:nth-of-type(2),
#sidebar-popular-post .popular-posts > ul > dd:nth-of-type(3),
#sidebar-popular-post .popular-posts > ul > dd:nth-of-type(4),
#sidebar-popular-post .popular-posts > ul > dd:nth-of-type(5) {
    display:block;
}

.site-footer .cloud-label-widget-content a {
    color: #CCC;
}

.entry-image {
    max-height: 300px;
}

/* ****************** */

.entry-content {
    line-height: 200%;
}

.entry-content > article > p {
    text-indent: 2em;
}

.entry-content h4 {
    font-size: 24pt;
    color:#BD8A39;
}

.entry-content h5 {
    font-size: 20pt;
    color:#BD8A39;
}

.entry-content h6 {
    font-size: 18pt;
    font-style: italic;
    color:#BD8A39;
}

.entry-content hr {
    border-top: 2px solid #DEB46F;
    border-bottom: 2px solid #BD8A39;
}

.entry-content ul {

}


</style>
<link href=''//pulipulichen.github.io/blogger/blogger/css/style.css'' rel=''stylesheet'' type=''text/css''/>
<link href=''//pulipulichen.github.io/blogger/blogger/css/style-item.css'' rel=''stylesheet'' type=''text/css''/>
<meta content=''width=device-width, initial-scale=1, maximum-scale=1'' name=''viewport''/>
<link href=''//lh3.googleusercontent.com/-EJjh-ZlKl64/VvtjyofcjNI/AAAAAAACuME/hYJhk_ZuORs/s0/pulipuli192x192.jpg'' rel=''shortcut icon'' type=''image/vnd.microsoft.icon''/>
<meta content=''#A1501A'' name=''theme-color''/>
<link href=''//lh3.googleusercontent.com/-EJjh-ZlKl64/VvtjyofcjNI/AAAAAAACuME/hYJhk_ZuORs/s0/pulipuli192x192.jpg'' rel=''icon'' sizes=''192x192''/>
<link href=''//lh3.googleusercontent.com/-vjf_alp-zjQ/VvtkKVpqCjI/AAAAAAACuMI/HPJXcEemwok/s0/pulipuli144x144.jpg'' rel=''apple-touch-icon'' sizes=''144x144''/>
<meta content=''R的文字雲怎麼都是□亂碼？wordcloud套件需要中文字形 / Why R’s wordcloud draws Chinese in □?'' property=''og:title''/>
<meta content=''http://blog.pulipuli.info/2016/11/rwordcloud-why-rs-wordcloud-draws.html'' property=''og:url''/>
<meta content=''article'' property=''og:type''/>
<meta content=''布丁布丁吃什麼？'' property=''og:site_name''/>
<meta content=''https://lh3.googleusercontent.com/-jlcNpnoN3KI/WB7p5iPhBBI/AAAAAAAC818/6THEZ4Y5Ytw/image_thumb%25255B1%25255D.png?imgmax=800'' property=''og:image''/>
<link href=''https://lh3.googleusercontent.com/-jlcNpnoN3KI/WB7p5iPhBBI/AAAAAAAC818/6THEZ4Y5Ytw/image_thumb%25255B1%25255D.png?imgmax=800'' rel=''image_src''/>
<meta content=''131200250238772'' property=''fb:admins''/>
<!-- Facebook Instant Articles -->
<meta content=''131200250238772'' property=''fb:pages''/><meta content=''09F5F270E3016847B9723E71AEE3FC24'' name=''msvalidate.01''/>
<meta content=''0XST85Xh5F'' name=''baidu-site-verification''/>
<meta content=''102285e6f21741f433c6400b5ec23fa7'' name=''p:domain_verify''/>
<!-- ======================================== -->
<script src=''//pulipulichen.github.io/blogger/blogger/js/script.js'' type=''text/javascript''></script>
<script src=''//pulipulichen.github.io/blogger/blogger/js/script-item.js'' type=''text/javascript''></script>
<!-- ======================================== -->
<!-- <link rel="stylesheet" type="text/css" href="//pulipulichen.github.io/blogger/blogger/css/style-olw.css"/> -->
</head>
<body>
<script src=''https://connect.facebook.net/en_US/all.js#xfbml=1''></script>
<div class=''firstload-background''></div>
<div class=''site'' id=''page''>
<div id=''masthead'' role=''banner''>
<div class=''container''>
<div class=''navbar navbar-inverse''>
<div class=''navbar-inner''>
<div class=''btn-navbar'' data-target=''.nav-collapse'' data-toggle=''collapse'' type=''button''>
<img src=''//lh3.googleusercontent.com/-joQnbCCa6Jg/VwFqIuKnCCI/AAAAAAACuUo/iZTPC_EVSyE/s0/bmenu_brown.png''/></div>
<header>
<div class=''back-button'' onclick=''javascript: _header_back_button_click();''>
<i aria-hidden=''true'' class=''fa fa-arrow-left''></i>
</div>
<div class=''header section'' id=''header''><div class=''widget Header'' data-version=''1'' id=''Header1''>
<div id=''header-inner'' style=''background-image: url("http://puddingchen.35.googlepages.com/pudding50px.gif"); background-position: left; width: 50px; min-height: 50px; _height: 50px; background-repeat: no-repeat; ''>
<div class=''titlewrapper'' style=''background: transparent''>
<h1 class=''title'' style=''background: transparent; border-width: 0px''>
<a accesskey=''H'' href=''http://blog.pulipuli.info/''>布丁布丁吃什麼&#65311;</a>
</h1>
</div>
<div class=''descriptionwrapper'' url=''http://blog.pulipuli.info/2016/11/rwordcloud-why-rs-wordcloud-draws.html''>
<p class=''description''><span>我不是在實驗室&#65292;就是在前往實驗室的路上&#12290;</span></p>
</div>
</div>
</div></div>
</header>
<div class=''search-bar''>
<div class=''nav-search''>
<!-- <form action=''/search'' id=''searchform'' method=''get'' role=''search''> <input class=''search_input'' id=''s'' name=''q'' onblur=''if(this.value==&apos;&apos;)this.value=this.defaultValue;'' onfocus=''if(this.value==this.defaultValue)this.value=&apos;&apos;'' type=''text'' value=''Search and hit''/> </form> -->
<script type=''text/javascript''>
        (function () {
            var cx = ''017270649262638447003:o6vaq9on3vs'';
            var gcse = document.createElement(''script'');
            gcse.type = ''text/javascript'';
            gcse.async = true;
            gcse.src = ''//cse.google.com/cse.js?cx='' + cx;
            var s = document.getElementsByTagName(''script'')[0];
            s.parentNode.insertBefore(gcse, s);
        })();
    </script>
<div class=''gcse''>
<gcse:search enableAutoComplete=''true''></gcse:search>
</div>
<div class=''srch_btn'' id=''gsce_submit'' onclick=''$(&#39;input.gsc-search-button&#39;).click();''></div>
</div>
</div>
<nav>
<div class=''nav-collapse collapse''>
<ul class=''nav'' id=''menu-primary''>
<li class=''search''>
<form action=''#'' id=''searchform'' method=''get'' onsubmit=''return menu_search_submit(this);'' role=''search''>
<input class=''srch_btn'' id=''menu_gsce_submit'' type=''submit''/>
<input class=''search_input'' id=''s'' name=''q'' onblur=''if(this.value==&#39;&#39;)this.value=this.defaultValue;'' onfocus=''if(this.value==this.defaultValue)this.value=&#39;&#39;'' type=''text'' value=''Search and hit''/>
</form>
</li>
<li class=''home''>
<a accesskey=''U'' class=''accesskey-menu'' href=''#menu-anchor'' id=''menu-anchor'' title=''accesskey: menu''> ::: </a>
<a accesskey=''N'' class=''accesskey-menu'' href=''#menu-anchor'' title=''accesskey: menu''></a>
<a href=''http://blog.pulipuli.info/''>HOME</a>
</li>
<li><a href=''/p/sitemap.html#sitemap''>SITEMAP</a></li>
<li><a href=''/p/about_38.html''>ABOUT</a></li>
<li class=''dropdown''><a class=''dropdown-toggle'' data-toggle=''dropdown'' href=''#''>MENU<i class=''icon-angle-down''></i></a>
<ul class=''dropdown-menu''>
<li><a href=''/p/publications.html''>PUBLICATIONS</a></li>
<li><a href=''/search/label/作品''>WORKS</a></li>
<li><a href=''/p/archives.html''>ARCHIVES</a></li>
<li><a href=''/p/labels.html''>LABELS</a></li>
<li><a href=''/2005/12/blogger_113544406852218769.html''>CONTACT</a></li>
</ul>
</li>
<li class=''help''>
<a href=''/p/sitemap.html''>
<span class=''icon'' title=''HELP''>?</span>
<span class=''title''>HELP</span>
</a>
</li>
</ul>
</div>
</nav>
</div>
</div>
</div>
<div class=''clear''></div>
</div>
<div class=''clear''></div>
<div class=''container'' id=''content-wrapper''>
<div class=''row'' id=''primary''>
<div class=''span9 main'' id=''content'' role=''main''>
<a accesskey=''C'' href=''#content-anchor'' id=''content-anchor'' title=''accesskey: main section''> ::: </a>
<div class=''main section'' id=''main''><div class=''widget Blog'' data-version=''1'' id=''Blog1''>
<div class=''post''>
<div class=''entry-container''>
<div class=''entry-content''><article>
<h1>
R的文字雲怎麼都是&#9633;亂碼&#65311;wordcloud套件需要中文字形 / Why R&#8217;s wordcloud draws Chinese in &#9633;?
<div class=''meta1''>
<p>
<small>
<span>
<i class=''fa fa-clock-o''></i>
11月 06, 2016
</span>
<span>
<i class=''fa fa-tags''></i>
<span class=''label-info''>
<a href=''http://blog.pulipuli.info/search/label/Programming%2FR'' rel=''tag''>
Programming/R
</a>

                                    ,
                                
<a href=''http://blog.pulipuli.info/search/label/Software%2FR'' rel=''tag''>
Software/R
</a>
</span>
</span>
<span>
<i class=''fa fa-comments''></i>
0 Comments
                </span>
<span class=''item-control blog-admin pid-1225433249''>
<a href=''https://www.blogger.com/post-edit.g?blogID=16607461&postID=7531801512378558602&from=pencil'' target=''_blank'' title=''編輯文章''>
<i aria-hidden=''true'' class=''fa fa-pencil-square-o''></i>
        Edit Post
      </a>
</span>
</small>
</p></div>
</h1>
<p><a href="https://lh3.googleusercontent.com/-0cUTVAiMLuo/WB7p2yTmgOI/AAAAAAAC814/MB5jbV0PdxE/s1600-h/image%25255B3%25255D.png"><img title="image" style="border-top: 0px; border-right: 0px; background-image: none; border-bottom: 0px; padding-top: 0px; padding-left: 0px; border-left: 0px; display: inline; padding-right: 0px" border="0" alt="image" src="https://lh3.googleusercontent.com/-jlcNpnoN3KI/WB7p5iPhBBI/AAAAAAAC818/6THEZ4Y5Ytw/image_thumb%25255B1%25255D.png?imgmax=800" width="1054" height="576" /></a></p>  <p>這篇只是很短地記錄解決在<a href="https://cran.r-project.org/">R</a>中使用<a href="https://cran.r-project.org/web/packages/wordcloud/index.html">wordcloud套件</a>畫不出中文文字雲的原因與做法&#12290;</p>  <p>&#160;</p>  <a name=''more''></a>  <hr />  <h4>文字雲都是&#9633;亂碼 / &#9633; word cloud</h4>  <p>根據<a href="https://rstudio-pubs-static.s3.amazonaws.com/31867_8236987cf0a8444e962ccd2aec46d9c3.html">Basic Text Mining in R</a>&#12289;陳嘉葳的<a href="http://rstudio-pubs-static.s3.amazonaws.com/12422_b2b48bb2da7942acaca5ace45bd8c60c.html">用R進行中文 text Mining</a>&#12289;還有Byran的<a href="http://blog.bryanbigdata.com/2014/06/r-text-mining.html">[R] TEXT MINING(文字探勘&#12289;文本分析練習)</a>這幾篇的教學&#65292;我終於處理到可以用wordcloud套件畫文字雲的進度&#12290;</p>  <p>原本的斷詞與詞頻結果如下&#65306;</p>  <pre>Terms    ppt2.txt ppt.txt
  公主          1       0
  原因          1       0
  同學          0       1
  名字          1       0
  地板          1       0
  小女          1       0
  手機          1       0
  水質          1       0
  畢業生        0       1
  白痴          1       0</pre>

<p>但是wordcloud輸出的結果卻是如下圖&#65306;</p>

<p><a href="https://lh3.googleusercontent.com/-8hpUDJ8u5iU/WB7p7-6WiAI/AAAAAAAC82A/tA2v3flp5Jk/s1600-h/5165309564192%25255B5%25255D.jpg"><img title="5165309564192" style="border-left-width: 0px; border-right-width: 0px; background-image: none; border-bottom-width: 0px; padding-top: 0px; padding-left: 0px; display: inline; padding-right: 0px; border-top-width: 0px" border="0" alt="5165309564192" src="https://lh3.googleusercontent.com/-5b_tMZW5fRI/WB7p9s4z68I/AAAAAAAC82E/70VABvQzwSw/5165309564192_thumb%25255B1%25255D.jpg?imgmax=800" width="251" height="221" /></a></p>

<p>怎麼中文會變成&#9633;亂碼&#65311;難道這又是編碼(encoding)的問題嗎&#65311;</p>

<p>不&#65292;作為一個Linux常識人&#65292;如果看到&#9633;的話我們第一個要想到的問題是&#65306;<font color="#ff0000"><strong>系統中沒有中文字形</strong></font>&#12290;</p>

<p>出現這樣的問題&#65292;其原因就是因為我使用的作業系統是英文版的Ubuntu 14.04&#65292;是全新空的作業系統&#65292;而不是一般教學文所使用的Windows&#12290;在預設英文的Ubuntu裡面沒有中文字形&#65292;那麼wordcloud當然畫不出含有中文字的文字雲囉&#12290;</p>

<h4>在Ubuntu中安裝中文字形 / Install Chinese Font in Ubuntu</h4>

<p>要安裝中文字形&#65292;我們應該就從開放原始碼的字形中來挑選&#12290;我就參考<a href="https://ingramchen.io/blog/2014/07/ubuntu-noto-font.html">Ubuntu 安裝思源字體</a>這篇&#65292;安裝Google推出的思源CJK字體(note)吧&#12290;</p>

<p>因為這一篇我沒打算仔細講&#65292;所以大概列出我處理的大綱&#65306;</p>

<ol>
  <li>在Google Note Fonts下載字形&#65292;選擇DOWNLOAD ALL FONTS&#65306; 
    <br /><a title="https://www.google.com/get/noto/" href="https://www.google.com/get/noto/">https://www.google.com/get/noto/</a> </li>

  <li>在Linux現在使用的家目錄底下建立.fonts/noto資料夾&#65306; 
    <br />

    <pre><code>mkdir -p ~/.font/noto</code></pre>
  </li>

  <li>從下載下來的思源字形壓縮檔Noto-hinted.zip中解壓縮副檔名為.otf的檔案&#65292;上傳到 ~/.fonts/note </li>

  <li>建立~/.fonts.conf檔案&#65292;內容如下&#65306; 
    <br />

    <pre><code class="html">&lt;fontconfig&gt;<br />&#160; &lt;match target=&quot;pattern&quot;&gt;<br />&#160;&#160;&#160; &lt;test qual=&quot;any&quot; name=&quot;family&quot;&gt;<br />&#160;&#160;&#160;&#160;&#160; &lt;string&gt;sans-serif&lt;/string&gt;<br />&#160;&#160;&#160; &lt;/test&gt;<br />&#160;&#160;&#160; &lt;edit name=&quot;family&quot; mode=&quot;prepend&quot; binding=&quot;strong&quot;&gt;<br />&#160;&#160;&#160;&#160;&#160; &lt;string&gt;Noto Sans T Chinese&lt;/string&gt;<br />&#160;&#160;&#160;&#160;&#160; &lt;string&gt;Noto Sans S Chinese&lt;/string&gt;<br />&#160;&#160;&#160;&#160;&#160; &lt;string&gt;Noto Sans Japanese&lt;/string&gt;<br />&#160;&#160;&#160;&#160;&#160; &lt;string&gt;Noto Sans Korean&lt;/string&gt;<br />&#160;&#160;&#160; &lt;/edit&gt;<br />&#160; &lt;/match&gt;<br />&lt;/fontconfig&gt;</code></pre>
  </li>

  <li>重新開機 </li>
</ol>

<h4>再次建立文字雲 / Create word cloud again</h4>

<p><a href="https://lh3.googleusercontent.com/-JVvQRNnpiH4/WB7p_-AvgEI/AAAAAAAC82I/ZHKlvp6ItCI/s1600-h/5165351736628%25255B2%25255D.jpg"><img title="5165351736628" style="border-top: 0px; border-right: 0px; background-image: none; border-bottom: 0px; padding-top: 0px; padding-left: 0px; border-left: 0px; display: inline; padding-right: 0px" border="0" alt="5165351736628" src="https://lh3.googleusercontent.com/--7GeSbxXKW4/WB7qCc8DgxI/AAAAAAAC82M/N_XWJTnxveA/5165351736628_thumb.jpg?imgmax=800" width="263" height="291" /></a></p>

<p>再次回到R中執行wordcloud()產生文字雲的語法&#65292;稍等一段時間之後&#65292;就能夠正常畫出如上圖的文字雲了(結論是老婆最大&#65311;)&#12290;至於如何調整字形之間的間距&#12289;選擇顏色之類的細節&#65292;就有待後續研究&#12290;</p>
</article></div></div>
<div class=''clear''></div>
<div class=''entry-meta clearfix''>
<div class=''up_arrow''></div>
<aside>
<div class=''pull-left author-meta''>
<script src=''/feeds/posts/default/7531801512378558602?alt=json-in-script&amp;callback=av''></script>
<h4 class=''bl_popover'' data-content=''這個布丁是在無聊的世界中找尋樂趣的一種不能吃的食物，喜愛動漫畫、遊戲、程式，以及跟世間脫節的生活步調。'' data-placement=''top'' data-title=''Admin'' data-trigger=''hover''>
<a href=''/p/about.html''>

                布丁布丁吃布丁
                <i aria-hidden=''true'' class=''fa fa-info-circle''></i>
</a>
</h4>
<div class=''creative-commons''>
<a class=''img'' href=''http://creativecommons.org/licenses/by-nc-sa/3.0/tw/'' rel=''license''>
<img alt=''創用 CC 授權條款'' src=''https://i.creativecommons.org/l/by-nc-sa/3.0/tw/80x15.png''/>
</a>
<span class=''title'' href=''http://purl.org/dc/dcmitype/Text'' property=''dct:title'' rel=''dct:type'' xmlns:dct=''http://purl.org/dc/terms/''>
R的文字雲怎麼都是&#9633;亂碼&#65311;wordcloud套件需要中文字形 / Why R&#8217;s wordcloud draws Chinese in &#9633;?
</span>
        是由
        <a class=''author'' href='''' property=''cc:attributionName'' rel=''cc:attributionURL'' xmlns:cc=''http://creativecommons.org/ns#''>布丁布丁吃布丁</a>
        製作&#65292;以<a href=''http://creativecommons.org/licenses/by-nc-sa/3.0/tw/'' rel=''license''>創用CC 姓名標示-非商業性-相同方式分享 3.0 台灣 授權條款</a>釋出&#12290;
    </div>
</div>
<div class=''pull-right share-story-container''>
<ul class=''share-story''>
<li><a class=''tips social-button facebook'' data-title=''Facebook'' href=''http://www.addthis.com/bookmark.php?v=300&winname=addthis&pub=pulipuli&s=facebook&source=msd-1.0&url=http://blog.pulipuli.info/2016/11/rwordcloud-why-rs-wordcloud-draws.html&title=R的文字雲怎麼都是□亂碼？wordcloud套件需要中文字形 / Why R’s wordcloud draws Chinese in □?&ate=AT-pulipuli/-/per-13/-/4&frommenu=1&ips=1&uud=1&ct=1&pre=http%3A%2F%2Fblog.pulipuli.info%2F&tt=0&captcha_provider=nucaptcha&pro=1'' target=''_blank''>
<i class=''fa fa-facebook''></i>
</a></li>
<li><a class=''tips social-button line'' data-title=''LINE'' href=''http://www.addthis.com/bookmark.php?v=300&winname=addthis&pub=pulipuli&s=lineme&source=msd-1.0&url=http://blog.pulipuli.info/2016/11/rwordcloud-why-rs-wordcloud-draws.html&title=R的文字雲怎麼都是□亂碼？wordcloud套件需要中文字形 / Why R’s wordcloud draws Chinese in □?&ate=AT-pulipuli/-/per-13/-/4&frommenu=1&ips=1&uud=1&ct=1&pre=http%3A%2F%2Fblog.pulipuli.info%2F&tt=0&captcha_provider=nucaptcha&pro=1'' target=''_blank''>
<strong>L</strong>
</a></li>
<li><a class=''tips social-button plurk'' data-title=''Plurk'' href=''http://www.addthis.com/bookmark.php?v=300&winname=addthis&pub=pulipuli&s=plurk&source=msd-1.0&url=http://blog.pulipuli.info/2016/11/rwordcloud-why-rs-wordcloud-draws.html&title=R的文字雲怎麼都是□亂碼？wordcloud套件需要中文字形 / Why R’s wordcloud draws Chinese in □?&ate=AT-pulipuli/-/per-13/-/4&frommenu=1&ips=1&uud=1&ct=1&pre=http%3A%2F%2Fblog.pulipuli.info%2F&tt=0&captcha_provider=nucaptcha&pro=1'' target=''_blank''>
<strong>P</strong>
</a></li>
<li><a class=''tips social-button google-plus'' data-title=''Google Plus'' href=''http://www.addthis.com/bookmark.php?v=300&winname=addthis&pub=pulipuli&s=google_plusone_share&source=msd-1.0&url=http://blog.pulipuli.info/2016/11/rwordcloud-why-rs-wordcloud-draws.html&title=R的文字雲怎麼都是□亂碼？wordcloud套件需要中文字形 / Why R’s wordcloud draws Chinese in □?&ate=AT-pulipuli/-/per-13/-/4&frommenu=1&ips=1&uud=1&ct=1&pre=http%3A%2F%2Fblog.pulipuli.info%2F&tt=0&captcha_provider=nucaptcha&pro=1'' target=''_blank''>
<i class=''fa fa-google-plus''></i>
</a></li>
<li><a class=''tips social-button email'' data-title=''Email'' href=''http://www.addthis.com/bookmark.php?v=300&winname=addthis&pub=pulipuli&s=email&source=msd-1.0&url=http://blog.pulipuli.info/2016/11/rwordcloud-why-rs-wordcloud-draws.html&title=R的文字雲怎麼都是□亂碼？wordcloud套件需要中文字形 / Why R’s wordcloud draws Chinese in □?&ate=AT-pulipuli/-/per-13/-/4&frommenu=1&ips=1&uud=1&ct=1&pre=http%3A%2F%2Fblog.pulipuli.info%2F&tt=0&captcha_provider=nucaptcha&pro=1'' target=''_blank''>
<i class=''fa fa-envelope''></i>
</a></li>
<li><a class=''tips social-button addthis'' data-title=''More Share'' href=''http://www.addthis.com/bookmark.php?v=300&winname=addthis&pub=pulipuli&source=msd-1.0&url=http://blog.pulipuli.info/2016/11/rwordcloud-why-rs-wordcloud-draws.html&title=R的文字雲怎麼都是□亂碼？wordcloud套件需要中文字形 / Why R’s wordcloud draws Chinese in □?&ate=AT-pulipuli/-/per-13/-/4&frommenu=1&ips=1&uud=1&ct=1&pre=http%3A%2F%2Fblog.pulipuli.info%2F&tt=0&captcha_provider=nucaptcha&pro=1'' target=''_blank''>
<i class=''fa fa-plus''></i>
</a></li>
</ul>
</div>
<div class=''clear''></div>
</aside>
</div>
<div class=''related_posts''>
<script type=''text/javascript''>
          var maxresults=10;
          var splittercolor="";
          var relatedpoststitle="Related Posts";
        </script>
<div id=''related-posts''>
<script src=''/feeds/posts/default/-/Programming/R?alt=json-in-script&callback=pulipuli_related_results_labels_thumbs&max-results=6'' type=''text/javascript''></script>
<script src=''/feeds/posts/default/-/Software/R?alt=json-in-script&callback=pulipuli_related_results_labels_thumbs&max-results=6'' type=''text/javascript''></script>
<script type=''text/javascript''>
                    removeRelatedDuplicates_thumbs();
                    printRelatedLabels_thumbs("http://blog.pulipuli.info/2016/11/rwordcloud-why-rs-wordcloud-draws.html");
                </script>
</div>
<div style=''clear:both''></div>
</div>
</div>
<div class=''comments'' id=''disqus_thread''></div>
<div class=''comments'' id=''comments''>
<a name=''comments''></a>
<h4>
0
意見:
        
</h4>
<div id=''Blog1_comments-block-wrapper''>
<div class=''avatar-comment-indent'' id=''comments-block''>
</div>
</div>
<p class=''comment-footer''>
<div class=''comment-form''>
<a name=''comment-form''></a>
<p>
</p>
<a href=''https://www.blogger.com/comment-iframe.g?blogID=16607461&postID=7531801512378558602'' id=''comment-editor-src''></a>
<a href=''https://www.blogger.com/comment-iframe.g?blogID=16607461&postID=7531801512378558602'' id=''c'' name=''c''></a>
<iframe allowtransparency=''true'' class=''blogger-iframe-colorize blogger-comment-from-post'' frameborder=''0'' height=''210'' id=''comment-editor'' name=''comment-editor'' src='''' width=''100%''></iframe>
<script type="text/javascript" src="https://www.blogger.com/static/v1/jsbin/1718213449-comment_from_post_iframe.js"></script>
<script type=''text/javascript''>
      BLOG_CMT_createIframe(''https://www.blogger.com/rpc_relay.html'', ''04122398539701750448'');
    </script>
</div>
</p>
<div id=''backlinks-container''>
<div id=''Blog1_backlinks-container''>
<script type=''text/javascript''>
                var disqus_shortname = ''pulipuli'';
                var disqus_blogger_current_url = "http://blog.pulipuli.info/2016/11/rwordcloud-why-rs-wordcloud-draws.html";
                if (!disqus_blogger_current_url.length) {
                    disqus_blogger_current_url = "http://blog.pulipuli.info/2016/11/rwordcloud-why-rs-wordcloud-draws.html";
                }
                var disqus_blogger_homepage_url = "http://blog.pulipuli.info/";
                var disqus_blogger_canonical_homepage_url = "http://blog.pulipuli.info/";
            </script>
<style type=''text/css''>
                    #comments {display:none;}
                </style>
<script type=''text/javascript''>
                    $(function() {
                        var bloggerjs = document.createElement(''script'');
                        bloggerjs.type = ''text/javascript'';
                        bloggerjs.async = true;
                        bloggerjs.src = ''//''+disqus_shortname+''.disqus.com/blogger_item.js'';
                        //(document.getElementsByTagName(''head'')[0] || document.getElementsByTagName(''body'')[0]).appendChild(bloggerjs);
                        _disqus_embed();
                    });
                </script>
<style type=''text/css''>
                    .post-comment-link { visibility: hidden; }
                </style>
<script type=''text/javascript''>
                (function() {
                    var bloggerjs = document.createElement(''script'');
                    bloggerjs.type = ''text/javascript'';
                    bloggerjs.async = true;
                    bloggerjs.src = ''//''+disqus_shortname+''.disqus.com/blogger_index.js'';
                    (document.getElementsByTagName(''head'')[0] || document.getElementsByTagName(''body'')[0]).appendChild(bloggerjs);
                })();
                </script>
<a name=''links''></a><h4>
</h4>
<p class=''comment-footer''>
<a id=''comment-form-anchor'' name=''comment-form-anchor''></a>
<a class=''comment-link'' href='''' id=''Blog1_backlinks-create-link'' target=''_blank''>
</a>
</p>
</div>
</div>
</div>
<div class=''blog-pager'' id=''blog-pager''>
<nav>
<ul class=''pager''>
<li class=''previous link''>
<span id=''blog-pager-newer-link''>
<a class=''blog-pager-newer-link'' href=''http://blog.pulipuli.info/2016/11/rrstudio-server-openvz-standalone-r.html'' id=''Blog1_blog-pager-newer-link'' title=''較新的文章''>
<i class=''fa fa-chevron-left''></i>
較新的文章
</a>
</span>
</li>
<li>
<a class=''home-link'' href=''http://blog.pulipuli.info/''>首頁</a>
</li>
<li class=''next link''>
<span id=''blog-pager-older-link''>
<a class=''blog-pager-older-link'' href=''http://blog.pulipuli.info/2016/11/rubuntur-how-to-install-archived.html'' id=''Blog1_blog-pager-older-link'' title=''較舊的文章''>
<i class=''fa fa-chevron-right''></i>
較舊的文章
</a>
</span>
</li>
</ul>
</nav>
</div>
<div class=''clear''></div>
<div class=''post-feeds''>
<div class=''feed-links''>
訂閱&#65306;
<a class=''feed-link'' href=''http://blog.pulipuli.info/feeds/7531801512378558602/comments/default'' target=''_blank'' type=''application/atom+xml''>張貼留言 (Atom)</a>
</div>
</div>
<script type="text/javascript">window.___gcfg = {''lang'': ''zh_TW''};</script>
</div></div>
</div>
<div class=''span3'' id=''side-bar''>
<a accesskey=''R'' href=''#side-bar-anchor'' id=''side-bar-anchor'' title=''accesskey: sidebar section''> ::: </a>
<div class=''sidebar section'' id=''sidebar''>
<div class=''widget HTML about-me''>
<a class=''icon'' href=''/p/about_38.html'' target=''_blank''><i aria-hidden=''true'' class=''fa fa-info-circle''></i></a>
<h2 class=''title''>
<span>About Me</span>
</h2>
<div class=''widget-content''>
<h3>布丁布丁吃布丁</h3>
<a class=''avatar-image-container'' href=''//lh3.googleusercontent.com/-tkBPlsBsFJg/V0M0b-gPKNI/AAAAAAACw9Y/Y-2BGg4z3H4/Image.jpg?imgmax=800''>
<img align=''right'' alt=''pudding(500px)'' border=''0'' height=''54'' src=''//lh3.googleusercontent.com/-tkBPlsBsFJg/V0M0b-gPKNI/AAAAAAACw9Y/Y-2BGg4z3H4/Image.jpg?imgmax=50'' style=''border-right-width: 0px; border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px;margin-left: 0.5rem;'' width=''54''/>
</a>
<div class=''description''>
            這個布丁是在無聊的世界中找尋樂趣的一種不能吃的食物&#65292;喜愛動漫畫&#12289;遊戲&#12289;程式&#65292;以及跟世間脫節的生活步調&#12290;
        </div>
<div class=''about-link''>
<span class=''social-button-wrapper''>
<a class=''social-button facebook'' href=''http://fb.blog.pulipuli.info/'' target=''_blank'' title=''Facebook''>
<i class=''fa fa-facebook''></i>
</a>
</span>
<span class=''social-button-wrapper''>
<a class=''social-button plurk'' href=''http://plurk.pulipuli.info'' target=''_blank'' title=''Plurk''>
<strong>P</strong>
</a>
</span>
<span class=''social-button-wrapper''>
<a class=''social-button rss'' href=''http://rss.blog.pulipuli.info'' target=''_blank'' title=''RSS''>
<i class=''fa fa-rss''></i>
</a>
</span>
<span class=''social-button-wrapper''>
<a class=''social-button email'' href=''mailto:blog@pulipuli.info'' target=''_blank'' title=''Email''>
<i class=''fa fa-envelope''></i>
</a>
</span>
<a class=''read-more about'' href=''/p/sitemap.html#subscribe''>訂閱</a>
<a class=''read-more about'' href=''/p/about_38.html''>自我介紹...</a>
</div>
<div class=''clear''></div>
</div>
</div>
<!-- =================================================== -->
<!-- 隨機文章 -->
<div class=''widget HTML random''>
<a class=''icon'' onclick=''_load_random_posts()''><i aria-hidden=''true'' class=''fa fa-refresh''></i></a>
<h2 class=''title''>
<span>Random Posts</span>
</h2>
<div class=''widget-content''>
<ul id=''random_posts''></ul>
</div>
<!-- <div class="widget-content"> -->
<div class=''clear''></div>
</div>
<!-- =================================================== -->
<div class=''widget HTML guestbook''>
<a class=''icon'' href=''/feeds/113544406852218769/comments/default'' target=''_blank''><i aria-hidden=''true'' class=''fa fa-rss-square''></i></a>
<h2 class=''title''>
<span>Guestbook</span>
</h2>
<div class=''widget-content''>
<!-- <script type="text/javascript" src="https://dl.dropboxusercontent.com/u/717137/blogger/js/puliGuestBook.js"></script> -->
<script src=''//pulipulichen.github.io/blogger/blogger/js/puliGuestBook.js'' type=''text/javascript''></script>
<script type=''text/javascript''>
// 布丁式Blogger留言板
// @param {Object} config 設定
jQuery.puliGuestBook({
    blogID: "16607461",    //blog的ID
    postID: "113544406852218769",    //post的ID
    url: "/2005/12/blogger_113544406852218769.html",    //訂閱張貼意見的網址&#65292;或是文章ID:115667103250300740
    css: "//pulipulichen.github.io/blogger/blogger/css/puliGuestBook.css",    //CSS樣式表
    container: "#puliGuestBook",    //顯示留言的元素
    listNumber: 20,    //顯示留言數量&#12290;超過此數量時&#65292;會顯示&#12300;閱讀全部留言&#12301;的連結&#12290;
    adminName: ''布丁布丁吃布丁'',    //Blog主人的名字
    adminPhoto: ''//1.bp.blogspot.com/_yr4MQB4zDus/SZ4Mb30N0aI/AAAAAAAAFUg/3OGhwhzBUOg/S45/'',    //部落格主人的照片
    anonymous: ''匿名'',    //匿名者的名字
    readMore: ''閱讀全部留言'',    //閱讀全部留言連結的名稱
    write: ''撰寫留言'',    //撰寫留言連結的名稱
    reload: ''重新讀取'',    //重新讀取連結的名稱
    addLink: "/2005/12/blogger_113544406852218769.html" //撰寫留言的按鈕連結
});
</script>
</div>
<div class=''clear''></div>
</div>
<!-- =================================================== -->
<div class=''widget HTML new''>
<a class=''icon'' href=''/feeds/posts/default'' target=''_blank''><i aria-hidden=''true'' class=''fa fa-rss-square''></i></a>
<h2 class=''title''>
<span>Recent Posts</span>
</h2>
<div class=''widget-content''>
<div id=''puliHandlePostNode''></div>
</div>
<div class=''clear''></div>
</div>
<!-- =================================================== -->
<div class=''widget HTML comments''>
<a class=''icon'' href=''/feeds/comments/default'' target=''_blank''><i aria-hidden=''true'' class=''fa fa-rss-square''></i></a>
<h2 class=''title''>
<span>Comments</span>
</h2>
<div class=''widget-content''>
<div id=''puliCommentsNode''></div>
<script type=''text/javascript''>
jQuery.getScript("//pulipulichen.github.io/blogger/blogger/js/puliHandleRecentFunction.js", function () {
    
    var pHP = puliHandlePost();
    pHP.bloggerName = "pulipuli";
    pHP.postshow = 10;
    pHP.titlelen = "";
    pHP.layout = decodeURI("%25title%25%20(%25Y%25-%25M%25-%25D%25%20)");
    pHP.tagname = "";
    pHP.callback = function () {
        var pHC = puliHandleComments();
        pHC.bloggerName = "pulipuli";
        pHC.postshow = 10;
        pHC.titlelen = "20";
        pHC.layout = decodeURI("%3Cstrong%3E%25authorname%25%3C/strong%3E(%25Y%25-%25M%25-%25D%25)%3Cbr%20/%3E%25comment%25");
        pHC.load("puliCommentsNode");
    };
    pHP.load("puliHandlePostNode");
    
});</script>
</div>
<div class=''clear''></div>
</div>
</div>
</div>
<div class=''clear''></div>
</div>
</div>
<div class=''site-footer'' id=''colophon'' role=''contentinfo''>
<div class=''container''>
<a accesskey=''B'' href=''#footer-anchor'' id=''footer-anchor'' title=''accesskey: footer section''> ::: </a>
<div class=''row-fluid'' id=''footer-body''>
<div class=''cleanwidget  nopadding span4 bl_html section'' id=''column1''>
<!-- <b:section class=''cleanwidget nopadding span4 bl_html'' id=''column1'' preferred=''yes''> <b:widget id=''Text1'' locked=''false'' title=''About us'' type=''Text''> <b:includable id=''main''> <b:if cond=''data:title != &quot;&quot;''> <h2 class=''title''><data:title/></h2> </b:if> <div class=''widget-content''> <data:content/> </div> <b:include name=''quickedit''/> </b:includable> </b:widget> </b:section> -->
<div class=''widget Text donation'' id=''donation''>
<h2 class=''title''>Buy Me A Coffee</h2>
<div class=''widget-content''>
<form action=''https://www.paypal.com/cgi-bin/webscr'' method=''post'' onclick=''this.submit()'' style=''cursor:pointer;'' target=''paypal''>
<input name=''cmd'' type=''hidden'' value=''_s-xclick''/>
<input name=''encrypted'' type=''hidden'' value=''-----BEGIN PKCS7-----MIIHXwYJKoZIhvcNAQcEoIIHUDCCB0wCAQExggEwMIIBLAIBADCBlDCBjjELMAkGA1UEBhMCVVMxCzAJBgNVBAgTAkNBMRYwFAYDVQQHEw1Nb3VudGFpbiBWaWV3MRQwEgYDVQQKEwtQYXlQYWwgSW5jLjETMBEGA1UECxQKbGl2ZV9jZXJ0czERMA8GA1UEAxQIbGl2ZV9hcGkxHDAaBgkqhkiG9w0BCQEWDXJlQHBheXBhbC5jb20CAQAwDQYJKoZIhvcNAQEBBQAEgYBUrz0/1hIxEEO4OFdQXZdH0QZZ9mqRwFIkOYemriO7DSLPhH2etiCoLYf6zzTMfX66UoAydIhqUE35I8357WIywvKAaBO6SPhtkxWvprNmU7EUft/MUweL94Smh4Zw0NQ0fc4bRJgN+q3p4kapCqb0wS8Ec0ekpo83wNKZp6AZBTELMAkGBSsOAwIaBQAwgdwGCSqGSIb3DQEHATAUBggqhkiG9w0DBwQIJzrc2jfLw7qAgbhyHOESq1SPpM5wIiZ65HWoLFpvVgU1x5ykpsFGW+Ojp7gEOlJA5HKLjgCZv8wOPls4iHzrOGXv3e5BIYUu/eA3/nOdqo4GVnsfEQ69+umd8szbBXkBjXOauOVeJdW8X0JGIyQjt+iMjovX7ronARKjlThbZBuSJgx9/OSNJRunbsPlbHJr7fN66AHIbL4B4w+BkRnWPu5DhFYfZdjOdSBLxfcit6RpwOOAQ+1nTnqhGbr8aEROSpMRoIIDhzCCA4MwggLsoAMCAQICAQAwDQYJKoZIhvcNAQEFBQAwgY4xCzAJBgNVBAYTAlVTMQswCQYDVQQIEwJDQTEWMBQGA1UEBxMNTW91bnRhaW4gVmlldzEUMBIGA1UEChMLUGF5UGFsIEluYy4xEzARBgNVBAsUCmxpdmVfY2VydHMxETAPBgNVBAMUCGxpdmVfYXBpMRwwGgYJKoZIhvcNAQkBFg1yZUBwYXlwYWwuY29tMB4XDTA0MDIxMzEwMTMxNVoXDTM1MDIxMzEwMTMxNVowgY4xCzAJBgNVBAYTAlVTMQswCQYDVQQIEwJDQTEWMBQGA1UEBxMNTW91bnRhaW4gVmlldzEUMBIGA1UEChMLUGF5UGFsIEluYy4xEzARBgNVBAsUCmxpdmVfY2VydHMxETAPBgNVBAMUCGxpdmVfYXBpMRwwGgYJKoZIhvcNAQkBFg1yZUBwYXlwYWwuY29tMIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQDBR07d/ETMS1ycjtkpkvjXZe9k+6CieLuLsPumsJ7QC1odNz3sJiCbs2wC0nLE0uLGaEtXynIgRqIddYCHx88pb5HTXv4SZeuv0Rqq4+axW9PLAAATU8w04qqjaSXgbGLP3NmohqM6bV9kZZwZLR/klDaQGo1u9uDb9lr4Yn+rBQIDAQABo4HuMIHrMB0GA1UdDgQWBBSWn3y7xm8XvVk/UtcKG+wQ1mSUazCBuwYDVR0jBIGzMIGwgBSWn3y7xm8XvVk/UtcKG+wQ1mSUa6GBlKSBkTCBjjELMAkGA1UEBhMCVVMxCzAJBgNVBAgTAkNBMRYwFAYDVQQHEw1Nb3VudGFpbiBWaWV3MRQwEgYDVQQKEwtQYXlQYWwgSW5jLjETMBEGA1UECxQKbGl2ZV9jZXJ0czERMA8GA1UEAxQIbGl2ZV9hcGkxHDAaBgkqhkiG9w0BCQEWDXJlQHBheXBhbC5jb22CAQAwDAYDVR0TBAUwAwEB/zANBgkqhkiG9w0BAQUFAAOBgQCBXzpWmoBa5e9fo6ujionW1hUhPkOBakTr3YCDjbYfvJEiv/2P+IobhOGJr85+XHhN0v4gUkEDI8r2/rNk1m0GA8HKddvTjyGw/XqXa+LSTlDYkqI8OwR8GEYj4efEtcRpRYBxV8KxAW93YDWzFGvruKnnLbDAF6VR5w/cCMn5hzGCAZowggGWAgEBMIGUMIGOMQswCQYDVQQGEwJVUzELMAkGA1UECBMCQ0ExFjAUBgNVBAcTDU1vdW50YWluIFZpZXcxFDASBgNVBAoTC1BheVBhbCBJbmMuMRMwEQYDVQQLFApsaXZlX2NlcnRzMREwDwYDVQQDFAhsaXZlX2FwaTEcMBoGCSqGSIb3DQEJARYNcmVAcGF5cGFsLmNvbQIBADAJBgUrDgMCGgUAoF0wGAYJKoZIhvcNAQkDMQsGCSqGSIb3DQEHATAcBgkqhkiG9w0BCQUxDxcNMTYwMjI5MDcwMDUyWjAjBgkqhkiG9w0BCQQxFgQUN7BuShMI5TMd75rse5P5FWUUuZAwDQYJKoZIhvcNAQEBBQAEgYCcP7uxVRe1E4W+6Am2a419jCX1yQTkB9BNNx2qlBybTWPlhQ30/h7nHswfdHFzwJ/2B349iZhFKb6M3XAubXsFPQdBQTJhKlIb48iUbOsMFBIeqpsAlvMsPHvqzraRmxg/EX4bnrPmd+40eaXGoGzX/PMpuwTEl2m+cBurBK+Eew==-----END PKCS7-----''/>
<div style=''width: 100%;    margin: 0 auto;font-size: 12pt;''>
<!-- <input type="image" src="https://lh3.googleusercontent.com/-kmGazSfZHxQ/VwFfE864o2I/AAAAAAACuUU/428W8WOmSAg/s0/coffee.png" border="0" name="submit" alt="PayPal &#65293; 更安全&#12289;更簡單的線上付款方式&#65281;" style="float:left" /> -->
<i aria-hidden=''true'' class=''fa fa-paypal'' style=''float: left;font-size: 40px;display:block; margin-top: 15px; margin-right: 10px;''></i>
<div style=''padding-top: 5px;    margin-left: 50px;''>
                    如果有幫到您的話&#65292;請布丁喝杯咖啡吧&#65281;
  <div style=''''><input class=''btn btn-default btn-small'' type=''submit'' value=''OK''/></div>
</div>
<img alt=''paypal pixel'' border=''0'' height=''1'' src=''https://www.paypalobjects.com/zh_TW/i/scr/pixel.gif'' width=''1''/>
</div>
</form>
</div>
<div class=''clear''></div>
</div>
<div class=''section'' id=''column1-stats''><div class=''widget Stats'' data-version=''1'' id=''Stats1''>
<h2>Hit Count</h2>
<div class=''widget-content''>
<div id=''Stats1_content'' style=''display: none;''>
<img alt=''Sparkline'' height=''30'' id=''Stats1_sparkline'' width=''75''/>
<span class=''counter-wrapper text-counter-wrapper'' id=''Stats1_totalCount''>
</span>
<div class=''clear''></div>
<span class=''widget-item-control''>
<span class=''item-control blog-admin''>
<a class=''quickedit'' href=''//www.blogger.com/rearrange?blogID=16607461&widgetType=Stats&widgetId=Stats1&action=editWidget&sectionId=column1-stats'' onclick=''return _WidgetManager._PopupConfig(document.getElementById("Stats1"));'' target=''configStats1'' title=''編輯''>
<img alt='''' height=''18'' src=''https://resources.blogblog.com/img/icon18_wrench_allbkg.png'' width=''18''/>
</a>
</span>
</span>
<div class=''clear''></div>
</div>
</div>
</div></div>
</div>
<div class=''cleanwidget  nopadding span8 bl_html section'' id=''column2''>
<div class=''Label section'' id=''column2-section''><div class=''widget Label'' data-version=''1'' id=''Label2''>
<h2>Labels</h2>
<div class=''widget-content cloud-label-widget-content''>
<span class=''label-size label-size-5''>
<a dir=''ltr'' href=''http://blog.pulipuli.info/search/label/%E6%97%A5%E8%A8%98''>日記</a>
<span class=''label-count'' dir=''ltr''>(231)</span>
</span>
<span class=''label-size label-size-5''>
<a dir=''ltr'' href=''http://blog.pulipuli.info/search/label/%E8%BC%94%E5%A4%A7%E5%9C%96%E8%B3%87''>輔大圖資</a>
<span class=''label-count'' dir=''ltr''>(166)</span>
</span>
<span class=''label-size label-size-5''>
<a dir=''ltr'' href=''http://blog.pulipuli.info/search/label/%E9%9B%BB%E8%85%A6%E8%BB%9F%E9%AB%94''>電腦軟體</a>
<span class=''label-count'' dir=''ltr''>(127)</span>
</span>
<span class=''label-size label-size-4''>
<a dir=''ltr'' href=''http://blog.pulipuli.info/search/label/%E6%94%BF%E5%A4%A7%E5%9C%96%E6%AA%94''>政大圖檔</a>
<span class=''label-count'' dir=''ltr''>(112)</span>
</span>
<span class=''label-size label-size-4''>
<a dir=''ltr'' href=''http://blog.pulipuli.info/search/label/%E6%9C%9F%E5%88%8A%E8%AB%96%E6%96%87%E9%96%B1%E8%AE%80''>期刊論文閱讀</a>
<span class=''label-count'' dir=''ltr''>(92)</span>
</span>
<span class=''label-size label-size-4''>
<a dir=''ltr'' href=''http://blog.pulipuli.info/search/label/%E4%BD%9C%E5%93%81''>作品</a>
<span class=''label-count'' dir=''ltr''>(75)</span>
</span>
<span class=''label-size label-size-4''>
<a dir=''ltr'' href=''http://blog.pulipuli.info/search/label/Blogger''>Blogger</a>
<span class=''label-count'' dir=''ltr''>(69)</span>
</span>
<span class=''label-size label-size-4''>
<a dir=''ltr'' href=''http://blog.pulipuli.info/search/label/%E7%B6%B2%E8%B7%AF%E7%AE%A1%E7%90%86''>網路管理</a>
<span class=''label-count'' dir=''ltr''>(69)</span>
</span>
<span class=''label-size label-size-4''>
<a dir=''ltr'' href=''http://blog.pulipuli.info/search/label/%E8%A8%98%E4%BA%8B''>記事</a>
<span class=''label-count'' dir=''ltr''>(57)</span>
</span>
<span class=''label-size label-size-4''>
<a dir=''ltr'' href=''http://blog.pulipuli.info/search/label/DSpace''>DSpace</a>
<span class=''label-count'' dir=''ltr''>(55)</span>
</span>
<span class=''label-size label-size-4''>
<a dir=''ltr'' href=''http://blog.pulipuli.info/search/label/%E7%A8%8B%E5%BC%8F%E5%AF%AB%E4%BD%9C''>程式寫作</a>
<span class=''label-count'' dir=''ltr''>(48)</span>
</span>
<span class=''label-size label-size-4''>
<a dir=''ltr'' href=''http://blog.pulipuli.info/search/label/%E7%A2%A9%E5%A3%AB%E7%95%A2%E6%A5%AD%E8%AB%96%E6%96%87''>碩士畢業論文</a>
<span class=''label-count'' dir=''ltr''>(46)</span>
</span>
<span class=''label-size label-size-4''>
<a dir=''ltr'' href=''http://blog.pulipuli.info/search/label/Proxmox''>Proxmox</a>
<span class=''label-count'' dir=''ltr''>(39)</span>
</span>
<span class=''label-size label-size-4''>
<a dir=''ltr'' href=''http://blog.pulipuli.info/search/label/JavaScript''>JavaScript</a>
<span class=''label-count'' dir=''ltr''>(32)</span>
</span>
<span class=''label-size label-size-4''>
<a dir=''ltr'' href=''http://blog.pulipuli.info/search/label/OS%2FProxmox%20VE''>OS/Proxmox VE</a>
<span class=''label-count'' dir=''ltr''>(32)</span>
</span>
<span class=''label-size label-size-3''>
<a dir=''ltr'' href=''http://blog.pulipuli.info/search/label/%E8%99%9B%E6%93%AC%E6%A9%9F%E5%99%A8''>虛擬機器</a>
<span class=''label-count'' dir=''ltr''>(28)</span>
</span>
<span class=''label-size label-size-3''>
<a dir=''ltr'' href=''http://blog.pulipuli.info/search/label/DLLL-CIAS''>DLLL-CIAS</a>
<span class=''label-count'' dir=''ltr''>(25)</span>
</span>
<span class=''label-size label-size-3''>
<a dir=''ltr'' href=''http://blog.pulipuli.info/search/label/%E7%A0%94%E7%A9%B6%E6%96%B9%E6%B3%95''>研究方法</a>
<span class=''label-count'' dir=''ltr''>(25)</span>
</span>
<span class=''label-size label-size-3''>
<a dir=''ltr'' href=''http://blog.pulipuli.info/search/label/Android''>Android</a>
<span class=''label-count'' dir=''ltr''>(24)</span>
</span>
<span class=''label-size label-size-3''>
<a dir=''ltr'' href=''http://blog.pulipuli.info/search/label/%E7%B6%B2%E7%AB%99%E6%9C%8D%E5%8B%99''>網站服務</a>
<span class=''label-count'' dir=''ltr''>(24)</span>
</span>
<span class=''label-size label-size-3''>
<a dir=''ltr'' href=''http://blog.pulipuli.info/search/label/%E9%9B%B2%E7%AB%AF%E7%A7%91%E6%8A%80%E8%88%87%E5%9C%96%E6%9B%B8%E9%A4%A8%E8%A1%8C%E5%8B%95%E6%9C%8D%E5%8B%99%E7%A0%94%E7%BF%92%E7%8F%AD%282014%29''>雲端科技與圖書館行動服務研習班(2014)</a>
<span class=''label-count'' dir=''ltr''>(24)</span>
</span>
<span class=''label-size label-size-3''>
<a dir=''ltr'' href=''http://blog.pulipuli.info/search/label/%E6%96%B0%E7%8E%A9%E5%85%B7''>新玩具</a>
<span class=''label-count'' dir=''ltr''>(23)</span>
</span>
<span class=''label-size label-size-3''>
<a dir=''ltr'' href=''http://blog.pulipuli.info/search/label/%E4%BD%9C%E6%A5%AD%E5%A0%B1%E5%91%8A''>作業報告</a>
<span class=''label-count'' dir=''ltr''>(22)</span>
</span>
<span class=''label-size label-size-3''>
<a dir=''ltr'' href=''http://blog.pulipuli.info/search/label/%E7%A0%94%E7%A9%B6%E6%89%80%E6%8E%A8%E7%94%84''>研究所推甄</a>
<span class=''label-count'' dir=''ltr''>(19)</span>
</span>
<span class=''label-size label-size-3''>
<a dir=''ltr'' href=''http://blog.pulipuli.info/search/label/Linux''>Linux</a>
<span class=''label-count'' dir=''ltr''>(18)</span>
</span>
<span class=''label-size label-size-3''>
<a dir=''ltr'' href=''http://blog.pulipuli.info/search/label/%E6%BC%94%E8%AC%9B%E5%BF%83%E5%BE%97''>演講心得</a>
<span class=''label-count'' dir=''ltr''>(18)</span>
</span>
<span class=''label-size label-size-3''>
<a dir=''ltr'' href=''http://blog.pulipuli.info/search/label/%E8%B3%87%E8%A8%8A%E8%A8%88%E9%87%8F%E5%AD%B8''>資訊計量學</a>
<span class=''label-count'' dir=''ltr''>(17)</span>
</span>
<span class=''label-size label-size-3''>
<a dir=''ltr'' href=''http://blog.pulipuli.info/search/label/%E7%84%A1%E9%A1%8C''>無題</a>
<span class=''label-count'' dir=''ltr''>(16)</span>
</span>
<span class=''label-size label-size-3''>
<a dir=''ltr'' href=''http://blog.pulipuli.info/search/label/%E8%AA%B2%E7%A8%8B%2F%E5%9C%96%E6%9B%B8%E8%B3%87%E8%A8%8A%E5%AD%B8%E7%A0%94%E7%A9%B6%E8%B6%A8%E5%8B%A2''>課程/圖書資訊學研究趨勢</a>
<span class=''label-count'' dir=''ltr''>(16)</span>
</span>
<span class=''label-size label-size-3''>
<a dir=''ltr'' href=''http://blog.pulipuli.info/search/label/Programming%2FJavaScript''>Programming/JavaScript</a>
<span class=''label-count'' dir=''ltr''>(14)</span>
</span>
<span class=''label-size label-size-3''>
<a dir=''ltr'' href=''http://blog.pulipuli.info/search/label/Zotero''>Zotero</a>
<span class=''label-count'' dir=''ltr''>(14)</span>
</span>
<span class=''label-size label-size-3''>
<a dir=''ltr'' href=''http://blog.pulipuli.info/search/label/%E5%9C%96%E8%B3%87%E5%AD%B8%E8%A1%93%E7%95%8C''>圖資學術界</a>
<span class=''label-count'' dir=''ltr''>(13)</span>
</span>
<span class=''label-size label-size-3''>
<a dir=''ltr'' href=''http://blog.pulipuli.info/search/label/PHP''>PHP</a>
<span class=''label-count'' dir=''ltr''>(12)</span>
</span>
<span class=''label-size label-size-3''>
<a dir=''ltr'' href=''http://blog.pulipuli.info/search/label/%E8%AA%B2%E7%A8%8B%2F%E5%9C%8B%E9%9A%9B%E6%AA%94%E6%A1%88%E5%AD%B8''>課程/國際檔案學</a>
<span class=''label-count'' dir=''ltr''>(12)</span>
</span>
<span class=''label-size label-size-3''>
<a dir=''ltr'' href=''http://blog.pulipuli.info/search/label/VirtualBox''>VirtualBox</a>
<span class=''label-count'' dir=''ltr''>(11)</span>
</span>
<span class=''label-size label-size-3''>
<a dir=''ltr'' href=''http://blog.pulipuli.info/search/label/%E6%A5%B5%E7%9F%AD''>極短</a>
<span class=''label-count'' dir=''ltr''>(11)</span>
</span>
<span class=''label-size label-size-3''>
<a dir=''ltr'' href=''http://blog.pulipuli.info/search/label/GitHub''>GitHub</a>
<span class=''label-count'' dir=''ltr''>(10)</span>
</span>
<span class=''label-size label-size-3''>
<a dir=''ltr'' href=''http://blog.pulipuli.info/search/label/Zentyal''>Zentyal</a>
<span class=''label-count'' dir=''ltr''>(10)</span>
</span>
<span class=''label-size label-size-3''>
<a dir=''ltr'' href=''http://blog.pulipuli.info/search/label/%E8%AA%B2%E7%A8%8B%2F%E6%AA%94%E6%A1%88%E6%87%89%E7%94%A8%E7%A0%94%E7%A9%B6''>課程/檔案應用研究</a>
<span class=''label-count'' dir=''ltr''>(9)</span>
</span>
<span class=''label-size label-size-3''>
<a dir=''ltr'' href=''http://blog.pulipuli.info/search/label/%E8%BC%94%E6%BC%AB''>輔漫</a>
<span class=''label-count'' dir=''ltr''>(9)</span>
</span>
<span class=''label-size label-size-3''>
<a dir=''ltr'' href=''http://blog.pulipuli.info/search/label/GLPI''>GLPI</a>
<span class=''label-count'' dir=''ltr''>(8)</span>
</span>
<span class=''label-size label-size-3''>
<a dir=''ltr'' href=''http://blog.pulipuli.info/search/label/Koha''>Koha</a>
<span class=''label-count'' dir=''ltr''>(8)</span>
</span>
<span class=''label-size label-size-3''>
<a dir=''ltr'' href=''http://blog.pulipuli.info/search/label/Server%2FownCloud''>Server/ownCloud</a>
<span class=''label-count'' dir=''ltr''>(8)</span>
</span>
<span class=''label-size label-size-3''>
<a dir=''ltr'' href=''http://blog.pulipuli.info/search/label/Windows%2F%E9%9B%BB%E8%85%A6%E8%BB%9F%E9%AB%94''>Windows/電腦軟體</a>
<span class=''label-count'' dir=''ltr''>(8)</span>
</span>
<span class=''label-size label-size-3''>
<a dir=''ltr'' href=''http://blog.pulipuli.info/search/label/%E6%94%BF%E5%A4%A7%E5%B9%B3%E5%83%B9%E7%BE%8E%E9%A3%9F''>政大平價美食</a>
<span class=''label-count'' dir=''ltr''>(8)</span>
</span>
<span class=''label-size label-size-3''>
<a dir=''ltr'' href=''http://blog.pulipuli.info/search/label/%E6%95%99%E5%AD%B8%E8%AA%B2%E7%A8%8B''>教學課程</a>
<span class=''label-count'' dir=''ltr''>(8)</span>
</span>
<span class=''label-size label-size-3''>
<a dir=''ltr'' href=''http://blog.pulipuli.info/search/label/%E6%95%B8%E4%BD%8D%E5%9C%96%E6%9B%B8%E9%A4%A8''>數位圖書館</a>
<span class=''label-count'' dir=''ltr''>(8)</span>
</span>
<span class=''label-size label-size-2''>
<a dir=''ltr'' href=''http://blog.pulipuli.info/search/label/KALS''>KALS</a>
<span class=''label-count'' dir=''ltr''>(7)</span>
</span>
<span class=''label-size label-size-2''>
<a dir=''ltr'' href=''http://blog.pulipuli.info/search/label/Plurk''>Plurk</a>
<span class=''label-count'' dir=''ltr''>(7)</span>
</span>
<span class=''label-size label-size-2''>
<a dir=''ltr'' href=''http://blog.pulipuli.info/search/label/CSS''>CSS</a>
<span class=''label-count'' dir=''ltr''>(6)</span>
</span>
<span class=''label-size label-size-2''>
<a dir=''ltr'' href=''http://blog.pulipuli.info/search/label/OS%2FFreeNAS''>OS/FreeNAS</a>
<span class=''label-count'' dir=''ltr''>(6)</span>
</span>
<span class=''label-size label-size-2''>
<a dir=''ltr'' href=''http://blog.pulipuli.info/search/label/OS%2FZentyal''>OS/Zentyal</a>
<span class=''label-count'' dir=''ltr''>(6)</span>
</span>
<span class=''label-size label-size-2''>
<a dir=''ltr'' href=''http://blog.pulipuli.info/search/label/Programming%2FAPP''>Programming/APP</a>
<span class=''label-count'' dir=''ltr''>(6)</span>
</span>
<span class=''label-size label-size-2''>
<a dir=''ltr'' href=''http://blog.pulipuli.info/search/label/%E5%A0%B1%E5%91%8A%2F%E6%95%99%E5%AD%B8%E8%AA%B2%E7%A8%8B''>報告/教學課程</a>
<span class=''label-count'' dir=''ltr''>(6)</span>
</span>
<span class=''label-size label-size-2''>
<a dir=''ltr'' href=''http://blog.pulipuli.info/search/label/%E7%99%BC%E8%A1%A8''>發表</a>
<span class=''label-count'' dir=''ltr''>(6)</span>
</span>
<span class=''label-size label-size-2''>
<a dir=''ltr'' href=''http://blog.pulipuli.info/search/label/2009%E8%A9%90%E6%AC%BA%E6%A1%88%E4%BB%B6''>2009詐欺案件</a>
<span class=''label-count'' dir=''ltr''>(5)</span>
</span>
<span class=''label-size label-size-2''>
<a dir=''ltr'' href=''http://blog.pulipuli.info/search/label/Programing%2FPHP''>Programing/PHP</a>
<span class=''label-count'' dir=''ltr''>(5)</span>
</span>
<span class=''label-size label-size-2''>
<a dir=''ltr'' href=''http://blog.pulipuli.info/search/label/Software%2FLibreOffice''>Software/LibreOffice</a>
<span class=''label-count'' dir=''ltr''>(5)</span>
</span>
<span class=''label-size label-size-2''>
<a dir=''ltr'' href=''http://blog.pulipuli.info/search/label/Software%2FR''>Software/R</a>
<span class=''label-count'' dir=''ltr''>(5)</span>
</span>
<span class=''label-size label-size-2''>
<a dir=''ltr'' href=''http://blog.pulipuli.info/search/label/Software%2FWindows''>Software/Windows</a>
<span class=''label-count'' dir=''ltr''>(5)</span>
</span>
<span class=''label-size label-size-2''>
<a dir=''ltr'' href=''http://blog.pulipuli.info/search/label/Virtual%20Machine%2FOpenVZ''>Virtual Machine/OpenVZ</a>
<span class=''label-count'' dir=''ltr''>(5)</span>
</span>
<span class=''label-size label-size-2''>
<a dir=''ltr'' href=''http://blog.pulipuli.info/search/label/%E7%A8%8B%E5%BC%8F%E8%AA%9E%E8%A8%80%2FJavaScript''>程式語言/JavaScript</a>
<span class=''label-count'' dir=''ltr''>(5)</span>
</span>
<span class=''label-size label-size-2''>
<a dir=''ltr'' href=''http://blog.pulipuli.info/search/label/%E8%A9%95%E8%AB%96''>評論</a>
<span class=''label-count'' dir=''ltr''>(5)</span>
</span>
<span class=''label-size label-size-2''>
<a dir=''ltr'' href=''http://blog.pulipuli.info/search/label/Library%2FORCID''>Library/ORCID</a>
<span class=''label-count'' dir=''ltr''>(4)</span>
</span>
<span class=''label-size label-size-2''>
<a dir=''ltr'' href=''http://blog.pulipuli.info/search/label/NetBeans''>NetBeans</a>
<span class=''label-count'' dir=''ltr''>(4)</span>
</span>
<span class=''label-size label-size-2''>
<a dir=''ltr'' href=''http://blog.pulipuli.info/search/label/Programming%2FPhoneGap''>Programming/PhoneGap</a>
<span class=''label-count'' dir=''ltr''>(4)</span>
</span>
<span class=''label-size label-size-2''>
<a dir=''ltr'' href=''http://blog.pulipuli.info/search/label/Selenium''>Selenium</a>
<span class=''label-count'' dir=''ltr''>(4)</span>
</span>
<span class=''label-size label-size-2''>
<a dir=''ltr'' href=''http://blog.pulipuli.info/search/label/Server%2FOCS''>Server/OCS</a>
<span class=''label-count'' dir=''ltr''>(4)</span>
</span>
<span class=''label-size label-size-2''>
<a dir=''ltr'' href=''http://blog.pulipuli.info/search/label/Software%2FZotero''>Software/Zotero</a>
<span class=''label-count'' dir=''ltr''>(4)</span>
</span>
<span class=''label-size label-size-2''>
<a dir=''ltr'' href=''http://blog.pulipuli.info/search/label/%E5%8D%9A%E5%A3%AB%E7%8F%AD%E8%80%83%E8%A9%A6''>博士班考試</a>
<span class=''label-count'' dir=''ltr''>(4)</span>
</span>
<span class=''label-size label-size-2''>
<a dir=''ltr'' href=''http://blog.pulipuli.info/search/label/%E5%95%8F%E7%AD%94%E8%A8%AA%E8%AB%87''>問答訪談</a>
<span class=''label-count'' dir=''ltr''>(4)</span>
</span>
<span class=''label-size label-size-2''>
<a dir=''ltr'' href=''http://blog.pulipuli.info/search/label/%E8%AA%B2%E7%A8%8B%2F%E8%B3%87%E8%A8%8A%E8%A1%8C%E7%82%BA%E8%88%87%E8%B3%87%E8%A8%8A%E6%9C%8D%E5%8B%99''>課程/資訊行為與資訊服務</a>
<span class=''label-count'' dir=''ltr''>(4)</span>
</span>
<span class=''label-size label-size-2''>
<a dir=''ltr'' href=''http://blog.pulipuli.info/search/label/%E8%AE%80%E8%80%85%E6%9C%8D%E5%8B%99%E7%A0%94%E8%A8%8E''>讀者服務研討</a>
<span class=''label-count'' dir=''ltr''>(4)</span>
</span>
<span class=''label-size label-size-2''>
<a dir=''ltr'' href=''http://blog.pulipuli.info/search/label/CKEditor''>CKEditor</a>
<span class=''label-count'' dir=''ltr''>(3)</span>
</span>
<span class=''label-size label-size-2''>
<a dir=''ltr'' href=''http://blog.pulipuli.info/search/label/Drupal''>Drupal</a>
<span class=''label-count'' dir=''ltr''>(3)</span>
</span>
<span class=''label-size label-size-2''>
<a dir=''ltr'' href=''http://blog.pulipuli.info/search/label/OCS''>OCS</a>
<span class=''label-count'' dir=''ltr''>(3)</span>
</span>
<span class=''label-size label-size-2''>
<a dir=''ltr'' href=''http://blog.pulipuli.info/search/label/OS%2FLinux''>OS/Linux</a>
<span class=''label-count'' dir=''ltr''>(3)</span>
</span>
<span class=''label-size label-size-2''>
<a dir=''ltr'' href=''http://blog.pulipuli.info/search/label/Programming%2FR''>Programming/R</a>
<span class=''label-count'' dir=''ltr''>(3)</span>
</span>
<span class=''label-size label-size-2''>
<a dir=''ltr'' href=''http://blog.pulipuli.info/search/label/Software''>Software</a>
<span class=''label-count'' dir=''ltr''>(3)</span>
</span>
<span class=''label-size label-size-2''>
<a dir=''ltr'' href=''http://blog.pulipuli.info/search/label/Software%2FPostreSQL''>Software/PostreSQL</a>
<span class=''label-count'' dir=''ltr''>(3)</span>
</span>
<span class=''label-size label-size-2''>
<a dir=''ltr'' href=''http://blog.pulipuli.info/search/label/Statistics''>Statistics</a>
<span class=''label-count'' dir=''ltr''>(3)</span>
</span>
<span class=''label-size label-size-2''>
<a dir=''ltr'' href=''http://blog.pulipuli.info/search/label/Web%20Service''>Web Service</a>
<span class=''label-count'' dir=''ltr''>(3)</span>
</span>
<span class=''label-size label-size-2''>
<a dir=''ltr'' href=''http://blog.pulipuli.info/search/label/%E6%B4%BB%E5%8B%95%E7%B1%8C%E8%BE%A6''>活動籌辦</a>
<span class=''label-count'' dir=''ltr''>(3)</span>
</span>
<span class=''label-size label-size-2''>
<a dir=''ltr'' href=''http://blog.pulipuli.info/search/label/%E6%BC%94%E8%AC%9B''>演講</a>
<span class=''label-count'' dir=''ltr''>(3)</span>
</span>
<span class=''label-size label-size-2''>
<a dir=''ltr'' href=''http://blog.pulipuli.info/search/label/%E7%94%9F%E6%B4%BB%2F%E6%97%A5%E8%A8%98''>生活/日記</a>
<span class=''label-count'' dir=''ltr''>(3)</span>
</span>
<span class=''label-size label-size-2''>
<a dir=''ltr'' href=''http://blog.pulipuli.info/search/label/%E8%AA%B2%E7%A8%8B%2F%E6%AA%94%E6%A1%88%E5%AD%B8''>課程/檔案學</a>
<span class=''label-count'' dir=''ltr''>(3)</span>
</span>
<span class=''label-size label-size-2''>
<a dir=''ltr'' href=''http://blog.pulipuli.info/search/label/%E9%96%B1%E8%AE%80%E5%AD%B8%E7%BF%92''>閱讀學習</a>
<span class=''label-count'' dir=''ltr''>(3)</span>
</span>
<span class=''label-size label-size-2''>
<a dir=''ltr'' href=''http://blog.pulipuli.info/search/label/3C''>3C</a>
<span class=''label-count'' dir=''ltr''>(2)</span>
</span>
<span class=''label-size label-size-2''>
<a dir=''ltr'' href=''http://blog.pulipuli.info/search/label/EMAIL-KM''>EMAIL-KM</a>
<span class=''label-count'' dir=''ltr''>(2)</span>
</span>
<span class=''label-size label-size-2''>
<a dir=''ltr'' href=''http://blog.pulipuli.info/search/label/IDE''>IDE</a>
<span class=''label-count'' dir=''ltr''>(2)</span>
</span>
<span class=''label-size label-size-2''>
<a dir=''ltr'' href=''http://blog.pulipuli.info/search/label/IPFire''>IPFire</a>
<span class=''label-count'' dir=''ltr''>(2)</span>
</span>
<span class=''label-size label-size-2''>
<a dir=''ltr'' href=''http://blog.pulipuli.info/search/label/OSSIM''>OSSIM</a>
<span class=''label-count'' dir=''ltr''>(2)</span>
</span>
<span class=''label-size label-size-2''>
<a dir=''ltr'' href=''http://blog.pulipuli.info/search/label/Programming%2FJava''>Programming/Java</a>
<span class=''label-count'' dir=''ltr''>(2)</span>
</span>
<span class=''label-size label-size-2''>
<a dir=''ltr'' href=''http://blog.pulipuli.info/search/label/Programming%2FPHP''>Programming/PHP</a>
<span class=''label-count'' dir=''ltr''>(2)</span>
</span>
<span class=''label-size label-size-2''>
<a dir=''ltr'' href=''http://blog.pulipuli.info/search/label/Server%2FGitLab''>Server/GitLab</a>
<span class=''label-count'' dir=''ltr''>(2)</span>
</span>
<span class=''label-size label-size-2''>
<a dir=''ltr'' href=''http://blog.pulipuli.info/search/label/Software%2FOpen%20Live%20Writer''>Software/Open Live Writer</a>
<span class=''label-count'' dir=''ltr''>(2)</span>
</span>
<span class=''label-size label-size-2''>
<a dir=''ltr'' href=''http://blog.pulipuli.info/search/label/Software%2FmRemoteNG''>Software/mRemoteNG</a>
<span class=''label-count'' dir=''ltr''>(2)</span>
</span>
<span class=''label-size label-size-2''>
<a dir=''ltr'' href=''http://blog.pulipuli.info/search/label/Virtual%20Machine''>Virtual Machine</a>
<span class=''label-count'' dir=''ltr''>(2)</span>
</span>
<span class=''label-size label-size-2''>
<a dir=''ltr'' href=''http://blog.pulipuli.info/search/label/pfSense''>pfSense</a>
<span class=''label-count'' dir=''ltr''>(2)</span>
</span>
<span class=''label-size label-size-2''>
<a dir=''ltr'' href=''http://blog.pulipuli.info/search/label/%E3%83%8B%E3%82%B3%E3%83%8B%E3%82%B3%E5%8B%95%E7%94%BB''>ニコニコ動画</a>
<span class=''label-count'' dir=''ltr''>(2)</span>
</span>
<span class=''label-size label-size-2''>
<a dir=''ltr'' href=''http://blog.pulipuli.info/search/label/%E4%BD%9C%E6%A5%AD%E7%B3%BB%E7%B5%B1%2FLinux''>作業系統/Linux</a>
<span class=''label-count'' dir=''ltr''>(2)</span>
</span>
<span class=''label-size label-size-2''>
<a dir=''ltr'' href=''http://blog.pulipuli.info/search/label/%E5%9C%96%E6%9B%B8%E8%B3%87%E8%A8%8A%E5%AD%B8%E7%A0%94%E8%A8%8E''>圖書資訊學研討</a>
<span class=''label-count'' dir=''ltr''>(2)</span>
</span>
<span class=''label-size label-size-2''>
<a dir=''ltr'' href=''http://blog.pulipuli.info/search/label/%E5%B8%83%E4%B8%81%E9%80%9A%E4%BF%A1''>布丁通信</a>
<span class=''label-count'' dir=''ltr''>(2)</span>
</span>
<span class=''label-size label-size-2''>
<a dir=''ltr'' href=''http://blog.pulipuli.info/search/label/%E6%8A%80%E8%A1%93%E6%9C%8D%E5%8B%99%E7%A0%94%E8%A8%8E''>技術服務研討</a>
<span class=''label-count'' dir=''ltr''>(2)</span>
</span>
<span class=''label-size label-size-2''>
<a dir=''ltr'' href=''http://blog.pulipuli.info/search/label/%E7%94%9F%E6%B4%BB%2F%E6%94%BF%E5%A4%A7%E5%B9%B3%E5%83%B9%E7%BE%8E%E9%A3%9F''>生活/政大平價美食</a>
<span class=''label-count'' dir=''ltr''>(2)</span>
</span>
<span class=''label-size label-size-2''>
<a dir=''ltr'' href=''http://blog.pulipuli.info/search/label/%E7%A0%94%E7%A9%B6%E6%96%B9%E6%B3%95%5C%E5%BA%8F%E5%88%97%E5%88%86%E6%9E%90''>研究方法\序列分析</a>
<span class=''label-count'' dir=''ltr''>(2)</span>
</span>
<span class=''label-size label-size-2''>
<a dir=''ltr'' href=''http://blog.pulipuli.info/search/label/%E7%A0%94%E7%A9%B6%E9%A0%98%E5%9F%9F%2F%E9%96%B1%E8%AE%80%E5%AD%B8%E7%BF%92''>研究領域/閱讀學習</a>
<span class=''label-count'' dir=''ltr''>(2)</span>
</span>
<span class=''label-size label-size-2''>
<a dir=''ltr'' href=''http://blog.pulipuli.info/search/label/%E7%A1%AC%E9%AB%94%E8%A8%AD%E5%82%99''>硬體設備</a>
<span class=''label-count'' dir=''ltr''>(2)</span>
</span>
<span class=''label-size label-size-2''>
<a dir=''ltr'' href=''http://blog.pulipuli.info/search/label/%E7%B3%BB%E7%B5%B1%2FWordPress''>系統/WordPress</a>
<span class=''label-count'' dir=''ltr''>(2)</span>
</span>
<span class=''label-size label-size-2''>
<a dir=''ltr'' href=''http://blog.pulipuli.info/search/label/%E7%B6%B2%E7%AB%99%E7%B3%BB%E7%B5%B1%2FownCloud''>網站系統/ownCloud</a>
<span class=''label-count'' dir=''ltr''>(2)</span>
</span>
<span class=''label-size label-size-2''>
<a dir=''ltr'' href=''http://blog.pulipuli.info/search/label/%E8%BC%95%E5%B0%8F%E8%AA%AA''>輕小說</a>
<span class=''label-count'' dir=''ltr''>(2)</span>
</span>
<span class=''label-size label-size-2''>
<a dir=''ltr'' href=''http://blog.pulipuli.info/search/label/%E9%81%8A%E6%88%B2''>遊戲</a>
<span class=''label-count'' dir=''ltr''>(2)</span>
</span>
<span class=''label-size label-size-1''>
<a dir=''ltr'' href=''http://blog.pulipuli.info/search/label/3C%2FNote%208''>3C/Note 8</a>
<span class=''label-count'' dir=''ltr''>(1)</span>
</span>
<span class=''label-size label-size-1''>
<a dir=''ltr'' href=''http://blog.pulipuli.info/search/label/AngularJS''>AngularJS</a>
<span class=''label-count'' dir=''ltr''>(1)</span>
</span>
<span class=''label-size label-size-1''>
<a dir=''ltr'' href=''http://blog.pulipuli.info/search/label/AutoIt''>AutoIt</a>
<span class=''label-count'' dir=''ltr''>(1)</span>
</span>
<span class=''label-size label-size-1''>
<a dir=''ltr'' href=''http://blog.pulipuli.info/search/label/Cbox%20Google%20Analytics''>Cbox Google Analytics</a>
<span class=''label-count'' dir=''ltr''>(1)</span>
</span>
<span class=''label-size label-size-1''>
<a dir=''ltr'' href=''http://blog.pulipuli.info/search/label/Data%20Mining''>Data Mining</a>
<span class=''label-count'' dir=''ltr''>(1)</span>
</span>
<span class=''label-size label-size-1''>
<a dir=''ltr'' href=''http://blog.pulipuli.info/search/label/Hardware''>Hardware</a>
<span class=''label-count'' dir=''ltr''>(1)</span>
</span>
<span class=''label-size label-size-1''>
<a dir=''ltr'' href=''http://blog.pulipuli.info/search/label/Hardware%2FNotebook''>Hardware/Notebook</a>
<span class=''label-count'' dir=''ltr''>(1)</span>
</span>
<span class=''label-size label-size-1''>
<a dir=''ltr'' href=''http://blog.pulipuli.info/search/label/OS%2FAndroid''>OS/Android</a>
<span class=''label-count'' dir=''ltr''>(1)</span>
</span>
<span class=''label-size label-size-1''>
<a dir=''ltr'' href=''http://blog.pulipuli.info/search/label/Programe%2FCSS''>Programe/CSS</a>
<span class=''label-count'' dir=''ltr''>(1)</span>
</span>
<span class=''label-size label-size-1''>
<a dir=''ltr'' href=''http://blog.pulipuli.info/search/label/Programming%2FDatabase''>Programming/Database</a>
<span class=''label-count'' dir=''ltr''>(1)</span>
</span>
<span class=''label-size label-size-1''>
<a dir=''ltr'' href=''http://blog.pulipuli.info/search/label/Programming%2FWeb%20Design''>Programming/Web Design</a>
<span class=''label-count'' dir=''ltr''>(1)</span>
</span>
<span class=''label-size label-size-1''>
<a dir=''ltr'' href=''http://blog.pulipuli.info/search/label/Second%20Life''>Second Life</a>
<span class=''label-count'' dir=''ltr''>(1)</span>
</span>
<span class=''label-size label-size-1''>
<a dir=''ltr'' href=''http://blog.pulipuli.info/search/label/Server%2FApache''>Server/Apache</a>
<span class=''label-count'' dir=''ltr''>(1)</span>
</span>
<span class=''label-size label-size-1''>
<a dir=''ltr'' href=''http://blog.pulipuli.info/search/label/Server%2FApache%20Solr''>Server/Apache Solr</a>
<span class=''label-count'' dir=''ltr''>(1)</span>
</span>
<span class=''label-size label-size-1''>
<a dir=''ltr'' href=''http://blog.pulipuli.info/search/label/Software%2FBrowser''>Software/Browser</a>
<span class=''label-count'' dir=''ltr''>(1)</span>
</span>
<span class=''label-size label-size-1''>
<a dir=''ltr'' href=''http://blog.pulipuli.info/search/label/Software%2FCWISE''>Software/CWISE</a>
<span class=''label-count'' dir=''ltr''>(1)</span>
</span>
<span class=''label-size label-size-1''>
<a dir=''ltr'' href=''http://blog.pulipuli.info/search/label/Software%2FOffice''>Software/Office</a>
<span class=''label-count'' dir=''ltr''>(1)</span>
</span>
<span class=''label-size label-size-1''>
<a dir=''ltr'' href=''http://blog.pulipuli.info/search/label/Software%2FWeka''>Software/Weka</a>
<span class=''label-count'' dir=''ltr''>(1)</span>
</span>
<span class=''label-size label-size-1''>
<a dir=''ltr'' href=''http://blog.pulipuli.info/search/label/Software%2F%E4%B8%AD%E5%B7%9E%E9%9F%BB%E8%BC%B8%E5%85%A5%E6%B3%95''>Software/中州韻輸入法</a>
<span class=''label-count'' dir=''ltr''>(1)</span>
</span>
<span class=''label-size label-size-1''>
<a dir=''ltr'' href=''http://blog.pulipuli.info/search/label/Timemark%20to%20SSA''>Timemark to SSA</a>
<span class=''label-count'' dir=''ltr''>(1)</span>
</span>
<span class=''label-size label-size-1''>
<a dir=''ltr'' href=''http://blog.pulipuli.info/search/label/Tool%2FNetBeans''>Tool/NetBeans</a>
<span class=''label-count'' dir=''ltr''>(1)</span>
</span>
<span class=''label-size label-size-1''>
<a dir=''ltr'' href=''http://blog.pulipuli.info/search/label/Userscript''>Userscript</a>
<span class=''label-count'' dir=''ltr''>(1)</span>
</span>
<span class=''label-size label-size-1''>
<a dir=''ltr'' href=''http://blog.pulipuli.info/search/label/Virtual%20Machine%2FDocker''>Virtual Machine/Docker</a>
<span class=''label-count'' dir=''ltr''>(1)</span>
</span>
<span class=''label-size label-size-1''>
<a dir=''ltr'' href=''http://blog.pulipuli.info/search/label/Virtual%20Machine%2FVirtualBox''>Virtual Machine/VirtualBox</a>
<span class=''label-count'' dir=''ltr''>(1)</span>
</span>
<span class=''label-size label-size-1''>
<a dir=''ltr'' href=''http://blog.pulipuli.info/search/label/%E5%9C%8B%E5%AE%B6%E8%80%83%E8%A9%A6''>國家考試</a>
<span class=''label-count'' dir=''ltr''>(1)</span>
</span>
<span class=''label-size label-size-1''>
<a dir=''ltr'' href=''http://blog.pulipuli.info/search/label/%E5%9C%8B%E7%AB%8B%E7%A9%BA%E4%B8%AD%E5%A4%A7%E5%AD%B8''>國立空中大學</a>
<span class=''label-count'' dir=''ltr''>(1)</span>
</span>
<span class=''label-size label-size-1''>
<a dir=''ltr'' href=''http://blog.pulipuli.info/search/label/%E5%B0%88%E9%A1%8C''>專題</a>
<span class=''label-count'' dir=''ltr''>(1)</span>
</span>
<span class=''label-size label-size-1''>
<a dir=''ltr'' href=''http://blog.pulipuli.info/search/label/%E8%AA%B2%E7%A8%8B%2F%E8%A8%88%E7%AE%97%E6%99%BA%E8%83%BD%E8%88%87%E5%95%86%E6%A5%AD%E5%88%86%E6%9E%90''>課程/計算智能與商業分析</a>
<span class=''label-count'' dir=''ltr''>(1)</span>
</span>
<span class=''label-size label-size-1''>
<a dir=''ltr'' href=''http://blog.pulipuli.info/search/label/%E8%B2%A9%E5%94%AE''>販售</a>
<span class=''label-count'' dir=''ltr''>(1)</span>
</span>
<span class=''label-size label-size-1''>
<a dir=''ltr'' href=''http://blog.pulipuli.info/search/label/%E8%B3%87%E8%A8%8A%E7%AE%A1%E7%90%86%2F%E7%B6%B2%E7%AB%99%E7%AE%A1%E7%90%86''>資訊管理/網站管理</a>
<span class=''label-count'' dir=''ltr''>(1)</span>
</span>
<span class=''label-size label-size-1''>
<a dir=''ltr'' href=''http://blog.pulipuli.info/search/label/%E9%9B%BB%E8%85%A6%E8%BB%9F%E9%AB%94%2FR''>電腦軟體/R</a>
<span class=''label-count'' dir=''ltr''>(1)</span>
</span>
<span class=''label-size label-size-1''>
<a dir=''ltr'' href=''http://blog.pulipuli.info/search/label/%E9%9B%BB%E8%A6%96''>電視</a>
<span class=''label-count'' dir=''ltr''>(1)</span>
</span>
<a class=''btn'' href=''/p/labels.html''>View All Labels</a>
<div class=''clear''></div>
<span class=''widget-item-control''>
<span class=''item-control blog-admin''>
<a class=''quickedit'' href=''//www.blogger.com/rearrange?blogID=16607461&widgetType=Label&widgetId=Label2&action=editWidget&sectionId=column2-section'' onclick=''return _WidgetManager._PopupConfig(document.getElementById("Label2"));'' target=''configLabel2'' title=''編輯''>
<img alt='''' height=''18'' src=''https://resources.blogblog.com/img/icon18_wrench_allbkg.png'' width=''18''/>
</a>
</span>
</span>
<div class=''clear''></div>
</div>
</div></div>
<div class=''span4 bl_newsletter no-items section'' id=''column3''>
</div>
</div>
<div class=''clear''></div>
</div>
</div>
<div class=''footer'' id=''footer''>
<footer>
<div class=''container clearfix''>
<div class=''go-top''>
<a href=''#''><i class=''fa fa-angle-up''></i></a>
</div>
<p>
<span class=''blog-copyright''>
                &#169; Copyright 2016 
                <a href=''http://blog.pulipuli.info/''>布丁布丁吃什麼&#65311;</a>
</span>
<span class=''themexpose''>
            / Created by <a href=''http://themexpose.com/'' id=''mycontent''>ThemeXpose</a>
            / Published By <a href=''http://gooyaabitemplates.com/'' rel=''dofollow'' target=''_blank'' title=''Blogger Templates''>Gooyaabi Templates</a>
</span>
</p>
<p class=''management''>
<a href=''https://www.blogger.com/blogger.g?blogID=16607461#templatehtml'' target=''_blank''>Template</a>
|
<a href=''https://www.blogger.com/blogger.g?blogID=16607461#stats'' target=''_blank''>Stats</a>
|
<a href=''https://analytics.google.com/analytics/web/#report/content-overview/a37178375w65476980p67298151/?et=reset'' target=''_blank''>Google Analytics</a>
|
<a href=''https://www.blogger.com/blogger.g?blogID=16607461#publishedposts'' target=''_blank''>Posts</a>
|
<a href=''https://www.blogger.com/blogger.g?blogID=16607461#spamcomments'' target=''_blank''>Spam Comments</a>
<!--| <a href="https://www.addthis.com/dashboard#dashboard-analytics/" target="_blank">AddThis</a>-->
|
<a href=''https://pulipuli.disqus.com/admin/moderate/#/all'' target=''_blank''>DisQus</a>
|
<a href=''https://developers.google.com/speed/pagespeed/insights/?utm_source=analytics'' target=''_blank''>PageSpeed</a>
|
<a href=''#'' onclick=''$(&#39;body > a:last&#39;).css(&#39;visibility&#39;, &#39;visible&#39;);''>SumoMe</a>
|
<a href=''https://cse.google.com/cse/setup/basic?cx=017270649262638447003:o6vaq9on3vs'' target=''_blank''>Google自訂搜尋</a>
|
<a href=''http://timdream.org/wordcloud/#feed:http://pulipuli.blogspot.com/feeds/posts/default'' target=''_blank''>HTML5 Word Cloud</a>
</p>
</div>
</footer>
</div>
</div>
</div>
<!-- JAVASCRIPT -->
<script async=''async'' data-sumo-site-id=''91b6a5a67cc23845f0765da427a8ac1c0b918c4e9226f12ea32abf1e8110df0c'' src=''//load.sumome.com/''></script>
<script src=''//pulipulichen.github.io/blogger/blogger/js/google-analytics.js'' type=''text/javascript''></script>
<script src=''//pulipulichen.github.io/blogger/blogger/js/related-posts.js'' type=''text/javascript''></script>
<script src=''//pulipulichen.github.io/blogger/blogger/lib/lightbox2-lokeshdhakar/init.js'' type=''text/javascript''></script>
<script src=''//pulipulichen.github.io/blogger/blogger/lib/highlight/init.js'' type=''text/javascript''></script>

<script type="text/javascript" src="https://www.blogger.com/static/v1/widgets/3200813190-widgets.js"></script>
<script type="text/javascript" src="https://apis.google.com/js/plusone.js"></script>
<script type=''text/javascript''>
window[''__wavt''] = ''AOuZoY4vnQKnm1El_3yVOhhSjB8vcYdzAw:1478500955245'';_WidgetManager._Init(''//www.blogger.com/rearrange?blogID\x3d16607461'',''//blog.pulipuli.info/2016/11/rwordcloud-why-rs-wordcloud-draws.html'',''16607461'');
_WidgetManager._SetDataContext([{''name'': ''blog'', ''data'': {''blogId'': ''16607461'', ''bloggerUrl'': ''https://www.blogger.com'', ''title'': ''布丁布丁吃什麼&#65311;'', ''pageType'': ''item'', ''postId'': ''7531801512378558602'', ''url'': ''http://blog.pulipuli.info/2016/11/rwordcloud-why-rs-wordcloud-draws.html'', ''canonicalUrl'': ''http://blog.pulipuli.info/2016/11/rwordcloud-why-rs-wordcloud-draws.html'', ''homepageUrl'': ''http://blog.pulipuli.info/'', ''searchUrl'': ''http://blog.pulipuli.info/search'', ''canonicalHomepageUrl'': ''http://blog.pulipuli.info/'', ''blogspotFaviconUrl'': ''http://blog.pulipuli.info/favicon.ico'', ''enabledCommentProfileImages'': true, ''gPlusViewType'': ''FILTERED_POSTMOD'', ''adultContent'': false, ''analyticsAccountNumber'': ''UA-37178375-1'', ''useUniversalAnalytics'': false, ''pageName'': ''R的文字雲怎麼都是&#9633;亂碼&#65311;wordcloud套件需要中文字形 / Why R&#8217;s wordcloud draws Chinese in &#9633;?'', ''pageTitle'': ''布丁布丁吃什麼&#65311;: R的文字雲怎麼都是&#9633;亂碼&#65311;wordcloud套件需要中文字形 / Why R&#8217;s wordcloud draws Chinese in &#9633;?'', ''metaDescription'': '''', ''encoding'': ''UTF-8'', ''locale'': ''zh_TW'', ''localeUnderscoreDelimited'': ''zh_tw'', ''isPrivate'': false, ''isMobile'': false, ''isMobileRequest'': false, ''mobileClass'': '''', ''isPrivateBlog'': false, ''languageDirection'': ''ltr'', ''feedLinks'': ''\x3clink rel\x3d\x22alternate\x22 type\x3d\x22application/atom+xml\x22 title\x3d\x22布丁布丁吃什麼&#65311; - Atom\x22 href\x3d\x22http://blog.pulipuli.info/feeds/posts/default\x22 /\x3e\n\x3clink rel\x3d\x22alternate\x22 type\x3d\x22application/rss+xml\x22 title\x3d\x22布丁布丁吃什麼&#65311; - RSS\x22 href\x3d\x22http://blog.pulipuli.info/feeds/posts/default?alt\x3drss\x22 /\x3e\n\x3clink rel\x3d\x22service.post\x22 type\x3d\x22application/atom+xml\x22 title\x3d\x22布丁布丁吃什麼&#65311; - Atom\x22 href\x3d\x22https://www.blogger.com/feeds/16607461/posts/default\x22 /\x3e\n\n\x3clink rel\x3d\x22alternate\x22 type\x3d\x22application/atom+xml\x22 title\x3d\x22布丁布丁吃什麼&#65311; - Atom\x22 href\x3d\x22http://blog.pulipuli.info/feeds/7531801512378558602/comments/default\x22 /\x3e\n'', ''meTag'': '''', ''openIdOpTag'': '''', ''postImageThumbnailUrl'': ''https://lh3.googleusercontent.com/-jlcNpnoN3KI/WB7p5iPhBBI/AAAAAAAC818/6THEZ4Y5Ytw/s72-c/image_thumb%25255B1%25255D.png?imgmax\x3d800'', ''postImageUrl'': ''https://lh3.googleusercontent.com/-jlcNpnoN3KI/WB7p5iPhBBI/AAAAAAAC818/6THEZ4Y5Ytw/image_thumb%25255B1%25255D.png?imgmax\x3d800'', ''mobileHeadScript'': '''', ''adsenseHostId'': ''ca-host-pub-1556223355139109'', ''view'': '''', ''dynamicViewsCommentsSrc'': ''//www.blogblog.com/dynamicviews/4224c15c4e7c9321/js/comments.js'', ''dynamicViewsScriptSrc'': ''//www.blogblog.com/dynamicviews/ca3f6ae6da5cb0f3'', ''plusOneApiSrc'': ''https://apis.google.com/js/plusone.js'', ''sharing'': {''platforms'': [{''name'': ''取得連結'', ''key'': ''link'', ''shareMessage'': ''取得連結'', ''target'': ''''}, {''name'': ''Facebook'', ''key'': ''facebook'', ''shareMessage'': ''分享到 Facebook'', ''target'': ''facebook''}, {''name'': ''BlogThis&#65281;'', ''key'': ''blogThis'', ''shareMessage'': ''BlogThis&#65281;'', ''target'': ''blog''}, {''name'': ''Twitter'', ''key'': ''twitter'', ''shareMessage'': ''分享到 Twitter'', ''target'': ''twitter''}, {''name'': ''Pinterest'', ''key'': ''pinterest'', ''shareMessage'': ''分享到 Pinterest'', ''target'': ''pinterest''}, {''name'': ''Google+'', ''key'': ''googlePlus'', ''shareMessage'': ''分享到 Google+'', ''target'': ''googleplus''}, {''name'': ''以電子郵件傳送'', ''key'': ''email'', ''shareMessage'': ''以電子郵件傳送'', ''target'': ''email''}], ''googlePlusShareButtonWidth'': 300, ''googlePlusBootstrap'': ''\x3cscript type\x3d\x22text/javascript\x22\x3ewindow.___gcfg \x3d {\x27lang\x27: \x27zh_TW\x27};\x3c/script\x3e''}}}, {''name'': ''features'', ''data'': {''widgetVisibility'': true}}, {''name'': ''messages'', ''data'': {''linkCopiedToClipboard'': ''已將連結複製到剪貼簿&#65281;'', ''postLink'': ''文章連結''}}, {''name'': ''template'', ''data'': {''name'': ''custom'', ''localizedName'': ''自訂'', ''isResponsive'': false, ''isAlternateRendering'': false, ''isCustom'': true}}, {''name'': ''view'', ''data'': {''classic'': {''name'': ''classic'', ''url'': ''?view\x3dclassic''}, ''flipcard'': {''name'': ''flipcard'', ''url'': ''?view\x3dflipcard''}, ''magazine'': {''name'': ''magazine'', ''url'': ''?view\x3dmagazine''}, ''mosaic'': {''name'': ''mosaic'', ''url'': ''?view\x3dmosaic''}, ''sidebar'': {''name'': ''sidebar'', ''url'': ''?view\x3dsidebar''}, ''snapshot'': {''name'': ''snapshot'', ''url'': ''?view\x3dsnapshot''}, ''timeslide'': {''name'': ''timeslide'', ''url'': ''?view\x3dtimeslide''}, ''isMobile'': false, ''title'': ''R的文字雲怎麼都是&#9633;亂碼&#65311;wordcloud套件需要中文字形 / Why R&#8217;s wordcloud draws Chinese in &#9633;?'', ''description'': ''布丁布丁吃布丁分享網頁技術&#12289;讀書心得的園地&#12290;'', ''featuredImage'': ''https://lh3.googleusercontent.com/-jlcNpnoN3KI/WB7p5iPhBBI/AAAAAAAC818/6THEZ4Y5Ytw/image_thumb%25255B1%25255D.png?imgmax\x3d800'', ''url'': ''http://blog.pulipuli.info/2016/11/rwordcloud-why-rs-wordcloud-draws.html'', ''type'': ''item'', ''isSingleItem'': true, ''isMultipleItems'': false, ''isError'': false, ''isPage'': false, ''isPost'': true, ''isHomepage'': false, ''isArchive'': false, ''isSearch'': false, ''isLabelSearch'': false, ''postId'': 7531801512378558602}}]);
_WidgetManager._RegisterWidget(''_HeaderView'', new _WidgetInfo(''Header1'', ''header'', null, document.getElementById(''Header1''), {}, ''displayModeFull''));
_WidgetManager._RegisterWidget(''_BlogArchiveView'', new _WidgetInfo(''BlogArchive1'', ''archivespage'', null, document.getElementById(''BlogArchive1''), {''languageDirection'': ''ltr'', ''loadingMessage'': ''Loading\x26hellip;''}, ''displayModeFull''));
_WidgetManager._RegisterWidget(''_LabelView'', new _WidgetInfo(''Label3'', ''labels-page'', null, document.getElementById(''Label3''), {}, ''displayModeFull''));
_WidgetManager._RegisterWidget(''_BlogView'', new _WidgetInfo(''Blog1'', ''main'', null, document.getElementById(''Blog1''), {''cmtInteractionsEnabled'': false, ''showBacklinks'': true, ''postId'': ''7531801512378558602'', ''lightboxEnabled'': true, ''lightboxModuleUrl'': ''https://www.blogger.com/static/v1/jsbin/3405095422-lbx__zh_tw.js'', ''lightboxCssUrl'': ''https://www.blogger.com/static/v1/v-css/368954415-lightbox_bundle.css''}, ''displayModeFull''));
_WidgetManager._RegisterWidget(''_StatsView'', new _WidgetInfo(''Stats1'', ''column1-stats'', null, document.getElementById(''Stats1''), {''title'': ''Hit Count'', ''showGraphicalCounter'': false, ''showAnimatedCounter'': false, ''showSparkline'': true, ''statsUrl'': ''//blog.pulipuli.info/b/stats?style\x3dWHITE_TRANSPARENT\x26timeRange\x3dALL_TIME\x26token\x3dbqg9P1gBAAA.E5jz7gHfJRBSg7W4LhwNXQ.L3fOy65q86ajmLoKW2waLw''}, ''displayModeFull''));
_WidgetManager._RegisterWidget(''_LabelView'', new _WidgetInfo(''Label2'', ''column2-section'', null, document.getElementById(''Label2''), {}, ''displayModeFull''));
</script>
</body>
</html>');

