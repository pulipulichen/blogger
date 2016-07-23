
function sa_create_temp_obs() {
    var _temp = 'ABBDC(CA)ABCB(DB)CBBB(BC)DDBCBCBCBBDBCDB BCBBDBCBAABCDDBCBAABAAABBBAA BDBABABBBCBBDBDBBCDBCABBDCCAABCBDBCBBBBCDDBCBCBCBBDBCDB BCBBDBCBAABCDDBCBAABAAABBBAA BDBABABBBCBBDBDBBCDBCABBDCCAABCBDBCBBBBCDDBCBCBCBBDBCDB BCBBDBCBAABCDDBCBAABAAABBBAA BDBABABBBCBBDBDBBCDBCABBDCCAABCBDBCBBBBCDDBCBCBCBBDBCDB BCBBDBCBAABCDDBCBAABAAABBBAA BDBABABBBCBBDBDBBCDBCABBDCCAABCBDBCBBBBCDDBCBCBCBBDBCDB BCBBDBCBAABCDDBCBAABAAABBBAA BDBABABBBCBBDBDBBCDBCABBDCCAABCBDBCBBBBCDDBCBCBCBBDBCDB BCBBDBCBAABCDDBCBAABAAABBBAA BDBABABBBCBBDBDBBCDBCABBDCCAABCBDBCBBBBCDDBCBCBCBBDBCDB BCBBDBCBAABCDDBCBAABAAABBBAA BDBABABBBCBBDBDBBCDBCABBDCCAABCBDBCBBBBCDDBCBCBCBBDBCDB BCBBDBCBAABCDDBCBAABAAABBBAA BDBABABBBCBBDBDBBCDBCABBDCCAABCBDBCBBBBCDDBCBCBCBBDBCDB BCBBDBCBAABCDDBCBAABAAABBBAA BDBABABBBCBBDBDBBCDBCABBDCCAABCBDBCBBBBCDDBCBCBCBBDBCDB BCBBDBCBAABCDDBCBAABAAABBBAA BDBABABBBCBBDBDBBCDBCABBDCCAABCBDBCBBBBCDDBCBCBCBBDBCDB BCBBDBCBAABCDDBCBAABAAABBBAA BDBABABBBCBBDBDBBCDBCABBDCCAABCBDBCBBBBCDDBCBCBCBBDBCDB BCBBDBCBAABCDDBCBAABAAABBBAA BDBABABBBCBBDBDBBCDBCABBDCCAABCBDBCBBBBCDDBCBCBCBBDBCDB BCBBDBCBAABCDDBCBAABAAABBBAA BDBABABBBCBBDBDBBCDBCABBDCCAABCBDBCBBBBCDDBCBCBCBBDBCDB BCBBDBCBAABCDDBCBAABAAABBBAA BDBABABBBCBBDBDBBCDBCABBDCCAABCBDBCBBBBCDDBCBCBCBBDBCDB BCBBDBCBAABCDDBCBAABAAABBBAA BDBABABBBCBBDBDBBCDBCABBDCCAABCBDBCBBBBCDDBCBCBCBBDBCDB BCBBDBCBAABCDDBCBAABAAABBBAA BDBABABBBCBBDBDBBCDBCABBDCCAABCBDBCBBBBCDDBCBCBCBBDBCDB BCBBDBCBAABCDDBCBAABAAABBBAA BDBABABBBCBBDBDBBCDBCABBDCCAABCBDBCBBBBCDDBCBCBCBBDBCDB BCBBDBCBAABCDDBCBAABAAABBBAA BDBABABBBCBBDBDBBCDBCABBDCCAABCBDBCBBBBCDDBCBCBCBBDBCDB BCBBDBCBAABCDDBCBAABAAABBBAA BDBABABBBCBBDBDBBCDBCABBDCCAABCBDBCBBBBCDDBCBCBCBBDBCDB BCBBDBCBAABCDDBCBAABAAABBBAA BDBABABBBCBBDBDBBCDBCABBDCCAABCBDBCBBBBCDDBCBCBCBBDBCDB BCBBDBCBAABCDDBCBAABAAABBBAA BDBABABBBCBBDBDBBCDBCABBDCCAABCBDBCBBBBCDDBCBCBCBBDBCDB BCBBDBCBAABCDDBCBAABAAABBBAA BDBABABBBCBBDBDBBCDBCABBDCCAABCBDBCBBBBCDDBCBCBCBBDBCDB BCBBDBCBAABCDDBCBAABAAABBBAA BDBABABBBCBBDBDBBCDBCABBDCCAABCBDBCBBBBCDDBCBCBCBBDBCDB BCBBDBCBAABCDDBCBAABAAABBBAA BDBABABBBCBBDBDBBCDBCABBDCCAABCBDBCBBBBCDDBCBCBCBBDBCDB BCBBDBCBAABCDDBCBAABAAABBBAA BDBABABBBCBBDBDBBCDBCABBDCCAABCBDBCBBBBCDDBCBCBCBBDBCDB BCBBDBCBAABCDDBCBAABAAABBBAA BDBABABBBCBBDBDBBCDBCABBDCCAABCBDBCBBBBCDDBCBCBCBBDBCDB BCBBDBCBAABCDDBCBAABAAABBBAA BDBABABBBCBBDBDBBCDBCABBDCCAABCBDBCBBBBCDDBCBCBCBBDBCDB BCBBDBCBAABCDDBCBAABAAABBBAA BDBABABBBCBBDBDBBCDBCABBDCCAABCBDBCBBBBCDDBCBCBCBBDBCDB BCBBDBCBAABCDDBCBAABAAABBBAA BDBABABBBCBBDBDBBCDBCABBDCCAABCBDBCBBBBCDDBCBCBCBBDBCDB BCBBDBCBAABCDDBCBAABAAABBBAA BDBABABBBCBBDBDBBCDBC';
    
    $('.sa-config .obs:first').val(_temp);
}

