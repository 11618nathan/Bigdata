text<- "텍스트마이닝은 자연어 (Natural Language)로 구성된 비정형데이터 (unstructured data)에서 패턴 또는 관계를 추출하여 의미있는 정보를 찾아내는 기법으로, 컴퓨터가 사람들이 말하는 언어를 이해할 수 있는 자연어 처리 (Natural Language Processing)에 기반으로 둔 기술이다. 트위터, 페이스북과 같은 소셜 미디어에서 생산되는 데이터는 비정형데이터이기 때문에 텍스트마이닝을 이용하여 분석할 수 있다.

텍스트마이닝은 말 그대로 텍스트 형태의 비정형데이터에 마이닝 기법을 적용한 것이다. 즉, 텍스트에 나타나는 단어를 분해, 정제하고, 특정 단어의 출현빈도 등을 파악하여 단어들 간의 관계를 조사하는 기법이다. 

데이터마이닝 (data mining)은 대규모 DB에 저장된 정형화된 데이터로부터 정보를 찾아내는 기법이라면 텍스트마이닝은 비정형화된 텍스트 문서에서 정보를 찾아내는 기법이라 할 수 있다.
그림 2.1은  데이터마이닝 과 텍스트마이닝의 관계를 나타내는 그림이다."

library(KoNLP) 
library(wordcloud) 

useSejongDic()
nouns <- extractNoun(text) 

nouns <- nouns[nchar(nouns)>=2] #명사 중에서 2개 글자이상만 검색

nouns <-gsub("텍스트마이닝.*","텍스트마이닝", nouns)
nouns <-gsub("데이터마이닝.*","데이터마이닝", nouns)

wordFreq <-table(nouns)  #빈도 계산
pal <- brewer.pal(6, "Dark2")


wordcloud(words=names(wordFreq), freq=wordFreq, colors=pal, min.freq=1, 
          random.order=F)

