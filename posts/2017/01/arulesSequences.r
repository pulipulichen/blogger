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
x <- read_baskets(con = system.file("misc", "arulesSequencesData.txt", package = "arulesSequences"), info = c("sequenceID","eventID","SIZE"))
s1 <- cspade(x, parameter = list(support = minSupport), control = list(verbose = TRUE))
summary(s1)
as(s1, "data.frame")