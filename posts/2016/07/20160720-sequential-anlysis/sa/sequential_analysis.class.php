<?php

class Sequential_analysis {
    
    /**
     * 序列編碼
     * @var string 
     */
    var $obs;
    
    /**
     * 序列編碼 轉換成陣列
     * @var array
     */
    var $config_obs_array = array();
    
    /**
     * 編碼次數
     * @var int 
     */
    var $n;  // 編碼次數
    
    /**
     * 序列次數
     * @var int 
     */
    var $ns;     // 序列次數
    
    /**
     * 片段次數
     * @var int 
     */
    var $breaks; //片段次數
    
    /**
     *是否允許相同編碼重複
     * @var boolean
     */
    //var $allow_same_adjacent_codes = true;
    
    /**
     * 是否縮減重複編碼
     * true, false, auto
     * @var string 
     */
    var $repeatable = TRUE;    // 編碼可否重複
    
    /**
     * 編碼列表
     * @var array 
     */
    var $code_list; // 編碼列表
    
    /**
     * 編碼列表頻率
     * @var array 
     */
    var $code_f;    // 編碼列表頻率
    
    /**
     * 序列頻率
     * @var array 
     */
    var $seq_f; // 序列頻率
    
    /**
     * 觀察序列長度 
     * @var int 
     */
    var $lag;   // 觀察序列長度
    
    /**
     * 期望機率模型
     * 
     * First-order model：從觀察樣本中推估機率期望值。 
     * Zero-order model：設定每種編碼的機率期望值均相等。
     * @var boolean 
     */
    //var $first_order;   
    
    /**
     * 編碼列表
     * @var string
     */
    var $code_list_string;  // 編碼列表
    
    /**
     * 標籤列表
     * @var array 
     */
    var $lag_list;  // 標籤列表
    
    /**
     * 編碼轉換頻率表 sequence frequency
     * @var array
     */
    var $sf = array();  //編碼轉換頻率表 sequence frequency
    
    /**
     * 編碼轉換頻率表 sequence frequency
     * @var array
     */
    var $pos_list = array();    // 編碼轉換機率表
    
    /**
     * 編碼頻率與機率表
     * @var array
     */
    var $sf_pos_list = array();    // 編碼頻率與機率表
    
    /**
     * 編碼轉換期望機率表
     * @var array
     */
    //var $exp_pos_table; // 編碼轉換期望機率表
    
    /**
     * 編碼轉換期望頻率表
     * @var array
     */
    //var $exp_f_table;    //編碼轉換期望頻率表

    /**
     * 建議最少編碼轉換樣本數量表
     * @var array
     */
    //var $last_ns_table; //建議最少編碼轉換樣本數量表
    
    /**
     * 建議最少編碼轉換樣本數量表 訊息
     * @var string
     */
    //var $last_ns_message;   //建議最少編碼轉換樣本數量表 訊息

    /**
     * 編碼轉換期望頻率表 (不顯示的)
     * @var array
     */
    var $exp_pos_list;  // 期望值列表...?
    
    /**
     * 調整後殘差表(Z分數) code_frequencies
     * @var array 
     */
    var $z_table;

    /**
     * 有顯著結果的列表 code_frequencies
     * @var array
     */
    var $sign_result;   // 有顯著結果的列表
    
    // ------------------------------------------------------

    /**
     * 序列分析工具
     * 
     * 使用範例
     * include_once 'sequential_analysis.class.php';
     * $sa = new Sequential_analysis("ABABCBCA", "ABC", FALSE);
     * print_r($sa->export_sign_result("allison_liker"));
     * 
     * @param {string} $obs 觀察序列字串
     * @param {string} $codes 欲觀察觀察編碼
     * @param {boolean} $repeatable 可否重複: true false
     */
    function __construct($obs = "", $codes = "", $repeatable = FALSE, $lag = 2) {

        // 只能計算2 lag，不能再多了
        //$lag = 4;
        
        $obs = trim($obs);
        if (is_string($codes)) {
            $codes = trim($codes);
        }
        else if (is_array($codes)) {
            $codes_string = "";
            foreach ($codes AS $c) {
                $codes_string .= $c;
            }
            $codes = $codes_string;
        }
        
        if ($obs === "") {
            //$obs = $this->sa_create_temp_obs();
            $obs = $this->sa_create_temp_obs2();
            $codes = "USTPG";
        }
        
        $code_list = [];    //包含的coding
        $code_f = [];    //頻率

        //取得參數
        $config_obs = $obs;
        if ($config_obs === '') {
            return;
        }
        
        $this->obs = $obs;
        
        $config_codes = $codes;

        //設定code
        if ($config_codes != '') {
            //var _last_code = null;
            for ($i = 0; $i < strlen($config_codes); $i++)
            {
                $code = substr($config_codes, $i, 1);

                $code_list[] = $code;
                $code_f[$code] = 0;
            }
        }

        $this->code_f = $code_f;
        $this->config_codes = $config_codes;
        $this->code_list = $code_list;
        
        $this->repeatable = $repeatable;
        $this->lag = $lag;
        
        
        $this->sa_convert_obs();
        $this->cal_frequency();
        
        
        // 20160722 1507 測試用
//        print_r(array(
//            $this->n, 
//            $this->ns, 
//            $this->breaks, 
//            $this->seq_f,
//            $this->code_list
//                ));
        //return;

        $this->calc_code_list_string();

        $this->create_martix_lag_list();

        $this->cal_sf_total();

        // 只是畫表格而已，不使用
        $this->create_obs_seq_pos_table();

        // 最後步驟
        $this->cal_sign_result();
    }   //end of function __construct(
    
    /**
     * 將觀察序列字串轉換成陣列
     */
    function sa_convert_obs() {

        $obs = $this->obs;
        //print_r($obs);
        
        $output = array();

        $break_list = array(' ', '\t', '\n');

        for ($i = 0; $i < strlen($obs); $i++) {
            $code = substr($obs, $i, 1);

            if (in_array($code, $break_list) === true) {
                $output[] = array();
            }
            else if ($code == '(') {
                $multi_code = array();
                $i++;
                while (substr($obs, $i, 1) !== ')') {
                    $code = substr($obs, $i, 1);
                    $multi_code[] = $code;
                    $i++; 
                }
                $output[] = $multi_code;
            }
            else {
                $output[] = array($code);
            }
        }
        //return $output;

        //print_r($output);
        $this->config_obs_array = $output;
    }   // end of function sa_convert_obs(
    // 16:48 整理到這裡
    
