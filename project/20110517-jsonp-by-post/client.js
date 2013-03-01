/**
 * Initialize Form
 */
$(function () {
    
    $("#form").submit(function () {
        
        if ($(this).attr("jsonp_by_post") == null)
        {
            $.jsonp_by_post(this, function (_result) {
                $("#output").html("Message: " + _result);
            });
            return false;
        }
        
    });
    
});

$.jsonp_by_post = function (_form_ele, _callback) {
    
    var _timestamp = (new Date()).getTime();
    
    var _form_obj = $(_form_ele);
    
    var _action = _form_obj.attr("action");
    var _action_post = _action + "?timestamp=" + _timestamp;
    
    //建立接收資料的iframe
    var _iframe_name = _action + _timestamp;
    
    var _iframe_obj = $('<iframe></iframe>')
        .attr('name', _iframe_name)
        .appendTo($('body'));
        
    //隱藏iframe
    _iframe_obj.css('width', '0').css('height', '0')
        .css('position', 'absolute').css('left', '-1000px').css('top', '-1000px');
    
    //調整傳送資料的form
    _form_obj.attr('action', _action_post)
        .attr('target', _iframe_name)
        .attr('method', 'post')
        .attr('enctype', 'multipart/form-data');
    
    //防止重複觸發初始化的事件
    _form_obj.attr('jsonp_by_post', 'true');
        
    //設定iframe讀取完畢之後的動作
    
    _iframe_obj.load(function () {
        
        //設定get方法JSONP的網址，要注意加入了JSONP特有的callback參數
        var _action_get = _action + "?timestamp=" + _timestamp 
            + "&callback=?";
          
        $.getJSON(_action_get, function (_result) {
            
            //復原form
            _form_obj.attr('action', _action)
                .removeAttr('target')
                .removeAttr('jsonp_by_post');
            
            //移除iframe
            _iframe_obj.remove();
            
            _callback(_result);
        });
        
    });
    
    //執行遞交
    _form_obj.submit();
};
