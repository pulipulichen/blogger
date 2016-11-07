# 引用函式
library("RPostgreSQL") # PostgreSQL資料庫連線需要的套件
library("tm") # 文本探勘工具
library("tmcn") # 文本探勘中文包
library("Rwordseg") # 中文斷詞工具
library("XML") # XML處理工具

# 資料庫連接
drv <- dbDriver("PostgreSQL")
con <- dbConnect(drv, dbname = db.name,
                 host = db.host, port = db.port,
                 user = db.user, password = db.password)

# 資料庫查詢
db.content <- dbGetQuery(con, sql.content)
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
    tryCatch({
        html <- htmlParse(db.content[,2], encoding="utf8")
        db.content[,2] <- xpathSApply(html, filter.xpath, filter.xpath.type)
    })
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

    # 儲存結果之前先清除該文本的詞頻資料
    where_sql <- ""
    for (doc_id in colnames(m1)) {
        if (where_sql != "") {
            where_sql <- paste0(where_sql, ' OR')
        }
        where_sql <- paste0(where_sql,  " ",db.term_freq.field_name.doc_id," = '",doc_id, "'")
    }
    if (where_sql != "") {
        sql.term_freq.delete.docs = paste0("DELETE FROM ",db.term_freq.table_name," WHERE ", where_sql)
        dbSendQuery(con, sql.term_freq.delete.docs)
    }

    # 儲存詞頻結果，寫入資料庫
    for (doc_id in colnames(m1)) {
        for (term in rownames(m1)) {
            freq = m1[term,doc_id]
            if (freq > 0 && freq > filter.term.min.freq) {
                sql.term_freq.insert = paste0("INSERT INTO term_freq (",db.term_freq.field_name.doc_id,",",db.term_freq.field_name.term,",",db.term_freq.field_name.speech,",",db.term_freq.field_name.freq,") VALUES ('", doc_id, "', '",term,"', '",df.speech[term],"', ",freq,")")
                dbSendQuery(con, sql.term_freq.insert)
            }
        }
    }
}