    /**
     * 計算頻率
     */
    function cal_frequency() {
        $config_repeatable = $this->repeatable;
        
        $n = 0;    //總coding次數
        $ns = 0;   //序列次數
        $breaks = 1;    //斷片次數
        
        $seq_f = [];    //每種序列發生的頻率

        //開始跑所有的觀察樣本
        $last_event = TRUE;
        $event = FALSE;
        
        $config_codes = $this->config_codes;
        $code_list = $this->code_list;
        $config_obs_array = $this->config_obs_array;
        $lag = $this->lag;
        
        
        //$proc_first_event = true;
        //print_r($this->config_obs_array);
        
        for ($i = 0; $i < count($this->config_obs_array); $i++) {
            
            // 考慮到同一時間點可能有多個事件，所以$events是複數
            $events = $this->config_obs_array[$i];
            
            //先處理_n跟_breaks
            if (count($events) === 0) {
                $breaks++;
                $last_event = FALSE;
                continue;
            }
            
            if ($config_repeatable === FALSE) {
                if ($last_event !== $event) {
                    $n++;
                }
            }
            else {
                $n++;
            }

            $ns_plus = false;
            for ($j = 0; $j < count($events); $j++)
            {
                $event = $events[$j];
                //檢查加入code list

                if ($config_codes == '' && in_array($event, $code_list) == FALSE) {
                    $code_list[] = $event;
                }

                //初始化code f
                if (isset($code_f[$event]) === FALSE) {
                    $code_f[$event] = 0;
                }

                //計算編碼頻率_code_f
                if ($config_repeatable === FALSE) {
                    if ($last_event !== $event) {
                        $code_f[$event]++;
                    }
                }
                else {
                    $code_f[$event]++;
                }

                $last_event = $event;

                $next_event = array();
                $break_detect = FALSE;
                // 20160721-1626 整理到這裡

                // 如果實際上的數目小於$lag，則很快停止計算
                if ($i < count($config_obs_array) - ($lag - 1)) {
                    for ($l = 0; $l < $lag - 1; $l++) {
                        $pos = $l + $i + 1;
                        $n_event = $config_obs_array[$pos];

                        if (count($n_event) > 0) {
                            $next_event[] = $n_event;
                        }
                        else {
                            $break_detect = true;
                            break;
                        }
                    } //for (var _l = 0; _l < _lag - 1; _l++)
                    if ($break_detect === TRUE) {
                        continue;
                    }
                } // if (_i < _config_obs_array.length - (_lag - 1))

                //接下來要組成不同的數列
                $seq_array = array();
                if (count($next_event) > 0) {
                    $seq_array = array($event);
                    $seq_name;
                    for ($ni = 0; $ni < count($next_event); $ni++) {
                        $n_event = $next_event[$ni];

                        $prev_seq = $seq_array;
                        $seq_array = array();
                        for ($e = 0; $e < count($n_event); $e++) {
                            $event = $n_event[$e];
                            for ($p = 0; $p < count($prev_seq); $p++) {
                                $p_seq = $prev_seq[$p];
                                $last_p_seq = substr($p_seq, count($p_seq)-1, 1);

                                //判斷是否是_repeatable
                                if ($last_p_seq == $event) {
//                                    if ($config_repeatable == 'auto') {
//                                        $this->repeatable = true;
//                                    }
                                    if ($config_repeatable === FALSE) {
                                        continue;
                                    }
                                }

                                $seq_name = $p_seq . $event;
                                $seq_array[] = $seq_name;
                            }
                        } //for (var _e = 0; _e < _n_event.length; _e++)
                    } //for (var _ni = 0; _ni < _next_event.length; _ni++)
                } 

                if (count($seq_array) > 0 && $break_detect === FALSE) {
                    if ($ns_plus === false) {
                        $ns++;
                        $ns_plus = true;    
                    }

                    $seq_f_last = null;
                    foreach ($seq_array AS $s => $seq_name) {
                        //var _seq_name = _seq_array[_s];
                        if (isset($seq_f[$seq_name]) === false) {
                            $seq_f[$seq_name] = 0;
                        }

                        //重複的阻止設計
                        if ($config_repeatable === FALSE
                                && $seq_name == $seq_f_last) {
                           continue;
                        }
                        else {
                            $seq_f_last = $seq_name;
                        }

                        // 加入序列中
                        $seq_f[$seq_name]++;
                        
                        $this->calc_position_frequency($seq_name);
                    }   
                }
            }     //for (var _j = 0; _j < _events.length; _j++)      
        }    //for (var _i = 0; _i < _config_obs_array.length; _i++)
        
        
        $this->n = $n;
        $this->ns = $ns;
        $this->breaks = $breaks;
        
        $this->seq_f = $seq_f;
        $this->code_list = $code_list;
        $this->code_f = $code_f;
    }
    
    var $position_frequency = array();
    
    function calc_position_frequency($seq_name) {
        for ($i = 0; $i < strlen($seq_name); $i++) {
            $code = substr($seq_name, $i, 1);
            if (isset($this->position_frequency[$code]) === FALSE) {
                $this->position_frequency[$code] = array();
            }
            if (isset($this->position_frequency[$code][$i]) === FALSE) {
                $this->position_frequency[$code][$i] = 0;
            }
            $this->position_frequency[$code][$i]++;
            //echo $code.$i . "-";
        }
    }
    
    function calc_code_list_string() {
        
        // 顯示編碼列表
        $code_list_string = '';
        foreach ($this->code_list AS $c) {
            if ($code_list_string !== '') {
                $code_list_string .= ', ';
            }
            $code_list_string += $c;
        }

        //_code_list_div.find('span').html(_code_list_string);
        $this->code_list_string = $code_list_string;
    }

