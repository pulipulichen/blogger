# 文本查詢
sql.content <- "SELECT doc_id, fulltext FROM doc"

# 新詞查詢
sql.newwords <- "SELECT term FROM new_word"

# 停用字查詢
sql.stopwords <- "SELECT term FROM stop_word"

# 過濾器設定
filter.xpath.enable <- TRUE # 是否使用xpath過濾
filter.xpath <- "/html/body" # xpath
filter.xpath.type <- xmlValue # xpath類型

filter.removePunctuation <- TRUE # 是否清除標點符號
filter.removeNumbers <- TRUE # 是否清除數字
filter.removeEnglish <- FALSE # 是否清除英文

filter.speech.enable <- TRUE # 是否使用詞性過濾
filter.speech <- c("n"); # 詞性設定，n表示名詞

filter.term.min.length <- 2 # 最小詞彙長度
filter.term.min.freq <- 3 # 詞彙最少頻率

# 資料庫設定
db.host <- "192.168.11.50" # 資料庫主機位置
db.port <- 5432 # 資料庫連接埠
db.user <- "kals" # 資料庫登入帳號
db.password <- "password" # 資料庫登入密碼
db.name <- "text_mining" # 資料庫名稱

# 輸出結果詞頻資料表設定
db.term_freq.table_name <- "term_freq" # 詞頻表格
db.term_freq.field_name.doc_id <- "doc_id" # 文件編號
db.term_freq.field_name.term <- "term" # 探勘出來的詞彙
db.term_freq.field_name.speech <- "speech" # 詞性
db.term_freq.field_name.freq <- "freq" # 頻率