setwd("c:/bigdata")

#googleVis ���̺귯�� ��ġ �� ȣ��
install.packages("googleVis")
library(googleVis)

#���� ����    val1=�ش� ��1   val2=�ش� ��2
df=data.frame(database=c("nt", "re", "mo"), val1=c(28, 12, 24), val2=c(11, 15, 33))

#Column��Ʈ ����
Column <- gvisColumnChart(df)

#plot �ȿ� chart ���� ���� �ҷ�����
plot(Column)