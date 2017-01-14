# Code Source: https://en.wikibooks.org/wiki/Data_Mining_Algorithms_In_R/Sequence_Mining/SPADE

# 最小支持度：篩選出至少40%的人共有的樣式
minSupport <- 0.4

if(require("arules")){
    print("arules is loaded correctly")
} else {
    print("trying to install arules")
    install.packages("arules")
    if(require(arules)){
        print("arules installed and loaded")
    } else {
        stop("could not install arules")
    }
}

if(require("arulesSequences")){
    print("arulesSequences is loaded correctly")
} else {
    print("trying to install arulesSequences")
    install.packages("arulesSequences")
    if(require(arules)){
        print("arulesSequences installed and loaded")
    } else {
        stop("could not install arulesSequences")
    }
}

library(Matrix)
library(arules)
library(arulesSequences)
library(stringr)

# --------------------------

df = read.csv("input.csv")
trim <- function (x) gsub("^\\s+|\\s+$", "", x)
df$Event_count <- sapply(df$Events, function(x) {
	length(unlist(strsplit(as.character(trim(x)), "\\W+")))
})
df2<-data.frame("score"=df["UserID"],"sequence_length"=df["Timestamp"],"support"=df["Event_count"],"sequence"=df["Events"])
write.table(df2, file="input.txt", row.names=FALSE, col.names=FALSE, sep=" ", quote=FALSE)

# --------------------------

x <- read_baskets("input.txt", info = c("sequenceID","eventID","SIZE"))
s1 <- cspade(x, parameter = list(support = minSupport), control = list(verbose = TRUE))

# -------------

s2<-as(s1, "data.frame")
s2["sequence_length"]<-c(str_count(array(unlist(s2["sequence"])), "\\},\\{")+1)
s2["score"]<-c(s2["sequence_length"]*s2["support"])
s2<-s2[order(s2["score"], decreasing = TRUE),]
s3<-data.frame("score"=s2["score"],"sequence_length"=s2["sequence_length"],"support"=s2["support"],"sequence"=s2["sequence"])
write.table(s3, file="output.csv", row.names=FALSE, sep=",")

# -------------
file.remove("input.txt")