    /**
     * 建立標籤列表
     * 20160722 1445 開始整理-整理完畢
     */
    function create_lag_list($lag, $lag_list = NULL) {
        if ($lag_list === NULL) {
            $lag_list = $this->code_list;
        }

        $new_lag_list = array();

        foreach ($lag_list AS $lag_name) {
            //var _lag_name = _lag_list[_i];

            foreach ($lag_list AS $code) {
                $name = $lag_name . $code;
                $new_lag_list[] = $name;
            }
        }

        $new_lag = $lag - 1;
        if ($new_lag > 1) {
            $lag_list = $this->create_lag_list($new_lag, $new_lag_list);
        }
        else {
            return $lag_list;
        }
        
        $this->lag_list = $lag_list;
    }
    
    function create_martix_lag_list($name = "") {
        if (strlen($name) === ($this->lag - 1)) {
            $this->lag_list[] = $name;
        }
        else {
            foreach ($this->code_list AS $code) {
                $new_name = $name . $code;
                //echo $name . "-";
                $this->create_martix_lag_list($new_name);
            }
        }
    }
    
    var $col_total = array();
    
    /**
     * 計算序列頻率
     */
    function cal_sf_total() {
        
        $seq_f = $this->seq_f;
        //print_r($this->lag_list);
        foreach ($this->code_list AS $i => $row_code)
        {
            $sf_total = 0;

            $sf_table =  array();
            
            foreach ($this->lag_list AS $col_code) {
                $seq_name = $row_code . $col_code;

                $sf = 0;

                if (isset($seq_f[$seq_name]) && is_int($seq_f[$seq_name])) {
                    $sf = $seq_f[$seq_name];
                }
                
                if (isset($this->col_total[$col_code]) === false) {
                    $this->col_total[$col_code] = 0;                    
                }
                $this->col_total[$col_code] = $this->col_total[$col_code] + $sf;
                //echo $row_code;

                //if ($sf === 0) {
                //   $sf = "0";
                //}
                

                $sf_table[$col_code] = $sf;
                $sf_total = intval($sf) + intval($sf_total);
            }
            
            

            //if ($sf_total === 0) {
            //    $sf_total = '0';
            //}

            //$('<td class="sf-total"></td>').html(_sf_total).appendTo(_row_tr);
            //$this->sf_total[$row_code] = $sf_total;
            $sf_table["total"] = $sf_total;
            $this->sf[$row_code] = $sf_table;
        }
        $this->sf["col_total"] = $this->col_total;
    }

/**
 * 繪製編碼轉換機率表
 * $this->pos_list
 * 20160722 1408 資料
 */
function create_obs_seq_pos_table() {
    
    //var _table = _f_table.clone();
    
    //_table.find('caption').html('編碼轉換機率表');
    
    //var _tr_list = _table.find('tbody tr');
    //for (var _i = 0; _i < _tr_list.length; _i++)
    foreach ($this->sf AS $row_code => $row)
    {
        if ($row_code === "col_total") {
            continue;
        }
        
        //var _tr = _tr_list.eq(_i);
        //var _sf_total = parseInt(_tr.find('.sf-total').html());
        $sf_total = $row['total'];
        //if (isNaN(_sf_total)) {
        if (is_int($sf_total) === FALSE) {
            $sf_total = 0;
        }
        
        if ($sf_total === 0) {
            //_tr.find('td').html('0.00');
        }
        else
        {
            //var _td_list = _tr.find('td');
            //$list = array();

            //for (var _j = 0; _j < _td_list.length; _j++)
            $pos_list = array();
            foreach ($row AS $j => $f) {
                if ($j === "total") {
                    continue;
                }

                //var _f = parseInt(_td_list.eq(_j).html());

                //if (isNaN(_f))
                //    _f = 0;
                
                //var _pos = (_f / _sf_total).toFixed(2);
                $pos = ($f / $sf_total);
                
                //_td_list.eq(_j).html(_pos);
                $pos_list[$j] = $pos;
            }
            $this->pos_list[$row_code] = $pos_list;
        }
    }
    
    //return _table;
} 

/**
 * 編碼頻率與機率表
 * 20160722 1420 開始整理
 */
function create_obs_f_table() {
    
    $sf_pos_list = array();

    $code_f = $this->code_f;
    $n = $this->n;
    
    foreach ($this->code_list AS $row_code) {
        
        $cf = 0;
        if (isset($code_f[$row_code]) && is_int($code_f[$row_code])) {
            $cf = $code_f[$row_code];
        }

        $sf_pos_list[$row_code]["sf"] = $cf;
        $sf_pos_list[$row_code]["pos"] = ($cf / $n);
    }
    $this->sf_pos_list = $sf_pos_list;
}

/**
 * First-Order Model Expect Position Table
 * 編碼轉換期望機率表(first-order model)
 * 20160722 1435 開始整理
 */
function create_exp_pos_1_table() {

    $exp_table = array();
    $code_f = $this->code_f;
    $n = $this->n;

    foreach ($this->code_list AS $row_code) {
        
        $cf = 0;
        if (isset($code_f[$row_code]) && is_int($code_f[$row_code])) {
            $cf = $code_f[$row_code];
        }
        
        $exp_row = array();
        
        foreach ($this->lag_list AS $j => $col_code) {

            //var _col_code = _lag_list[_j];

            $row_code_f = $cf;
            $exp_pos = $cf / $n;
            
            for ($k = 0; $k < strlen($col_code); $k++) {

                $col_c = substr($col_code, $k, 1);
                
                $f = 0;
                if (isset($code_f[$col_c]) && is_int($code_f[$col_c])) {
                    $f = $code_f[$col_c];
                }
                    
                $p = 0;
                if ($this->repeatable === TRUE) {
                    $p = $f / $n;
                }
                else {
                    $p = $f / ($n - $row_code_f);
                }
                
//                if ($row_code === "P" && $col_code === "G") {
//                    print_r(array($row_code_f, $n, $f));
//                }
                
                $exp_pos = $exp_pos * $p;
            }
            
            $exp_row[$col_code] = $exp_pos;
        }

        $exp_table[$row_code] = $exp_row;
    }
    
    $this->exp_pos_table = $exp_table;
    
}   //  function create_exp_pos_1_table($n, $code_list, $code_f, $repeatable, $lag, $lag_list) {

/**
 * 編碼轉換期望機率表(zero-order model)
 * $this->exp_table = $exp_table;
 * 20160722 1456 整理完畢
 * @deprecated since version 20160725 不使用了
 */
function create_exp_pos_0_table() {
    
    //$n = $this->n; 
    $code_list = $this->code_list; 
    $code_f = $this->code_f; 
    //$repeatable = $this->repeatable; 
    $lag = $this->lag; 
    $lag_list = $this->lag_list;
    
    
    //print_r($code_list);
//    $exp_pos = (1 / count($code_list));
//
//    for ($i = 0; $i < $lag - 1; $i++) {
//        $exp_pos = $exp_pos * $exp_pos;
//    }
    // 20160723 修正zero-order的算法
    $exp_pos = 1 / (count($code_list) * (count($code_list) - 1) );
    
    $exp_table = array();
    foreach ($code_list AS $i => $row_code) {
        $cf = 0;

        if (is_int($code_f[$row_code])) {
            $cf = $code_f[$row_code];
        }
        
        $exp_row = array();
        //for (var _j in _lag_list) {
        foreach ($lag_list AS $j => $col_code ) {
            $exp_row[$col_code] = $exp_pos;
            //var _td = $('<td></td>').attr("exp_pos", _exp_pos).html(_exp_pos.toFixed(2)).appendTo(_row_tr);
        }
        $exp_table[$row_code] = $exp_row;
    }
    $this->exp_pos_table = $exp_table;
    
    //return _table;
}

/**
 * 編碼轉換期望頻率表
 * var $exp_f_table;    //編碼轉換期望頻率表
 * 20160722 1552 整理完成
 * @deprecated since version 20160725 不採用，因為期望值計算方式結合了
 */
function create_exp_f_table() {
    
    //var _exp_f_table = _exp_pos_table.clone();
    //_exp_f_table.find('caption').html('編碼轉換期望頻率表');
    
    //var _td_list = _exp_f_table.find('td');
    $exp_f_table = $this->exp_pos_table;
    $ns = $this->ns;
    
    //for ($i = 0; $i < count($td_list); $i++) {
    foreach ($exp_f_table AS $row_code => $row) {
        //var _exp_pos = _td_list.eq(_i).attr("exp_pos");
        foreach ($row AS $col_code => $exp_pos) {
            if (is_float($exp_pos) === FALSE) {
                continue;
            }
            else {
                $exp_f = $exp_pos * $ns;
                $exp_f_table[$row_code][$col_code] = $exp_f;
            }
        }
    }
    //return _exp_f_table;
    $this->exp_f_table = $exp_f_table;
}


/**
 * 建議最少編碼轉換樣本數量表
 * (其實可以省略啦)
 * 20160722 1553 開始整理 - 整理完成
 * var $last_ns_table; //建議最少編碼轉換樣本數量表
 * @deprecated since version 20160725 不使用
 */
function create_last_ns_table() {

    $last_ns_table = $this->exp_pos_table;
    $ns = $this->ns;
    //_table.find('caption').html('建議最少編碼轉換樣本數量表');
    
    //var _td_list = _table.find('td');
    
    $max_ns = 0;
    //for (var _i = 0; _i < _td_list.length; _i++)
    foreach ($last_ns_table AS $row_code => $row) {

        foreach ($row AS $col_code => $exp_pos) {
            //var _exp_pos = _td_list.eq(_i).attr('exp_pos');
            //_exp_pos = parseFloat(_exp_pos);
                
            //if (isNaN(_exp_pos))
            //    continue;
            if (is_float($exp_pos) === FALSE) {
                continue;
            }
            else if ($exp_pos > 0) {   

                $last_ns = 9 / ($exp_pos * (1 - $exp_pos));
                
                $last_ns_dis = $last_ns;
                
                $last_ns_table[$row_code][$col_code] = $last_ns_dis;
                
                $max_ns = $last_ns;
            }
            else {
                $last_ns_table[$row_code][$col_code] = NULL;
            }
        }
    }
    if ($ns < $max_ns) {
        //_tfoot = $('<tfoot><tr><td colspan="'+_cols+'" style="color:red;">&#8251; 目前您的樣本數為'+_ns+'&#65292;未達建議最少個編碼轉換樣本數'+_max_ns+'個</td></tr></tfoot>')
        $this->last_ns_message = '目前您的樣本數為' . $ns . '&#65292;未達建議最少個編碼轉換樣本數' . $max_ns . '個';
    }
    else {
        //_tfoot = $('<tfoot><tr><td colspan="'+_cols+'">&#8251; 目前您的樣本數為'+_ns+'&#65292;足夠建議最少個編碼轉換序列樣本數'+_max_ns+'個</td></tr></tfoot>')
        $this->last_ns_message = '目前您的樣本數為' . $ns . '&#65292;足夠建議最少個編碼轉換序列樣本數' . $max_ns . '個';
    }
    
    //_tfoot.appendTo(_table);
    
    //return _table;
    $this->last_ns_table = $last_ns_table;
}

