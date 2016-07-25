<?php
//echo (10-(127*0.0654))/sqrt(127*0.0654*0.9346);
//echo (10 - 127 * 0.065439148007955 ) / sqrt(127 * 0.065439148007955 * (1 - 0.065439148007955));
//echo (10-(127*0.05)) / sqrt(127*0.05*0.95);

//echo (10 - (30*0.278) ) / sqrt( 30 * 0.278 * (1-0.278) * (1-0.236) );
//echo (10 - (30*0.27835051546392 ) ) / sqrt( 30 * 0.27835051546392  * (1-0.27835051546392 ) * (1-0.23622047244094 ) );
/*
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
*/
//$obs .= "ST";
$obs = "USPTPTPGTPTGTPGTGPTPGTGPSTPTGTSPGPSUSTPTGTUTSPGPSGTPTGPGSUSTUTSPSGTPTGPGSUSTUTSPSGTPTGPGUSUTUPUGSTSPSGTPTGPGUSUTUPUGSTSPSGTPTGPG";
//echo strlen($obs);


include_once 'sequential_analysis.class.php';
//$sa = new Sequential_analysis($obs, "USTPG", FALSE, 2);
//$sa = new Sequential_analysis("PGTPGTPGT");
$sa = new Sequential_analysis();

//print_r($sa->position_frequency);
//echo Sequential_analysis::table_draw($sa->position_frequency);

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

//echo "\n <h2>編碼頻率與機率表</h2>\n";
////print_r($sa->sf_pos_list);
//echo sa::table_draw($sa->sf_pos_list);

//echo "\n <h2>編碼轉換期望機率表</h2>\n";
////print_r($sa->exp_pos_table);
//echo sa::table_draw($sa->exp_pos_table);
//
//echo "\n <h2>編碼轉換期望頻率表</h2>\n";
////print_r($sa->exp_f_table);
//echo sa::table_draw($sa->exp_f_table);
//
//echo "\n <h2>建議最少編碼轉換樣本數量表</h2>\n";
////print_r($sa->last_ns_table);
//echo sa::table_draw($sa->last_ns_table);

//echo "\n <h2>建議最少編碼轉換樣本數量表 訊息</h2>\n";
//print_r($sa->last_ns_message);
//echo "<br />\n";

foreach ($sa->z_table AS $model => $value) {
    echo "\n <h2>調整後殘差表(Z分數) (".$model.")</h2>\n";
    //print_r($sa->z_table);
    echo Sequential_analysis::table_draw($sa->z_table[$model], true);

    echo "\n <h2>顯著編碼轉換 (".$model.")</h2>\n";
    print_r($sa->sign_result[$model]);
}

echo "\n <h2>顯著編碼轉換 (all)</h2>\n";
print_r($sa->export_sign_result("allison_liker"));

//include_once 'sequential_analysis.class.php';
//$sa = new Sequential_analysis("ABABABABABABCBCA", "ABC", FALSE);
//print_r($sa->export_sign_result("allison_liker"));
