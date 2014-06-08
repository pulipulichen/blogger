
var _submitToGoogleTrans = function (_form) {

    try {

    //var _source = $("#source").val();
    var _source = _form.source.value;
    _source = $.trim(_source);
    
    if (_source === "") {
        return false;
    }

    if (_form.replace_fulltype.checked) {
        _source = _googleTransUtils.str_replace("’", "'", _source);
        _source = _googleTransUtils.str_replace("”", '"', _source);
        _source = _googleTransUtils.str_replace("“", '"', _source);

    }

    if (_form.trim_dash.checked) {
        _source = _googleTransUtils.str_replace("-\n", "", _source);
    }

    if (_form.trim_nl.checked) {
        _source = _googleTransUtils.str_replace("\n", " ", _source);
    }

    if (_form.sentence_nl.checked) {
        _source = _googleTransUtils.str_replace(". ", ". \n\n", _source);
        _source = _googleTransUtils.str_replace(".\" ", ".\" \n\n", _source);
        _source = _googleTransUtils.str_replace(".\' ", ".\' \n\n", _source);
        //_source = _googleTransUtils.str_replace(": ", ": \n\n\n", _source);
        _source = _googleTransUtils.str_replace("; ", "; \n\n", _source);
        //for (var _i = 1; _i < 10; _i++) {
        //    _source = _googleTransUtils.str_replace(" (" + _i + ")", " \n\n(" + _i + ")", _source);
        //}
        _source = _googleTransUtils.str_replace("\n ", "\n", _source);
    }
    
    if (_form.trim_citation.checked) {
        _source = _source.replace(/\n\d+$/g, "");
        _source = _source.replace(/\n\d+ /g, "\n");
    }
    
    while (_source.indexOf("  ") > -1) {
        _source = _googleTransUtils.str_replace("  ", " ", _source);
    }
    _source = $.trim(_source);

    /*
    if (_trim_style === "enable_trim_nl") {
        _source = _googleTransUtils.trim_nl(_source);
    }
    else if (_trim_style === "enable_trim_dash") {
        _source = _googleTransUtils.str_replace("-\n", " ", _source);
    }
    else if (_trim_style === "enable_trim_nl_with_blank") {
        _source = _googleTransUtils.str_replace("\n", " ", _source);
    }
    else if (_trim_style === "enable_trim_nl_dash") {
        _source = _googleTransUtils.str_replace("-\n", "", _source);
        _source = _googleTransUtils.str_replace("\n", " ", _source);
    }
    */

    // https://translate.google.com.tw/#en/zh-TW/While
    
    var _ori_source = _source;
    _source = encodeURIComponent(_source);
    var _url = "https://translate.google.com.tw/#"
        + _form.source_lang.value
        + "/"
        + _form.target_lang.value
        + "/"
        + _source;


    var _output_style = _form.output_style.value;
    //alert([_output_style, _url]);

    if (_form.test_output.checked) {
        //$(".google_trans_20140526 .test-output .test-div textarea").slideUp();
        
        
        var _test_output = $(".google_trans_20140526 .test-output").show();
        var _test_div = $("<div class='test-div panel panel-success'></div>").prependTo(_test_output);
        
        
        //-----------
        var _d = new Date();
        var _h = _d.getHours();
        var _m = _d.getMinutes();
        var _s = _d.getSeconds();
        
        //<span class="glyphicon glyphicon-resize-full" style="float:right"></span>
        //<span class="glyphicon glyphicon-resize-small" style="float:right"></span>

        var _preview = _ori_source;
        _preview = _googleTransUtils.str_replace("\n", " ", _preview);
        
        $("<div class='animated panel-heading togglable'></div>")
                .html('<span class="glyphicon glyphicon-resize-full" style="float:right"></span>'
                    + '<span class="glyphicon glyphicon-resize-small" style="float:right"></span>' 
                    + "<div class='heading-text'>" 
                        + "<strong>" + _h + ":" + _m + ":" + _s + "</strong> " + _preview + "</div> ")
                .click(function () {
                    _googleTransUtils.toggle_panel(this);
                })
                .appendTo(_test_div);
        
        
        _googleTransUtils.toggle_panel($(".google_trans_20140526 .input-div .panel-heading.togglable"));
        
        //-----------
        
        var _textarea = $("<textarea class='animated source panel-body'></textarea>")
                .val(_ori_source)
                .click(function () {
                    this.select();
                })
                .appendTo(_test_div);
        
        $(function () {
            _textarea.autosize();
            _textarea.focus();
            _textarea.click();
        });
        
    }
    else {
        //_source = encodeURIComponent(_source);
        if (_output_style === "blank") {
            window.open(_url, "_blank");
        }
        else if (_output_style === "iframe") {
            var _heading = _form.subject.value;
            
            var _time = (new Date()).getTime();
            
            _heading = _time + " " + _heading;
            
            var _iframe = _googleTransUtils.create_iframe(_url, _heading);
            _iframe.prependTo(".google_trans_20140526 .output");
        }
    }


    }
    catch (_e) {
        console.log(_e);
    }

    /*

    else if (_output_style === "iframe") {
        window.open(_url, "_blank");
    }
    */
   
    $(_form.source).val("");

    return false;
};

