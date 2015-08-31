ORCID_puli_utils.init({ 
    input: { 
        family_names: "[name='family_names']",
        given_names: "[name='given_names']",
        email: "[name='email']",
        orcid_id: "[name='orcid_id']",
        given_trusted: "[name='given_trusted']"
    }, 
    app: { 
        client_id: "APP-2QXG8GW8BZ9SN0RD",
        client_secret: "5ccb12f8-a791-4df9-9514-cfbf1e52037d",
        redirect_uri: "http://pc-pudding.dlll.nccu.edu.tw/blogger/project/2015/07/orcid-puli-util/20150630-orcid-redirect.html",    // 需要一個外部網址 
        lang: "zh_TW"
    }, 
    employment: { 
        orcid: "0000-0002-5496-8565", 
        disambiguated_id: 32787, 
        source_id: 34913, 
        keyword: "National Chengchi University", 
    }, 
    message: {
        connect_button: "建立或連接ORCID ID",
        reset_link: "重設ORCID",
        bookmarklet: "授權政大",
        fieldset_legend: "請按照以下步驟進行授權",
        bookmarklet_usage: "請拖曳上面授權按鈕到書籤列<br /><img src='http://lh3.googleusercontent.com/-JAjetUuBu6c/VbKNIq_oLVI/AAAAAAACYbM/VQujuHiLQdM/orcid1_thumb%25255B1%25255D.png' style='border:1px gray solid' />",
        open_account: "開啟設定頁面",
        open_bookmarket: "請點選授權按鈕。<br /><img src='http://lh3.googleusercontent.com/-5nG84mlwL4M/VbKNLhucyKI/AAAAAAACYbc/vTY8lJcgnUA/orcid2_thumb%25255B2%25255D.png' style='border:1px gray solid' />",
        input_password: "請輸入您的密碼 <br /><img src='http://lh3.googleusercontent.com/-yJLdDHowcP4/VbKNOgRqFQI/AAAAAAACYbs/qDu9ypACb0g/orcid3_thumb%25255B2%25255D.png' style='border:1px gray solid' />",
        prompt_hint: "授權政大: 請輸入您的ORCID密碼",
        prompt_error: "ORCID密碼錯誤，請再次輸入您的ORCID密碼",
        alert_success: "授權成功，視窗即將關閉。",
        delegated: "已經授權",
        need_delegated: "尚未授權",
        prompt_domain_error: "請將此按鈕拖曳至書籤，並在登入ORCID之後再點選此按鈕",
        error_prompt_disabled: "授權錯誤，請手動開啟「彈出式視窗」",
        trust_loading: "授權動作處理中，請稍候...",
        submit: "確定",
        close: "關閉",
        browser_detect: '請使用桌面版Google Chrome操作。<a href="https://www.google.com.tw/chrome/browser/desktop/" target="download_chrome">下載Google Chrome</a>',
        prompt_enable: '請點選以下按鈕以完成授權',
        continue_delegate: "確認授權"
    }
});