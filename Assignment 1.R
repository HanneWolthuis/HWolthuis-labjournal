########################### Title: Introducation to R for SNA Author: J Tolsma version: 30-10-2019

# start with clean workspace
rm(list = ls())

# install.packages I will need later here
install.packages("installr")  
require(installr)  # then you will need to load them. This package is used to simply update R
install.packages("foreign")
require(foreign)  # used to read in spss data files
require(tidyverse)
install.packages("haven")  
require (haven)
# update if necessarry. Best to run this command in RGui, not in RStudio.
updateR()

# define workdirectory, note the double backslashes
setwd("C:/Users/hanne/OneDrive/Documents/Social and Cultural Research/Social networks/HWolthuis-labjournal")  # change to your own workdirectory








####### reading spss files

# ignore the warnings ?read.spss note that I have saved the data files in a folder called
# 'addfiles'.

cv08 <- foreign::read.spss("Cultural_Changes_2008.sav", use.value.labels = T, to.data.frame = T)
cv10 <- foreign::read.spss("Cultural_Changes_2010.sav", use.value.labels = T, to.data.frame = T)

# normally I think setting use.value.labels=F is more convenient. Thus lets load the data again but
# now without labels
cv08_nolab <- foreign::read.spss("Cultural_Changes_2008.sav", use.value.labels = F, to.data.frame = T)
cv10_nolab <- foreign::read.spss("Cultural_Changes_2010.sav", use.value.labels = F, to.data.frame = T)

# finally, import the data using haven
cv08_haven <- haven::read_spss("Cultural_Changes_2008.sav")
cv10_haven <- haven::read_spss("Cultural_Changes_2010.sav")

str(cv08)
str(cv08_haven)

str(cv08$lftop)  # a factor
str(cv08_nolab$lftop)  # a numeric variable

# to access specific attributes
attr(cv08_haven$lftop, "labels")

names(cv08_haven)
summary(cv08_haven)
head(cv08_haven)
# fix(cv08_haven) #will produce an error
fix(cv08)
View(cv08_haven)





############ Define missings 

str(cv08_haven$lftop)
summary(cv08_haven$lftop)
attr(cv08_haven$lftop, "labels")
table(cv08_haven$lftop, useNA = "always")

cv08$lftop_new <- cv08$lftop

cv08$lftop_new[cv08$lftop_new == "Onbekend"] <- NA

table(cv08$lftop_new, useNA = "always")