    function sa_create_temp_obs() {
        $temp = 'ABBDC(CA)ABCB(DB)CBBB(BC)DDBCBCBCBBDBCDB BCBBDBCBAABCDDBCBAABAAABBBAA BDBABABBBCBBDBDBBCDBCABBDCCAABCBDBCBBBBCDDBCBCBCBBDBCDB BCBBDBCBAABCDDBCBAABAAABBBAA BDBABABBBCBBDBDBBCDBCABBDCCAABCBDBCBBBBCDDBCBCBCBBDBCDB BCBBDBCBAABCDDBCBAABAAABBBAA BDBABABBBCBBDBDBBCDBCABBDCCAABCBDBCBBBBCDDBCBCBCBBDBCDB BCBBDBCBAABCDDBCBAABAAABBBAA BDBABABBBCBBDBDBBCDBCABBDCCAABCBDBCBBBBCDDBCBCBCBBDBCDB BCBBDBCBAABCDDBCBAABAAABBBAA BDBABABBBCBBDBDBBCDBCABBDCCAABCBDBCBBBBCDDBCBCBCBBDBCDB BCBBDBCBAABCDDBCBAABAAABBBAA BDBABABBBCBBDBDBBCDBCABBDCCAABCBDBCBBBBCDDBCBCBCBBDBCDB BCBBDBCBAABCDDBCBAABAAABBBAA BDBABABBBCBBDBDBBCDBCABBDCCAABCBDBCBBBBCDDBCBCBCBBDBCDB BCBBDBCBAABCDDBCBAABAAABBBAA BDBABABBBCBBDBDBBCDBCABBDCCAABCBDBCBBBBCDDBCBCBCBBDBCDB BCBBDBCBAABCDDBCBAABAAABBBAA BDBABABBBCBBDBDBBCDBCABBDCCAABCBDBCBBBBCDDBCBCBCBBDBCDB BCBBDBCBAABCDDBCBAABAAABBBAA BDBABABBBCBBDBDBBCDBCABBDCCAABCBDBCBBBBCDDBCBCBCBBDBCDB BCBBDBCBAABCDDBCBAABAAABBBAA BDBABABBBCBBDBDBBCDBCABBDCCAABCBDBCBBBBCDDBCBCBCBBDBCDB BCBBDBCBAABCDDBCBAABAAABBBAA BDBABABBBCBBDBDBBCDBCABBDCCAABCBDBCBBBBCDDBCBCBCBBDBCDB BCBBDBCBAABCDDBCBAABAAABBBAA BDBABABBBCBBDBDBBCDBCABBDCCAABCBDBCBBBBCDDBCBCBCBBDBCDB BCBBDBCBAABCDDBCBAABAAABBBAA BDBABABBBCBBDBDBBCDBCABBDCCAABCBDBCBBBBCDDBCBCBCBBDBCDB BCBBDBCBAABCDDBCBAABAAABBBAA BDBABABBBCBBDBDBBCDBCABBDCCAABCBDBCBBBBCDDBCBCBCBBDBCDB BCBBDBCBAABCDDBCBAABAAABBBAA BDBABABBBCBBDBDBBCDBCABBDCCAABCBDBCBBBBCDDBCBCBCBBDBCDB BCBBDBCBAABCDDBCBAABAAABBBAA BDBABABBBCBBDBDBBCDBCABBDCCAABCBDBCBBBBCDDBCBCBCBBDBCDB BCBBDBCBAABCDDBCBAABAAABBBAA BDBABABBBCBBDBDBBCDBCABBDCCAABCBDBCBBBBCDDBCBCBCBBDBCDB BCBBDBCBAABCDDBCBAABAAABBBAA BDBABABBBCBBDBDBBCDBCABBDCCAABCBDBCBBBBCDDBCBCBCBBDBCDB BCBBDBCBAABCDDBCBAABAAABBBAA BDBABABBBCBBDBDBBCDBCABBDCCAABCBDBCBBBBCDDBCBCBCBBDBCDB BCBBDBCBAABCDDBCBAABAAABBBAA BDBABABBBCBBDBDBBCDBCABBDCCAABCBDBCBBBBCDDBCBCBCBBDBCDB BCBBDBCBAABCDDBCBAABAAABBBAA BDBABABBBCBBDBDBBCDBCABBDCCAABCBDBCBBBBCDDBCBCBCBBDBCDB BCBBDBCBAABCDDBCBAABAAABBBAA BDBABABBBCBBDBDBBCDBCABBDCCAABCBDBCBBBBCDDBCBCBCBBDBCDB BCBBDBCBAABCDDBCBAABAAABBBAA BDBABABBBCBBDBDBBCDBCABBDCCAABCBDBCBBBBCDDBCBCBCBBDBCDB BCBBDBCBAABCDDBCBAABAAABBBAA BDBABABBBCBBDBDBBCDBCABBDCCAABCBDBCBBBBCDDBCBCBCBBDBCDB BCBBDBCBAABCDDBCBAABAAABBBAA BDBABABBBCBBDBDBBCDBCABBDCCAABCBDBCBBBBCDDBCBCBCBBDBCDB BCBBDBCBAABCDDBCBAABAAABBBAA BDBABABBBCBBDBDBBCDBCABBDCCAABCBDBCBBBBCDDBCBCBCBBDBCDB BCBBDBCBAABCDDBCBAABAAABBBAA BDBABABBBCBBDBDBBCDBCABBDCCAABCBDBCBBBBCDDBCBCBCBBDBCDB BCBBDBCBAABCDDBCBAABAAABBBAA BDBABABBBCBBDBDBBCDBCABBDCCAABCBDBCBBBBCDDBCBCBCBBDBCDB BCBBDBCBAABCDDBCBAABAAABBBAA BDBABABBBCBBDBDBBCDBC';
        return $temp;
    }
    
