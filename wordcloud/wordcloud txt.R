text <- "텍스트 마이닝(text mining): 자연어(natural language)로 구성된 비정형 텍스트 데이터에서 패턴 또는 관계를 추출하여 가치와 의미 있는 정보를 찾아내는 마이닝 기법으로 자연어 처리(natural language processing) 기술에 기반한 방법이다. 소셜 미디어에서 생산되는 데이터는 비정형 데이터이기 때문에 텍스트 마이닝을 이용하여 분석한다. SNS 등을 물론, 온라인 뉴스 등 웹 상에 존재하는 방대한 비정형 데이터를 실시간으로 수집, 분석하여 고객의 감성 및 의도 등을 분석해 내는 과정이다. 텍스트 형태의 비정형 데이터에 마이닝 기법을 적용한다. 텍스트에 나타나는 단어를 분해, 정제하고, 특정 단어의 출현빈도 등을 파악하여 단어들 간의 관계를 조사하는 기법이다. 따라서, 텍스트 마이닝과 데이터 마이닝은 둘다 패턴을 추출한다는 점에서 공통점이 있으나 어디에서 패턴을 추출하는가에 대해서는 차이점이 있다. 텍스트 마이닝은 정형화된 데이터보다는 비정형화된 텍스트로부터 패턴을 추출한다는 점에서 차이가 있다."

install.packages("KoNLP")
install.packages("wordcloud")
library(KoNLP) 
library(wordcloud)

useSejongDic()
nouns <- extractNoun(text) 

#명사 중에서 2개 글자 이상만 검색
nouns <- nouns[nchar(nouns)>=2]

nouns <-gsub("텍스트마이닝.*","텍스트마이닝", nouns)
nouns <-gsub("데이터마이닝.*","데이터마이닝", nouns)

# 빈도 계산
wordFreq <-table(nouns)
pal <- brewer.pal(6, "Dark2")

wordcloud(words=names(wordFreq), freq=wordFreq, colors=pal, min.freq=1, random.order=F)
