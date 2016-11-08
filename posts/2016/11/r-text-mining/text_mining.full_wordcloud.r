# 文本查詢，至少要查詢doc_id跟fulltext兩個欄位
sql.content <- "SELECT doc_id, fulltext FROM doc"

# 新詞查詢
sql.newwords <- "SELECT term FROM new_word"

# 停用字查詢
sql.stopwords <- "SELECT term FROM stop_word"

# 過濾器設定
library("XML")
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
db.host <- "192.168.56.152" # 資料庫主機位置
db.port <- 5432 # 資料庫連接埠
db.user <- "postgres" # 資料庫登入帳號
db.password <- "password" # 資料庫登入密碼
db.name <- "text_mining" # 資料庫名稱

# =================================
# 引用套件，請事先確認套件都有正常安裝
library("RPostgreSQL") # PostgreSQL資料庫連線需要的套件
library("tm") # 文本探勘工具
library("tmcn") # 文本探勘中文包
library("Rwordseg") # 中文斷詞工具
library("XML") # XML處理工具
library("parallelsugar") # 新版Rwordseg會用到mclapply()

# 資料庫連接
drv <- dbDriver("PostgreSQL")
con <- dbConnect(drv, dbname = db.name,
                 host = db.host, port = db.port,
                 user = db.user, password = db.password)

# 資料庫查詢
db.content <- dbGetQuery(con, sql.content)

# 如果有文本資料的話
#if (length(colnames(db.content)) > 0) {

# 查詢其他資料
db.newwords <-dbGetQuery(con, sql.newwords)
db.stopwords <- dbGetQuery(con, sql.stopwords)

# 新詞加入斷詞器
if (length(colnames(db.newwords)) > 0) {
    insertWords(db.newwords[,1])
}

# 儲存詞性
df.speech <- list()

# HTML的body抽取處理
if (filter.xpath.enable == TRUE) {
    html <- htmlParse(db.content[,2], encoding="utf8")
    db.content[,2] <- xpathSApply(html, filter.xpath, filter.xpath.type)
}

# 要輸入的文本
final_df <- as.data.frame(t(db.content[,2]))
colnames(final_df)<-db.content[,1]

# 建立文本物件
R_corpus <- Corpus(VectorSource(final_df), list(language = NA))

# 清除標點符號
if (filter.removePunctuation == TRUE) {
    R_corpus <- tm_map(R_corpus, removePunctuation)
}

# 清除數字
if (filter.removeNumbers == TRUE) {
    R_corpus <- tm_map(R_corpus, removeNumbers)
}

# 清除大小寫英文與數字
if (filter.removeEnglish == TRUE) {
    R_corpus <- tm_map(R_corpus, function(word) {
        gsub("[A-Za-z]", "", word)
    })
}

# 斷詞
R_corpus <- tm_map(R_corpus, segmentCN, nature = TRUE)

# 詞性過濾前的調整
if (filter.removeEnglish == FALSE) {
    # 如果不過濾英文，那就關閉詞性過濾的設定
    filter.speech.enable <- FALSE
}

# 詞性過濾
R_corpus <- tm_map(R_corpus, function(word) {
    
    if (filter.speech.enable == TRUE) {
        filter.words <- word[(match(names(word), filter.speech, nomatch = -1) > 0)]
        df.speech[filter.words] <<- names(filter.words)
        filter.words
    } else {
        df.speech[word] <<- names(word)
        word
    }
})

# 停用字設定
if (length(colnames(db.stopwords)) > 0) {
    my.stopwords <- c(stopwordsCN(), stopwords("english"), db.stopwords[,1])
} else {
    my.stopwords <- c(stopwordsCN(), stopwords("english"))
}

# 製作詞彙陣列
R_corpus <- Corpus(VectorSource(R_corpus))
tdm <- FALSE
tdm <-  TermDocumentMatrix(R_corpus, control = list(wordLengths = c(filter.term.min.length, Inf), stopwords = my.stopwords))

if (is.object(tdm) == TRUE) {

    m1 <- as.matrix(tdm) # 詞彙分佈儲存在m1裡面


    # ==========================
    # 文字雲執行部分

    # 引用函式
    library("wordcloud") # 文字雲繪圖工具

    # 製作文字雲
    v <- sort(rowSums(m1), decreasing = TRUE)
    d <- data.frame(word = names(v), freq = v)
    wordcloud(d$word, d$freq, min.freq = filter.term.min.freq, random.order = F, ordered.colors = F, 
        colors = rainbow(length(row.names(m1))))


} # if (is.object(tdm) == TRUE) {

#} # if (length(colnames(db.content)) > 0) {
