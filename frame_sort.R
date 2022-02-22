
set.seed(13435)
x<-data.frame("var1"=sample(1:5),"var2"=sample(6:10),"var3"=sample(11:15))

x<- x[sample(1:5),]
x$var2[c(1,3)]= NA
x                            
x[,1]
x[,2]
x[,3]

x[,"var1"]
x[,"var2"]
x[,"var3"]

x[1,3,"var1"]

x[x$var1 <= 2 & x$var3 >= 9 ,]

x[x$var1 <= 2 | x$var3 >= 14 ,]


# Sort Functions

sort(x$var1)

sort(x$var3,decreasing=TRUE)

order(x$var1,x$var3)

x[order(x$var1),]

x[order(x$var1,x$var3),]
s