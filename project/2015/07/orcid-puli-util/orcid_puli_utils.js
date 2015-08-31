var ORCID_puli_utils = {};

ORCID_puli_utils.params;

ORCID_puli_utils.init = function (_params) {
    var _ = this;

    if (typeof($) === "undefined") {
        var _script = document.createElement("script");
        _script.setAttribute("src", "http://code.jquery.com/jquery-latest.min.js");
        document.head.appendChild(_script);

        setTimeout(function () {
            _.init(_params);
        }, 100);
        return;
    }

    _.params = _params;
    if (typeof(_.params.debug) === "undefined") {
        _.params.debug = false;
    }
    
    // ------------------------------
    // 檢查是否有code
    var _code = _.get_code();
    if (_code !== undefined) {
        _.get_orcid_id(_code, function (_orcid) {
            _.setup_opener_input(_orcid);
        });
        return;
    }
    
    // ------------------------------
    // 檢查是否有trust
    if (_.get_trust()) {
        _.set_cookie("given_trusted", "true");
        //alert("成功設定");
        window.close();
        return;
    }
    
    // ------------------------------
    
    var _input = $(_.params.input.orcid_id);
    if (_input.length === 0) {
        return;
    }
    
    _input.hide();
    
    var _inline_hint = $('<span class="orcid-inline-hint"></span>').insertAfter(_input);
    var _block_hint = $('<div class="orcid-block-hint"></div>').insertAfter(_inline_hint);

    var _btn_style = "border: 1px solid #d3d3d3;padding: .3em;background-color: #fff;" 
        + "border-radius: 8px;box-shadow: 1px 1px 3px #999;cursor: pointer;color: #999;" 
        + "font-weight: bold;font-size: .8em;line-height: 24px;vertical-align: middle; " 
        + "margin: 0.5em;text-transform: none;" 
        + "box-sizing: border-box;align-items: flex-start;text-align: center;  " 
        + "text-rendering: auto;letter-spacing: normal;word-spacing: normal;  " 
        + "text-indent: 0px;text-shadow: none;display: inline-block;" 
        + "-webkit-writing-mode: horizontal-tb;box-sizing: border-box;";
    var _a_style = "color: #999;text-decoration: initial;font-weight:bold;font-size: .8em;";
    
    // -------------
    
    var _connect_button = _.create_connect_button();
    _connect_button.hide();
    _connect_button.appendTo(_inline_hint);

    var _profile_link = $('<div style="'+_btn_style+'" class="orcid-profile">'
        + '<img alt="ORCID logo" height="24" id="orcid-id-logo" src="http://orcid.org/sites/default/files/images/orcid_24x24.png" width="24" style="margin: 0 5px 4px 0; padding: 0;vertical-align: middle;  border: 0;  box-sizing: border-box;  color: #338caf;">'
        + '<a target="orcid_profile" style="'+_a_style+'"></a>'
        + '</div>')
        .hide()
        .appendTo(_inline_hint);

    var _delegated = $('<span class="orcid-delegated">'
        + '<input type="checkbox" checked="true" disabled="true">'
        + '<a href="https://orcid.org/account" target="orcid_account" style="'+_a_style+'">' + _.params.message.delegated + '</a>'
        + '</span>')
        .hide()
        .appendTo(_inline_hint);

    var _need_delegated = $('<span class="orcid-need-delegated">'
        + '<input type="checkbox" disabled="true">'
        + '<span style="'+_a_style+'">' + _.params.message.need_delegated + '</span>'
        + '</span>')
        .hide()
        .appendTo(_inline_hint);

    //_profile_link.wrap("<div/>");
    
    var _reset_orcid = _.create_reset_orcid_link();
    _reset_orcid.hide();
    _reset_orcid.appendTo(_block_hint);
    
    var _delegate_instruction = _.create_delegate_instruction();
    _delegate_instruction.hide();
    _delegate_instruction.appendTo(_block_hint);
    

    // ------------------------------

    // 如果input沒有值
    var _orcid_id = _input.val();
    //_params.message.connect_button;console.log(_orcid_id);


    // ------------------------------
    
    // 檢查欄位裡面是否已經填寫了ORCID
    if (_.validate_orcid_id(_orcid_id) === false) {
        // 沒填寫的情況
        $(_.params.input.given_trusted).val("false");
        
        // 顯示按鈕
        //_.check_login(function () {
            if (_code === undefined) {
                _.display_connect_button();
            }
        //});
    }
    else {
        // 欄位已經填寫了ORCID
        
        _.init_delegate();
        _reset_orcid.show();
        var _orcid_url = "http://orcid.org/" + _orcid_id;
        _profile_link.find("a").html(_orcid_url).attr("href", _orcid_url);
        _profile_link.show();
    }
};