function sa_start()
{   
    var _n = 0;    //總coding次數
    var _ns = 0;   //序列次數
    var _breaks = 1;    //斷片次數
    
    var _code_list = [];    //包含的coding
    var _code_f = {};    //頻率
    var _seq_f = {};    //每種序列發生的頻率
    
    //取得參數
    var _config_obs = $.trim($('.sa-config .obs').val());
    if (_config_obs == '')
    {
        alert('請輸入觀察樣本&#65281;');
        $('.sa-config .obs').focus();
        return;
    }
    else
    {
        /*
        var _temp = _config_obs.split('\n');
        _config_obs = _temp.join(' ');
        _temp = _config_obs.split('\t');
        _config_obs = _temp.join(' ');
        _temp = _config_obs.split('&#12288;');
        _config_obs = _temp.join(' ');
        */
    }
    
    var _config_codes = $.trim($('.sa-config .codes').val());
    var _config_repeatable = $('.sa-config-form [name="repeatable"]:checked').attr('value');
    var _repeatable = false;
    if (_config_repeatable != 'auto')
        _repeatable = eval(_config_repeatable);
    var _first_order = ($('.sa-config [name="exp_model"]:checked').attr('value') == 'first_order');
    var _lag = $.trim($('.sa-config [name="lag"]').attr('value'));
    if (_lag == '')
    {
        alert('請輸入觀察序列長度&#65281;');
        $('.sa-config [name="lag"]').focus();
        return;
    }
    else
    {
        _lag = parseInt(_lag);
        if (isNaN(_lag))
            _lag = 2;
        
        if (_lag > 3)
        {
            if (window.confirm('觀察序列長度太長的話,運算時間要很久,你確定要這麼做嗎?') == false)
            {
                $('.sa-config [name="lag"]').select();
                return;
            }   
        }
    }
    
    
    //設定code
    if (_config_codes != '')
    {
        //var _last_code = null;
        for (var _i = 0; _i < _config_codes.length; _i++)
        {
            var _code = _config_codes.substr(_i, 1);
   //if (_config_repeatable == 'false'  && _code == _last_code)
            // continue;
   
            _code_list.push(_code);
            _code_f[_code] = 0;
   
   //_last_code = _code;
        }
    }
    
    var _config_obs_array = sa_convert_obs(_config_obs);
    
    //開始跑所有的觀察樣本
    var _event = false;
    var _last_event = true;
    for (var _i = 0; _i < _config_obs_array.length; _i++)
    {
        var _events = _config_obs_array[_i];
        //先處理_n跟_breaks
        if (_events.length > 0)
        {
            if (_config_repeatable == 'false')
            {
                if (_last_event != _event)
                {
                    _n++;
                }
            }
            else
                _n++;
            
            
            var _ns_plus = false;
            for (var _j = 0; _j < _events.length; _j++)
            {
                var _event = _events[_j];
                //檢查加入code list
                
                if (_config_codes == ''                    && $.inArray(_event, _code_list) == -1)
                    _code_list.push(_event);
                   
                //初始化code f
                if (typeof(_code_f[_event]) == 'undefined')
                    _code_f[_event] = 0;
                    
                //計算編碼頻率_code_f
    if (_config_repeatable == 'false')
    {
     if (_last_event != _event)
                    {
                        //alert([_j, _last_event, _event]);
      _code_f[_event]++;
                    }
    }
    else
              _code_f[_event]++;
     
    _last_event = _event;
    
                //_code_f[_event]++;
                
                var _next_event = [];
                var _break_detect = false;
                if (_i < _config_obs_array.length - (_lag - 1))
                {
                    for (var _l = 0; _l < _lag - 1; _l++)
                    {
                        var _pos = _l + _i + 1;
                        var _n_event = _config_obs_array[_pos];
                        
                        if (_n_event.length > 0)
                        {
                            _next_event.push(_n_event);    
                        }
                        else
                        {
                            _break_detect = true;
                            break;
                        }
                    } //for (var _l = 0; _l < _lag - 1; _l++)
                    if (_break_detect == true)
                        continue;
                } // if (_i < _config_obs_array.length - (_lag - 1))
                
                //接下來要組成不同的數列
                var _seq_array = [];
                if (_next_event.length > 0)
                {
                      
                    _seq_array = [_event];
                    var _seq_name;
                    for (var _ni = 0; _ni < _next_event.length; _ni++)
                    {
                        var _n_event = _next_event[_ni];
                        
                        var _prev_seq = _seq_array;
                        _seq_array = [];
                        for (var _e = 0; _e < _n_event.length; _e++)
                        {
                            var _event = _n_event[_e];
                            for (var _p = 0; _p < _prev_seq.length; _p++)
                            {
                                var _p_seq = _prev_seq[_p];
                                var _last_p_seq = _p_seq.substr(_p_seq.length-1, 1);
                                
                                //判斷是否是_repeatable
                                if (_last_p_seq == _event)
                                {
                                    if (_config_repeatable == 'auto')
                                        _repeatable = true;
                                    else if (_config_repeatable == 'false')
                                        continue;
                                }
                                
                                _seq_name = _p_seq + _event;
                                _seq_array.push( _seq_name );
                            }
                        } //for (var _e = 0; _e < _n_event.length; _e++)
                    } //for (var _ni = 0; _ni < _next_event.length; _ni++)
                } 
                
                
                if (_seq_array.length > 0 && _break_detect == false)
                {
                    if (_ns_plus == false)
                    {
                        _ns++;
                        _ns_plus = true;    
                    }

                    var _seq_f_last = null;
                    for (_s in _seq_array)
                    {
                        var _seq_name = _seq_array[_s];
                        if (typeof(_seq_f[_seq_name]) == 'undefined')
                            _seq_f[_seq_name] = 0;

      //重複的阻止設計
                        if (_config_repeatable == 'false'  && _seq_name == _seq_f_last)
                           continue;
      else
       _seq_f_last = _seq_name;

                        _seq_f[_seq_name]++;
                    }   
                }
            }     //for (var _j = 0; _j < _events.length; _j++)       
        }    //if (_events.length > 0)
        else
        {
            _breaks++;
        }
    }    //for (var _i = 0; _i < _config_obs_array.length; _i++)
    
    sa_draw_table(_n, _ns, _breaks, _code_list, _code_f, _seq_f, _repeatable, _first_order, _lag);
}

