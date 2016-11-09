# 宣告資料

# 以自定義數值鍵入資料
group.exp1 <- c(45,47,52,54,57,41,58,59,47,44,57,58,54,59,42,49,52,53,47,41,59,59,45,49,56,50,50,43,52,49)

# 產生隨機亂數30個，最低為50，最多為90
group.exp2 <- runif(30, min=50, max=90) 

# 以常態分配產生亂數30個，平均數為80
group.ctl <- rnorm(30, mean=80, sd=10) 

# 彙整成Data Frame格式 (類似表格)
data <- data.frame(group.exp1, group.exp2, group.ctl) 

# 繪製箱型圖
boxplot(data)