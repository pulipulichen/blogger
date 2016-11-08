# ==========================
# 設定部分

# 詞頻查詢
sql.term_freq <- "SELECT word, freq FROM view_term_freq_sum"
wordcloud.min.freq <- 10 # 文字雲顯示最小文字頻率

# 資料庫設定
db.host <- "192.168.56.152" # 資料庫主機位置
db.port <- 5432 # 資料庫連接埠
db.user <- "postgres" # 資料庫登入帳號
db.password <- "password" # 資料庫登入密碼
db.name <- "text_mining" # 資料庫名稱

# ==========================
# 執行部分

# 引用套件，請先確認套件已經安裝
library("RPostgreSQL") # PostgreSQL資料庫連線需要的套件
library("wordcloud2") # 文字雲繪圖工具

# 資料庫連接
drv <- dbDriver("PostgreSQL")
con <- dbConnect(drv, dbname = db.name,
                 host = db.host, port = db.port,
                 user = db.user, password = db.password)

# 資料庫查詢
db.term_freq <- dbGetQuery(con, sql.term_freq)

# 如果有資料的話
if (length(colnames(db.term_freq)) > 0) {

# 製作文字雲
wordcloud2(db.term_freq, size = 1)

} #if (length(colnames(db.term_freq)) > 0) {
