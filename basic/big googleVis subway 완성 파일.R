setwd("c:/bigdata")

#googleVis 라이브러리 설치 및 호출
install.packages("googleVis")
library(googleVis)

#데이터 파일 loc에 불러들임. 
loc <- read.csv("subway2.csv",header=T)
loc

#변수 이름과 파일 이름 같이.
subway <- gvisMap(loc, "LATLON" , "name",
                  options=list(showTip=TRUE, showLine=TRUE, enableScrollWheel=TRUE,
                               mapType='normal', useMapTypeControl=TRUE,
                               width=1000,height=400))

#플롯 차트 괄호 안  변수 이름 같이
plot(subway)

