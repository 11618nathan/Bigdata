setwd("c:/bigdata")

#googleVis 라이브러리 설치 및 호출
install.packages("googleVis")
library(googleVis)

#데이터 파일 loc에 불러들임. 
loc <- read.csv("wifi.csv",header=T)
loc

#변수 이름과 파일 이름 같이.
wifi <- gvisMap(loc, "LATLON" , "name",
                   options=list(showTip=TRUE, showLine=TRUE, enableScrollWheel=TRUE,
                                mapType='normal', useMapTypeControl=TRUE))

#플롯 차트 변수 이름 같이
plot(wifi)

