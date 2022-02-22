
# first time install packages # ----install.packages("xlsx")
#install.packages("readxl")

readxl_example()
library(readxl)
library(xlsx)


data1 <- read_xlsx("C:\\Users\\Zahid Butt\\Documents\\MyData_Collection\\data\\abc.xlsx")

#data2 <- read_xlsx("\\item_Prefix.xlsx")

head(data1)

#------------------------------------------------
#install.packages("rvest")  
  ## First, load required packages (or install if they're not already)
  pkgs = c("rvest", "magrittr", "httr", "stringr")
for (pkg in pkgs){
  if (!require(pkg, character.only = T)){
    install.packages(pkg)
    library(pkg)
  }
}

# examples - 1

popParse <- read_html("https://en.wikipedia.org/wiki/List_of_countries_by_population_in_1900")

str(popParse)

popNodes <- html_nodes(popParse, "table")
popNodes
View(popNodes)

pop <- html_table(popNodes, header = TRUE, fill = TRUE)[[3]]
str(pop)

pop2 <- pop[-1, ]         #remove row 1
head(pop2)

# ----------------------------------
# exampls - 2

library(rvest)

# Start by reading a HTML page with read_html():
starwars <- read_html("https://rvest.tidyverse.org/articles/starwars.html")

# Then find elements that match a css selector or XPath expression
# using html_elements(). In this example, each <section> corresponds
# to a different film
films <- starwars %>% html_elements("section")
films

# Then use html_element() to extract one element per film. Here
# we the title is given by the text inside <h2>
title <- films %>% 
  html_element("h2") %>% 
  html_text2()
title

# Or use html_attr() to get data out of attributes. html_attr() always
# returns a string so we convert it to an integer using a readr function
episode <- films %>% 
  html_element("h2") %>% 
  html_attr("data-id") %>% 
  readr::parse_integer()
episode
