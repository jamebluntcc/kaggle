# tidy titanic data
library(dplyr)
library(readr)
library(stringr)
library(tidyr)
test <- read_csv(file = "test.csv",col_names = T)
train <- read_csv(file = "train.csv",col_names = T)
gender_sub <- read_csv(file = "gender_submission.csv",col_names = T)
merge_test <- left_join(test,gender_sub,by="PassengerId")
#---data explore by visualazation--
# try each var to surive
