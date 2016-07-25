<?php

include_once 'sequential_analysis.class.php';
$obs = 'USPTPTPGTPTGTPGTGPTPGTGPSTPTGTSPGPSUSTPTGTUTSPGPSGTPTGPGSUSTUTSPSGTPTGPGSUSTUTSPSGTPTGPGUSUTUPUGSTSPSGTPTGPGUSUTUPUGSTSPSGTPTGPG';
$sa = new Sequential_analysis($obs);

echo "\n <h2>編碼序列</h2> \n";
echo $sa->obs;

echo "\n <h2>標籤列表</h2> \n";
print_r($sa->lag_list);

echo "\n <h2>編碼轉換頻率表</h2> \n";
//print_r($sa->sf);
echo Sequential_analysis::table_draw($sa->sf);

echo "\n <h2>編碼出現頻率表</h2>\n";
//print_r($sa->pos_list);
echo Sequential_analysis::table_draw($sa->code_f);

echo "\n <h2>編碼轉換頻率表</h2>\n";
//print_r($sa->pos_list);
echo Sequential_analysis::table_draw($sa->pos_list);

foreach ($sa->z_table AS $model => $value) {
    echo "\n <h2>調整後殘差表(Z分數) (".$model.")</h2>\n";
    //print_r($sa->z_table);
    echo Sequential_analysis::table_draw($sa->z_table[$model], true);

    echo "\n <h2>顯著編碼轉換 (".$model.")</h2>\n";
    print_r($sa->sign_result[$model]);
}

echo "\n <h2>所有顯著編碼轉換 (all)</h2>\n";

print_r($sa->export_sign_result("allison_liker"));

?>
<script src="//ajax.googleapis.com/ajax/libs/jquery/2.2.2/jquery.min.js"></script>
<script src="http://pulipulichen.github.io/blogger/posts/2016/07/20160720-sequential-anlysis/1204/d3.v3.min.js"></script>
<link type='text/css' rel='stylesheet' href='http://pulipulichen.github.io/blogger/posts/2016/07/20160720-sequential-anlysis/1204/d3network.css' />
<script src="http://pulipulichen.github.io/blogger/posts/2016/07/20160720-sequential-anlysis/1204/d3network.js"></script>
<script>
    
var config = {};

// @var 使用箭頭 true || false
config.enableDirection = true;

config.canvasWidth = 960;
config.canvasHeight = 960;

config.strokeWidthMax = 0.3;
config.strokeWidthMin = 0.1;
config.arrowMaxSize = 0.2;
config.arrowDefaultSize = 12;
config.linkDistance = 150;
config.rectWidth = 100;
config.rectHeight = 60;

config.nodeR = 10;


config.links = <?php echo json_encode($sa->export_sign_result("allison_liker")); ?>;
d3network(config);
</script>