function sa_convert_obs(_obs) {
    
    var _output = [];
    
    var _break_list = [' ', '\t', '\n'];
    
    for (var _i = 0; _i < _obs.length; _i++)
    {
        var _code = _obs.substr(_i, 1);
        
        if ($.inArray(_code, _break_list) > -1)
        {
            _output.push([]);
        }
        else if (_code == '(')
        {
            var _multi_code = [];
            _i++;
            while (_obs.substr(_i, 1) != ')')
            {
                _code = _obs.substr(_i, 1);
                _multi_code.push(_code);
                _i++; 
            }
            _output.push(_multi_code);
        }
        else
        {
            _output.push([_code]);
        }
    }
    return _output;
    
}

function sa_draw_table(_n, _ns, _breaks, _code_list, _code_f, _seq_f, _repeatable, _first_order, _lag) {
    
    var _sa_result = $('.sa-result:first');
    
    _sa_result.empty();
    
    $('<div><hr /><h4>結果輸出&#65306;</h4></div>').appendTo(_sa_result);
    
    $('<div>編碼次數&#65306;'+_n+'</div>').appendTo(_sa_result);
    $('<div>序列次數&#65306;'+_ns+'</div>').appendTo(_sa_result);
    $('<div>片段次數&#65306;'+_breaks+'</div>').appendTo(_sa_result);
    
    var _code_list_div = $('<div>編碼列表&#65306;<span></span></div>').appendTo(_sa_result);
    var _code_list_string = '';
    for (var _i in _code_list)
    {
        if (_code_list_string != '')
            _code_list_string += ', ';
        _code_list_string += _code_list[_i];
    }
    _code_list_div.find('span').html(_code_list_string);
    
    if (_repeatable == true)
        $('<div>編碼重複&#65306;可</div>').appendTo(_sa_result);
    else
        $('<div>編碼重複&#65306;否</div>').appendTo(_sa_result);
    
    //-----------------
    
    var _f_table = $('<div class="sa-div"><table align="center" border="1" cellpadding="5" class="sa-table sa-result"><caption>編碼轉換頻率表</caption><thead></thead><tbody></tbody></table></div>')
        .appendTo(_sa_result);
    
    var _f_thead = _f_table.find('thead:first');
    var _f_thead_tr = $('<tr></tr>').appendTo(_f_thead);
    $('<th>&nbsp;</th>').appendTo(_f_thead_tr);
    
    
    var _lag_list = create_lag_list(_code_list, _lag);
    
    for (var _i in _lag_list)
    {
        var _code = _lag_list[_i];
        
        $('<th></th>')
            .html(_code)
            .appendTo(_f_thead_tr);
    }
    $('<th>轉換頻率</th>').appendTo(_f_thead_tr);
    //$('<th>期望機率</th>').appendTo(_f_thead_tr);
    
        
    var _f_tbody = _f_table.find('tbody:first');
    for (var _i in _code_list)
    {
        var _row_code = _code_list[_i];
        
        var _row_tr = $('<tr><th>' + _row_code + '</th></tr>').appendTo(_f_tbody);
        
        var _sf_total = 0;
        
        for (var _j in _lag_list)
        {
            var _col_code = _lag_list[_j];
            
            var _seq_name = _row_code + _col_code;
            var _sf = 0;
            if (typeof(_seq_f[_seq_name]) == 'number')
                _sf = _seq_f[_seq_name];
            
     if (_sf == 0)
  _sf = "0";

            $('<td></td>').html(_sf).appendTo(_row_tr);
            _sf_total = parseInt(_sf) + parseInt(_sf_total);
        }
        
        if (_sf_total == 0)
            _sf_total = '0';
        
        $('<td class="sf-total"></td>').html(_sf_total).appendTo(_row_tr);
        
        /*
        var _cf = 0;
        if (typeof(_code_f[_row_code]) == 'number')
            _cf = _code_f[_row_code];
        $('<td></td>').html(_cf).appendTo(_row_tr);
        
        var _exp_pos = _cf / _n;
        $('<td></td>').html(_exp_pos).appendTo(_row_tr);
        */
    }
    
    create_obs_seq_pos_table(_f_table).appendTo(_sa_result);    
    
    // -------------------------------------
    var _exp_pos_table;
    if (_first_order == true)
    {
        var _obs_f_table = create_obs_f_table(_n, _code_list, _code_f).appendTo(_sa_result);
        
        _exp_pos_table = create_exp_pos_1_table(_n, _code_list, _code_f, _repeatable, _lag, _lag_list).appendTo(_sa_result);        
    }
    else
    {
        _exp_pos_table = create_exp_pos_0_table(_n, _code_list, _code_f, _repeatable, _lag, _lag_list).appendTo(_sa_result);
    }
    
    create_exp_f_table(_exp_pos_table, _ns).appendTo(_sa_result);
    create_last_ns_table(_exp_pos_table, _ns, _code_list).appendTo(_sa_result);
    
    var _exp_pos_list = [];
    if (_first_order == true)
    {
        var _exp_pos_td_list = _exp_pos_table.find('td:not(.sf-total)');
        for (var _i = 0; _i < _exp_pos_td_list.length; _i++)
        {
            var _td = _exp_pos_td_list.eq(_i);
            
            var _pos = parseFloat(_td.attr("exp_pos"));
            if (isNaN(_pos))
                _pos = 0;
            
            _exp_pos_list.push(_pos);
        }
    } 
    else
    {
        _exp_pos = (1 / (_code_list.length));
        for (var _i = 0; _i < _lag - 1; _i++)
            _exp_pos = _exp_pos * _exp_pos;
        
        for (var _j = 0; _j < (_lag_list.length * _code_list.length); _j++)
        {
            _exp_pos_list.push(_exp_pos);
        }
    }
    
    // -------------------------------------
    
    var _z_table = $('<div class="sa-div"><table align="center" border="1" cellpadding="5" class="sa-table sa-result"><caption>調整後殘差表(Z分數)</caption><thead></thead><tbody></tbody></table></div>')
        .appendTo(_sa_result);
    
    var _z_thead = _z_table.find('thead:first');
    var _z_thead_tr = $('<tr></tr>').appendTo(_z_thead);
    $('<td>&nbsp;</td>').appendTo(_z_thead_tr);
    for (var _i in _lag_list)
    {
        var _code = _lag_list[_i];
        
        $('<th></th>')
            .html(_code)
            .appendTo(_z_thead_tr);
    }
        
    var _z_tbody = _z_table.find('tbody:first');
    
    
    var _sign_result = {};    //有顯著的結果
    
    var _e = 0;
    
    for (var _i in _code_list)
    {
        var _row_code = _code_list[_i];
        
        var _row_tr = $('<tr><th>' + _row_code + '</th></tr>').appendTo(_z_tbody);
        
        var _cf = 0;
        if (typeof(_code_f[_row_code]) == 'number')
            _cf = _code_f[_row_code];
        
        for (var _j in _lag_list)
        {
            var _col_code = _code_list[_j];
            
            var _seq_name = _row_code + _col_code;
            var _sf = 0;
            if (typeof(_seq_f[_seq_name]) == 'number')
                _sf = _seq_f[_seq_name];
            
            var _exp_pos = _exp_pos_list[_e];
            
            var _z = (_sf - (_ns * _exp_pos)) / Math.sqrt(_ns * _exp_pos * ( 1 - _exp_pos) );
            
            if (isNaN(_z))
                _z = 0;
                
            _z = _z.toFixed(2);
            
            
            //var _td = $('<td></td>').html('z: '+ _z + 'ns:' + _ns+ 'exp_f:' + (_ns*_exp_pos) + 'exp: ' + _exp_pos+ 'row: ' + _row_code_pos+ 'col: ' + _col_code_pos).appendTo(_row_tr);
            var _td = $('<td></td>').html(_z).appendTo(_row_tr);
            
            if (_z > 1.96)
            {
                _td.addClass('sign');
                
                _sign_result[_seq_name] = _z;
            }   
            
            _e++;
        }
    }
    
    
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
}

