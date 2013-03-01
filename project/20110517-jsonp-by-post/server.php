<?php
$header = "data";
$timestamp = $_GET["timestamp"];
$index = $header . $timestamp;

session_start();

if ($_SERVER['REQUEST_METHOD'] == "POST")
{
    $description = $_POST["description"];
    
    $_SESSION[$index]['name'] = $_FILES['file']['name'];
    $_SESSION[$index]['size'] = $_FILES['file']['size'];
    $_SESSION[$index]['description'] = $description;
    
    if ($_FILES['file']['size'] == 0)
    {
        $_SESSION[$index]['state'] = 'error';
        echo "false";
    }
    else
    {
        $_SESSION[$index]['state'] = "sussesful";
        echo "true";
    }
}
else
{
    $callback = $_GET['callback'];

    $output = '';
    if (isset($_SESSION[$index]))
    {
        $output = $_SESSION[$index]['state'].'; ' 
            .$_SESSION[$index]['name'].'; '
            .$_SESSION[$index]['size'].'; '
            .$_SESSION[$index]['description'];
            
        unset($_SESSION[$index]);
    }
    
    if (is_null($callback))
        echo $output;
    else
        echo $callback."('".$output."');";    
    
}