    function sa_create_temp_obs2() {
        $temp = 'USPTPTPGTPTGTPGTGPTPGTGPSTPTGTSPGPSUSTPTGTUTSPGPSGTPTGPGSUSTUTSPSGTPTGPGSUSTUTSPSGTPTGPGUSUTUPUGSTSPSGTPTGPGUSUTUPUGSTSPSGTPTGPG';
        return $temp;
    }
    
    /**
     * @deprecated 20160725 不採用，因為z-score的計算方式不一樣了
     */
    /*
    function cal_exp_pos_list() {
        
        $first_order = $this->first_order;
        $code_list = $this->code_list; 
        $lag = $this->lag;

        //var _exp_pos_list = [];
        $exp_pos_list = array();

        if ($first_order === TRUE) {

            //var _exp_pos_td_list = _exp_pos_table.find('td:not(.sf-total)');
            $exp_pos_table = $this->exp_pos_table;

            foreach ($exp_pos_table AS $row_code => $row) {
                foreach ($row AS $col_code => $pos) {
                    if (is_float($pos) === false) {
                        $pos = 0;
                    }
                    $exp_pos_list[$row_code][$col_code] = $pos;
                }
            }
        } 
        else {
            $exp_pos = (1 / count($code_list));
            for ($i = 0; $i < $lag - 1; $i++) {
                $exp_pos = $exp_pos * $exp_pos;
            }

            foreach ($this->exp_pos_table AS $row_code => $row) {
                foreach ($row AS $col_code => $pos) {
                    $exp_pos_list[$row_code][$col_code] = $exp_pos;
                }
            }
        }

        // 注意，列表被我改成table了
        $this->exp_pos_list = $exp_pos_list;
    }   // function cal_exp_pos_list() {
    */
    function cal_sign_result() {
        
        $this->cal_z_score_zero_order();
        $this->cal_z_score_code_frequencies();
        $this->cal_z_score_joint_frequency();
        //$this->cal_z_score_transitional_probability();
        $this->cal_z_score_allison_liker();
        //$this->cal_z_score_allison_liker2();
        
    }
    
