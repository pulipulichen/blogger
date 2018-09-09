<?xml version="1.0" encoding="UTF-8" ?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html expr:dir='data:blog.languageDirection' xmlns='http://www.w3.org/1999/xhtml' xmlns:b='http://www.google.com/2005/gml/b' xmlns:data='http://www.google.com/2005/gml/data' xmlns:expr='http://www.google.com/2005/gml/expr'>
<head>

<title>
    <b:if cond='data:blog.pageType == &quot;item&quot;'>
        <data:blog.pageName/> - <data:blog.title/>
        <b:else/>
        <data:blog.pageTitle/>
    </b:if>
</title>
<b:include data='blog' name='all-head-content'/>

<b:skin><![CDATA[<?php echo file_get_contents("0_header/1_style.css"); ?>
]]></b:skin>

<script type='text/javascript' src="//pulipulichen.github.io/blogger/blogger/js/breeze.js"></script>
<script src='//ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js' type='text/javascript'/>

<?php 
// --------------------------------------------
// 讀取外部檔案
?>

<link href='//fonts.googleapis.com/css?family=Lato' rel='stylesheet' type='text/css'/>
<link href='//fonts.googleapis.com/css?family=Crete+Round' rel='stylesheet' type='text/css'/>
<link href='//netdna.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.css' rel='stylesheet' type='text/css'/>


<style>
<?php echo file_get_contents("0_header/2_style.css"); ?>
<?php echo file_get_contents("0_header/3_custom_style.css"); ?>
</style>
<link rel="stylesheet" type="text/css" href="//pulipulichen.github.io/blogger/blogger/css/style.css"/>

<b:if cond='data:blog.pageType == &quot;item&quot;'>
    <link rel="stylesheet" type="text/css" href="//pulipulichen.github.io/blogger/blogger/css/style-item.css"/>
    <link rel="stylesheet" type="text/css" href="//pulipulichen.github.io/blogger/blogger/css/gutenberg.min.css" media="print"/>
    <link rel="stylesheet" type="text/css" href="//pulipulichen.github.io/blogger/blogger/css/style-print.css" media="print"/>
</b:if>

<?php 
// 讀取外部檔案
// --------------------------------------------
?>

<?php 
// --------------------------------------------
// 標記資訊
?>

<meta content='width=device-width, initial-scale=1, maximum-scale=1' name='viewport'/>
<link href='//lh3.googleusercontent.com/-EJjh-ZlKl64/VvtjyofcjNI/AAAAAAACuME/hYJhk_ZuORs/s0/pulipuli192x192.jpg' rel='shortcut icon' type='image/vnd.microsoft.icon'/>
<meta content='#A1501A' name='theme-color'/>
<link href='//lh3.googleusercontent.com/-EJjh-ZlKl64/VvtjyofcjNI/AAAAAAACuME/hYJhk_ZuORs/s0/pulipuli192x192.jpg' rel='icon' sizes='192x192'/>
<link href='//lh3.googleusercontent.com/-vjf_alp-zjQ/VvtkKVpqCjI/AAAAAAACuMI/HPJXcEemwok/s0/pulipuli144x144.jpg' rel='apple-touch-icon' sizes='144x144'/>

<?php echo file_get_contents("0_header/4_facebook_code.html"); ?>
<meta name="msvalidate.01" content="09F5F270E3016847B9723E71AEE3FC24" />
<meta name="baidu-site-verification" content="0XST85Xh5F" />
<meta name="p:domain_verify" content="102285e6f21741f433c6400b5ec23fa7"/>

<!-- ======================================== -->
<script type="text/javascript" src="//pulipulichen.github.io/blogger/blogger/js/script.js"></script>
<b:if cond='data:blog.pageType == &quot;item&quot;'>
    <script type="text/javascript" src="//pulipulichen.github.io/blogger/blogger/js/script-item.js"></script>
</b:if>
<!-- ======================================== -->

<!-- <link rel="stylesheet" type="text/css" href="//pulipulichen.github.io/blogger/blogger/css/style-olw.css"/> -->
</head>
    
    
<body>

<script src='//connect.facebook.net/en_US/all.js#xfbml=1'/>

<div class='firstload-background'></div>

<div class='site' id='page'>
<div id='masthead' role='banner'>
<div class='container'>

    
<div class='navbar navbar-inverse'>
 <div class='navbar-inner'>
 <div class='btn-navbar' data-target='.nav-collapse' data-toggle='collapse' type='button'>
    <img src='//lh3.googleusercontent.com/-joQnbCCa6Jg/VwFqIuKnCCI/AAAAAAACuUo/iZTPC_EVSyE/s0/bmenu_brown.png'/></div>

<header>
<?php
// 在這邊加上回去上一頁的按鈕
?>
    <b:if cond='data:blog.url != data:blog.homepageUrl'>
        <div onclick="javascript: _header_back_button_click();" class="back-button">
            <i class="fa fa-arrow-left" aria-hidden="true"></i>
        </div>
    </b:if>
    
