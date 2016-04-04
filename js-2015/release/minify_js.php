<?php

//$debug = true;

$compressed = 'pulipuli.blogspot.com.min.js';
$files = array(
    "jquery.lazyload.min.js"
    , "ydn.db-is-core-qry.js"
    //, "jquery.blogger.infinitescroll.min.js"
    , "puli.post.iframelazyload.js"
    , "puli.utils.js"
    , "blogger.js"
    //, "puliPostCatalog.js"
    , "puli.post.toc.js"
    //, "puliBloggerDigest.js"
    , "jquery.qrcode.js"
    , "qrcode.js"
    , "puli.qrcode.js"
);

$file_name_list = '';

foreach ($files as $file_name) {
    if ($file_name_list != '') {
        $file_name_list = $file_name_list . ', ';
    }
    $file_name_list = $file_name_list . $file_name;
}

if ($file_name_list != '') {
    if (count($files) > 1) {
        $file_name_list = " *\n * Include files: " . $file_name_list;
    }
    else {
        $file_name_list = " *\n * Include file: " . $file_name_list;
    }
}

$compressed_file_content = '';

//顯示開頭註解
$doc_block = "/**
 * $compressed
 * 
 * JavaScript for http://pulipuli.blogspot.tw
$file_name_list
 * * Minify JavaScript: http://localhost/blogger/js/release/minify_js.php
 */
";
$compressed_file_content = $compressed_file_content . $doc_block;

require_once '../../min/lib/JSMinPlus.php';


$compressed_file_name_footer = '.min.js';

//顯示壓縮內容
foreach ($files as $file_name) {
    $file_content = file_get_contents("../".$file_name);
    
    //壓縮
    if (substr($file_name, 0-(strlen($compressed_file_name_footer)) !== $compressed_file_name_footer)) {
    
    	if (isset($debug) === false) {
    		$file_content = JSMinPlus::minify($file_content);
    	}
    }
    
    $compressed_file_content = $compressed_file_content . $file_content . ';';
}

//file_put_contents($compressed, $compressed_file_content);
//echo $compressed_file_content;

if (isset($_GET['type']) === FALSE) {
    ?>
<!--
To change this template, choose Tools | Templates
and open the template in the editor.
-->
<!DOCTYPE html>
<html>
    <head>
        <title>Test minify JavaScript</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="../lib/jquery.js"></script>
    </head>
    <body>
        <div id="loading">讀取中。如果沒有出現下載連結，請修改程式之後<a href="?">重新整理這個網頁</a>。</div>
        <script type="text/javascript" src="?type=display"></script>
        <script type="text/javascript">
            document.write('<a href="?type=compress">確定沒有錯誤，開始壓縮</a>');
            document.getElementById('loading').style.display = 'none';
        </script>
    </body>
</html>
    <?php
}
else if ($_GET['type'] === 'display') {
    header("Content-type: text/javascript");
    echo $compressed_file_content;
}
else if ($_GET['type'] === 'compress') {
    header("Content-type: text/javascript");
    file_put_contents($compressed, $compressed_file_content);
    echo $compressed_file_content;
}
