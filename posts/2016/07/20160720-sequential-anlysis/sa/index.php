<?php
//echo (10-(127*0.0654))/sqrt(127*0.0654*0.9346);
//echo (10 - 127 * 0.065439148007955 ) / sqrt(127 * 0.065439148007955 * (1 - 0.065439148007955));

$obs = "";
for ($i = 0; $i < 10; $i++) {
    $obs .= "PG ";
}   //20
for ($i = 0; $i < 5; $i++) {
    $obs .= "GP ";
}   //10
for ($i = 0; $i < 15; $i++) {
    $obs .= "GS";
}   //30
for ($i = 0; $i < 15; $i++) {
    $obs .= "PS";
}   //30
for ($i = 0; $i < 4; $i++) {
    $obs .= "PU";
}   // 8
for ($i = 0; $i < 15; $i++) {
    $obs .= "SUT";
}
//$obs .= "ST";
echo strlen($obs);


include 'sa.php';
$sa = new sa($obs);

echo "\n <h2>編碼序列</h2> \n";
echo $sa->obs;

echo "\n <h2>標籤列表</h2> \n";
print_r($sa->lag_list);

echo "\n <h2>編碼轉換頻率表</h2> \n";
//print_r($sa->sf);
echo sa::table_draw($sa->sf);

echo "\n <h2>編碼轉換頻率表</h2>\n";
//print_r($sa->pos_list);
echo sa::table_draw($sa->pos_list);

echo "\n <h2>編碼頻率與機率表</h2>\n";
//print_r($sa->sf_pos_list);
echo sa::table_draw($sa->sf_pos_list);

echo "\n <h2>編碼轉換期望機率表</h2>\n";
//print_r($sa->exp_pos_table);
echo sa::table_draw($sa->exp_pos_table);

echo "\n <h2>編碼轉換期望頻率表</h2>\n";
//print_r($sa->exp_f_table);
echo sa::table_draw($sa->exp_f_table);

echo "\n <h2>建議最少編碼轉換樣本數量表</h2>\n";
//print_r($sa->last_ns_table);
echo sa::table_draw($sa->last_ns_table);

echo "\n <h2>建議最少編碼轉換樣本數量表 訊息</h2>\n";
print_r($sa->last_ns_message);
echo "<br />\n";

echo "\n <h2>調整後殘差表(Z分數)</h2>\n";
//print_r($sa->z_table);
echo sa::table_draw($sa->z_table);

echo "\n <h2>顯著編碼轉換</h2>\n";
print_r($sa->sign_result);