    /**
     * 平均編碼出現頻率
     * Zero-order Model
     */
    function cal_z_score_zero_order() {
        $code_list = $this->code_list;
        $code_f = $this->code_f;
        $lag_list = $this->lag_list;
        $seq_f = $this->seq_f;
        $ns = $this->ns;
        
        $sign_result = array();    //有顯著結果的列表

        $z_table = array();

        foreach ($code_list AS $row_code) {

            $cf = 0;
            if (isset($code_f[$row_code]) && is_int($code_f[$row_code])) {
                $cf = $code_f[$row_code];
            }

            $z_row = array();
            foreach ($lag_list AS $col_code) {

                //var _col_code = _code_list[_j];

                $seq_name = $row_code . $col_code;

                $sf = 0;

                if (isset($seq_f[$seq_name]) && is_int($seq_f[$seq_name])) {
                    $sf = $seq_f[$seq_name];
                }

                $exp_pos = 1 / ((count($this->code_list) * (count($this->code_list) - 1)));
                //echo $exp_pos;
                
                $z = ($sf - ($ns * $exp_pos)) / sqrt($ns * $exp_pos * ( 1 - $exp_pos) );

//                if (is_float($z) === FALSE) {
//                    $z = 0;
//                }

                $z_row[$col_code] = $z;

                if ($z > 1.96) {
                    //_td.addClass('sign');

                    $sign_result[$seq_name] = $z;
                }   

                //_e++;
            }
            $z_table[$row_code] = $z_row;
        }
        
        $this->z_table["zero_order"] = $z_table;

        $this->sign_result["zero_order"] = $sign_result;
    }
    
    /**
     * 單看編碼出現頻率
     * First-order Model
     */
    function cal_z_score_code_frequencies() {
        $code_list = $this->code_list;
        $code_f = $this->code_f;
        $lag_list = $this->lag_list;
        $seq_f = $this->seq_f;
        $ns = $this->ns;
        
        $sign_result = array();    //有顯著結果的列表

        $z_table = array();

        foreach ($code_list AS $row_code) {

            $cf = 0;
            if (isset($code_f[$row_code]) && is_int($code_f[$row_code])) {
                $cf = $code_f[$row_code];
            }

            $z_row = array();
            foreach ($lag_list AS $col_code) {
                //echo $row_code . "-" . $col_code . "|";

                //var _col_code = _code_list[_j];

                $seq_name = $row_code . $col_code;

                $sf = 0;

                if (isset($seq_f[$seq_name]) && is_int($seq_f[$seq_name])) {
                    $sf = $seq_f[$seq_name];
                }

                //$exp_pos = $this->exp_pos_list[$row_code][$col_code];
                // p -> g
                //$pp = 0;
                //if (isset($this->sf[$row_code]) && isset($this->sf[$row_code]["total"])) {
                //    $pp = $this->sf[$row_code]["total"] / $this->ns;
                //}
                $pp = ($this->code_f[$row_code] / $this->ns);
                //echo $pp . "+";
                
                $exp_pos = $this->_calc_prop_targets($col_code, $row_code, TRUE, $pp);
         
//                if (isset($this->sf[$col_code]) && $this->sf[$col_code]["total"]) {
//                    $fg = $this->sf[$col_code]["total"];
//                }
//                if ($row_code === "P" && $col_code === "G") {
//                    echo $exp_pos . "!!!";
//                }
//                //$fg = $this->sf["col_total"][$col_code];
//                
//                
//                if ($this->repeatable === true) {
//                    $exp_pos = $pp * ($fg / $this->ns);
//                }
//                else {
//                    $exp_pos = $pp * ($fg / ($this->ns - $this->sf[$row_code]["total"]));
//                }
                
                
                //echo $pp."-".$fg . "|";
                
                
                
                if ($ns * $exp_pos * ( 1 - $exp_pos) > 0) {
                    $z = ($sf - ($ns * $exp_pos)) / sqrt($ns * $exp_pos * ( 1 - $exp_pos) );
                    //echo $z;
                    // 正確解答 P->G: 0.71371376594677
                }
                else {
                    $z = 0;
                }

//                if (is_float($z) === FALSE) {
//                    $z = 0;
//                }

                $z_row[$col_code] = $z;

                if ($z > 1.96) {
                    //_td.addClass('sign');

                    $sign_result[$seq_name] = $z;
                }   

                //_e++;
            }
            $z_table[$row_code] = $z_row;
        }
        
        $this->z_table["code_frequencies"] = $z_table;

        $this->sign_result["code_frequencies"] = $sign_result;
    }
    
    function cal_z_score_joint_frequency() {
        $code_list = $this->code_list;
        $code_f = $this->code_f;
        $lag_list = $this->lag_list;
        $seq_f = $this->seq_f;
        $ns = $this->ns;
        
        $sign_result = array();    //有顯著結果的列表

        $z_table = array();

        foreach ($code_list AS $row_code) {

            $cf = 0;
            if (isset($code_f[$row_code]) && is_int($code_f[$row_code])) {
                $cf = $code_f[$row_code];
            }

            $z_row = array();
            foreach ($lag_list AS $col_code) {

                //var _col_code = _code_list[_j];

                $seq_name = $row_code . $col_code;

                $sf = 0;

                if (isset($seq_f[$seq_name]) && is_int($seq_f[$seq_name])) {
                    $sf = $seq_f[$seq_name];
                }

                //$exp_pos = $this->exp_pos_list[$row_code][$col_code];
//                $fg = $this->sf["col_total"][$col_code];
//                
//                if ($this->repeatable === true) {
//                    $pg = ($fg / $this->ns);
//                }
//                else {
//                    $pg = ($fg / ($this->ns - $this->sf[$row_code]['total']) );
//                }
                $pg = $this->_calc_prop_targets($col_code, $row_code);
                
                //$fp = $this->sf[$row_code]['total'];
                $fp = $this->code_f[$row_code];
                //$exp_pos = ($fp / $this->ns) * $pg;
                
                if (($fp * $pg * ( 1 - $pg)) > 0) {
                    $z = ($sf - ($fp * $pg)) / sqrt($fp * $pg * ( 1 - $pg) );
                    
                    // 正確解答： P->G: 0.67193684090529
                }
                else {
                    $z = 0;
                }
                
//                if ($row_code === "P" && $col_code === "G") {
//                    echo "----" . (10 - (30*0.278) ) / sqrt( 30 * 0.278 * (1-0.278) ) . "---";
//                    echo "---" . (10 - (30*0.27835051546392 ) ) / sqrt( 30 * 0.27835051546392  * (1-0.27835051546392 )) . "---";
//                    print_r(array("聯合頻率算法:
//joint_frequency", $sf, $fp, $pg, $fp, $this->ns, $z));
//                }

//                if (is_float($z) === FALSE) {
//                    $z = 0;
//                }

                $z_row[$col_code] = $z;

                if ($z > 1.96) {
                    //_td.addClass('sign');

                    $sign_result[$seq_name] = $z;
                }   

                //_e++;
            }
            $z_table[$row_code] = $z_row;
        }
        
        $this->z_table["joint_frequency"] = $z_table;

        $this->sign_result["joint_frequency"] = $sign_result;
    }
    
