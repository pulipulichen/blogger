<?php

class sa {
    
    var $n;  // 編碼次數
    var $ns;     // 序列次數
    var $breaks; //片段次數
    var $repeatable;    // 可否重複
    
    var $code_list_string;  // 編碼列表
    var $sf = array();  //編碼轉換頻率表 sequence frequency
    var $pos_list = array();    // 編碼轉換機率表
    var $sf_pos_list = array();    // 編碼頻率與機率表
    var $exp_pos_table; // 編碼轉換期望機率表(first-order model)
    var $exp_f_table;    //編碼轉換期望頻率表

    var $last_ns_table; //建議最少編碼轉換樣本數量表
    var $last_ns_message;   //建議最少編碼轉換樣本數量表 訊息

    var $exp_pos_list;  // 期望值列表...?

    var $sign_result;   // 有顯著結果的列表

    function sa_create_temp_obs() {
        $temp = 'ABBDC(CA)ABCB(DB)CBBB(BC)DDBCBCBCBBDBCDB BCBBDBCBAABCDDBCBAABAAABBBAA BDBABABBBCBBDBDBBCDBCABBDCCAABCBDBCBBBBCDDBCBCBCBBDBCDB BCBBDBCBAABCDDBCBAABAAABBBAA BDBABABBBCBBDBDBBCDBCABBDCCAABCBDBCBBBBCDDBCBCBCBBDBCDB BCBBDBCBAABCDDBCBAABAAABBBAA BDBABABBBCBBDBDBBCDBCABBDCCAABCBDBCBBBBCDDBCBCBCBBDBCDB BCBBDBCBAABCDDBCBAABAAABBBAA BDBABABBBCBBDBDBBCDBCABBDCCAABCBDBCBBBBCDDBCBCBCBBDBCDB BCBBDBCBAABCDDBCBAABAAABBBAA BDBABABBBCBBDBDBBCDBCABBDCCAABCBDBCBBBBCDDBCBCBCBBDBCDB BCBBDBCBAABCDDBCBAABAAABBBAA BDBABABBBCBBDBDBBCDBCABBDCCAABCBDBCBBBBCDDBCBCBCBBDBCDB BCBBDBCBAABCDDBCBAABAAABBBAA BDBABABBBCBBDBDBBCDBCABBDCCAABCBDBCBBBBCDDBCBCBCBBDBCDB BCBBDBCBAABCDDBCBAABAAABBBAA BDBABABBBCBBDBDBBCDBCABBDCCAABCBDBCBBBBCDDBCBCBCBBDBCDB BCBBDBCBAABCDDBCBAABAAABBBAA BDBABABBBCBBDBDBBCDBCABBDCCAABCBDBCBBBBCDDBCBCBCBBDBCDB BCBBDBCBAABCDDBCBAABAAABBBAA BDBABABBBCBBDBDBBCDBCABBDCCAABCBDBCBBBBCDDBCBCBCBBDBCDB BCBBDBCBAABCDDBCBAABAAABBBAA BDBABABBBCBBDBDBBCDBCABBDCCAABCBDBCBBBBCDDBCBCBCBBDBCDB BCBBDBCBAABCDDBCBAABAAABBBAA BDBABABBBCBBDBDBBCDBCABBDCCAABCBDBCBBBBCDDBCBCBCBBDBCDB BCBBDBCBAABCDDBCBAABAAABBBAA BDBABABBBCBBDBDBBCDBCABBDCCAABCBDBCBBBBCDDBCBCBCBBDBCDB BCBBDBCBAABCDDBCBAABAAABBBAA BDBABABBBCBBDBDBBCDBCABBDCCAABCBDBCBBBBCDDBCBCBCBBDBCDB BCBBDBCBAABCDDBCBAABAAABBBAA BDBABABBBCBBDBDBBCDBCABBDCCAABCBDBCBBBBCDDBCBCBCBBDBCDB BCBBDBCBAABCDDBCBAABAAABBBAA BDBABABBBCBBDBDBBCDBCABBDCCAABCBDBCBBBBCDDBCBCBCBBDBCDB BCBBDBCBAABCDDBCBAABAAABBBAA BDBABABBBCBBDBDBBCDBCABBDCCAABCBDBCBBBBCDDBCBCBCBBDBCDB BCBBDBCBAABCDDBCBAABAAABBBAA BDBABABBBCBBDBDBBCDBCABBDCCAABCBDBCBBBBCDDBCBCBCBBDBCDB BCBBDBCBAABCDDBCBAABAAABBBAA BDBABABBBCBBDBDBBCDBCABBDCCAABCBDBCBBBBCDDBCBCBCBBDBCDB BCBBDBCBAABCDDBCBAABAAABBBAA BDBABABBBCBBDBDBBCDBCABBDCCAABCBDBCBBBBCDDBCBCBCBBDBCDB BCBBDBCBAABCDDBCBAABAAABBBAA BDBABABBBCBBDBDBBCDBCABBDCCAABCBDBCBBBBCDDBCBCBCBBDBCDB BCBBDBCBAABCDDBCBAABAAABBBAA BDBABABBBCBBDBDBBCDBCABBDCCAABCBDBCBBBBCDDBCBCBCBBDBCDB BCBBDBCBAABCDDBCBAABAAABBBAA BDBABABBBCBBDBDBBCDBCABBDCCAABCBDBCBBBBCDDBCBCBCBBDBCDB BCBBDBCBAABCDDBCBAABAAABBBAA BDBABABBBCBBDBDBBCDBCABBDCCAABCBDBCBBBBCDDBCBCBCBBDBCDB BCBBDBCBAABCDDBCBAABAAABBBAA BDBABABBBCBBDBDBBCDBCABBDCCAABCBDBCBBBBCDDBCBCBCBBDBCDB BCBBDBCBAABCDDBCBAABAAABBBAA BDBABABBBCBBDBDBBCDBCABBDCCAABCBDBCBBBBCDDBCBCBCBBDBCDB BCBBDBCBAABCDDBCBAABAAABBBAA BDBABABBBCBBDBDBBCDBCABBDCCAABCBDBCBBBBCDDBCBCBCBBDBCDB BCBBDBCBAABCDDBCBAABAAABBBAA BDBABABBBCBBDBDBBCDBCABBDCCAABCBDBCBBBBCDDBCBCBCBBDBCDB BCBBDBCBAABCDDBCBAABAAABBBAA BDBABABBBCBBDBDBBCDBCABBDCCAABCBDBCBBBBCDDBCBCBCBBDBCDB BCBBDBCBAABCDDBCBAABAAABBBAA BDBABABBBCBBDBDBBCDBC';
        return $temp;
    }
    
/**
 * @var $obs 觀察序列
 * @var $codes 觀察編碼
 * @var $repeatable 可否重複
 */
function __construct($obs, $codes = "", $repeatable = 'false', $first_order = FALSE, $lag = 2)
{   
    $n = 0;    //總coding次數
    $ns = 0;   //序列次數
    $breaks = 1;    //斷片次數
    
    $code_list = [];    //包含的coding
    $code_f = [];    //頻率
    $seq_f = [];    //每種序列發生的頻率
    
    //取得參數
    $config_obs = $obs;
    if ($config_obs === '') {
        return;
    }
    
    $config_codes = $codes;
    $config_repeatable = $repeatable;
    
    //var _first_order = $;
    //var _lag = $.trim($('.sa-config [name="lag"]').attr('value'));
    
    //設定code
    if ($config_codes != '') {
        //var _last_code = null;
        for ($i = 0; $i < strlen($config_codes); $i++)
        {
            $code = substr($config_codes, _i, 1);
   
            $code_list[] = _code;
            $code_f[$code] = 0;
        }
    }
    
    $config_obs_array = $this->sa_convert_obs($config_obs);
    
    //開始跑所有的觀察樣本
    $last_event = null;
    for ($i = 0; $i < count($config_obs_array); $i++)
    {
        $events = $config_obs_array[$i];
        //先處理_n跟_breaks
        if (count($events) > 0)
        {
            if ($config_repeatable === 'false')
            {
                if ($last_event != $event)
                {
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
                if ($config_repeatable === 'false') {
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
                
                if ($i < count($config_obs_array) - ($lag - 1)) {
                    for ($l = 0; $l < $lag - 1; $l++) {
                        $pos = $l + $i + 1;
                        $n_event = $config_obs_array[$pos];
                        
                        if ($n_event.length > 0) {
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
                                    if ($config_repeatable == 'auto') {
                                        $repeatable = true;
                                    }
                                    else if ($config_repeatable === 'false') {
                                        continue;
                                    }
                                }
                                
                                $seq_name = $p_seq + $event;
                                $seq_array[] = $seq_name;
                            }
                        } //for (var _e = 0; _e < _n_event.length; _e++)
                    } //for (var _ni = 0; _ni < _next_event.length; _ni++)
                } 
                
                if (count($seq_array) > 0 && $break_detect === false) {
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
                        if ($config_repeatable === 'false'
                                && $seq_name == $seq_f_last) {
                           continue;
                        }
                        else {
                            $seq_f_last = $seq_name;
                        }

                        $seq_f[$seq_name]++;
                    }   
                }
            }     //for (var _j = 0; _j < _events.length; _j++)       
        }    //if (_events.length > 0)
        else {

            $breaks++;

        }
    }    //for (var _i = 0; _i < _config_obs_array.length; _i++)
    
