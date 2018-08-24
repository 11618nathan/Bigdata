setwd("c:/bigdata")

#패키지 설치 라이브러리 호출
install.packages("ggplot2")
install.packages("ggmap")

library(ggplot2)
library(ggmap)

#데이터 파일 loc에 불러들임.
loc <- read.csv("office.csv",header=T)
loc

#center에 지도의 중심부를 나타내 줄 위도 경도 데이터가 필요
center <- c(mean(loc$LON), mean(loc$LAT))
office <- get_map(center, zoom=11, maptype = "roadmap")

#데이터프레임의 칼럼명이 lon위도 lat경도
office.map <- ggmap(office)+geom_point(data=loc, aes(x=LON, y=LAT),size=5,alpha=1, color="red")

#지도에 이름표시
office.map + geom_text(data=loc, aes(x = LON, y = LAT+0.01, label=name),size=3)

#해상도를 지정하고 저장
ggsave("office.png",dpi=1000)