    function _calc_prop_targets($col_code, $row_code, $pos_first = FALSE, $prop = 1) {
        //echo $col_code."+";
        for ($i = 0; $i < strlen($col_code); $i++) {
            $code = substr($col_code, $i, 1);
            $prev_code = $row_code;
            if ($i > 0) {
                $prev_code = substr($col_code, ($i-1), 1);
            }

            $fg = 0;
            $p = 0;
            
            if ($pos_first === FALSE) {
                $p = $i+1;
                if (isset($this->position_frequency[$code][($p)])) {
                    $fg = $this->position_frequency[$code][($p)];
                }
            }
            else {
                $fg = $this->code_f[$code];
            }
            
//            if ($pos_first === FALSE) {
//                $p = $i+1;
//            }
//            if (isset($this->position_frequency[$code][($p)])) {
//                $fg = $this->position_frequency[$code][($p)];
//            }
                
//            if ($row_code === "P" && $col_code === "G" && $pos_first === TRUE) {
//                echo $fg . "+" . $p . "---";
//            }
            
            if ($this->repeatable === true) {
                $prop = $prop * ($fg / $this->ns);
            }
            else {
                //$prop = $prop * ($fg / ($this->ns - $this->sf[$prev_code]["total"]));
                $prop = $prop * ($fg / ($this->ns - $this->code_f[$prev_code]));
            }
        }
        return $prop;
    } 
    
    /**
     * @deprecated since version 20160725 等同於joint_frequency
     */
    function cal_z_score_transitional_probability() {
        $code_list = $this->code_list;
        $code_f = $this->code_f;
        $lag_list = $this->lag_list;
        $seq_f = $this->seq_f;
        $ns = $this->ns;
        
        $sign_result = array();    //有顯著結果的列表

        $z_table = array();

        foreach ($code_list AS $row_code) {

            $cf = 0;
            if (isset($code_f[$row_code]) && is_int($code_f[$row_code])) {
                $cf = $code_f[$row_code];
            }

            $z_row = array();
            foreach ($lag_list AS $col_code) {

                //var _col_code = _code_list[_j];

                $seq_name = $row_code . $col_code;

                $sf = 0;

                if (isset($seq_f[$seq_name]) && is_int($seq_f[$seq_name])) {
                    $sf = $seq_f[$seq_name];
                }

                //$exp_pos = $this->exp_pos_list[$row_code][$col_code];
                if ($this->repeatable === true) {
                    $pg = ($this->sf["col_total"][$col_code] / $this->ns);
                }
                else {
                    $pg = ($this->sf["col_total"][$col_code] / ($this->ns - $this->sf[$row_code]['total']) );
                }
                $fp = $this->sf[$row_code]['total'];
                $pp = ($fp / $this->ns);
                $exp_pos = $pp * $pg;
                
                $pgp = 0;
                if ($fp > 0) {
                    $pgp = ($sf / $fp);
                }
                
                if ($pg > 0 && $pp > 0 && ($pg * (1-$pg)) / (($this->ns) * $pp) > 0) {
                    $z = ($pgp - $pg) / sqrt(($pg * (1-$pg)) / (($this->ns) * $pp) );
                }
                else {
                    $z = 0;
                }
//                if ($row_code === "P" && $col_code === "G") {
//                    echo "----" . ((0.333 - 0.278 ) / sqrt( (0.278 * (1 - 0.278)) / (127*0.236) )) . "---";
//                    echo "----" . ((0.33333333333333  - 0.27835051546392 ) / sqrt( (0.27835051546392  * (1 - 0.27835051546392)) / (127*0.23622047244094 ) )) . "---";
//                    print_r(array($pgp, $pg, $this->ns, $pp, $z));
//                }

                $z_row[$col_code] = $z;

                if ($z > 1.96) {
                    //_td.addClass('sign');

                    $sign_result[$seq_name] = $z;
                }   

                //_e++;
            }
            $z_table[$row_code] = $z_row;
        }
        
        $this->z_table["transitional_probability"] = $z_table;

        $this->sign_result["transitional_probability"] = $sign_result;
    }
    
