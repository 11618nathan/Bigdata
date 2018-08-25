# 1 . 작업용 디렉터리를 지정
setwd("C:/bigdata")


# 2. 필요한 패키지를 설치 한 후 R 에 loading 합니다
install.packages("KoNLP")
install.packages("wordcloud")

library(KoNLP) 
library(wordcloud) 

# 3. 분석용 데이터를 변수로 읽어 들입니다.
ahn <-  readLines("ahn.txt") #한줄 한줄 읽고 각 줄이 벡터에서 하나의 원소가 된다.
ahn
# 4. 사전에 단어추가 - 안철수, 박근혜, 문재인, 대한민국 을 추가
useSejongDic() 

mergeUserDic(data.frame(c('안철수', '박근혜','문재인', '대한민국'), "ncn"))

# 5. 텍스트가 여러 개의 문장으로 구성되어있는 경우 각각의 문장에 대하여 특정함수(extractNoun)를 적용 
nouns <-sapply(ahn, extractNoun, USE.NAMES=F) #nouns :리스트
nouns
# 6. 리스트형태의 결과를 벡터로 변환
nouns <-unlist(nouns)
nouns
# nouns 에 있는 단어 중 글자수가 2자 이상인 단어를 검색
nouns <- nouns[nchar(nouns)>=2]
nouns
# 문자열에서 패턴을 검사하여 지정된 문자열로 대치(replace)
nouns <-gsub("하게","", nouns) #"하게"를 제거
nouns
#단어의 빈도 분석
wordFreq <-table(nouns)
wordFreq
# Step 10. 빈도수가 상위 5개인 단어를 추출하여 그래프를 그립니다.
top5 <- head(sort(wordFreq, decreasing=T),5)
top5
pie(top5, col=rainbow(10))
barplot(top5, col=rainbow(10))

# Step 11. Word Cloud 형태로 그래픽으로 출력합니다

library(RColorBrewer) # 화면에 출력할 컬러를 사용할 라이브러리를 Loading 합니다.
palette <- brewer.pal(6, "Dark2") # 글자 색깔을 지정합니다.

# min.freq = 최소 언급횟수, rot.per = 단어 배치 각도(0.1=90도), scale = 글자 크기 비율
# colors = 단어의 색 지정, random.order=F이면 빈도가 높을 수록 가운데에 나타남
wordcloud(words=names(wordFreq), freq=wordFreq, scale=c(5, 1), rot.per=0.1, 
          random.color=T, colors=palette, min.freq=2, random.order=F )




