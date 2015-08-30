var _orcid_pulipuli_bookmarklet = function () {
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
              color: "white",
              padding: "1em",
              fontSize: "2em"
            }).appendTo($("body"));

            var _fields = $('<div class="orcid-puli-fields"></div>')
                    .appendTo(mask);

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
            
            var _loading = $('<div class="orcid-puli-loading"></div>')
                    .hide()
                    .appendTo(mask);
            _loading.html(_trust_loading);
        }
    };
    
    var _toggle_loading = function (_enable_loading) {
        if (_enable_loading === true) {
            $(".orcid-puli-loading").show();
            $(".orcid-puli-fields").hide();
        }
        else {
            $(".orcid-puli-loading").hide();
            $(".orcid-puli-fields").show();
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
            window.alert(_error_prompt_disabled);
            _toggle_loading(false);
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

$(function () {
    _orcid_pulipuli_bookmarklet();
});
