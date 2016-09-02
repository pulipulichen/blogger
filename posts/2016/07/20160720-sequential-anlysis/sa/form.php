<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Lag Sequential Analysis Tool</title>
</head>

<body>
    <h1>Lag Sequential Analysis Tool</h1>
    <a target="_blank" href="https://github.com/pulipulichen/blogger/tree/gh-pages/posts/2016/07/20160720-sequential-anlysis/sa">source code</a>
    <form action="form.php" method="post">
        <textarea name="obs" style="width: 100%;height: 10em;"><?php if (isset($_POST["obs"])) echo $_POST["obs"]; ?></textarea>
        <div style="text-align: center;">
            <label>
                <input type="checkbox" name="repeatable" value="true" <?php if (isset($_POST["repeatable"])) echo "checked" ?> /> Adjacent codes can be same.
            </label>
        </div>
        <div style="text-align: center;">
            <button type="submit" style="font-size: 3em;">SUBMIT</button>
        </div>
    </form>
    <?php
if (isset($_POST["obs"]) && trim($_POST["obs"]) !== "") {
    ?>
    <?php
include_once 'sequential_analysis.class.php';
$obs = trim($_POST["obs"]);
$repeatable = isset($_POST["repeatable"]);
//$obs = 'ABBCBBCAAC';
$sa = new Sequential_analysis($obs, "", $repeatable);

echo "\n <h2>編碼序列</h2> \n";
echo $sa->obs;

echo "\n <h2>編碼標籤列表</h2> \n";
print_r($sa->lag_list);

echo "\n <h2>編碼轉換頻率表</h2> \n";
//print_r($sa->sf);
echo Sequential_analysis::table_draw($sa->sf);

echo "\n <h2>調整後殘差表</h2> \n";
echo Sequential_analysis::table_draw($sa->z_table['allison_liker'], true);

echo "\n <h2>所有顯著編碼轉換 (all)</h2>\n";
print_r($sa->export_sign_result("allison_liker"));
    
}
?>
</body>
</html>
