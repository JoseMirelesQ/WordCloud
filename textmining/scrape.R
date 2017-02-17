library(rvest)
library(xml2)

url <- "http://www.opensourceshakespeare.org/views/plays/play_view.php?WorkID=hamlet&Act=4&Scene=3&Scope=scene"

read_html(url)%>%
  html_nodes(css = ".playtext")%>%
  html_text()