function create_lag_list(_code_list, _lag, _lag_list)
{
    if (_lag_list == null)
        _lag_list = _code_list;
    
    if (_lag < 3)
        return _lag_list;
    else
    {
        var _new_lag_list = [];
        
        for (var _i in _lag_list)
        {
            var _lag_name = _lag_list[_i];
            
            for (var _c in _code_list)
            {
                var _name = _lag_name + _code_list[_c];
                _new_lag_list.push(_name);
            }
        }
        
        var _new_lag = _lag - 1;
        _lag_list = create_lag_list(_code_list, _new_lag, _new_lag_list);
    }
    return _lag_list;
}

function create_obs_seq_pos_table(_f_table) {
    
    var _table = _f_table.clone();
    
    _table.find('caption').html('編碼轉換機率表');
    
    var _tr_list = _table.find('tbody tr');
    for (var _i = 0; _i < _tr_list.length; _i++)
    {
        var _tr = _tr_list.eq(_i);
        var _sf_total = parseInt(_tr.find('.sf-total').html());
        if (isNaN(_sf_total))
            _sf_total = 0;
        
        if (_sf_total == 0)
        {
            _tr.find('td').html('0.00');
        }
        else
        {
            var _td_list = _tr.find('td');
            for (var _j = 0; _j < _td_list.length; _j++)
            {
                var _f = parseInt(_td_list.eq(_j).html());
                //if (isNaN(_f))
                //    _f = 0;
                var _pos = (_f / _sf_total).toFixed(2);
                _td_list.eq(_j).html(_pos);
            }
        }
    }
    
    return _table;
} 

