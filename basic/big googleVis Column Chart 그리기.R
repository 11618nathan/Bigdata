setwd("c:/bigdata")

#googleVis 라이브러리 설치 및 호출
install.packages("googleVis")
library(googleVis)

#변수 지정    val1=해당 값1   val2=해당 값2
df=data.frame(country=c("US", "GB", "BR"), val1=c(10, 13, 32), val2=c(23, 12, 32))

#Column차트 지정
Column <- gvisColumnChart(df)

#plot 안에 chart 지정 변수 불러오기
plot(Column)
