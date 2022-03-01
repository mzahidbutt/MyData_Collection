
#install.packages("wordcloud")
#install.packages("tm")
#install.packages("slam")
#install.packages("pacman")
library(wordcloud)
library(tm)

#fileurl <- "https://data.baltimorecity.gov/api/views/dz54-2ary/rows.csv?accesstype=DOWNLOAD"
#download.file(fileurl,destfile="./data.cameras.csv")

if (!file.exists("data")) {
  dir.create("data")
}
fileUrl <- "https://data.baltimorecity.gov/api/views/dz54-
2aru/rows.csv?accessType=DOWNLOAD"
download.file(fileUrl, destfile = "./data/cameras.csv")
dateDownloaded <- date()



cameraData <- read.csv("./data/cameras.csv")
names(cameraData)
wd<- d$Year
wordcloud(cameraData, scale=c(5,0.5), random.order= FALSE,
           rot.per=0.35, use.r.layout=FALSE,
           colors=brewer.pal(8,"Dark2"))
