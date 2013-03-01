<?php

header("Content-type: text/css");

$files = array("blogger-template.css");

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
 * blogger-template.min.css
 * 
 * CSS for http://pulipuli.blogspot.tw
$file_name_list
 */
";

require_once '../../min/lib/CSSmin.php';

$cssmin = new CSSmin();

$compressed_file_name = '.min.js';

//顯示壓縮內容
foreach ($files as $file_name) {
    $file_content = file_get_contents($file_name);
    
    //壓縮
    if (substr($file_name, 0-(strlen($compressed_file_name)) !== $compressed_file_name)) {
        $file_content = $cssmin->run($file_content);
    }
    
    echo $file_content;
}