// ---------------------------

ORCID_puli_utils.init_delegate = function () {
    var _ = this;
    var _input = $(_.params.input.orcid_id);
    var _orcid_id = _input.val();

    $(".orcid-need-delegated").show();

    // 確認是否有機構與關鍵字
    _.has_delegated(_orcid_id, function (_result) {
        //console.log(["是否有機構？", _result]);
        if (_result === false) {
            _.display_delegate_instruction();
        }
        else {
            $(".orcid-need-delegated").hide();
            $(".orcid-delegated").show();

            if (_.params.debug) {
                console.log("已經有機構與關鍵字");
                _.display_delegate_instruction();
            }
        }
        var _orcid_url = "http://orcid.org/" + _orcid_id;
        var _profile_link = $(".orcid-profile");
        _profile_link.find("a").html(_orcid_url).attr("href", _orcid_url);
        _profile_link.show();
    });
};

// -----------------------------

/**
 * 是ORCID id嗎？
 */
ORCID_puli_utils.validate_orcid_id = function (_orcid_id) {
    return (_orcid_id.match(/^(\d{4})-(\d{4})-(\d{4})-(\d{3}[0-9X])$/) !== null);
    // "0000-0003-3751-610X".match(/^(\d{4})-(\d{4})-(\d{4})-(\d{3}[0-9X])$/) !== null
};

// ----------------------------------------------

ORCID_puli_utils.get_oauth_url = function () {
    var _ = this;
    var _app_client_id = _.params.app.client_id;
    var _redirect_uri = _.params.app.redirect_uri;
    var _url = "http://orcid.org/oauth/authorize?client_id=" + _app_client_id 
        + "&response_type=code" 
        + "&scope=/authenticate" 
        + "&redirect_uri=" + _redirect_uri 
        + "&show_login=true"
        + "&state=state_information"
        + "&lang=" + _.params.app.lang;

    // API說明：https://members.orcid.org/api/get-oauthauthorize

    var _family_names = $(_.params.input.family_names);
    if (_family_names.length > 0 && _family_names.eq(0).val().trim().length > 0) {
        _url = _url + "&family_names=" + _family_names.eq(0).val().trim();
    }
    
    var _given_names = $(_.params.input.given_names);
    if (_given_names.length > 0 && _given_names.eq(0).val().trim().length > 0) {
        _url = _url + "&given_names=" + _given_names.eq(0).val().trim();
    }
    
    var _email = $(_.params.input.email);
    if (_email.length > 0 && _email.eq(0).val().trim().length > 0) {
        _url = _url + "&email=" + _email.eq(0).val().trim();
    }
    return _url;
};

//ORCID_puli_utils.check_login = function (_callback) {
//    var _ = this;
//    var _url = _.get_oauth_url();
//
//    var _iframe = $("<iframe />")
//        .css({
//            width: 0,
//            height: 0,
//            visibility: "hidden"
//        })
//        .addClass("orcid-check-login")
//        .appendTo("body");
//    _iframe.attr("src", _url);
//    _iframe.load(function () {
//        _callback();
//    });
//};

// ----------------------------------------------

/**
 * 取得code
 */
ORCID_puli_utils.get_code = function () {
    var code;
    if (window.location.search.indexOf("code=") !== -1) {
        var query = window.location.search.substring(1);
        var vars = query.split("&");
        for (var i=0;i<vars.length;i++) {
            var pair = vars[i].split("=");
            if (pair[0] === "code") {
                code = pair[1];
            }
        }
    }
    return code;
};

/**
 * 取得trust
 */
ORCID_puli_utils.get_trust = function () {
    return (window.location.search.indexOf("trust=true") !== -1);
};

/**
 * 取得ORCID id
 */
