

x<-c(1:4,NA,6:7,NA)
is.na(x)

df <- data.frame(col1=c(1:3,NA), col2= c("this",NA,"is", "text"),
                 col3=c(TRUE,FALSE, TRUE,TRUE),col4=c(2.5,4.2,3.2,NA),stringsAsFactors=FALSE)

is.na(df)

sum(is.na(df))                 

which(is.na(df))                 

colSums(is.na(df))

#-----------

x<-c(1:4,NA,6:7,NA)

x[is.na(x)] <- mean(x,na.rm=TRUE)
x

round(x,2)

# assign default value to frame and replace 99 to NA
df<-data.frame(col1=c(1:3,99), col2=c(2.5,4.2,99,3.2))
df
df[df==99]<-NA
df


complete.cases(df)

df[complete.cases(df),]

na.omit(df)

# Exercise to check airquality value

airquality