var _googleTransUtils = {
    /**
     * 取代字串
     * @param {String} _search 要被取代的字串
     * @param {String} _replace 要取而代之的字串
     * @param {String} _subject 進行處理的字串
     * @param {number} _count 最多的處理次數
     * @returns {String}
     */
    str_replace: function (_search, _replace, _subject, _count) {
        // http://kevin.vanzonneveld.net
        // +   original by: Kevin van Zonneveld (http://kevin.vanzonneveld.net)
        // +   improved by: Gabriel Paderni
        // +   improved by: Philip Peterson
        // +   improved by: Simon Willison (http://simonwillison.net)
        // +    revised by: Jonas Raoni Soares Silva (http://www.jsfromhell.com)
        // +   bugfixed by: Anton Ongson
        // +      input by: Onno Marsman
        // +   improved by: Kevin van Zonneveld (http://kevin.vanzonneveld.net)
        // +    tweaked by: Onno Marsman
        // +      input by: Brett Zamir (http://brett-zamir.me)
        // +   bugfixed by: Kevin van Zonneveld (http://kevin.vanzonneveld.net)
        // +   input by: Oleg Eremeev
        // +   improved by: Brett Zamir (http://brett-zamir.me)
        // +   bugfixed by: Oleg Eremeev
        // %          note 1: The count parameter must be passed as a string in order
        // %          note 1:  to find a global variable in which the result will be given
        // *     example 1: str_replace(' ', '.', 'Kevin van Zonneveld');
        // *     returns 1: 'Kevin.van.Zonneveld'
        // *     example 2: str_replace(['{name}', 'l'], ['hello', 'm'], '{name}, lars');
        // *     returns 2: 'hemmo, mars'

        var _i = 0, _j = 0, _temp = '', _repl = '', _sl = 0, _fl = 0,
                _f = [].concat(_search),
                _r = [].concat(_replace),
                _s = _subject,
                _ra = _r instanceof Array, _sa = _s instanceof Array;
        _s = [].concat(_s);
        if (_count) {
            this.window[_count] = 0;
        }

        for (_i=0, _sl=_s.length; _i < _sl; _i++) {
            if (_s[_i] === '') {
                continue;
            }
            for (_j=0, _fl=_f.length; _j < _fl; _j++) {
                _temp = _s[_i]+'';
                _repl = _ra ? (_r[_j] !== undefined ? _r[_j] : '') : _r[0];
                _s[_i] = (_temp).split(_f[_j]).join(_repl);
                if (_count && _s[_i] !== _temp) {
                    this.window[_count] += (_temp.length-_s[_i].length)/_f[_j].length;}
            }
        }
        return _sa ? _s : _s[0];
    },
    trim_nl: function (_str) {
        return this.str_replace("\n", "", _str);
    },
    trim_nl_dash: function (_str) {
        return this.str_replace("-\n", "", _str);
    },
    toggle_panel: function (_heading) {
        _heading = $(_heading);
        var _body = _heading.next();
        
        var _hidden_classname = "heading_hidden";
        if (_body.filter(":visible").length > 0) {
            _body.slideUp(function () {
                _heading.addClass(_hidden_classname);
            });
        }
        else {
            _body.slideDown(function () {
                _heading.removeClass(_hidden_classname);
            });
        }
        //_body.toggle(500);
    },
    create_iframe: function (_url, _heading) {
        
        var _panel = $("<div></div>").addClass("panel panel-success");
        
        var _panel_heading = $("<div></div>")
                .addClass("panel-heading togglable")
                .appendTo(_panel)
                .click(function () {
                    _googleTransUtils.toggle_panel(this);
        });
        
        var _panel_title = $("<div></div>")
                .addClass("panel-title")
                .html(_heading)
                .appendTo(_panel_heading);
        
        var _body = $("<div></div>")
                .addClass("panel-body")
                .appendTo(_panel);
        
        var _iframe = $("<iframe src=\"" + _url + "&output=embed\" class=\"iframe\" />")
                .appendTo(_body);
        
        
        return _panel;
    }
};

$(function(){
    var _input_textarea = $('.input-textarea')
            //.autosize()
            .focus();
    
    var _resize_textarea = function () {
        var _height = window.innerHeight;
        _height = _height - 300;
        if (_height < 30) {
            _height = 30;
        }
        //alert(_height);
        
        _input_textarea.height(_height);
    };
    
    _resize_textarea();
    $(window).resize(function () {
         _resize_textarea();
    });
    
    // autosize用法：
    // http://www.jacklmoore.com/autosize/
});