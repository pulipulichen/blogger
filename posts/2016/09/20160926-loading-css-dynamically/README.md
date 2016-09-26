<p><a href="$image[3].png"><img title="image" style="border-left-width: 0px; border-right-width: 0px; background-image: none; border-bottom-width: 0px; padding-top: 0px; padding-left: 0px; display: inline; padding-right: 0px; border-top-width: 0px" border="0" alt="image" src="$image_thumb[1].png" width="644" height="440" /></a></p>

<p>我在KALS專案中有用到<a href="http://stackoverflow.com/questions/5680657/adding-css-file-with-jquery#answer-5680757" target="_blank">以jQuery動態載入CSS的技巧</a>，但是最近在Chrome上卻意外不能執行。研究之後才發現這是因為我在載入CSS途中去修改CSS載入<link />標籤的title屬性，造成CSS載入失敗。解決方法是應該在建立載入CSS的<link />標籤時就加入title屬性，而不要事後修改。</p>

<!--more-->

<hr />

<h4>載入CSS失敗的案例 / Fault Example </h4>

<p>接著我們來看一下㑹失敗的案例。這個例子必需要用Google Chrome 53.02785.116m版以上開啟才會發生，在Firefox或IE上面則不會遇到這個問題。請注意看JavaScript程式碼裡面的內容，我在建立了<link />標籤之後就插入到裡面，此時CSS會載入。但我又在後面修改了<link />標籤的title屬性，就造成CSS載入中斷了。 </p>

<ul>
  <li>CSS程式碼：<a href="http://pulipulichen.github.io/blogger/posts/2016/09/20160926-loading-css-dynamically/style.css" target="_blank">style.css</a> 

    <br /><code>body { 
      <br />&#160;&#160;&#160; color:red; 

      <br />} </code></li>

  <li>HTML程式碼：<a href="http://pulipulichen.github.io/blogger/posts/2016/09/20160926-loading-css-dynamically/load_css_fault.html" target="_blank">load_css_fault.html</a> </li>
</ul>
<code>&lt;html&gt; 
  <br />&lt;head&gt; 

  <br />&#160;&#160;&#160; &lt;script src=&quot;//ajax.googleapis.com/ajax/libs/jquery/2.2.2/jquery.min.js&quot;&gt;&lt;/script&gt; 

  <br />&lt;/head&gt; 

  <br />&lt;body&gt; 

  <br />&#160;&#160;&#160; 這是錯誤的例子：CSS沒有正常載入，文字還是黑色的。 

  <br />&#160;&#160;&#160; &lt;script&gt; 

  <br />&#160;&#160;&#160;&#160;&#160;&#160;&#160; $(function () { 

  <br />&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160; var _link = $('&lt;link href=&quot;style.css&quot; type=&quot;text/css&quot; rel=&quot;stylesheet&quot; /&gt;'); 

  <br />&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160; _link.appendTo(&quot;head&quot;); 

  <br />&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160; <br />&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160; // 修改link屬性 

  <br />&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160; _link.attr(&quot;title&quot;, &quot;global&quot;); 

  <br />&#160;&#160;&#160;&#160;&#160;&#160;&#160; }); 

  <br />&#160;&#160;&#160; &lt;/script&gt; 

  <br />&lt;/body&gt; 

  <br />&lt;/html&gt; 

  <br /></code>

<p>運作結果： </p>

<p><iframe src="http://pulipulichen.github.io/blogger/posts/2016/09/20160926-loading-css-dynamically/load_css_fault.html"></iframe></p>

<hr />

<h4>成功的案例 / Workable Example</h4>

<p>接下來我們換一個改良後的程式碼。CSS依舊是同一個檔案，不過JavaScript裡面的敘述有所修改。我在建立<link />標籤的時候設定了title屬性，然後才插入到裡面，這樣子CSS就能夠正常讀取了。</p>

<ul>
  <li>HTML程式碼：<a href="http://pulipulichen.github.io/blogger/posts/2016/09/20160926-loading-css-dynamically/load_css_success.html" target="_blank">load_css_success.html</a> </li>
</ul>
<code>&lt;html&gt;
  <br />&lt;head&gt;

  <br />&#160;&#160;&#160; &lt;script src=&quot;//ajax.googleapis.com/ajax/libs/jquery/2.2.2/jquery.min.js&quot;&gt;&lt;/script&gt;

  <br />&lt;/head&gt;

  <br />&lt;body&gt;

  <br />&#160;&#160;&#160; 這是正確的例子：CSS有正常載入，文字變成紅色的。

  <br />&#160;&#160;&#160; &lt;script&gt;

  <br />&#160;&#160;&#160;&#160;&#160;&#160;&#160; $(function () {

  <br />&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160; var _link = $('&lt;link href=&quot;style.css&quot; type=&quot;text/css&quot; rel=&quot;stylesheet&quot; /&gt;');

  <br />&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160; <br />&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160; // 提前修改link屬性

  <br />&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160; _link.attr(&quot;title&quot;, &quot;global&quot;);

  <br />&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160; <br />&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160; _link.appendTo(&quot;head&quot;);

  <br />&#160;&#160;&#160;&#160;&#160;&#160;&#160; });

  <br />&#160;&#160;&#160; &lt;/script&gt;

  <br />&lt;/body&gt;

  <br />&lt;/html&gt;

  <br /></code>

<p>運作結果： </p>

<p><iframe src="http://pulipulichen.github.io/blogger/posts/2016/09/20160926-loading-css-dynamically/load_css_success.html"></iframe></p>