    $this->sa_draw_table($n, $ns, $breaks, $code_list, $code_f, $seq_f, $repeatable, $first_order, $lag);
}   //end of function sa_start(

function sa_convert_obs($obs) {
    
    $output = array();
    
    $break_list = array(' ', '\t', '\n');
    
    for ($i = 0; $i < strlen(_obs); $i++) {
        $code = substr(obs, $i, 1);
        
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
            $output[] = array(_code);
        }
    }
    return $output;
}   // end of function sa_convert_obs(
// 16:48 整理到這裡

function sa_draw_table($n, $ns, $breaks, $code_list, $code_f, $seq_f, $repeatable, $first_order, $lag) {
    
    //var _sa_result = $('.sa-result:first');
    
    //_sa_result.empty();
    
    $sa_result = "";
    $sa_result = '<div><hr /><h4>結果輸出&#65306;</h4></div>';
    
    $this->n = $n;
    //$sa_result = '<div>編碼次數&#65306;' . $n . '</div>';
    $this->ns = $ns;
    //$sa_result = '<div>序列次數&#65306;' . $ns . '</div>';
    $this->breaks = $breaks;
    //$sa_result = '<div>片段次數&#65306;' . $breaks . '</div>';
    
    $sa_result = '<div>編碼列表&#65306;<span></span></div>';
    
    // 顯示編碼列表
    //$code_list_div = $(').appendTo(_sa_result);
    $code_list_string = '';
    foreach ($code_list AS $i => $c) {
        if ($code_list_string !== '') {
            $code_list_string .= ', ';
        }
        $code_list_string += $c;
    }
    
    //_code_list_div.find('span').html(_code_list_string);
    $this->code_list_string = $code_list_string;
    
    
    $this->repeatable = $repeatable;
    
    // 20160721 整理到這裡
    //-----------------
    
    // 畫表格，不必理會
    //var _f_table = $('<div class="sa-div"><table align="center" border="1" cellpadding="5" class="sa-table sa-result"><caption>編碼轉換頻率表</caption><thead></thead><tbody></tbody></table></div>')
    //    .appendTo(_sa_result);
    
    //var _f_thead = _f_table.find('thead:first');
    //var _f_thead_tr = $('<tr></tr>').appendTo(_f_thead);
    //$('<th>&nbsp;</th>').appendTo(_f_thead_tr);
    
    
    $lag_list = $this->create_lag_list($code_list, $lag);
    
    //foreach ($lag_list AS $i => $code)
    //{
        //var _code = _lag_list[_i];
        
        //$('<th></th>')
        //    .html(_code)
        //    .appendTo(_f_thead_tr);
    //}
    //$('<th>轉換頻率</th>').appendTo(_f_thead_tr);
    //$('<th>期望機率</th>').appendTo(_f_thead_tr);
    
        
    //var _f_tbody = _f_table.find('tbody:first');

    foreach ($code_list AS $i => $row_code)
    {
        //var _row_code = _code_list[_i];
        
        //var _row_tr = $('<tr><th>' + _row_code + '</th></tr>').appendTo(_f_tbody);
        
        $sf_total = 0;
        
        //for (var _j in _lag_list)
        $sf = array();
        foreach ($lag_list AS $j => $col_code)
        {
            //var _col_code = _lag_list[_j];
            
            //var _seq_name = _row_code + _col_code;
            $seq_name = $row_code . $col_code;

            //var _sf = 0;
            $sf = 0;

            //if (typeof(_seq_f[_seq_name]) == 'number') {
            //    _sf = _seq_f[_seq_name];
            //}
            if (is_int($seq_f[$seq_name])) {
                $sf = $seq_f[$seq_name];
            }
            
            if ($sf === 0) {
               $sf = "0";
            }

            //$('<td></td>').html(_sf).appendTo(_row_tr);
            $sf[$col_code] = $sf;
            //_sf_total = parseInt(_sf) + parseInt(_sf_total);
            $sf_total = intval($sf) + intval($sf_total);
        }

        
        //if (_sf_total == 0) {
        //    _sf_total = '0';
        //}
        if ($sf_total === 0) {
            $sf_total = '0';
        }
        
        //$('<td class="sf-total"></td>').html(_sf_total).appendTo(_row_tr);
        $this->sf_total[$row_code] = $sf_total;
        $sf["total"] = $sf_total
        $this->sf[$row_code] = $sf;

        /*
        var _cf = 0;
        if (typeof(_code_f[_row_code]) == 'number')
            _cf = _code_f[_row_code];
        $('<td></td>').html(_cf).appendTo(_row_tr);
        
        var _exp_pos = _cf / _n;
        $('<td></td>').html(_exp_pos).appendTo(_row_tr);
        */
    }
    
    // 只是畫表格而已，不使用
    //create_obs_seq_pos_table(_f_table).appendTo(_sa_result);    
    $this->create_obs_seq_pos_table();
    
    // 20160722 1356 整理到這裡
    // -------------------------------------

    //var _exp_pos_table;
    //if (_first_order == true) {
    if ($first_order === TRUE) {
        //var _obs_f_table = create_obs_f_table(_n, _code_list, _code_f).appendTo(_sa_result);
        $this->create_obs_f_table($n, $code_list, $code_f);
        
        //_exp_pos_table = create_exp_pos_1_table(_n, _code_list, _code_f, _repeatable, _lag, _lag_list).appendTo(_sa_result);
        $this->create_exp_pos_1_table($n, $code_list, $code_f, $repeatable, $lag, $lag_list);
    }
    else
    {
        //_exp_pos_table = create_exp_pos_0_table(_n, _code_list, _code_f, _repeatable, _lag, _lag_list).appendTo(_sa_result);
        $this->create_exp_pos_0_table($n, $code_list, $code_f, $repeatable, $lag, $lag_list);
    }

    // 20160722 1419 整理到這裡
    // --------------------------------------------
    // 20160722 1457 開始繼續整理

    //$this->create_exp_f_table(_exp_pos_table, _ns).appendTo(_sa_result);
    //$this->create_last_ns_table(_exp_pos_table, _ns, _code_list).appendTo(_sa_result);
    $this->create_exp_f_table($exp_pos_table, $ns);
    $this->create_last_ns_table($exp_pos_table, $ns, $code_list);

    // 20160722 1610 繼續整理
    // --------------------------------------------
    
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

        /*
        for ($i = 0; _i < _exp_pos_td_list.length; _i++)
        {
            var _td = _exp_pos_td_list.eq(_i);
            
            var _pos = parseFloat(_td.attr("exp_pos"));
            if (isNaN(_pos)) {
                _pos = 0;
            }
            
            _exp_pos_list.push(_pos);
        }
        */
    } 
    else
    {
        $exp_pos = (1 / count($code_list));
        for ($i = 0; $i < $lag - 1; $i++) {
            $exp_pos = $exp_pos * $exp_pos;
        }
        
        //for ($j = 0; $j < (count($lag_list) * count($code_list)); $j++) {
        //    $exp_pos_list[] = $exp_pos;
        //}
        foreach ($exp_pos_table AS $row_code => $row) {
            foreach ($row AS $col_code => $pos) {
                $exp_pos_list[$row_code][$col_code] = $exp_pos;
            }
        }
    }

    // 注意，列表被我改成table了
    $this->exp_pos_list = $exp_pos_list;
    
    // 20160722 1623 整理到這裡
    // -------------------------------------
    
    //var _z_table = $('<div class="sa-div"><table align="center" border="1" cellpadding="5" class="sa-table sa-result"><caption>調整後殘差表(Z分數)</caption><thead></thead><tbody></tbody></table></div>')
    //    .appendTo(_sa_result);
    
    //var _z_thead = _z_table.find('thead:first');
    //var _z_thead_tr = $('<tr></tr>').appendTo(_z_thead);
    //$('<td>&nbsp;</td>').appendTo(_z_thead_tr);
    //for (var _i in _lag_list)
    //{
    //    var _code = _lag_list[_i];
    //    
    //    $('<th></th>')
    //        .html(_code)
    //        .appendTo(_z_thead_tr);
    //}
        
    //var _z_tbody = _z_table.find('tbody:first');
    
    $sign_result = array();    //有顯著結果的列表
    
    //$e = 0;

    $z_table = array();
    
    foreach ($code_list AS $i => $row_code) {

        //var _row_code = _code_list[_i];
        
        //var _row_tr = $('<tr><th>' + _row_code + '</th></tr>').appendTo(_z_tbody);
        
        $cf = 0;

        if (is_int($code_f[$row_code])) {
            $cf = $code_f[$row_code];
        }
        
        $z_row = array();
        foreach ($lag_list AS $j => $col_code) {

            //var _col_code = _code_list[_j];
            
            $seq_name = $row_code . $col_code;

            $sf = 0;

            if (is_int($seq_f[$seq_name])) {
                $sf = $seq_f[$seq_name];
            }
            
            $exp_pos = $exp_pos_list[$row_code][$col_code];
            
            $z = ($sf - ($ns * $exp_pos)) / sqrt($ns * $exp_pos * ( 1 - $exp_pos) );
            
            if (is_float($z) === FALSE) {
                $z = 0;
            }
                
            //_z = _z.toFixed(2);
            
            
            //var _td = $('<td></td>').html('z: '+ _z + 'ns:' + _ns+ 'exp_f:' + (_ns*_exp_pos) + 'exp: ' + _exp_pos+ 'row: ' + _row_code_pos+ 'col: ' + _col_code_pos).appendTo(_row_tr);
            //var _td = $('<td></td>').html(_z).appendTo(_row_tr);
            $z_row[$col_code] = $z;
            
            if ($z > 1.96)
            {
                //_td.addClass('sign');
                
                $sign_result[$seq_name] = _z;
            }   
            
            //_e++;
        }
        $z_table[$row_code] = $z_row;
    }
    
    $this->sign_result = $sign_result;

    //----------------------------------------------------------
    
    /*
    var _sign_result_div = $('<div>顯著編碼轉換&#65306;<ul></ul></div>').appendTo(_sa_result);
    var _sign_result_ul = _sign_result_div.find('ul:first'); 
    var _has_sign_result = false;
    for (var _seq_name in _sign_result)
    {
        _has_sign_result = true;
        
        var _z = _sign_result[_seq_name];
        
        var _seq_name_list = _seq_name.split('');
        var _seq_name_dir = _seq_name_list.join('->');
        
        var _li = $('<li></li>').appendTo(_sign_result_ul);
        
        _li.html(_seq_name_dir + ' : ' + _z);
    }
    
    if (_has_sign_result == false)
    {
        $('<li></li>').html('沒有任何編碼轉換達到顯著&#12290;').appendTo(_sign_result_ul);
    }
    */
}

