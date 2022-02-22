
library(dplyr)

library(datasets)

head(mtcars)

mtcars %>% group_by(cyl) %>% summarise(mean=mean(disp),n=n())

sub_m <- mtcars %>% select(mpg, cyl,disp, hp, gear, carb) %>% mutate(dispxhp = disp*hp)
names(sub_m)

table(mtcars$carb)

sub_m <- mtcars %>% select(mpg, cyl,disp, hp, gear, carb) %>% filter(carb%in% c(4,2,1))

table(mtcars$carb)
