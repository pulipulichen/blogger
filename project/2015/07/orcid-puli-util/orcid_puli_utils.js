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
    var _input = $(_.params.inputs.orcid_id);
    if (_input.length === 0) {
        return;
    }

    var _delegated = $('<a class="orcid-delegated" href="https://orcid.org/account" target="orcid_account">' + _.params.message.delegated + '</a>')
        .hide()
        .insertAfter(_input);

    // ------------------------------

    // 如果input沒有值
    var _orcid_id = _input.val();
    //_params.message.connect_button;console.log(_orcid_id);

    // ------------------------------
    // 檢查是否有code
    var _code = _.get_code();
    if (_code !== undefined) {
        _.get_orcid_id(_code, function (_orcid) {
            _.setup_opener_input(_orcid);
        });
    }

    // ------------------------------
    if (_.validate_orcid_id(_orcid_id) === false) {
        // 顯示按鈕
        _.check_login(function () {
            _.display_connect_button();
        });
    }
    else {
        _.init_delegate();
    }
};

// ---------------------------

ORCID_puli_utils.init_delegate = function () {
    var _ = this;
    var _input = $(_.params.inputs.orcid_id);
    var _orcid_id = _input.val();

    // 確認是否有機構與關鍵字
    _.has_delegated(_orcid_id, function (_result) {
        //console.log(["是否有機構？", _result]);
        if (_result === false) {
            _.display_delegate_instruction();
        }
        else {
            $("a.orcid-delegated").show();

            if (_.params.debug) {
                console.log("已經有機構與關鍵字");
                _.display_delegate_instruction();
            }
        }
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
        + "&state=state_information";

    var _email = $(_.params.inputs.email);
    if (_email.length > 0 && _email.val().trim().length > 0) {
        _url = _url + "&email=" + _email.val().trim();
    }
    return _url;
};

ORCID_puli_utils.check_login = function (_callback) {
    var _ = this;
    var _url = _.get_oauth_url();

    var _iframe = $("<iframe />")
        .css({
            width: 0,
            height: 0,
            visibility: "hidden"
        })
        .addClass("orcid-check-login")
        .appendTo("body");
    _iframe.attr("src", _url);
    _iframe.load(function () {
        _callback();
    });
};

// ----------------------------------------------

/**
 * 取得code
 */
ORCID_puli_utils.get_code = function () {
    if (window.location.search.indexOf("code=") !== -1) {
        var code;
        var query = window.location.search.substring(1);
        var vars = query.split("&");
        for (var i=0;i<vars.length;i++) {
            var pair = vars[i].split("=");
            if (pair[0] == "code") {
                code = pair[1];
            }
        }
    }
    return code;
};

/**
 * 取得ORCID id
 */
ORCID_puli_utils.get_orcid_id = function (_code, _callback) {
    var _ = this;
    $.ajax({
        url: "https://pub.orcid.org/oauth/token",
        type: 'POST',
        dataType: "json",
        data: {
            client_id: _.params.app.client_id,
            client_secret: _.params.app.client_secret,
            grant_type: "authorization_code",
            redirect_uri: _.params.app.redirect_uri,
            code: _code
        },
        success: function (_result) {
            var _orcid = _result.orcid;
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
    var _input = _window.$(_.params.inputs.orcid_id);
    _input.val(_orcid);
    _input.nextAll(".orcid-delegated-instruction").remove();
    _input.nextAll(".orcid-connect-button").remove();
    _input.show();
    _window.$("iframe.orcid-check-login").remove();
    _window.ORCID_puli_utils.init_delegate();
    window.close();
};

// ----------------------------------------------


ORCID_puli_utils.oauthWindow;

/**
 * 顯示連接的按鈕
 */
ORCID_puli_utils.display_connect_button = function () {
    var _ = this;
    var _msg = _.params.message.connect_button;

    var _btn_style = "border: 1px solid #d3d3d3;padding: .3em;background-color: #fff;" 
        + "border-radius: 8px;box-shadow: 1px 1px 3px #999;cursor: pointer;color: #999;" 
        + "font-weight: bold;font-size: .8em;line-height: 24px;vertical-align: middle; " 
        + "-webkit-appearance: button;  margin: 0;text-transform: none;" 
        + "box-sizing: border-box;align-items: flex-start;text-align: center;  " 
        + "text-rendering: auto;letter-spacing: normal;word-spacing: normal;  " 
        + "text-indent: 0px;text-shadow: none;display: inline-block;" 
        + "-webkit-writing-mode: horizontal-tb;box-sizing: border-box;";
    var _btn = $('<button style="'+_btn_style+'" class="orcid-connect-button"></button>');
    _btn.html(_msg);

    var _btn_img_style = "margin: 0 5px 4px 0; padding: 0;vertical-align: middle;  " 
        + "border: 0;  box-sizing: border-box;  color: #338caf;";
    var _btn_img = $('<img alt="ORCID logo" height="24" id="orcid-id-logo" '
        + 'src="http://orcid.org/sites/default/files/images/orcid_24x24.png" width="24" ' 
        + 'style="'+_btn_img_style+'">');
    _btn_img.prependTo(_btn);

    var _input = $(_.params.inputs.orcid_id);
    _input.after(_btn);
    _input.hide();

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

    if (_.params.debug === true) { 
        $(function () {
            _btn.click();
        });
    }
};

// ----------------------------------------------

ORCID_puli_utils.has_delegated = function (_orcid_id, _callback) {
    var _ = this;
    $.ajax({
        url: "http://pub.orcid.org/v1.2/"+_orcid_id+"/orcid-profile?_=" + new Date().getTime(),
        type: "GET",
        success: function (_result) {
            var _found = false;
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
    var _input = $(_.params.inputs.orcid_id);

    if (_input.nextAll(".orcid-delegate-instruction").length > 0) {
        return;
    }

    var _ol = $('<ol class="orcid-delegate-instruction"></ol>')
        .insertAfter(_input.next());

    _ol.append($("<li></li>").append(_.create_bookmarklet()));
    _ol.append($("<li>" + _.params.message.bookmarklet_usage + "</li>"));
    _ol.append($("<li></li>").append(_.create_account_link()));
    _ol.append($("<li>" + _.params.message.open_bookmarket + "</li>"));
    _ol.append($("<li>" + _.params.message.input_password + "</li>"));

    // 加入bookmarklet
};

ORCID_puli_utils.create_bookmarklet = function () {
    var _ = this;
    var _btn_style = "border: 1px solid #d3d3d3;padding: .3em;background-color: #fff;border-radius: 8px;box-shadow: 1px 1px 3px #999;"
        + "cursor: pointer;color: #999;font-weight: bold;font-size: .8em;line-height: 24px;vertical-align: middle;-webkit-appearance: button;"
        + "margin: 0;margin-bottom: 5px;text-transform: none;box-sizing: border-box;align-items: flex-start;text-align: center;  text-rendering: auto;letter-spacing: normal;word-spacing: normal;  text-indent: 0px;text-shadow: none;display: inline-block;-webkit-writing-mode: horizontal-tb;box-sizing: border-box;";
    var _btn = $('<button style="'+_btn_style+'"></button>');
    _btn.html(_.params.message.bookmarklet);

    var _a = $("<a></a>").append(_btn);

    var _func = _.create_bookmarklet_href;
    var _func_str = _func.toString();

    // 取代必要的資料
    _func_str = _func_str.replace("[[message:prompt_hint]]", _.params.message.prompt_hint);
    _func_str = _func_str.replace("[[message:prompt_error]]", _.params.message.prompt_error);
    _func_str = _func_str.replace("[[message:alert_success]]", _.params.message.alert_success);
    _func_str = _func_str.replace("[[message:employment_orcid]]", _.params.employment.orcid);
    _func_str = _func_str.replace("\"[[message:employment_disambiguated_id]]\"", _.params.employment.disambiguated_id);
    _func_str = _func_str.replace("[[message:keyword]]", _.params.employment.keyword);

    var _href = "javascript:" + _func_str.substring(13, _func_str.length - 2);
    _a.attr("href", _href);
    return _a;
};

ORCID_puli_utils.create_bookmarklet_href = function () {

    var _message = "[[message:prompt_hint]]";
    var _message_prompt_error = "[[message:prompt_error]]";
    var _message_alert_success = "[[message:alert_success]]";
    var _employment_orcid = "[[message:employment_orcid]]";
    var _employment_disambiguated_id = "[[message:employment_disambiguated_id]]";
    var _keyword = "[[message:keyword]]";

    var _add_delegate = function () {
        var _pw = window.prompt(_message);
        if (_pw === null || _pw === "") {
            return;
        }
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
                    _add_delegate();
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

                    if (_keyword == _result.keywords[_i].value) {
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
                        _exit_callback();
                    }
                });

            }   /*success: function (_result) {*/
        });
    };  /*var _add_keyword = function () {*/

    var _exit_callback = function () {
        window.alert(_message_alert_success);
        window.close();
    };

    /*console.log(0);*/
    if ($("#DelegatesCtrl").find('table thead tbody tr td a.ng-binding:contains("' + _employment_orcid +  '")').length === 0) {
        /*console.log(1);*/
        _add_delegate();
    }
    else {
        /*console.log(2);*/
        _check_employment();
    }
};

// -----------------------

ORCID_puli_utils.account_window;
ORCID_puli_utils.create_account_link = function () {
    var _ = this;
    var _btn_style = "border: 1px solid #d3d3d3;padding: .3em;background-color: #fff;border-radius: 8px;box-shadow: 1px 1px 3px #999;cursor: pointer;color: #999;font-weight: bold;font-size: .8em;line-height: 24px;vertical-align: middle;-webkit-appearance: button;  margin: 0;margin-bottom:5px;text-transform: none;box-sizing: border-box;align-items: flex-start;text-align: center;  text-rendering: auto;letter-spacing: normal;word-spacing: normal;  text-indent: 0px;text-shadow: none;display: inline-block;-webkit-writing-mode: horizontal-tb;box-sizing: border-box;";
    var _btn = $('<button style="'+_btn_style+'"></button>');
    _btn.html(_.params.message.open_account);

    _btn.click(function () {
        _.account_window = window.open("https://orcid.org/account", "_blank");
        $(_.account_window).unload(function () {
            $("ol.orcid-delegate").remove();
            $("ol.orcid-delegate-instruction").remove();
            $("a.orcid-delegated").show();

            /*var _input = $(_.params.inputs.orcid_id);
            var _orcid_id = _input.val();*/

            /*$("ol.orcid-delegate").hide();
            $("ol.orcid-delegate-instruction").hide();
            
            _.has_delegated(_orcid_id, function (_result) {

                console.log(["_result1 ", _result]); 
                if (_result === false) {
                    _.has_delegated(_orcid_id, function (_result) {
                        if (_result === false) {
                            $("ol.orcid-delegate").show();
                            $("ol.orcid-delegate-instruction").show();
                        }
                        else {
                            $("ol.orcid-delegate").remove();
                            $("ol.orcid-delegate-instruction").remove();
                            $("a.orcid-delegated").show();
                        }
                    });
                }
                else {
                    $("ol.orcid-delegate").remove();
                    $("ol.orcid-delegate-instruction").remove();
                    $("a.orcid-delegated").show();
                }
            });*/
        });
    });
    return _btn;
};