<b:section class='header' id='header' maxwidgets='1' showaddelement='no'>
     
   <b:widget id='Header1' locked='true' title='Breeze Responsive Blogger Template  (Header)' type='Header'>
     <b:includable id='main'>

         
  <b:if cond='data:useImage'>
    <b:if cond='data:imagePlacement == &quot;BEHIND&quot;'>
      <!--
      Show image as background to text. You can't really calculate the width
      reliably in JS because margins are not taken into account by any of
      clientWidth, offsetWidth or scrollWidth, so we don't force a minimum
      width if the user is using shrink to fit.
      This results in a margin-width's worth of pixels being cropped. If the
      user is not using shrink to fit then we expand the header.
      -->
      <b:if cond='data:mobile'>
          <div id='header-inner'>
            <div class='titlewrapper' style='background: transparent'>
              <h1 class='title' style='background: transparent; border-width: 0px'>
                <b:include name='title'/>
              </h1>
            </div>
            <b:include name='description'/>
          </div>
        <b:else/>
          <div expr:style='&quot;background-image: url(\&quot;&quot; + data:sourceUrl + &quot;\&quot;); &quot;                        + &quot;background-position: &quot;                        + data:backgroundPositionStyleStr + &quot;; &quot;                        + data:widthStyleStr                        + &quot;min-height: &quot; + data:height                        + &quot;_height: &quot; + data:height                        + &quot;background-repeat: no-repeat; &quot;' id='header-inner'>
            <div class='titlewrapper' style='background: transparent'>
              <h1 class='title' style='background: transparent; border-width: 0px'>
                <b:include name='title'/>
              </h1>
            </div>
            <b:include name='description'/>
          </div>
        </b:if>
    <b:else/>
      <!--Show the image only-->
      <div id='header-inner'>
        <a accesskey="H" expr:href='data:blog.homepageUrl' id='header-inner-link' style='display: block'>
          <img expr:alt='data:title' expr:height='data:height' expr:id='data:widget.instanceId + &quot;_headerimg&quot;' expr:src='data:sourceUrl' expr:width='data:width' style='display: block'/>
        </a>
        <!--Show the description-->
        <b:if cond='data:imagePlacement == &quot;BEFORE_DESCRIPTION&quot;'>
          <b:include name='description'/>
        </b:if>
      </div>
    </b:if>
  <b:else/>
    <!--No header image -->
    <div id='header-inner'>
      <div class='titlewrapper'>
        <h1 class='title'>
          <b:include name='title'/>
        </h1>
      </div>
      <b:include name='description'/>
    </div>
  </b:if>
</b:includable>
     <b:includable id='description'>
  <div class='descriptionwrapper' expr:url='data:blog.url'>
    <p class='description'><span><data:description/></span></p>
  </div>
</b:includable>
     <b:includable id='title'>
  <b:if cond='data:blog.url == data:blog.homepageUrl'>
    <data:title/>
  <b:else/>
    <a accesskey="H" expr:href='data:blog.homepageUrl'><data:title/></a>
  </b:if>
</b:includable>
   </b:widget>
    
</b:section>
</header>
     
<?php echo file_get_contents("1_menu/2_search.html"); ?>

<?php echo file_get_contents("1_menu/1_menu.html"); ?>

 </div> 
</div>
</div>
<?php
// ---------------------------------------------
?>  
<div class='clear'/>
</div>
      <div class='clear'/>

<div class='container' id='content-wrapper'>
<div class='row' id='primary'>

<b:if cond='data:blog.url == "http://blog.pulipuli.info/p/archives.html" or data:blog.url == "https://blog.pulipuli.info/p/archives.html"'>
<?php echo file_get_contents("4_content/archives.html") ?>
<style type="text/css">
#content.main {
    display: none;
}
</style>
</b:if>

<b:if cond='data:blog.url == "http://blog.pulipuli.info/p/labels.html" or data:blog.url == "https://blog.pulipuli.info/p/labels.html"'>
<?php echo file_get_contents("4_content/labels.html") ?>
<style type="text/css">
#content.main {
    display: none;
}
</style>
</b:if>
<div class='span9 main' id='content' role='main'>
    <a accesskey="C" href="#content-anchor" title="accesskey: main section" id="content-anchor"> ::: </a>
<b:section class='main' id='main' showaddelement='no'>
  <b:widget id='Blog1' locked='true' title='Blog Posts' type='Blog'>
    <b:includable id='main' var='top'>
  <b:if cond='data:mobile == &quot;false&quot;'>
    <!-- posts -->
      <b:include data='top' name='status-message'/>
      <b:loop values='data:posts' var='post'>
        <b:include data='post' name='post'/>
        <b:if cond='data:blog.pageType != &quot;index&quot;'>
          <b:if cond='data:post.showThreadedComments'>
            <b:include data='post' name='threaded_comments'/>
          <b:else/>
            <b:include data='post' name='comments'/>
          </b:if>
        </b:if>
      </b:loop>

    <!-- navigation -->
    <b:include name='nextprev'/>

    <!-- feed links -->
    <b:include name='feedLinks'/>

    <b:if cond='data:top.showStars'>
      <script src='//www.google.com/jsapi' type='text/javascript'/>
      <script type='text/javascript'>
        google.load(&quot;annotations&quot;, &quot;1&quot;, {&quot;locale&quot;: &quot;<data:top.languageCode/>&quot;});
        function initialize() {
          google.annotations.setApplicationId(<data:top.blogspotReviews/>);
          google.annotations.createAll();
          google.annotations.fetch();
        }
        google.setOnLoadCallback(initialize);
      </script>
    </b:if>

  <b:else/>
    <b:include name='mobile-main'/>
  </b:if>

  <b:if cond='data:top.showDummy'>
    <data:top.dummyBootstrap/>
  </b:if>

