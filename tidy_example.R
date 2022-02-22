
#install.packages("tidyverse")

##install.packages("dplyr")

##install.packages("tidyr")

library(dplyr)

msleep <-read.csv("msleep.csv")

View(msleep)

head(msleep)

sleeptime <- select(msleep, name, sleep_total)

filter(msleep, order == 'Carnivora')
