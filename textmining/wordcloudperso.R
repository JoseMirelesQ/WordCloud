library("tm")
library("SnowballC")
library("wordcloud")
library("RColorBrewer")

#text <- readLines(file.choose())

filePath <- "C:/Users/430006064/Documents/R/textmining/temp/Julie.txt"
text <- readLines(filePath)
docs <- Corpus(VectorSource(text))

inspect(docs)

toSpace <- content_transformer(function (x , pattern ) gsub(pattern, " ", x))
docs <- tm_map(docs, toSpace, "-")


# Convert the text to lower case
docs <- tm_map(docs, content_transformer(tolower))
# Remove numbers
docs <- tm_map(docs, removeNumbers)
# Remove spanish common stopwords
docs <- tm_map(docs, removeWords, stopwords("english"))
# Remove your own stop word
# specify your stopwords as a character vector
docs <- tm_map(docs, removeWords, c("thou","thy","romeo","juliet","will","thee","shakespeare","william")) 
# Remove punctuations
docs <- tm_map(docs, removePunctuation)
# Eliminate extra white spaces
docs <- tm_map(docs, stripWhitespace)

dtm <- TermDocumentMatrix(docs)
m <- as.matrix(dtm)
v <- sort(rowSums(m),decreasing=TRUE)
d <- data.frame(word = names(v),freq=v)
head(d, 10)


set.seed(1234)
wordcloud(words = d$word, freq = d$freq, min.freq = 1,
          max.words=200, random.order=FALSE, rot.per=0.35, 
          colors=brewer.pal(8, "Accent"))

wordcloud2(data = d)
figPath <- system.file("C:/Users/430006064/Documents/R/textmining/temp/descarga.png",package = "wordcloud2")
wordcloud2(d, figPath = figPath, shape="star", size = 1.5,color = "skyblue")

wordcloud2(d, shape="square", size = .5,color = "skyblue")

letterCloud(d, word = "Raul", size = 1)



figPath <- "C:/Users/430006064/Documents/R/textmining/temp/tweet.png"
wordcloud2(d, figPath = figPath, size = 1.5,color = "skyblue")

class(d)
set.seed(1234)
hdi<-data.frame(c("HDI","Israel","Ramirez","Jean","Arreola","Ricardo","Murguia","Rebeca","Linares","Carmen","de Alba","Pamela","Hernandez","Dileri","Linares","Manuel","Mireles"),c(3,rep(1,16)))
wordcloud2(hdi, figPath = figPath, size = .8,color = "skyblue")
wordcloud2(hdi, shape="star", size = 1.5,color = "skyblue")

getwd()