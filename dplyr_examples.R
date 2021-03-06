
library(dplyr)

chicago <- readRDS("./data/chicago.rds")


dim(chicago)

str(chicago)

names(chicago)[1:3]

subset <- select(chicago, city:dptp)

subset

head(subset)

select(chicago, -(city:dptp))

i <- match("city", names(chicago))
j <- match("dptp", names(chicago))
head(chicago[, -(i:j)])

subset <- select(chicago, ends_with("2"))
str(subset)

subset <- select(chicago, starts_with("d"))
str(subset)

chic.f <-filter(chicago, pm25tmean2 > 30)
str(chic.f)

summary(chic.f$pm25tmean2)
chic.f <- filter(chicago, pm25tmean2 > 30 & tmpd > 80)

select(chic.f, date, tmpd, pm25tmean2)                 

chicago <- arrange(chicago, date)

head(select(chicago, date, pm25tmean2), 10)

select(chicago, date, pm25tmean2)

tail(select(chicago, date, pm25tmean2), 5)

chicago <- arrange(chicago, desc(date))

head(select(chicago, date, pm25tmean2), 10)

head(chicago[,1:5],3)

chicago <- rename(chicago, dewpoint = dptp, pm25 = pm25tmean2)

head(chicago[,1:5],3)

chicago <- mutate(chicago, pm25detrend = pm25 - mean(pm25, na.rm = TRUE))

head(chicago)

head(transmute(chicago, pm10detrend = pm10tmean2 - mean(pm10tmean2, na.rm = TRUE),
                              o3detrend = o3tmean2 - mean(o3tmean2, na.rm = TRUE)))

chicago <- mutate(chicago, year = as.POSIXlt(date)$year + 1900)

years <- group_by(chicago, year)

summarize(years, pm25 = mean(pm25, na.rm = TRUE), 
                     o3 = max(o3tmean2, na.rm = TRUE), 
                    no2 = median(no2tmean2, na.rm = TRUE))

qq <- quantile(chicago$pm25, seq(0, 1, 0.2), na.rm = TRUE)

chicago <- mutate(chicago, pm25.quint = cut(pm25, qq))

quint <- group_by(chicago, pm25.quint)

summarize(quint, o3 = mean(o3tmean2, na.rm = TRUE), 
                    no2 = mean(no2tmean2, na.rm = TRUE))


mutate(chicago, pm25.quint = cut(pm25, qq)) %>%    
           group_by(pm25.quint) %>% 
           summarize(o3 = mean(o3tmean2, na.rm = TRUE), 
                                         no2 = mean(no2tmean2, na.rm = TRUE))


mutate(chicago, month = as.POSIXlt(date)$mon + 1) %>% 
           group_by(month) %>% 
           summarize(pm25 = mean(pm25, na.rm = TRUE), 
                                         o3 = max(o3tmean2, na.rm = TRUE), 
                                        no2 = median(no2tmean2, na.rm = TRUE))


#-----------------------------------------------
# graph samples
# Air Pollution data

pollution <- read.csv("data/ad_viz_plotval_data.csv")

dim(pollution)

str(pollution)


# Remove columns
pollution <- pollution[,c(-3,-6:-12) ]


# summaries columns 
summary(pollution$Daily.Mean.PM2.5.Concentration)

#plot box plot graph
boxplot(pollution$Daily.Mean.PM2.5.Concentration, col = "green")
abline(h=12)


#Histogram plot
hist(pollution$Daily.Mean.PM2.5.Concentration,col="green")
rug(pollution$Daily.Mean.PM2.5.Concentration)

#Histogram plot with further break
hist(pollution$Daily.Mean.PM2.5.Concentration,col="green", breaks = 100)
rug(pollution$Daily.Mean.PM2.5.Concentration)
abline(v=15, lwd = 2)
abline(v=median(pollution$Daily.Mean.PM2.5.Concentration), col = "red", lwd= 2)

# bar plot 
barplot(table(pollution$COUNTY),col="blue", main =  "Number of Record per country")

# Multiple Box blot

boxplot(Daily.Mean.PM2.5.Concentration ~ COUNTY, data = pollution, color="red")
abline(h = 12, lwd = 2)

# scatter plot
par(mfrow = c(2,1), mar = c(4,4,2,1))
pollution$Date = as.Date(pollution$Date, "%m/%d/%y")
plot(pollution$Date, pollution$Daily.Mean.PM2.5.Concentration)
abline(h = 12, lwd = 3, col = "blue")
     