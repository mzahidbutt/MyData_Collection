
################################################
############### Check Directory ################
################################################
if (!file.exists("data")) {
  dir.create("data")
}

setwd('./data')
setwd('../')


################################################
################ Download Files ################
################################################

fileUrl <- "https://data.baltimorecity.gov/api/views/dz54-2aru/rows.csv?accessType=DOWNLOAD"

download.file(fileUrl, destfile = "./data/cameras.csv")
list.files("./data")

cdata <- read.table('./data/cameras.csv', sep = ',', header = TRUE)

cameradata <- read.csv('cameras.csv')
# structure of data 
str(cameradata)


################################################
############ Read xlsx data file ###############
################################################
# To write xlsx data file
library(readxl)
readxl_example()

xlsx_example <- readxl_example("type-me.xls")
#file read
diris = read_excel(xlsx_example)

dd <- read_excel("cameras.xlsx")

# Exercise: Try examples
?read_excel 

# To write xlsx data file
devtools::install_github("ropensci/writexl")

library(writexl)
write_xlsx(cdata, "./data/cameras.xlsx")


#############################################
############## HTML webpage #################
#############################################
#Read HTML webpage
library(rvest)

theurl <- "http://en.wikipedia.org/wiki/Brazil_national_football_team"
file<-read_html(theurl)

#Read Table from webpage
tables<-html_nodes(file, "table")
table1 <- html_table(tables[4], fill = TRUE)

?html_text


#############################################
################ Data Table #################
#############################################
library(data.table)
DF = data.frame(x=rnorm(9), y=rep(c("a", "b", "c"), each=3), z=rnorm(9))
head(DF, 3)

DT = data.table(x=rnorm(18), y=rep(c("a", "b", "c"), each=3), z=rnorm(18))
head(DT, 3)

tables()

DT[,list(mean(x), sum(z))]
DT[,table(y)]



##################################################
### Combine two Data frames by Rows or Columns ###
##################################################

# cbind in r - data for example
activity <-data.frame(opid=c("Op01","Op02","Op03",
                             "Op04","Op05","Op06","Op07"),
                      units=c(23,43,21,32,13,12,32))
names <- data.frame(operator=c("Larry","Curly","Moe",
                               "Jack","Jill","Kim","Perry"))
blended <- cbind(activity, names)
blended

sourceofhire <- data.frame(found=c("Movie","Movie","Movie",
                                   "Book","Book","TV","TV"))
blended <- cbind(activity, names, sourceofhire)
blended


# rbind
rblended <- rbind(blended, blended)
rblended


# merge with common field
# Need some data to play with
df1 <- data.frame(LETTERS, dfindex = 1:26)
df2 <- data.frame(letters, dfindex = c(1:10,15,20,22:35))

# INNER JOIN: returns rows when there is a match in both tables.
merge(df1, df2)

# FULL (outer) JOIN: all records from both the tables and fill in NULLs for missing matches on either side.
merge(df1,df2, all=TRUE)

# what if column names don't match?
names(df1) <- c("alpha", "lotsaNumbers")

merge(df1, df2, by.x = "lotsaNumbers", by.y = "dfindex")


#############################################
################### Dplyr ###################
#############################################
library(dplyr)
library(datasets)
head(mtcars)

sub_m <- mtcars %>% 
  select(mpg, cyl, disp, hp, gear, carb) %>% 
  mutate(dispxhp = disp*hp)

names(sub_m)

table(mtcars$carb)

sub_m <- mtcars %>% 
  select(mpg, cyl, disp, hp, gear, carb) %>% 
  filter( carb %in% c(4,2,1))

table(sub_m$carb)

mtcars %>% 
  select(mpg, cyl, disp, hp, gear, carb) %>% 
  filter( carb %in% c(4,2,1)) %>%
  group_by(cyl) %>%
  summarise(hp_mean=mean(hp), disp_mean=mean(disp), n=n())




#############################################
################### Tidyr ###################
#############################################




#########################################################
################### Text Data Cleaning ##################
#########################################################
library(tm)

sentence=c('this is my 1st try example.','A person is nice', ' we can divide 10 with 2', 'Ahmed is a Gentle man')

txt <- Corpus(VectorSource(sentence))
txt_data<-tm_map(txt,stripWhitespace)
txt_data<-tm_map(txt_data,tolower)
txt_data<-tm_map(txt_data,removeNumbers)
txt_data<-tm_map(txt_data,removePunctuation)
txt_data <-tm_map(txt_data,removeWords, stopwords("english"))
#user define words to remove
txt_data <- tm_map(txt_data, removeWords,
                   c("and","the","our","that","for","are","also","more","has","must","have","should","this","with"))

df <- data.frame(cln_text=unlist(txt_data), stringsAsFactors=F)
df$cln_text



#################################################
################# Word Cloud ####################
#################################################
library(wordcloud)
wordcloud (txt_data)

#from Cameras dataset
d <- read.csv('./data/cameras.csv')
names(d)
wd <- d$street
wordcloud(wd, scale=c(5,0.5), random.order=FALSE, 
           rot.per=0.35, use.r.layout=FALSE, colors=brewer.pal(8, "Dark2"))