function create_obs_f_table(_n, _code_list, _code_f) {
    
    var _table = $('<div class="sa-div"><table align="center" border="1" cellpadding="5" class="sa-table sa-result"><caption>編碼頻率與機率表</caption><thead></thead><tbody></tbody></table></div>');
    
    var _thead = _table.find('thead:first');
    var _thead_tr = $('<tr></tr>').appendTo(_thead);
    $('<th>&nbsp;</th>').appendTo(_thead_tr);
    $('<th>頻率</th>').appendTo(_thead_tr);
    $('<th>機率(=頻率/'+_n+')</th>').appendTo(_thead_tr);
        
    var _tbody = _table.find('tbody:first');
    for (var _i in _code_list)
    {
        var _row_code = _code_list[_i];
        
        var _row_tr = $('<tr><th>' + _row_code + '</th></tr>').appendTo(_tbody);
        
        var _cf = 0;
        if (typeof(_code_f[_row_code]) == 'number')
            _cf = _code_f[_row_code];
        
        $('<td></td>').html(_cf).appendTo(_row_tr);
        $('<td></td>').html((_cf / _n)).appendTo(_row_tr);
    }
    
    return _table;
}

function create_exp_pos_1_table(_n, _code_list, _code_f, _repeatable, _lag, _lag_list) {
    
    var _table = $('<div class="sa-div"><table align="center" border="1" cellpadding="5" class="sa-table sa-result"><caption>編碼轉換期望機率表(first-order model)</caption><thead></thead><tbody></tbody></table></div>');
    
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
    for (var _i in _code_list)
    {
        var _row_code = _code_list[_i];
        
        var _row_tr = $('<tr><th>' + _row_code + '</th></tr>').appendTo(_tbody);
        
        var _cf = 0;
        if (typeof(_code_f[_row_code]) == 'number')
            _cf = _code_f[_row_code];
        
        for (var _j in _lag_list)
        {
            var _row_code_f = _cf;
            var _exp_pos = _cf / _n;
            
            var _col_code = _lag_list[_j];
            for (var _k = 0; _k < _col_code.length; _k++)
            {
                var _col_c = _col_code.substr(_k, 1);
                
                var _f = 0;
                if (typeof(_code_f[_col_c]) == 'number')
                    _f = _code_f[_col_c];
                    
                var _p;
                if (_repeatable)
                    _p = _f / _n;
                else
                    _p = _f / (_n - _row_code_f);
                
                _exp_pos = _exp_pos * _p;
            }
            
            var _td = $('<td></td>').attr("exp_pos", _exp_pos).html(_exp_pos.toFixed(2)).appendTo(_row_tr);
        }
    }
    
    return _table;
}