</b:includable>
<b:includable id='backlinkDeleteIcon' var='backlink'>
  <span expr:class='&quot;item-control &quot; + data:backlink.adminClass'>
    <a expr:href='data:backlink.deleteUrl' expr:title='data:top.deleteBacklinkMsg'>
      <img src='//www.blogger.com/img/icon_delete13.gif'/>
    </a>
  </span>
</b:includable>
<b:includable id='backlinks' var='post'>
  <?php echo file_get_contents("4_content/backlinks.html"); ?>
</b:includable>
<b:includable id='comment-form' var='post'>
  <div class='comment-form'>
    <a name='comment-form'/>
    <b:if cond='data:mobile'>
      <h4 id='comment-post-message'>
        <a expr:id='data:widget.instanceId + &quot;_comment-editor-toggle-link&quot;' href='javascript:void(0)'><data:postCommentMsg/></a></h4>
      <p><data:blogCommentMessage/></p>
      <data:blogTeamBlogMessage/>
      <a expr:href='data:post.commentFormIframeSrc' id='comment-editor-src'/>
      <a expr:href='data:post.commentFormIframeSrc' id='c' name="c"/>
      <?php echo file_get_contents("4_content/comment_form_tool.html"); ?>
      <iframe allowtransparency='true' class='blogger-iframe-colorize blogger-comment-from-post' frameborder='0' height='210' id='comment-editor' name='comment-editor' src='' style='display: none' width='100%'/>
    <b:else/>
      <p><data:blogCommentMessage/></p>
      <data:blogTeamBlogMessage/>
      <a expr:href='data:post.commentFormIframeSrc' id='comment-editor-src'/>
      <a expr:href='data:post.commentFormIframeSrc' id='c' name="c"/>
      <?php echo file_get_contents("4_content/comment_form_tool.html"); ?>
      <iframe allowtransparency='true' class='blogger-iframe-colorize blogger-comment-from-post' frameborder='0' height='210' id='comment-editor' name='comment-editor' src='' width='100%'/>
    </b:if>
    <data:post.friendConnectJs/>
    <data:post.cmtfpIframe/>
    <script type='text/javascript'>
      BLOG_CMT_createIframe(&#39;<data:post.appRpcRelayPath/>&#39;, &#39;<data:post.communityId/>&#39;);
    </script>
  </div>
</b:includable>
    <b:includable id='commentDeleteIcon' var='comment'>
  <span expr:class='&quot;item-control &quot; + data:comment.adminClass'>
    <b:if cond='data:showCmtPopup'>
      <div class='goog-toggle-button'>
        <div class='goog-inline-block comment-action-icon'/>
      </div>
    <b:else/>
      <a class='comment-delete' expr:href='data:comment.deleteUrl' expr:title='data:top.deleteCommentMsg'>
        <img src='//www.blogger.com/img/icon_delete13.gif'/>
      </a>
    </b:if>
  </span>
</b:includable>
    <b:includable id='comment_count_picker' var='post'>
  <b:if cond='data:post.forceIframeComments'>
    <span class='cmt_count_iframe_holder' expr:data-count='data:post.numComments' expr:data-onclick='data:post.addCommentOnclick' expr:data-url='data:post.canonicalUrl'>
    </span>
  <b:else/>
    <b:if cond='data:post.commentSource == 1'>
      <span class='cmt_count_iframe_holder' expr:data-count='data:post.numComments' expr:data-onclick='data:post.addCommentOnclick' expr:data-url='data:post.canonicalUrl'>
      </span>
    <b:else/>
      <a class='comment-link' expr:href='data:post.addCommentUrl' expr:onclick='data:post.addCommentOnclick'>
        <data:post.commentLabelFull/>:
      </a>
    </b:if>
  </b:if>
</b:includable>
<b:includable id='comment_picker' var='post'>
  <b:if cond='data:post.forceIframeComments'>
    <b:include data='post' name='iframe_comments'/>
    <b:if cond='data:post.showThreadedComments'>
      <b:include data='post' name='threaded_comments'/>
    <b:else/>
      <b:include data='post' name='comments'/>
    </b:if>
  <b:else/>
    <b:if cond='data:post.commentSource == 1'>
      <b:include data='post' name='iframe_comments'/>
    <b:else/>
      <b:if cond='data:post.showThreadedComments'>
        <b:include data='post' name='threaded_comments'/>
      <b:else/>
        <b:include data='post' name='comments'/>
      </b:if>
    </b:if>
  </b:if>
</b:includable>
<b:includable id='comments' var='post'>
  <?php echo file_get_contents("4_content/comments.html"); ?>
</b:includable>
    <b:includable id='feedLinks'>
  <b:if cond='data:blog.pageType != &quot;item&quot;'> <!-- Blog feed links -->
    <b:if cond='data:feedLinks'>
      <div class='blog-feeds'>
        <b:include data='feedLinks' name='feedLinksBody'/>
      </div>
    </b:if>

    <b:else/> <!--Post feed links -->
    <div class='post-feeds'>
      <b:loop values='data:posts' var='post'>
        <b:if cond='data:post.allowComments'>
          <b:if cond='data:post.feedLinks'>
            <b:include data='post.feedLinks' name='feedLinksBody'/>
          </b:if>
        </b:if>
      </b:loop>
    </div>
  </b:if>
</b:includable>
    <b:includable id='feedLinksBody' var='links'>
  <div class='feed-links'>
  <data:feedLinksMsg/>
  <b:loop values='data:links' var='f'>
     <a class='feed-link' expr:href='data:f.url' expr:type='data:f.mimeType' target='_blank'><data:f.name/> (<data:f.feedType/>)</a>
  </b:loop>
  </div>
</b:includable>
    <b:includable id='iframe_comments' var='post'>

  <b:if cond='data:post.allowIframeComments'>
    <script expr:src='data:post.iframeCommentSrc' type='text/javascript'/>
    <div class='cmt_iframe_holder'/>

    <b:if cond='data:post.embedCommentForm == &quot;false&quot;'>
      <a expr:href='data:post.addCommentUrl' expr:onclick='data:post.addCommentOnclick'><data:postCommentMsg/></a>
    </b:if>
  </b:if>
</b:includable>
    <b:includable id='mobile-index-post' var='post'>
  <div class='mobile-date-outer date-outer'>
    <div class='mobile-post-outer'>
      <a expr:href='data:post.url'>
        <h3 class='mobile-index-title entry-title'>
          <data:post.title/>
        </h3>

        <div class='mobile-index-arrow'>&amp;rsaquo;</div>

        <div class='mobile-index-contents'>
          <b:if cond='data:post.thumbnailUrl'>
            <div class='mobile-index-thumbnail'>
              <div class='Image'>
                <img expr:src='data:post.thumbnailUrl'/>
              </div>
            </div>
          </b:if>

          <div class='post-body'>
            <b:if cond='data:post.snippet'><data:post.snippet/></b:if>

          </div>
        </div>

        <div style='clear: both;'/>
      </a>

      <div class='mobile-index-comment'>
        <b:if cond='data:blog.pageType != &quot;static_page&quot;'>
          <b:if cond='data:post.allowComments'>
            <b:if cond='data:post.numComments != 0'>
              <a class='comment-link' expr:href='data:post.addCommentUrl' expr:onclick='data:post.addCommentOnclick'><b:if cond='data:post.numComments == 1'>1 <data:top.commentLabel/><b:else/><data:post.numComments/> <data:top.commentLabelPlural/></b:if></a>
            </b:if>
          </b:if>
        </b:if>
      </div>
    </div>
  </div>
</b:includable>
    <b:includable id='mobile-main' var='top'>
    <!-- posts -->
    <div class='blog-posts hfeed'>
      <b:include data='top' name='status-message'/>
      <b:if cond='data:blog.pageType == &quot;index&quot;'>
        <b:loop values='data:posts' var='post'>
          <b:include data='post' name='mobile-index-post'/>
        </b:loop>
      <b:else/>
        <b:loop values='data:posts' var='post'>
          <b:include data='post' name='mobile-post'/>
        </b:loop>
      </b:if>
    </div>

   <b:include name='mobile-nextprev'/>
</b:includable>
    <b:includable id='mobile-nextprev'>
  <div class='blog-pager' id='blog-pager'>
    <b:if cond='data:newerPageUrl'>
      <div class='mobile-link-button' id='blog-pager-newer-link'>
      <a class='blog-pager-newer-link' expr:href='data:newerPageUrl' expr:id='data:widget.instanceId + &quot;_blog-pager-newer-link&quot;' expr:title='data:newerPageTitle'>&amp;lsaquo;</a>
      </div>
    </b:if>

    <b:if cond='data:olderPageUrl'>
      <div class='mobile-link-button' id='blog-pager-older-link'>
      <a class='blog-pager-older-link' expr:href='data:olderPageUrl' expr:id='data:widget.instanceId + &quot;_blog-pager-older-link&quot;' expr:title='data:olderPageTitle'>&amp;rsaquo;</a>
      </div>
    </b:if>

    <div class='mobile-link-button' id='blog-pager-home-link'>
    <a class='home-link' expr:href='data:blog.homepageUrl'><data:homeMsg/></a>
    </div>

    <div class='mobile-desktop-link'>
      <a class='home-link' expr:href='data:desktopLinkUrl'><data:desktopLinkMsg/></a>
    </div>

  </div>
  <div class='clear'/>
</b:includable>
<b:includable id='mobile-post' var='post'>
  <div class='date-outer'>
    <div class='date-posts'>
      <div class='post-outer'>

        <div class='post'>
          <b:if cond='data:post.title'>
            <h3 class='post-title'>
              <b:if cond='data:post.link'>
                <a expr:href='data:post.link'><data:post.title/></a>
              <b:else/>
                <b:if cond='data:post.url'>
                  <b:if cond='data:blog.url != data:post.url'>
                    <a expr:href='data:post.url'><data:post.title/></a>
                  <b:else/>
                    <data:post.title/>
                  </b:if>
                <b:else/>
                  <data:post.title/>
                </b:if>
              </b:if>
            </h3>
          </b:if>

          <div class='post-header'/>

          <div class='post-body'>
            <data:post.body/>
            <div class='clear'/> 
          </div>

          <div class='post-footer'>
            <div class='post-footer-line post-footer-line-1'>
              <span class='post-author vcard'>
                <b:if cond='data:top.showAuthor'>
                  <b:if cond='data:post.authorProfileUrl'>
                    <span class='fn'>
                      <a expr:href='data:post.authorProfileUrl' rel='author' title='author profile'>
                        <data:post.author/>
                      </a>
                    </span>
                  <b:else/>
                    <span class='fn'><data:post.author/></span>
                  </b:if>
                </b:if>
              </span>

              <span class='post-timestamp'>
                <b:if cond='data:top.showTimestamp'>
                  <data:top.timestampLabel/>
                  <b:if cond='data:post.url'>
                    <a class='timestamp-link' expr:href='data:post.url' rel='bookmark' title='permanent link'><abbr class='published' expr:title='data:post.timestampISO8601'><data:post.timestamp/></abbr></a>
                  </b:if>
                </b:if>
              </span>

              <span class='post-comment-link'>
                <b:if cond='data:blog.pageType != &quot;item&quot;'>
                  <b:if cond='data:blog.pageType != &quot;static_page&quot;'>
                    <b:if cond='data:post.allowComments'>
                      <a class='comment-link' expr:href='data:post.addCommentUrl' expr:onclick='data:post.addCommentOnclick'><b:if cond='data:post.numComments == 1'>1 <data:top.commentLabel/><b:else/><data:post.numComments/> <data:top.commentLabelPlural/></b:if></a>
                    </b:if>
                  </b:if>
                </b:if>
              </span>
            </div>

            <div class='post-footer-line post-footer-line-2'>
              <b:if cond='data:top.showMobileShare'>
                <div class='mobile-link-button goog-inline-block' id='mobile-share-button'>
                  <a href='javascript:void(0);'><data:shareMsg/></a>
                </div>
              </b:if>
              <b:if cond='data:top.showDummy'>
                <div class='goog-inline-block dummy-container'><data:post.dummyTag/></div>
              </b:if>
            </div>

          </div>
        </div>

        <b:if cond='data:blog.pageType != &quot;index&quot;'>
          <b:if cond='data:post.showThreadedComments'>
            <div class="comments" id="disqus_thread"></div>
            <b:include data='post' name='threaded_comments'/>
          <b:else/>
            <div class="comments" id="disqus_thread"></div>
            <b:include data='post' name='comments'/>
          </b:if>
        </b:if>
          
        
          

      </div>
    </div>
  </div>
</b:includable>
    <b:includable id='nextprev'>
        <b:if cond='data:blog.url != "http://blog.pulipuli.info/2005/12/blogger_113544406852218769.html" and data:blog.url != "https://blog.pulipuli.info/2005/12/blogger_113544406852218769.html"'>
  <div class='blog-pager' id='blog-pager'>
    <nav>
        <ul class="pager">
            <b:if cond='data:newerPageUrl'>
                <li class="previous link">
                    <span id='blog-pager-newer-link'>
                        <a class='blog-pager-newer-link' expr:href='data:newerPageUrl' expr:id='data:widget.instanceId + &quot;_blog-pager-newer-link&quot;' expr:title='data:newerPageTitle'>
                            <i class="fa fa-chevron-left"></i> <data:newerPageTitle/>
                        </a>
                    </span>
                </li>
            <b:else/>
                <li class="previous hidden link">
                    <span id='blog-pager-newer-link'>
                        <a class='blog-pager-newer-link' href='#'>
                            <i class="fa fa-chevron-left"></i> <data:newerPageTitle/>
                        </a>
                    </span>
                </li>
            </b:if>
            
            <li>
                <a class='home-link' expr:href='data:blog.homepageUrl'><data:homeMsg/></a>
            </li>
            
            <b:if cond='data:olderPageUrl'>
                <li class="next link">
                    <span id='blog-pager-older-link'>
                        <a class='blog-pager-older-link' expr:href='data:olderPageUrl' expr:id='data:widget.instanceId + &quot;_blog-pager-older-link&quot;' expr:title='data:olderPageTitle'>
                            <i class="fa fa-chevron-right"></i> <data:olderPageTitle/>
                        </a>
                    </span>
                </li>
            <b:else/>
                <li class="next hidden link">
                    <span id='blog-pager-older-link'>
                        <a class='blog-pager-older-link' expr:href='data:olderPageUrl' expr:id='data:widget.instanceId + &quot;_blog-pager-older-link&quot;' expr:title='data:olderPageTitle'>
                            <i class="fa fa-chevron-right"></i> <data:olderPageTitle/>
                        </a>
                    </span>
                </li>
            </b:if>
            
            
            <b:if cond='data:mobileLinkUrl'>
                <li class="next">
                    <div class='blog-mobile-link'>
                      <a expr:href='data:mobileLinkUrl'><data:mobileLinkMsg/></a>
                    </div>
                </li>
            </b:if>
        </ul>
    </nav>

  </div>
  <div class='clear'/>
  </b:if>
</b:includable>
    <b:includable id='post' var='post'>
<div class='post'>
<b:if cond='data:blog.pageType == &quot;index&quot;'>
<b:if cond='data:post.title'>



<h3>
<b:if cond='data:post.link'>
<a expr:href='data:post.link' expr:title='data:post.title'><data:post.title/></a>
<b:else/>
<b:if cond='data:post.url'>
<a expr:href='data:post.url' expr:title='data:post.title'><data:post.title/></a>
<b:else/><data:post.title/>
</b:if>
</b:if>
</h3>
</b:if>
</b:if>

<b:if cond='data:blog.pageType == &quot;index&quot;'>

    <span expr:id='&quot;lp&quot; + data:post.id' class="index-labels"> 
        <i class='fa fa-tags'/>       
        <b:if cond='data:post.labels'>
            <span class='label-info'>

                <b:loop values='data:post.labels' var='label'>
                    <a expr:href='data:label.url' rel='tag'>
                        <data:label.name/>
                    </a>
                    <b:if cond='data:label.isLast != &quot;true&quot;'>
                        ,
                    </b:if>
                </b:loop>
            </span>
        </b:if>
    </span>
    <span expr:id='&quot;p&quot; + data:post.id'><data:post.body/></span>
    <script type='text/javascript'>
        var x=&quot;<data:post.title/>&quot;
        ,y=&quot;<data:post.url/>&quot;
        ,z=&quot;<data:post.author/>&quot;
        ,t=&quot;<data:post.timestamp/>&quot;
        ,u=&quot;<data:post.numComments/>&quot;;
        rm2(&quot;p<data:post.id/>&quot;,&quot;<data:post.url/>&quot;);
    </script>
    
<b:else/>
    <div class='entry-container'>
    <div class='entry-content'><article>
    <h1>
<b:if cond='data:post.link'>
    <a expr:href='data:post.link + &quot;&quot;' expr:title='data:post.title'><data:post.title/></a>
<b:else/>

<data:post.title/>

<div class='meta1'>
    <p>
        <small>  
            <span>
                <i class='fa fa-clock-o'/> <data:post.timestamp/>
            </span>    
            <b:if cond='data:blog.pageType != &quot;static_page&quot;'>
                <span>  
                    <i class='fa fa-tags'/>       
                    <b:if cond='data:post.labels'>
                        <span class='label-info'>

                            <b:loop values='data:post.labels' var='label'>
                                <a expr:href='data:label.url' rel='tag'>
                                    <data:label.name/>
                                </a>
                                <b:if cond='data:label.isLast != &quot;true&quot;'>
                                    ,
                                </b:if>
                            </b:loop>
                        </span>
                    </b:if>
                </span>
            </b:if>
            
            <b:if cond='data:post.allowNewComments'>
                <span>
                    <i class='fa fa-comments'/> <data:post.numComments/> Comments
                </span>
            </b:if>
            
            <b:include data='post' name='postQuickEdit'/>
        </small>
    </p></div>
  </b:if></h1>
            
  <data:post.body/>
  
</article></div></div>

</b:if>

<div class='clear'/>

<b:if cond='data:blog.url != "http://blog.pulipuli.info/2005/12/blogger_113544406852218769.html" and data:blog.url != "https://blog.pulipuli.info/2005/12/blogger_113544406852218769.html"'>
<div class='entry-meta clearfix'>
<div class='up_arrow'/>

<aside>
<b:if cond='data:blog.pageType == &quot;index&quot;'>
    <div class='pull-left'>
        <a class='read-more' expr:href='data:post.url + &quot;&quot;'>Read More</a>
        <b:include data='post' name='postQuickEdit'/>
    </div>
</b:if>
 

<b:if cond='data:blog.pageType == &quot;item&quot;'>
    <?php echo file_get_contents("4_content/author.html") ?>
</b:if>

<?php echo file_get_contents("4_content/share.html") ?>

<div class='clear'/>

</aside>
</div>
</b:if> <?php /* <b:if cond='data:blog.url != "http://blog.pulipuli.info/2005/12/blogger_113544406852218769.html"'> */ ?>

<?php /* Related Posts */ ?>   
<b:if cond='data:blog.url != "http://blog.pulipuli.info/2005/12/blogger_113544406852218769.html" and data:blog.url != "https://blog.pulipuli.info/2005/12/blogger_113544406852218769.html"'>
    <div class='related_posts'>
        <script type='text/javascript'>
          var maxresults=10;
          var splittercolor=&quot;&quot;;
          var relatedpoststitle=&quot;Related Posts&quot;;
        </script>
        <b:if cond='data:blog.pageType == &quot;item&quot;'>
            <div id='related-posts'>
                <b:loop values='data:post.labels' var='label'>
                    <b:if cond='data:label.isLast != &quot;true&quot;'>
                    </b:if>
                    <script expr:src='&quot;/feeds/posts/default/-/&quot; + data:label.name + &quot;?alt=json-in-script&amp;callback=pulipuli_related_results_labels_thumbs&amp;max-results=6&quot;' type='text/javascript'/></b:loop>
                <script type='text/javascript'>
                    removeRelatedDuplicates_thumbs();
                    printRelatedLabels_thumbs(&quot;<data:post.url/>&quot;);
                </script>
            </div>
            <div style='clear:both'/>
        </b:if>
    </div>
    </b:if>
    

</div>
</b:includable>
    <b:includable id='postQuickEdit' var='post'>
  <b:if cond='data:post.editUrl'>
    <span expr:class='&quot;item-control &quot; + data:post.adminClass'>
      <a expr:href='data:post.editUrl' expr:title='data:top.editPostMsg' target='_blank'>
        <!-- <img alt='' class='icon-action' height='18' src='//img2.blogblog.com/img/icon18_edit_allbkg.gif' width='18'/> -->
        <i class="fa fa-pencil-square-o" aria-hidden="true"></i>
        Edit Post
      </a>
    </span>
  </b:if>
</b:includable>
    <b:includable id='shareButtons' var='post'>
  <b:if cond='data:top.showEmailButton'><a class='goog-inline-block share-button sb-email' expr:href='data:post.sharePostUrl + &quot;&amp;target=email&quot;' expr:title='data:top.emailThisMsg' target='_blank'><span class='share-button-link-text'><data:top.emailThisMsg/></span></a></b:if><b:if cond='data:top.showBlogThisButton'><a class='goog-inline-block share-button sb-blog' expr:href='data:post.sharePostUrl + &quot;&amp;target=blog&quot;' expr:onclick='&quot;window.open(this.href, \&quot;_blank\&quot;, \&quot;height=270,width=475\&quot;); return false;&quot;' expr:title='data:top.blogThisMsg' target='_blank'><span class='share-button-link-text'><data:top.blogThisMsg/></span></a></b:if><b:if cond='data:top.showTwitterButton'><a class='goog-inline-block share-button sb-twitter' expr:href='data:post.sharePostUrl + &quot;&amp;target=twitter&quot;' expr:title='data:top.shareToTwitterMsg' target='_blank'><span class='share-button-link-text'><data:top.shareToTwitterMsg/></span></a></b:if><b:if cond='data:top.showFacebookButton'><a class='goog-inline-block share-button sb-facebook' expr:href='data:post.sharePostUrl + &quot;&amp;target=facebook&quot;' expr:onclick='&quot;window.open(this.href, \&quot;_blank\&quot;, \&quot;height=430,width=640\&quot;); return false;&quot;' expr:title='data:top.shareToFacebookMsg' target='_blank'><span class='share-button-link-text'><data:top.shareToFacebookMsg/></span></a></b:if><b:if cond='data:top.showOrkutButton'><a class='goog-inline-block share-button sb-orkut' expr:href='data:post.sharePostUrl + &quot;&amp;target=orkut&quot;' expr:title='data:top.shareToOrkutMsg' target='_blank'><span class='share-button-link-text'><data:top.shareToOrkutMsg/></span></a></b:if><b:if cond='data:top.showDummy'><div class='goog-inline-block dummy-container'><data:post.dummyTag/></div></b:if>
</b:includable>
    <b:includable id='status-message'>
  <b:if cond='data:navMessage'>
  <div class='status-msg-wrap'>
    <div class='status-msg-body'>
      <data:navMessage/>
    </div>
  </div>
  <div class='clear'/>
  </b:if>
</b:includable>
<b:includable id='threaded-comment-form' var='post'>
  <div class='comment-form'>
    <a name='comment-form'/>
    <b:if cond='data:mobile'>
      <p><data:blogCommentMessage/></p>
      <data:blogTeamBlogMessage/>
      <a expr:href='data:post.commentFormIframeSrc' id='comment-editor-src'/>
      <a expr:href='data:post.commentFormIframeSrc' id='c' name="c"/>
      <?php echo file_get_contents("4_content/comment_form_tool.html"); ?>
      <iframe allowtransparency='true' class='blogger-iframe-colorize blogger-comment-from-post' frameborder='0' height='210' id='comment-editor' name='comment-editor' src='' style='display: none' width='100%'/>
    <b:else/>
      <p><data:blogCommentMessage/></p>
      <data:blogTeamBlogMessage/>
      <a expr:href='data:post.commentFormIframeSrc' id='comment-editor-src'/>
      <a expr:href='data:post.commentFormIframeSrc' id='c' name="c"/>
      <?php echo file_get_contents("4_content/comment_form_tool.html"); ?>
      <iframe allowtransparency='true' class='blogger-iframe-colorize blogger-comment-from-post' frameborder='0' height='210' id='comment-editor' name='comment-editor' src='' width='100%'/>
    </b:if>
    <data:post.friendConnectJs/>
    <data:post.cmtfpIframe/>
    <script type='text/javascript'>
      BLOG_CMT_createIframe(&#39;<data:post.appRpcRelayPath/>&#39;, &#39;<data:post.communityId/>&#39;);
    </script>
  </div>
</b:includable>
    <b:includable id='threaded_comment_js' var='post'>
  <script async='async' expr:src='data:post.commentSrc' type='text/javascript'/>

  <script type='text/javascript'>
    (function() {
      var items = <data:post.commentJso/>;
      var msgs = <data:post.commentMsgs/>;
      var config = <data:post.commentConfig/>;

// <![CDATA[
      _display_related_posts(items, msgs, config);
    })();
// ]]>
  </script>
</b:includable>
<b:includable id='threaded_comments' var='post'>
  <div class="comments" id="disqus_thread"></div>
    
  <div class='comments' id='comments'>
    <a name='comments-anchor' id='comments-anchor'  />
    <h4>總共<data:post.commentLabelFull/>, <a href="#comment-form-iframe" class="comment-form-iframe">(我要發問)</a></h4>

    <div class='comments-content'>
      <b:if cond='data:post.embedCommentForm'>
        <b:include data='post' name='threaded_comment_js'/>
      </b:if>
      <div id='comment-holder'>
         <data:post.commentHtml/>
      </div>
    </div>
    <p class='comment-footer'>
      <b:if cond='data:post.allowNewComments'>
        <b:include data='post' name='threaded-comment-form'/>
      <b:else/>
        <data:post.noNewCommentsText/>
      </b:if>
    </p>

    <b:if cond='data:showCmtPopup'>
      <div id='comment-popup'>
        <iframe allowtransparency='true' frameborder='0' id='comment-actions' name='comment-actions' scrolling='no'>
        </iframe>
      </div>
    </b:if>

    <div id='backlinks-container'>
    <div expr:id='data:widget.instanceId + &quot;_backlinks-container&quot;'>
       <b:if cond='data:post.showBacklinks'>
         <b:include data='post' name='backlinks'/>
       </b:if>
    </div>
    </div>
  </div>
</b:includable>
  </b:widget>
</b:section>
</div>



<div class='span3' id='side-bar'>
    <a accesskey="R" href="#side-bar-anchor" title="accesskey: sidebar section" id="side-bar-anchor"> ::: </a>
    <div class="sidebar section" id="sidebar">
        <?php echo file_get_contents("2_sidebar/1_sidebar.html"); ?>
    </div>
</div>

<div class='clear'/>
</div> 
</div> 

    <div class='site-footer' id='colophon' role='contentinfo'>
        <div class='container'>
            <a accesskey="B" href="#footer-anchor" title="accesskey: footer section" id="footer-anchor"> ::: </a>
            <div class='row-fluid' id='footer-body'>
                <div class="cleanwidget  nopadding span4 bl_html section" id="column1">
                    <?php echo file_get_contents("3_footer/1_col.html") ?>
                </div>
                <div class="cleanwidget  nopadding span8 bl_html section" id="column2">
                    <?php echo file_get_contents("3_footer/2_col.html") ?>
                </div>
                <div class='clear'/>
            </div>
        </div>

<div class='footer' id='footer'>
    <footer>
        <div class='container clearfix'>
                 
                <div class='go-top'>
                    <a class="goto-top" href='#' title="Go to Top"><i class='fa fa-angle-up'/></a>
                    <a class="goto-comment" href='#comment-form-iframe' title="Add Comment"><i class="fa fa-commenting" aria-hidden="true"></i></a>
                </div>
            
            
            <p>
            <span class="blog-copyright">
                &#169; Copyright <?php echo date("Y"); ?> 
                <a expr:href='data:blog.homepageUrl'><data:blog.title/></a> 
            </span>
            <span class="themexpose">
            / Created by <a href='http://themexpose.com/' id='mycontent'>ThemeXpose</a>
            / Published By <a href='http://gooyaabitemplates.com/' rel='dofollow' target='_blank' title='Blogger Templates'>Gooyaabi Templates</a>
            </span>
            </p>
            <p class="management">
                <?php echo file_get_contents("3_footer/4_management.html") ?>
            </p>
        </div>
    </footer>        
  </div>
</div>
</div>

<!-- JAVASCRIPT -->
<!-- <script src="//load.sumome.com/" data-sumo-site-id="91b6a5a67cc23845f0765da427a8ac1c0b918c4e9226f12ea32abf1e8110df0c" async="async"></script> -->
<!-- Go to www.addthis.com/dashboard to customize your tools --> <script type="text/javascript" src="//s7.addthis.com/js/300/addthis_widget.js#pubid=pulipuli" async="async"></script> 
<script type="text/javascript" src="//pulipulichen.github.io/blogger/blogger/js/google-analytics.js"></script>

<b:if cond='data:blog.pageType == &quot;item&quot;'>
    <script type="text/javascript" src="//pulipulichen.github.io/blogger/blogger/js/related-posts.js"></script>
    <script type="text/javascript" src="//pulipulichen.github.io/blogger/blogger/lib/lightbox2-lokeshdhakar/init.js"></script>
    <script type="text/javascript" src="//pulipulichen.github.io/blogger/blogger/lib/highlight/init.js"></script>
</b:if>
</body>
</html>