/**
 * 建立標籤列表
 * 20160722 1445 開始整理-整理完畢
 */
function create_lag_list($code_list, $lag, $lag_list)
{
    if ($lag_list === NULL) {
        $lag_list = $code_list;
    }
    
    if ($lag < 3) {
        return $lag_list;
    }
    else {
        $new_lag_list = array();
        
        foreach ($lag_list AS $i => $lag_name) {
            //var _lag_name = _lag_list[_i];
            
            foreach ($code_list AS $c => $code) {
                $name = $lag_name + $code;
                $new_lag_list[] = $name;
            }
        }
        
        $new_lag = $lag - 1;
        $lag_list = $this->create_lag_list($code_list, $new_lag, $new_lag_list);
    }
    return $lag_list;
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
        //var _tr = _tr_list.eq(_i);
        //var _sf_total = parseInt(_tr.find('.sf-total').html());
        $sf_total = $row[$total];
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
function create_obs_f_table($n, $code_list, $code_f) {
    
    //var _table = $('<div class="sa-div"><table align="center" border="1" cellpadding="5" class="sa-table sa-result"><caption>編碼頻率與機率表</caption><thead></thead><tbody></tbody></table></div>');
    
    //var _thead = _table.find('thead:first');
    //var _thead_tr = $('<tr></tr>').appendTo(_thead);
    //$('<th>&nbsp;</th>').appendTo(_thead_tr);
    //$('<th>頻率</th>').appendTo(_thead_tr);
    //$('<th>機率(=頻率/'+_n+')</th>').appendTo(_thead_tr);
    
    $sf_pos_list = array();

    //var _tbody = _table.find('tbody:first');
    //for (var _i in _code_list) {
    foreach ($code_list AS $i > $row_code) {
        //var _row_code = _code_list[_i];
        
        //var _row_tr = $('<tr><th>' + _row_code + '</th></tr>').appendTo(_tbody);
        
        $cf = 0;
        if (is_int($code_f[$row_code])) {
            $cf = $code_f[$row_code];
        }

        $sf_pos_list[$row_code]["sf"] = $cf;
        //$('<td></td>').html(_cf).appendTo(_row_tr);

        $sf_pos_list[$row_code]["pos"] = ($cf / $n);
        //$('<td></td>').html((_cf / _n)).appendTo(_row_tr);
    }
    $this->sf_pos_list = $sf_pos_list;
    
    //return _table;
}

/**
 * First-Order Model Expect Position Table
 * 編碼轉換期望機率表(first-order model)
 * 20160722 1435 開始整理
 */
function create_exp_pos_1_table($n, $code_list, $code_f, $repeatable, $lag, $lag_list) {
    
    //var _table = $('<div class="sa-div"><table align="center" border="1" cellpadding="5" class="sa-table sa-result"><caption>編碼轉換期望機率表(first-order model)</caption><thead></thead><tbody></tbody></table></div>');
    
    /*
    var _thead = _table.find('thead:first');
    var _thead_tr = $('<tr></tr>').appendTo(_thead);
    $('<th>&nbsp;</th>').appendTo(_thead_tr);
    for (var _i in _lag_list)
    {
        var _code = _lag_list[_i];
        
        $('<th></th>')
            .html(_code)
            .appendTo(_thead_tr);
    }
    */
        
    //var _tbody = _table.find('tbody:first');
    $exp_table = array();

    //for (var _i in _code_list)
    foreach ($code_list AS $i => $row_code) {
        
        //var _row_code = _code_list[_i];
        
        //var _row_tr = $('<tr><th>' + _row_code + '</th></tr>').appendTo(_tbody);
        
        $cf = 0;
        if (is_int($code_f[$row_code])) {
            $cf = $code_f[$row_code];
        }
        
        $exp_row = array();
        //for (var _j in _lag_list)
        foreach ($lag_list AS $j => $col_code) {

            //var _col_code = _lag_list[_j];

            $row_code_f = $cf;
            $exp_pos = $cf / $n;
            
            for ($k = 0; $k < strlen(col_code); $k++) {

                $col_c = substr($col_code, $k, 1);
                
                $f = 0;
                if (is_int($code_f[$col_c])) {
                    $f = $code_f[$col_c];
                }
                    
                $p;
                if ($repeatable === TRUE) {
                    $p = $f / $n;
                }
                else {
                    $p = $f / ($n - $row_code_f);
                }
                
                $exp_pos = $exp_pos * $p;
            }
            
            //var _td = $('<td></td>').attr("exp_pos", _exp_pos).html(_exp_pos.toFixed(2)).appendTo(_row_tr);
            $exp_row[$col_code] = $exp_pos;
        }

        $exp_table[$row_code] = $exp_row;
    }
    
    $this->exp_pos_table = $exp_table;
    //return _table;
}   //  function create_exp_pos_1_table($n, $code_list, $code_f, $repeatable, $lag, $lag_list) {

/**
 * 編碼轉換期望機率表(zero-order model)
 * $this->exp_table = $exp_table;
 * 20160722 1456 整理完畢
 */
function create_exp_pos_0_table($n, $code_list, $code_f, $repeatable, $lag, $lag_list) {
    
    $exp_pos = (1 / count($code_list));

    for ($i = 0; $i < $lag - 1; $i++) {
        $exp_pos = $exp_pos * $exp_pos;
    }
    
    //var _table = $('<div class="sa-div"><table align="center" border="1" cellpadding="5" class="sa-table sa-result"><caption>編碼轉換期望機率表(zero-order model)</caption><thead></thead><tbody></tbody></table></div>');
    
    /*
    var _thead = _table.find('thead:first');
    var _thead_tr = $('<tr></tr>').appendTo(_thead);
    $('<th>&nbsp;</th>').appendTo(_thead_tr);
    for (var _i in _lag_list)
    {
        var _code = _lag_list[_i];
        
        $('<th></th>')
            .html(_code)
            .appendTo(_thead_tr);
    }
        
    var _tbody = _table.find('tbody:first');
    */

    //for (var _i in _code_list)
    $exp_table = array();
    foreach ($code_list AS $i => $row_code) {
        //var _row_code = _code_list[_i];
        
        //var _row_tr = $('<tr><th>' + _row_code + '</th></tr>').appendTo(_tbody);
        
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
 */
function create_exp_f_table($exp_pos_table, $ns) {
    
    //var _exp_f_table = _exp_pos_table.clone();
    //_exp_f_table.find('caption').html('編碼轉換期望頻率表');
    
    //var _td_list = _exp_f_table.find('td');
    $exp_f_table = $this->exp_table;
    
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
 */
function create_last_ns_table($exp_pos_table, $ns, $code_list) {

    $last_ns_table = $this->exp_pos_table;
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
                
                //var _last_ns_dis = _last_ns.toFixed(2);
                $last_ns_dis = $last_ns;
                
                //_td_list.eq(_i).html(_last_ns_dis);
                $last_ns_table[$row_code][$col_code] = $last_ns_dis;
                
                // 超越數量有顯著性的特徵 class
                //if ($last_ns > $ns) {
                //    _td_list.eq(_i).addClass('sign');
                //}
                
                //if ($max_ns === 0) {
                //    $max_ns = $last_ns;
                //}
                //else if (_max_ns < _last_ns) {
                //    _max_ns = _last_ns.toFixed(2);
                //}
                $max_ns = $last_ns;
            }
            else
            {
                //_td_list.eq(_i).html('-');
                $last_ns_table[$row_code][$col_code] = NULL;
            }
    }
    
    //var _cols = (_td_list.length / _code_list.length) + 1;
    
    //var _tfoot;
    
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


}   //  class sa {