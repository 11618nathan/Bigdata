# googleVis �ѱ� ��Ʈ ���� ����
header <- mychart$html$header
header <- gsub("charset=utf-8", "charset=euc-kr", header)
mychart$html$header <- header