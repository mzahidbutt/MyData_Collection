# Data Collection and Data Wrangles

if (!file.exists("data")){
  dir.create("data")
}
  
#setwd("./data")


fileurl <- "https://www.stats.govt.nz/assets/Uploads/Annual-enterprise-survey/Annual-enterprise-survey-2020-financial-year-provisional/Download-data/annual-enterprise-survey-2020-financial-year-provisional-csv.csv"       
destfile <- "test.csv"           
download.file(fileurl,destfile)


list.files("./Data")
 ## "cameras.csv"
        
dateDownloaded <- date()
dateDownloaded
           
# ---------------------------------


