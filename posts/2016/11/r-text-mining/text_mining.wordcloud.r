# 詞頻查詢
sql.term_freq <- "SELECT term, sum(freq) AS sum FROM term_freq GROUP BY term ORDER BY sum DESC"
wordcloud.min.freq <- 10 # 文字雲顯示最小文字頻率

# 資料庫設定
db.host <- "192.168.56.152" # 資料庫主機位置
db.port <- 5432 # 資料庫連接埠
db.user <- "postgres" # 資料庫登入帳號
db.password <- "password" # 資料庫登入密碼
db.name <- "text_mining" # 資料庫名稱

# 引用函式
library("RPostgreSQL") # PostgreSQL資料庫連線需要的套件
library("wordcloud") # 文字雲繪圖工具

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
d <- data.frame(word = db.term_freq[,1], freq = db.term_freq[,2])
wordcloud(d$word, d$freq, min.freq = wordcloud.min.freq, random.order = F, ordered.colors = F, 
    colors = rainbow(length(row.names(db.term_freq))))

} #if (length(colnames(db.term_freq)) > 0) {
