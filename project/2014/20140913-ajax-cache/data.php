<?php
header('Content-Type: application/javascript');
if (isset($_GET["callback"])) {
    echo $_GET["callback"]."(\"get data!\");";
}
else {
    echo "get data";
}