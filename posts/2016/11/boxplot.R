# 產生資料
group.exp1 <- rnorm(30, mean=50, sd=10) # 以常態分配產生亂數30個，平均數為50
group.exp2 <- runif(30, min=50, max=90) # 產生隨機亂數30個，最低為50，最多為90
group.ctl <- rnorm(30, mean=80, sd=10) # 以常態分配產生亂數30個，平均數為80

# 彙整成Data Frame格式 (類似表格)
data <- data.frame(group.exp1, group.exp2, group.ctl) 

# 繪製箱型圖
boxplot(data)