ORCID_puli_utils.get_orcid_id = function (_code, _callback) {
    var _ = this;
    //console.log("開始取得ORCID");
    
    var _data = {
            client_id: _.params.app.client_id,
            client_secret: _.params.app.client_secret,
            grant_type: "authorization_code",
            redirect_uri: _.params.app.redirect_uri,
            code: _code
    };
    //_data = JSON.stringify(_data);
    $.ajax({
        url: "https://pub.orcid.org/oauth/token",
        type: 'POST',
        dataType: 'json',
        //contentType: 'application/json',
        data: _data,
        //processData: false,
        success: function (_result) {
            var _orcid = _result.orcid;
            //console.log("取得ORCID: " + _orcid);
            if (typeof(_callback) === "function") {
                _callback(_orcid);
            }
        }
    });
};

/**
 * 設定input
 */
ORCID_puli_utils.setup_opener_input = function (_orcid) {
    var _ = this;
    var _window = window.opener;
    if (_window === null) {
        _window = window.parent;
    }
    var _input = _window.$(_.params.input.orcid_id);
    _input.val(_orcid);
    _window.$(".orcid-delegated-instruction").hide();
    _window.$(".orcid-connect-button").hide();
    /*_input.show();*/
    //_window.$("iframe.orcid-check-login").remove();
    _window.ORCID_puli_utils.init_delegate();
    _window.$(".orcid-reset-link").show();
    window.close();
};

// ----------------------------------------------


ORCID_puli_utils.oauthWindow;

/**
 * 顯示連接的按鈕
 */
ORCID_puli_utils.create_connect_button = function () {
    var _ = this;
    var _msg = _.params.message.connect_button;

    var _btn_style = "border: 1px solid #d3d3d3;padding: .3em;background-color: #fff;" 
        + "border-radius: 8px;box-shadow: 1px 1px 3px #999;cursor: pointer;color: #999;" 
        + "font-weight: bold;font-size: .8em;line-height: 24px;vertical-align: middle; " 
        //+ "-webkit-appearance: button;"
        + "margin: 0;text-transform: none;" 
        + "box-sizing: border-box;align-items: flex-start;text-align: center;  " 
        + "text-rendering: auto;letter-spacing: normal;word-spacing: normal;  " 
        + "text-indent: 0px;text-shadow: none;display: inline-block;" 
        + "-webkit-writing-mode: horizontal-tb;box-sizing: border-box;"
        + "display:inline-block;";
    var _btn = $('<a style="'+_btn_style+'" class="orcid-connect-button"></a>');
    _btn.html(_msg);

    var _btn_img_style = "margin: 0 5px 4px 0; padding: 0;vertical-align: middle;  " 
        + "border: 0;  box-sizing: border-box;  color: #338caf;";
    var _btn_img = $('<img alt="ORCID logo" height="24" id="orcid-id-logo" '
        + 'src="http://orcid.org/sites/default/files/images/orcid_24x24.png" width="24" ' 
        + 'style="'+_btn_img_style+'">');
    _btn_img.prependTo(_btn);

    //var _input = $(_.params.input.orcid_id);
    //_input.afterAll(".orcid-inline-hint:first").append(_btn);
    //_input.hide();

    _btn.click(function () {
        var _url = _.get_oauth_url();
        _.oauthWindow = window.open(_url
            ,"_blank"
            , "toolbar=no, scrollbars=yes, width=500, height=600, top=500, left=500");
        //if (_.oauthWindow !== undefined) {
        //    _.oauthWindow.onbeforeunload = function() {
        //        _.init_delegate();
        //    };
        //}
    });

    return _btn;
};

ORCID_puli_utils.display_connect_button = function () {
    var _ = this;
    
    var _btn = $('.orcid-connect-button');
    _btn.css("display", "inline-block");
    
    if (_.params.debug === true) { 
        $(function () {
            _btn.click();
        });
    }
};

// ----------------------------------------------

/**
 * 確認是否已經授權了
 * @param {String} _orcid_id
 * @param {Function} _callback
 */
