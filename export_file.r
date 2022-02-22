# Data Collection and Data Wrangles

if (!file.exists("data")){
  dir.create("data")
}
  
#setwd("./data")


fileurl <- "https://www.stats.govt.nz/assets/Uploads/Annual-enterprise-survey/Annual-enterprise-survey-2020-financial-year-provisional/Download-data/annual-enterprise-survey-2020-financial-year-provisional-csv.csv"       
destfile <- "./data/test.csv"           
download.file(fileurl,destfile)


list.files("./data")
 ## "cameras.csv"
        
dateDownloaded <- date()
dateDownloaded
           
# ---------------------------------
# reading csv file

mydata <- read.table("./data/test.csv", sep= ",", header =TRUE)
head(mydata)

data1 <- fread("./data/test.csv")
data1 <- data.table::fread("./data/test.csv")
head(data1)
data1


install.packages()