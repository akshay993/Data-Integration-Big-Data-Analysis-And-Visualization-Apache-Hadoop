library('RCurl')
library('XML')
library(Rcrawler)

## Read all articles collected so far
setwd("../Data")
Articles <- read.csv("NYTimes_Articles_Collected")
Articles <- subset(Articles, select = -c(X))
setwd("../code")

#Rcrawler(Website = "https://www.nytimes.com/aponline/2018/03/20/world/europe/ap-eu-britain-facebook-cambridge-analytica-the-latest.html", no_cores = 4, no_conn = 4, ExtractXpathPat = c("//h1","//article"), PatternsNames = c("Title","Content"))

## Using rcrawler to extract the article from URL (present in "Articles")
## try is used for error handling
## A total word count is done on the article to elimninate duplicates

for (i in c(1:nrow(Articles))){
  if (i==1){
    try(Data<-ContentScraper(Url = toString(Articles$web_url[i]), XpathPatterns =c("//h1","//article"), PatternsName = c("Title","Content")))
    content <-data.frame(Data)
    wordcount <- length(unlist(strsplit(toString(content$Content[1])," ")))
    content <- cbind(content,wordcount)
  }
  if (i>1){
    try(Data <- ContentScraper(Url = toString(Articles$web_url[i]), XpathPatterns =c("//h1","//article"), PatternsName = c("Title","Content")))
    temp <- data.frame(Data)
    wordcount <- length(unlist(strsplit(toString(temp$Content[1])," ")))
    temp <- cbind(temp,wordcount)
    content <- rbind(content,temp)
  }
  print(i)
}

## Eliminating duplicates caused by error handling
content = content[!duplicated(content$wordcount),]

## Saving the article extracted
setwd("../Data")
write.csv(content,"NYTimes_Articles_data")
setwd("../code")