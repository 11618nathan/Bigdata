setwd("c:/bigdata")

#googleVis 라이브러리 설치 및 호출
install.packages("googleVis")
library(googleVis)

#csv파일 읽기 변수 설정
fruits <- read.csv("fruits.csv")

Bubble <- gvisBubbleChart(fruits, idvar="Fruit", xvar="Sales", yvar="Expenses", colorvar="Year", sizevar="Profit", options=list(hAxis="{minValue:75, maxValue:125}", vAxis="{minValue:60, maxValue:100}"))


#plot 차트 그리기
plot(Bubble)

