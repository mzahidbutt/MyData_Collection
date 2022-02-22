
activity <- data.frame(opid= c("op01","op02","op03","op04","op05","op06","op07"),
                       units=c(24,43,21,32,13,12,32))
activity

names <- data.frame(operator=c("Larry","Curly", "Moe", "Jack","Jill", "Kim","Perry"))

names

blended = cbind(activity, names)

rblended = rbind(blended,blended)

rblended

activity <- data.frame(operator= c("op01","op02","op03","op04","op05","op06","op07"))

names <- data.frame(operator=c("Larry","Curly", "Moe", "Jack","Jill", "Kim","Perry"))

blended = rbind(activity,names)
blended


# ------------------ 
#Merge

df1 <- data.frame(LETTERS, dfindex= 1:26)
df1

df2 <- data.frame(letters, dfindex = c(1:10, 15,20,22:35))
df2
merge(df1,df2)

View(merge(df1,df2))

merge(df1,df2,all=TRUE)

names(df1) <- c("alpha","lotNumbers")

merge(df1,df2,by.x = "lotNumbers", by.y = "dfindex")
