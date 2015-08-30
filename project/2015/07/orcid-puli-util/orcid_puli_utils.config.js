ORCID_puli_utils.init({ 
    inputs: { 
        email: "[name='email']",
        orcid_id: "[name='orcid']" 
    }, 
    app: { 
        client_id: "APP-2FUVI5T5FJUDLXQ1",
        client_secret: "a944fb0d-93bc-4b27-80d3-83ca3fa1e907",
        redirect_uri: "http://webapp.nccu.edu.tw/PR/PR02/PR0201/Home/ShowOrcidLoading",    // 需要一個外部網址 
        lang: "zh_TW"
    }, 
    employment: { 
        orcid: "0000-0003-0909-0201", 
        disambiguated_id: 32787, 
        source_id: 34913, 
        keyword: "National Chengchi University", 
    }, 
    message: { 
        connect_button: "建立或連接ORCID ID", 
        bookmarklet: "授權政大", 
        bookmarklet_usage: "請拖曳上面授權按鈕到書籤列<br /><img src='http://lh3.googleusercontent.com/-JAjetUuBu6c/VbKNIq_oLVI/AAAAAAACYbM/VQujuHiLQdM/orcid1_thumb%25255B1%25255D.png' style='border:1px gray solid' />", 
        open_account: "開啟設定頁面", 
        open_bookmarket: "請點選授權按鈕。<br /><img src='http://lh3.googleusercontent.com/-5nG84mlwL4M/VbKNLhucyKI/AAAAAAACYbc/vTY8lJcgnUA/orcid2_thumb%25255B2%25255D.png' style='border:1px gray solid' />", 
        input_password: "請輸入您的ORCID密碼 <br /><img src='http://lh3.googleusercontent.com/-yJLdDHowcP4/VbKNOgRqFQI/AAAAAAACYbs/qDu9ypACb0g/orcid3_thumb%25255B2%25255D.png' style='border:1px gray solid' />", 
        prompt_hint: "請輸入您的ORCID密碼", 
        prompt_error: "ORCID密碼錯誤，請再次輸入您的ORCID密碼", 
        alert_success: "授權成功，視窗即將關閉。", 
        delegated: "已經授權" 
    } 
});