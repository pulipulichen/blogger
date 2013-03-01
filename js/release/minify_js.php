<?php

header("Content-type: text/javascript");

$files = array(
    "puliPostCatalog.js"
    , "puliBloggerDigest.js"
    , "jquery.lazyload.min.js"
    , "jquery.blogger.infinitescroll.min.js"
    , "blogger.js"
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

//顯示開頭註解
echo "/**
 * pulipuli.blogspot.com.min.js
 * 
 * JavaScript for http://pulipuli.blogspot.tw
$file_name_list
 */
";

require_once '../../min/lib/JSMinPlus.php';


$compressed_file_name = '.min.js';

//顯示壓縮內容
foreach ($files as $file_name) {
    $file_content = file_get_contents("../".$file_name);
    
    //壓縮
    if (substr($file_name, 0-(strlen($compressed_file_name)) !== $compressed_file_name)) {
        $file_content = JSMinPlus::minify($file_content);
    }
    
    echo $file_content;
}
