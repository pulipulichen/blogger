ORCID_puli_utils.init({ 
    input: { 
        family_names: "[name='family_names']",
        given_names: "[name='given_names']",
        email: "[name='email']",
        orcid_id: "[name='orcid_id']",
        given_trusted: "[name='given_trusted']",
        submit: ":submit:first",
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
        bookmarklet: "設定ORCID代理人",
        fieldset_legend: "請按照以下步驟進行授權",
        bookmarklet_usage: "請拖曳上面授權按鈕到書籤列<br /><img src='http://lh3.googleusercontent.com/-JAjetUuBu6c/VbKNIq_oLVI/AAAAAAACYbM/VQujuHiLQdM/orcid1_thumb%25255B1%25255D.png' style='border:1px gray solid' />",
        open_account: "開啟ORCID網站",
        prompt_hint: "授權政大: 請輸入您的ORCID密碼",
        prompt_error: "ORCID密碼錯誤，請再次輸入您的ORCID密碼",
        alert_success: "授權成功，視窗即將關閉。",
        delegated: "已經授權",
        need_delegated: "尚未授權",
        prompt_domain_error: "請將此按鈕拖曳至書籤，並在登入ORCID網站之後再點選此按鈕",
        error_prompt_disabled: "授權錯誤，請手動開啟「彈出式視窗」",
        trust_loading: "授權動作處理中，請稍候...",
        submit: "確定",
        close: "關閉",
        browser_detect: '請使用桌面版Google Chrome操作，<a href="https://www.google.com.tw/chrome/browser/desktop/" target="download_chrome">請下載Google Chrome</a>。',
        prompt_enable: '請點選以下按鈕以完成授權',
        continue_delegate: "確認授權",
        delegate_guide: [
            '確認Google Chrome的書籤列已經開啟，或參考<a href="https://support.google.com/chrome/answer/95745?hl=zh-Hant" target="open_bookmark" style="padding:0;display: inline; background: none;">顯示書籤列的說明</a>'
                + '<br /><img src="http://i.imgur.com/9bUmSPP.jpg" style="border:1px gray solid" />',
            '請拖曳右方圖示 <span class="bookmarklet" /> 到書籤列' 
                + '<br /><img src="https://lh3.googleusercontent.com/-YE-dLVRQ7R0/VeZ_Vdwja0I/AAAAAAACk8M/EbW349v26EE/s0/orcid-bookmark.jpg" '
                + 'onclick="this.src=\'https://lh3.googleusercontent.com/-twDikBAEUV8/VeZ2ufgRlPI/AAAAAAACk7M/8ZKgsymE8Tc/s0/orcid-bookmark.gif\'; this.style.cursor=\'default\';" '
                + 'style="border:1px gray solid;cursor:pointer;" />',
            '請點選右邊圖示 <span class="open_account" />，開啟ORCID網站後，再點選書籤列上的「設定ORCID代理人」。'
                + '<br /><img src="https://lh3.googleusercontent.com/-bp9POJFV_j0/Ve2WyRhXmuI/AAAAAAAClOs/TqdP83WJxq0/s0/bookmark_click.jpg" style="border:1px gray solid" />',
            '請按照「設定ORCID代理人」指示完成後續步驟，就可以成功授權!'
                + '<br /><img src="https://lh3.googleusercontent.com/-CGmHMkzNfh8/VeZ-MK5ta-I/AAAAAAACk8A/Hp6_i4pl400/s0/orcid-proxy.jpg" '
                + 'onclick="this.src=\'https://lh3.googleusercontent.com/-nk-xh5JMvA4/VeZ74tpzvmI/AAAAAAACk7o/s3r9WO1NjA8/s0/orcid-proxy.gif\'; this.style.cursor=\'default\';" '
                + 'style="border:1px gray solid;cursor:pointer;" />',
            //'輸入您的ORCID密碼'
            //    + '<br /><img src="https://lh3.googleusercontent.com/-7_FZN7KBSk0/VeWdSRrUM_I/AAAAAAACk58/GWH6i_aNOW8/s0/orcid_password.jpg" style="border:1px gray solid" />',
            //'點選「確認授權」按鈕'
            //    + '<br /><img src="https://lh3.googleusercontent.com/-69ForfztAVY/VeWdKUpXm0I/AAAAAAACk50/ToFraWlbYCc/s0/orcid_ok.jpg" style="border:1px gray solid" />',
            //'授權動作完成後，即可刪除書籤列上的「授權政大維護ORCID」<br /> [[圖]]',
            //'如有任何問題，請聯絡分機 <span style="text-decoration:underline">84006 圖書館學科館員</span> ',
            //'關於ORCID與授權政大的說明資訊，請參考<a href="" target="orcid_workshop" style="padding:0;display: inline;">ORCID工作坊</a>。'
        ],
        //
        support: [
            '如有任何問題，請聯絡分機 <span style="text-decoration:underline">84006 圖書館學科館員</span> ',
            '關於ORCID與設定代理人的說明資訊，請參考<a href="" target="orcid_workshop" style="padding:0;display: inline;">政大圖書館ORCID說明</a>。',
            '[[orcid-reset]]'
        ]
    }
});