function create_exp_pos_0_table(_n, _code_list, _code_f, _repeatable, _lag, _lag_list) {
    
    var _exp_pos = 1 / ((_code_list.length) * (_code_list.length - 1));
    
    var _table = $('<div class="sa-div"><table align="center" border="1" cellpadding="5" class="sa-table sa-result"><caption>編碼轉換期望機率表(zero-order model)</caption><thead></thead><tbody></tbody></table></div>');
    
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
    for (var _i in _code_list)
    {
        var _row_code = _code_list[_i];
        
        var _row_tr = $('<tr><th>' + _row_code + '</th></tr>').appendTo(_tbody);
        
        var _cf = 0;
        if (typeof(_code_f[_row_code]) == 'number')
            _cf = _code_f[_row_code];
        
        for (var _j in _lag_list)
        {
            var _td = $('<td></td>').attr("exp_pos", _exp_pos).html(_exp_pos.toFixed(2)).appendTo(_row_tr);
        }
    }
    
    return _table;
}

function create_exp_f_table(_exp_pos_table, _ns) {
    
    var _exp_f_table = _exp_pos_table.clone();
    _exp_f_table.find('caption').html('編碼轉換期望頻率表');
    
    var _td_list = _exp_f_table.find('td');
    
    for (var _i = 0; _i < _td_list.length; _i++)
    {
        var _exp_pos = _td_list.eq(_i).attr("exp_pos");
        _exp_pos = parseFloat(_exp_pos);
            
        
        if (isNaN(_exp_pos))
            continue;
        else
        {
            var _exp_f = _exp_pos * _ns;
            _exp_f = _exp_f.toFixed(2);
            _td_list.eq(_i).html(_exp_f);
        }
    }
    return _exp_f_table;
}