ORCID_puli_utils.has_delegated = function (_orcid_id, _callback) {
    var _ = this;
    var _found = false;
    
    // 用欄位來確認是否已經授權
    var _given_trusted = $(_.params.input.given_trusted);
    if (_given_trusted.length > 0) {
        _given_trusted = _given_trusted.val();
        _given_trusted = _given_trusted.toLowerCase();
        _found = (_given_trusted === "true");
        if (typeof(_callback) === "function") {
            _callback(_found);
        }
        return;
    }
    
    // ---------------------------------------------
    
    $.ajax({
        url: "http://pub.orcid.org/v1.2/"+_orcid_id+"/orcid-profile?_=" + new Date().getTime(),
        type: "GET",
        success: function (_result) {
            var _result = $(_result);
            var _organization = _result.find("disambiguated-organization-identifier:contains("+ _.params.employment.source_id+")");
            if (_organization.length > 0) {
                _found = (_organization.parents("affiliation:first").find("type:contains('employment')").length > 0)
            }

            // 找關鍵字
            if (_found === true) {
                var _keywords = _result.find("keywords[visibility='public'] keyword:contains("+ _.params.employment.keyword+")");
                _found = (_keywords.length > 0);
            }

            if (typeof(_callback) === "function") {
                _callback(_found);
            }
        }
    });
};

// ORCID_puli_utils.has_added_employment = function (_orcid_id, _callback) {
//     var _ = this;
//     $.ajax({
//         url: "http://pub.orcid.org/v1.2/"+_orcid_id+"/orcid-profile",
//         type: "GET",
//         success: function (_result) {
//             var _found = false;
//             var _result = $(_result);
//             var _organization = _result.find("disambiguated-organization-identifier:contains("+ _.params.employment.source_id+")");
//             if (_organization.length > 0) {
//                 _found = (_organization.parents("affiliation:first").find("type:contains('employment')").length > 0)
//             }
//             if (typeof(_callback) === "function") {
//                 _callback(_found);
//             }
//         }
//     });
// };

// ORCID_puli_utils.has_added_keyword = function (_orcid_id, _callback) {
//     var _ = this;
//     $.ajax({
//         url: "http://pub.orcid.org/v1.2/"+_orcid_id+"/orcid-profile",
//         type: "GET",
//         success: function (_result) {
//             var _found = false;
//             var _result = $(_result);
//             var _keywords = _result.find("keywords['visibility'='public'] keyword:contains("+ _.params.employment.keyword+")");
//             _found = (_keywords.length > 0)
//             if (typeof(_callback) === "function") {
//                 _callback(_found);
//             }
//         }
//     });
// };

// ----------------------------------------------

/**
 * 顯示授權的按鈕
 */
ORCID_puli_utils.display_delegate_instruction = function () {
    var _ = this;
    $(".orcid-delegate-instruction").show();
};

/**
 * 顯示授權的按鈕
 */
ORCID_puli_utils.create_delegate_instruction = function () {
    var _ = this;
    
    var _fieldset = $("<fieldset></fieldset>");
    _fieldset.addClass("orcid-delegate-instruction");
    _fieldset.css("display", "inline-block");
    _fieldset.append("<legend>" + _.params.message.fieldset_legend + "</legend>");
    
    var ua = navigator.userAgent;
    if (/Android|webOS|iPhone|iPad|iPod|BlackBerry/i.test(ua) === false && ua.lastIndexOf('Chrome/') > 0) {
    //if (true) {
    
        var _ol = $('<ol></ol>');

        _ol.append($("<li></li>").append(_.create_bookmarklet()));
        _ol.append($("<li>" + _.params.message.bookmarklet_usage + "</li>"));
        _ol.append($("<li></li>").append(_.create_account_link()));
        _ol.append($("<li>" + _.params.message.open_bookmarket + "</li>"));
        _ol.append($("<li>" + _.params.message.input_password + "</li>"));

        _fieldset.append(_ol);

    }
    else {
        
        _fieldset.append("<div>" + _.params.message.browser_detect + "</div>");
    }

    return _fieldset;
};