    function cal_z_score_allison_liker() {
        $code_list = $this->code_list;
        $code_f = $this->code_f;
        $lag_list = $this->lag_list;
        $seq_f = $this->seq_f;
        $ns = $this->ns;
        
        $sign_result = array();    //有顯著結果的列表

        $z_table = array();

        foreach ($code_list AS $row_code) {

            $cf = 0;
            if (isset($code_f[$row_code]) && is_int($code_f[$row_code])) {
                $cf = $code_f[$row_code];
            }

            $z_row = array();
            foreach ($lag_list AS $col_code) {

                //var _col_code = _code_list[_j];

                $seq_name = $row_code . $col_code;

                $sf = 0;

                if (isset($seq_f[$seq_name]) && is_int($seq_f[$seq_name])) {
                    $sf = $seq_f[$seq_name];
                }
                
                $fpg = $sf;

                //$exp_pos = $this->exp_pos_list[$row_code][$col_code];
                $fp = $this->sf[$row_code]['total'];
                
//                $fg = $this->sf["col_total"][$col_code];
//                if ($this->repeatable === true) {
//                    $pg = ($fg / $this->ns);
//                }
//                else {
//                    $pg = ($fg / ($this->ns - $fp) );
//                }
                $pg = $this->_calc_prop_targets($col_code, $row_code);
                
                $pp = ($fp / $this->ns);
                //$pt = $pp;
                //$exp_pos = $pp * $pg;
                
                
                if (( $fp * $pg * (1-$pg) * (1-$pp) ) > 0) {
                    $z = ($fpg - ($fp * $pg)) / sqrt( $fp * $pg * (1-$pg) * (1-$pp) );
                    
                    // 正確解答：P->G: 0.76885500628616
                }
                else {
                    $z = 0;
                }
                //if ($row_code === "P" && $col_code === "G") {
                    //echo (10 - (30*0.278) ) / sqrt( 30 * 0.278 * (1-0.278) * (1-0.236) ) . '-------';
                    //echo (10 - (30*0.27835051546392 ) ) / sqrt( 30 * 0.27835051546392  * (1-0.27835051546392 ) * (1-0.23622047244094 ) ) . '-------';
                //    print_r(array($fpg, $fp, $pg, $fg, $pg, $pg, $pp, $z));
                //}

//                if (is_float($z) === FALSE) {
//                    $z = 0;
//                }

                $z_row[$col_code] = $z;

                if ($z > 1.96) {
                    //_td.addClass('sign');

                    $sign_result[$seq_name] = $z;
                }   

                //_e++;
            }
            $z_table[$row_code] = $z_row;
        }
        
        $this->z_table["allison_liker"] = $z_table;

        $this->sign_result["allison_liker"] = $sign_result;
    }
    
    /**
     * @deprecated since version 20160725 等同於allison liker
     */
    function cal_z_score_allison_liker2() {
        $code_list = $this->code_list;
        $code_f = $this->code_f;
        $lag_list = $this->lag_list;
        $seq_f = $this->seq_f;
        $ns = $this->ns;
        
        $sign_result = array();    //有顯著結果的列表

        $z_table = array();

        foreach ($code_list AS $row_code) {

            $cf = 0;

            if (is_int($code_f[$row_code])) {
                $cf = $code_f[$row_code];
            }

            $z_row = array();
            foreach ($lag_list AS $col_code) {

                //var _col_code = _code_list[_j];

                $seq_name = $row_code . $col_code;

                $sf = 0;

                if (isset($seq_f[$seq_name]) && is_int($seq_f[$seq_name])) {
                    $sf = $seq_f[$seq_name];
                }
                $fpg = $sf;

                //$exp_pos = $this->exp_pos_list[$row_code][$col_code];
                $fg = $this->sf["col_total"][$col_code];
                $fp = $this->sf[$row_code]['total'];
                if ($this->repeatable === true) {
                    $pg = ($fg / $this->ns);
                }
                else {
                    $pg = ($fg / ($this->ns - $fp) );
                }
                
                $pp = ($fp / $this->ns);
                //$pt = $pp;
                //$exp_pos = $pp * $pg;
                
                
                //$z = ($fpg - ($fp * $pg)) / sqrt( $fp * $pg * (1-$pg) * (1-$pp) );
                $pgp = ($sf / $fp);
                
                $z = ($pgp - $pg) / sqrt( ($pg * (1-$pg) * (1-$pp)) / ($this->ns * $pp) ) ;
                //if ($row_code === "P" && $col_code === "G") {
                //    print_r(array($fpg, $fp, $pg, $fg, $pg, $pg, $pp, $z));
                //}

//                if (is_float($z) === FALSE) {
//                    $z = 0;
//                }

                $z_row[$col_code] = $z;

                if ($z > 1.96) {
                    //_td.addClass('sign');

                    $sign_result[$seq_name] = $z;
                }   

                //_e++;
            }
            $z_table[$row_code] = $z_row;
        }
        
        $this->z_table["allison_liker2"] = $z_table;

        $this->sign_result["allison_liker2"] = $sign_result;
    }
    
    /**
     * 輸出顯著的序列轉換結果
     * 
     * $sa->export_sign_result("allison_liker")
     * @param {String|NULL} $target_model
     * @return array
     */
    function export_sign_result($target_model = NULL) {
        $export = array();
        
        foreach ($this->sign_result AS $model => $results) {
            if (count($results) > 0) {
                $ary = array();
                foreach ($results AS $seq => $z) {
                    $ary[] = array(
                        "source" => substr($seq, 0, 1),
                        "target" => substr($seq, 1, 1),
                        "value" => $z,
                        "label" => round($z, 2)
                    );
                }
                $export[$model] = $ary;
            }
        }
        
        if (is_null($target_model) === FALSE) {
            if (isset($export[$target_model])) {
                $export = $export[$target_model];
            }
            else {
                $export = array();
            }
        }
        
        return $export;
    }

    /**
     * 描繪表格
     * @param {string} $table
     * @return string
     */
    static function table_draw($table, $show_sig = FALSE) {
        $html = '<table border="1">';
        
        $thead_th = array();
        
        $first_tr = true;
        $tbody = "<tbody>";
        foreach ($table AS $row_code => $row) {
            
            $tr = "<tr>";
            $tr .= "<th>" . $row_code . "</th>";
            
            if (is_array($row)) {
                foreach ($row AS $col_code => $cell) {
                    if ($first_tr === TRUE) {
                        $thead_th[] = $col_code;
                    }

                    if ($show_sig === TRUE && $cell > 1.96) {
                        $tr .= "<td style='color:red;'>" . $cell . "</td>";
                    }
                    else {
                        $tr .= "<td>" . $cell . "</td>";
                    }
                }
            }
            else {
                $cell = $row;
                if ($show_sig === TRUE && $cell > 1.96) {
                    $tr .= "<td style='color:red;'>" . $cell . "</td>";
                }
                else {
                    $tr .= "<td>" . $cell . "</td>";
                }
            }
            $tr .= "</tr>";
            $tbody .= $tr;
            $first_tr = false;
        }
        $tbody .= "</tbody>";
        
        $thead = "<thead><th>&nbsp;</th>";
        foreach ($thead_th AS $th) {
            $thead .= "<th>" . $th . "</th>";
        }
        $thead .= "</thead>";
        
        $html .= $thead . $tbody . "</table>";
        return $html;
    }
    
    
    
}   //  class sa {