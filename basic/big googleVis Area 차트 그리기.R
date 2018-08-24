setwd("c:/bigdata")

# googleVis 라이브러리 설치 및 호출
install.packages("googleVis")
library(googleVis)

# 변수 지정    val1=해당 값1   val2=해당 값2
df=data.frame(country=c("nt", "re", "mo"), val1=c(28, 12, 24), val2=c(11, 15, 33))

# Area차트 지정
Area <- gvisAreaChart(df)

# plot 안에 chart 지정 변수 불러오기
plot(Area)