ORCID_puli_utils.create_bookmarklet = function () {
    var _ = this;
    var _btn_style = "border: 1px solid #d3d3d3;padding: .3em;background-color: #fff;border-radius: 8px;box-shadow: 1px 1px 3px #999;"
        + "cursor: pointer;color: #999;font-weight: bold;font-size: .8em;line-height: 24px;vertical-align: middle;"
        //+ "-webkit-appearance: button;"
        + "text-decoration:initial;font-weight: bold;"
        + "margin: 0;margin-bottom: 5px;text-transform: none;box-sizing: border-box;align-items: flex-start;text-align: center;  text-rendering: auto;letter-spacing: normal;word-spacing: normal;  text-indent: 0px;text-shadow: none;display: inline-block;-webkit-writing-mode: horizontal-tb;box-sizing: border-box;";
    var _btn = $('<a style="'+_btn_style+'"></a>');
    _btn.html(_.params.message.bookmarklet);

    //var _a = $("<a></a>").append(_btn);

    var _func = _.create_bookmarklet_href;
    var _func_str = _func.toString();

    // 取代必要的資料
    _func_str = _func_str.replace("[[message:prompt_hint]]", _.params.message.prompt_hint);
    _func_str = _func_str.replace("[[message:prompt_error]]", _.params.message.prompt_error);
    _func_str = _func_str.replace("[[message:alert_success]]", _.params.message.alert_success);
    _func_str = _func_str.replace("[[message:employment_orcid]]", _.params.employment.orcid);
    _func_str = _func_str.replace("\"[[message:employment_disambiguated_id]]\"", _.params.employment.disambiguated_id);
    _func_str = _func_str.replace("[[message:keyword]]", _.params.employment.keyword);
    _func_str = _func_str.replace("[[message:prompt_domain_error]]", _.params.message.prompt_domain_error);
    _func_str = _func_str.replace("[[message:redirect_uri]]", _.params.app.redirect_uri);
    
    _func_str = _func_str.replace("[[message:submit]]", _.params.message.submit);
    _func_str = _func_str.replace("[[message:close]]", _.params.message.close);
    _func_str = _func_str.replace("[[message:error_prompt_disabled]]", _.params.message.error_prompt_disabled);
    _func_str = _func_str.replace("[[message:trust_loading]]", _.params.message.trust_loading);
    
    _func_str = _func_str.replace("[[message:prompt_enable]]", _.params.message.prompt_enable);
    _func_str = _func_str.replace("[[message:continue_delegate]]", _.params.message.continue_delegate);
    
    //var _replaceAll = function (find, replace, str) {
    //    return str.replace(new RegExp(find, 'g'), replace);
    //};
    
    //_func_str = _replaceAll(" ", "", _func_str);
    
    //_func_str = escape(_func_str);
    
    //var _href = "javascript:void(" + _func_str.substring(13, _func_str.length - 2) + ")";
    var _href = "javascript:" + _func_str.substring(13, _func_str.length - 2);
    _btn.attr("href", _href);
    return _btn;
};

/**
 * 注意：以下程式千萬不可以用 // 註解！！
 */
