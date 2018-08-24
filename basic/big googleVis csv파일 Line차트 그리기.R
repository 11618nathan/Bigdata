setwd("c:/bigdata")

#googleVis 라이브러리 설치 및 호출
install.packages("googleVis")
library(googleVis)

#csv파일 읽기 변수 설정
pop <- read.csv("Population.csv", header = T)
pop

#Line 차트 지정 변수 양쪽 둘다 설정
Line <- gvisLineChart(pop, options = list(height=500, weight=500))

#plot 차트 그리기
plot(Line)