function create_last_ns_table(_exp_pos_table, _ns, _code_list)
{
    var _table = _exp_pos_table.clone();
    _table.find('caption').html('建議最少編碼轉換樣本數量表');
    
    var _td_list = _table.find('td');
    
    var _max_ns = 0;
    for (var _i = 0; _i < _td_list.length; _i++)
    {
        var _exp_pos = _td_list.eq(_i).attr('exp_pos');
        _exp_pos = parseFloat(_exp_pos);
            
        if (isNaN(_exp_pos))
            continue;
        else if (_exp_pos > 0)
        {   
            var _last_ns = 9 / (_exp_pos * (1 - _exp_pos));
            
            var _last_ns_dis = _last_ns.toFixed(2);
            
            _td_list.eq(_i).html(_last_ns_dis);
            
            if (_last_ns > _ns)
            {
                _td_list.eq(_i).addClass('sign');
            }
            
            if (_max_ns == 0)
                _max_ns = _last_ns;
            else if (_max_ns < _last_ns)
                _max_ns = _last_ns.toFixed(2);
        }
        else
        {
            _td_list.eq(_i).html('-');
        }
    }
    
    var _cols = (_td_list.length / _code_list.length) + 1;
    
    var _tfoot;
    
    if (_ns < _max_ns)
        _tfoot = $('<tfoot><tr><td colspan="'+_cols+'" style="color:red;">&#8251; 目前您的樣本數為'+_ns+'&#65292;未達建議最少個編碼轉換樣本數'+_max_ns+'個</td></tr></tfoot>')
    else
        _tfoot = $('<tfoot><tr><td colspan="'+_cols+'">&#8251; 目前您的樣本數為'+_ns+'&#65292;足夠建議最少個編碼轉換序列樣本數'+_max_ns+'個</td></tr></tfoot>')
    
    _tfoot.appendTo(_table);
    
    return _table;
}