ORCID_puli_utils.create_bookmarklet_href = function () {
    var _message = "[[message:prompt_hint]]";
    var _message_prompt_error = "[[message:prompt_error]]";
    var _message_alert_success = "[[message:alert_success]]";
    var _message_prompt_domain_error = "[[message:prompt_domain_error]]";
    var _employment_orcid = "[[message:employment_orcid]]";
    var _employment_disambiguated_id = "[[message:employment_disambiguated_id]]";
    var _keyword = "[[message:keyword]]";
    var _redirect_uri = "[[message:redirect_uri]]";
    
    var _submit = "[[message:submit]]";
    var _close = "[[message:close]]";
    var _error_prompt_disabled = "[[message:error_prompt_disabled]]";
    var _trust_loading = "[[message:trust_loading]]";
    /*
    //var _prompt_enable_encodeURIComponent = "[[message:prompt_enable_encodeURIComponent]]";
    //var _prompt_enable = decodeURIComponent(_prompt_enable_encodeURIComponent);
    */
    var _prompt_enable = "[[message:prompt_enable]]";
    var _continue_delegate = "[[message:continue_delegate]]";

    /* 確認是在orcid網域底下才生效 */
    var _is_orcid_domain = function () {
        if (location.href.length < 19 || location.href.substr(0, 18) !== "https://orcid.org/") {
            window.alert(_message_prompt_domain_error);
            /*window.open("https://orcid.org/account", "given_trust");*/
            return false;
        }
        return true;
    };

    var _create_mask = function () {
        var mask = $('.puli-overlay-mask');
        if (!mask.length) {
            mask = $('<div class="puli-overlay-mask"></div>');
            mask.css({
              position: 'absolute',
              width: '100%',
              height: '100%',
              top: '0px',
              left: '0px',
              zIndex: 100,
              backgroundColor: "rgba(0%,0%,0%,0.6)",
              textAlign: "center",
              padding: "1em",
              fontSize: "2em"
            }).appendTo($("body"));

            var _content_style = "background-color:white;margin: 1em 5em;padding: 1em;border-radius: 0.5em;";
            var _content_container = $('<div style="'+_content_style+'"></div>')
                    .appendTo(mask);

            /* ------------------------- */

            var _fields = $('<div class="orcid-puli-fields"></div>')
                    .appendTo(_content_container);

            _fields.append('<div style="">' + _message  + '</div>');
            _fields.append('<div><input type="password" name="orcid_puli_password" /></div>');

            var _btn_style = "margin: 0 0.5em;display: inline-block;margin-bottom: 0px;font-weight: 400;text-align: center;vertical-align: middle;cursor: pointer;background-image: none;border: 1px solid transparent;white-space: nowrap;padding: 6px 12px;font-size: 14px;line-height: 1.42857;border-radius: 4px;-moz-user-select: none;";
            var _submit_btn = $('<button type="button" style="color:white;background: none repeat scroll 0% 0% #31789B;' + _btn_style + '">' + _submit + '</button>').appendTo(_fields);
            _submit_btn.click(function () {
                _add_delegate();
            });

            var _cancel_btn = $('<button type="button" style="color:#333;' + _btn_style + '">' + _close + '</button>').appendTo(_fields);
            _cancel_btn.click(function () {
                mask.remove();
            });
            
            /* ------------------------- */
            
            var _loading = $('<div class="orcid-puli-loading"></div>')
                    .hide()
                    .appendTo(_content_container);
            _loading.html(_trust_loading);
            
            /* ------------------------- */
            
            var _enable_prompt = $('<div class="orcid-puli-prompt"></div>')
                    .hide()
                    .appendTo(_content_container);
            _enable_prompt.html(_prompt_enable);
            var _btn_container = $('<div style="text-align:center"></div>')
                .appendTo(_enable_prompt);
            var _continue_btn = $('<button type="button" style="color:white;background: none repeat scroll 0% 0% #31789B;' + _btn_style + '">' + _continue_delegate + '</button>')
                    .appendTo(_btn_container);
            _continue_btn.click(function () {
                _trusted_callback();
            });
        }
    };
    
    var _toggle_loading = function (_enable_loading) {
        var _fields = $(".orcid-puli-fields");
        var _loading = $(".orcid-puli-loading");
        var _prompt = $(".orcid-puli-prompt");
        
        _loading.hide();
        _fields.hide();
        _prompt.hide();
        if (_enable_loading === true) {
            _loading.show();
        }
        else if (_enable_loading === "prompt") {
            _prompt.show();
        }
        else {
            _fields.show();
        }
    };

    var _add_delegate = function () {
        /*var _pw = window.prompt(_message);*/
        var _pw = $('[name="orcid_puli_password"]').val();
        /*alert(_pw);*/
        if (_pw === null || _pw === "") {
            return;
        }
        _toggle_loading(true);
        $.ajax({
            url: "/account/addDelegate.json",
            type: "POST",
            beforeSend: function (xhr) {
                xhr.setRequestHeader("Content-type", "application/json; charset=UTF-8");
            },
            data: JSON.stringify({delegateToManage: _employment_orcid, password: _pw}),
            success: function (_result) {
                if (typeof(_result.errors[0]) !== "undefined") {
                    _message = _message_prompt_error;
                    window.alert(_message);
                    _toggle_loading(false);
                }
                else {
                    _check_employment();
                }
            }
        });
    };

    var _check_employment = function () {

        $.ajax({
            url: "/affiliations/affiliationIds.json",
            type: "GET",
            beforeSend: function (xhr) {
                xhr.setRequestHeader("Content-type", "application/json; charset=UTF-8");
            },
            success: function (_result) {
                var _ids = _result.concat(",");
                $.ajax({
                    url: "/affiliations/affiliations.json?affiliationIds=" + _ids,
                    type: "GET",
                    beforeSend: function (xhr) {
                        xhr.setRequestHeader("Content-type", "application/json; charset=UTF-8");
                    },
                    success: function (_result) {
                        var _found = false;
                        for (var _i in _result) {
                            var _aff = _result[_i];
                            if (_aff.affiliationTypeForDisplay === "Employment"
                                && (_aff.orgDisambiguatedId !== null && _aff.orgDisambiguatedId.value === _employment_disambiguated_id + "")
                                && _aff.visibility.visibility === "PUBLIC") {
                                _found = true;
                                break;
                            }
                        }

                        if (_found === false) {
                            _add_employment();
                        }
                        else {
                            _add_keyword();
                        }
                    }
                });
            }
        });
    };

    /* 加入機構 */
    var _add_employment = function () {
        $.ajax({
            url: "/affiliations/disambiguated/id/" + _employment_disambiguated_id,
            type: "GET",
            beforeSend: function (xhr) {
                xhr.setRequestHeader("Content-type", "application/json; charset=UTF-8");
            },
            success: function (_result) {
                var _data = {
                    "visibility":{
                        "visibility":"PUBLIC"
                    },
                    "affiliationName":{
                        "value":_result.value,
                    },
                    "city":{
                        "value":_result.countryForDisplay,
                    },
                    "region":{
                     "value":_result.region,
                    },
                    "country":{
                        "value":_result.country,
                    },
                    "roleTitle":{
                    },
                    "departmentName":{
                    },
                    "affiliationType":{
                        "value":"employment",
                    },
                    "disambiguatedAffiliationSourceId":_result.sourceId,
                    "disambiguationSource":_result.sourceType,
                    "orgDisambiguatedId":{
                        "value": _employment_disambiguated_id,
                    }
                };  /*var _data = {*/

                $.ajax({
                    url: "/affiliations/affiliation.json",
                    type: 'POST',
                    data: JSON.stringify(_data),
                    beforeSend: function (xhr) {
                        xhr.setRequestHeader("Content-type", "application/json; charset=UTF-8");
                    },
                    success: function (_result) {
                        _add_keyword();
                    }
                });
            }   /*success: function (_result) {*/
        });
    };  /* var _add_employment = function () { */

    /* 加入關鍵字 */
    var _add_keyword = function () {
        $.ajax({
            url: "/my-orcid/keywordsForms.json",
            type: "GET",
            beforeSend: function (xhr) {
                xhr.setRequestHeader("Content-type", "application/json; charset=UTF-8");
            },
            success: function (_result) {
                var _keywords = [];
                var _existed = false;
                for (var _i in _result.keywords) {
                    var _value = {value: _result.keywords[_i].value};
                    _keywords.push(_value);

                    if (_keyword === _result.keywords[_i].value) {
                        _existed = true;
                    }
                }

                if (_existed === false) {
                    var _value = {value: _keyword};
                    _keywords.push(_value);
                }

                var _data = {
                    errors: [],
                    keywords: _keywords,
                    visibility: {errors: [], required: true, getRequiredMessage: null, visibility: "PUBLIC"}
                };

                $.ajax({
                    url: "/my-orcid/keywordsForms.json",
                    type: 'POST',
                    data: JSON.stringify(_data),
                    beforeSend: function (xhr) {
                        xhr.setRequestHeader("Content-type", "application/json; charset=UTF-8");
                    },
                    success: function (_result) {
                        _trusted_callback();
                    }
                });

            }   /*success: function (_result) {*/
        });
    };  /*var _add_keyword = function () {*/

    var _trusted_callback = function () {
        var _href = _redirect_uri + "?trust=true";
        
        var _given_trusted_cookie = window.open(_href
            , "given_trusted_cookie"
            , "toolbar=no, scrollbars=no, width=320, height=240, top=0, left=0");
            
        if (_given_trusted_cookie === undefined) {
            /*window.alert(_error_prompt_disabled);*/
            _toggle_loading("prompt");
        }
        else {
            _given_trusted_cookie.onunload = function () {
                _exit_callback();
            };
        }
    };

    var _exit_callback = function () {
        /*window.alert(_message_alert_success);*/
        window.close();
    };

    /* 真正開始執行動作 */
    /*console.log(0);*/
    /*_trusted_callback();*/
    
    if (_is_orcid_domain()) {
        $(function () {
            if ($("#DelegatesCtrl").find('[href="http://orcid.org/' + _employment_orcid +  '"]').length === 0) {
                _create_mask();
            }
            else {
                _create_mask();
                _toggle_loading(true);
                _check_employment();
            }
        });
    }
};

