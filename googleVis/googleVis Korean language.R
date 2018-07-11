# googleVis 한글 폰트 깨짐 방지
header <- mychart$html$header
header <- gsub("charset=utf-8", "charset=euc-kr", header)
mychart$html$header <- header