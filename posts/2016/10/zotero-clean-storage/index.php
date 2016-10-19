<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>
    Zotero Clean Storage
</title>
</head>

<body>
<?php

if (!isset($_GET["delete"])) {
    ?>
    <form action="." method="get">
        <input type="hidden" name="delete" value="true" />
        <button type="submit">DELETE FOLLOWING FILES?</button>
    </form>
    <?php
}
else {
    set_time_limit ( 3000 );
}

// http://stackoverflow.com/questions/1271099/moving-a-file-to-the-recycle-bin-php

function Recycle($filename)
{
    $commend = __DIR__ . '/file-recycle.exe "' . $filename . '"';
    //echo $commend;
    
    //system(__DIR__."/Recycle.exe -f " . $filename, $r);
    //system("DEL /S")
    //return $r;
    exec($commend);
}

$dir = "D:\Desktop\Box Sync\[ZOTERO]\storage";
$needle = " (pulipuli.chen@gmail.com)";

$remove_list = array();

// 列出該目錄底下的所有目錄
$files = scandir($dir);
foreach ($files AS $file_name) {
    if (strpos($file_name, $needle) !== FALSE) {
        $remove_list[] = $dir . "\\" . $file_name;
    }
}

foreach ($remove_list AS $file_name) {
    echo $file_name;
    
    if (isset($_GET["delete"]) && $_GET["delete"] === "true") {
        Recycle($file_name);
        echo "is moved to recycler.";
        //break;
    }
    echo "<br />";
}

if (isset($_GET["delete"]) && $_GET["delete"] === "true") {
    ?>
    All files have been moved to recycler.
    <?php
}
?>

</body>
</html>