// -----------------------

ORCID_puli_utils.account_window;
ORCID_puli_utils.account_window_lock = false;

ORCID_puli_utils.create_account_link = function () {
    var _ = this;
    var _btn_style = "border: 1px solid #d3d3d3;padding: .3em;background-color: #fff;border-radius: 8px;box-shadow: 1px 1px 3px #999;cursor: pointer;color: #999;font-weight: bold;font-size: .8em;line-height: 24px;vertical-align: middle;-webkit-appearance: button;  margin: 0;margin-bottom:5px;text-transform: none;box-sizing: border-box;align-items: flex-start;text-align: center;  text-rendering: auto;letter-spacing: normal;word-spacing: normal;  text-indent: 0px;text-shadow: none;display: inline-block;-webkit-writing-mode: horizontal-tb;box-sizing: border-box;";
    var _btn = $('<button type="button" style="'+_btn_style+'"></button>');
    _btn.html(_.params.message.open_account);

    _btn.click(function () {
        _.account_window = window.open("https://orcid.org/account", "given_trust");
        _.account_window_lock = true;
        var _check = function () {
            _.set_trusted();
        };
        
        $(window).focus(_check);
        $(_.account_window).unload(_check);
        
        
    }); //_btn.click(function () {
    return _btn;
};

ORCID_puli_utils.set_trusted = function () {
    var _ = this;
    
    if (_.account_window_lock === false) {
        return;
    }
    
    setTimeout(function () {
        //console.log("set_trusted");
        //console.log([1, _.account_window !== undefined, _.account_window.closed === false, _.get_cookie("given_trusted")]);

        if ((_.account_window !== undefined
                && _.account_window.closed === false)
                ||  (_.get_cookie("given_trusted") === undefined || _.get_cookie("given_trusted") === null)) {
            //console.log([1, _.account_window !== undefined, _.account_window.closed === false]);
            return;
        }
        else { 
            //console.log(2);
            _.account_window_lock = false;
            _.delete_cookie("given_trusted");
        }

        $("ol.orcid-delegate").hide();
        $(".orcid-delegate-instruction").hide();
        $(".orcid-delegated").show();
        $(".orcid-need-delegated").hide();
        $(_.params.input.given_trusted).val("true");
        
    }, 10);
    
    return;
};

