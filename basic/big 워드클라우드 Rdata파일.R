
setwd("C:/bigdata")

install.packages("twitteR")
install.packages("tm")

library(twitteR)
library(KoNLP) 
library(wordcloud)
library(tm)

data <- load("삼성전자.RData")

df <- do.call("rbind", lapply(rdmTweets, as.data.frame))
df

useSejongDic()
nouns <- sapply(df$text, extractNoun, USE.NAMES=F) 

# 6. 리스트형태의 결과를 벡터로 변환
nouns <-unlist(nouns)
nouns
# nouns 에 있는 단어 중 글자수가 2자 이상인 단어를 검색
nouns <- nouns[nchar(nouns)>=2]
nouns
# 문자열에서 패턴을 검사하여 지정된 문자열로 대치(replace)
nouns <-gsub("\\d+","", nouns) #모든 숫자 제거
nouns <-gsub("삼성","", nouns) 
nouns <-gsub("전국","", nouns) 
nouns <-gsub("연속","", nouns) 
nouns <-gsub("후원","", nouns) 
nouns <-gsub("영향","", nouns) 
nouns <-gsub("권오현","", nouns) 
nouns <-gsub("경기대회","", nouns) 
nouns <-gsub("전자","", nouns)
nouns <-gsub("폰앤케이스.*","", nouns)
nouns <-gsub("한투블로그.*","", nouns)
nouns <-gsub("한국투데이.*","", nouns)
nouns <-gsub("서울=.*","", nouns)
nouns <-gsub("아이","", nouns)
nouns <-gsub("http","", nouns) 
nouns <-gsub("RT","", nouns)
nouns <-gsub("co.*","", nouns)
nouns
nouns <- nouns[nchar(nouns)>=2]
nouns
#단어의 빈도 분석
wordFreq <-table(nouns)
wordFreq

# Step 10. 빈도수가 상위 10개인 단어를 추출하여 그래프를 그립니다.
top10 <- head(sort(wordFreq, decreasing=T),10)
top10
pie(top10, col=rainbow(10))
barplot(top10, col=rainbow(10), las=2)

# Step 11. Word Cloud 형태로 그래픽으로 출력합니다

library(RColorBrewer) # 화면에 출력할 컬러를 사용할 라이브러리를 Loading 합니다.
palette <- brewer.pal(6, "Dark2") # 글자 색깔을 지정합니다.

# min.freq = 최소 언급횟수, rot.per = 단어 배치 각도(0.1=90도), scale = 글자 크기 비율
# colors = 단어의 색 지정, random.order=F이면 빈도가 높을 수록 가운데에 나타남
wordcloud(words=names(wordFreq), freq=wordFreq, scale=c(5, 0.5), rot.per=0.1, 
          random.color=T, colors=palette, min.freq=5, random.order=F )