ORCID_puli_utils.create_reset_orcid_link = function () {
    var _ = this;
    
    var _msg = _.params.message.reset_button;
    
    var _style = "font-size: .8em;cursor:pointer;text-decoration:underline;margin: 1em 0;";
    
    var _link = $('<a style="' + _style + '"></a>')
            .html(_.params.message.reset_link);
            
    _link.click(function () {
        _.reset();
    });
    
    _link = $("<div></div>")
        .addClass("orcid-reset-link")
        .css("margin", ".5em 0")
        .append(_link);
    
    return _link;
};

ORCID_puli_utils.reset = function () {
    var _ = this;
    
    $(_.params.input.given_trusted).val("false");
    $(".orcid-profile").hide();
    $(".orcid-delegated").hide();
    $(".orcid-need-delegated").hide();
    $(".orcid-delegate-instruction").hide();
    $(".orcid-reset-link").hide();
    $(_.params.input.given_trusted).val("false");
    
    _.display_connect_button();
    $(_.params.input.orcid_id).val("");
};

//------------------------------------

ORCID_puli_utils.set_cookie = function(key, value)  {
    document.cookie = key + '=' + value + ";path=/";
    //console.log("設定cookie:" + key + "=" + value);
};

ORCID_puli_utils.get_cookie = function(key) {
    var keyValue = document.cookie.match('(^|;) ?' + key + '=([^;]*)(;|$)');
    //console.log(["讀取cookie:", key, document.cookie]);
    return keyValue ? keyValue[2] : null;
};

ORCID_puli_utils.delete_cookie = function(key) {
    document.cookie = key + '=;expires='+(new Date()).toGMTString();
    //console.log("刪除cookie:" + key);
};
