# tidy titanic data
library(dplyr)
library(readr)
library(stringr)
library(tidyr)
library(ggplot2)
test <- read_csv(file = "test.csv",col_names = T)
train <- read_csv(file = "train.csv",col_names = T)
gender_sub <- read_csv(file = "gender_submission.csv",col_names = T)
# merge_test <- left_join(test,gender_sub,by="PassengerId")
#---data explore by visualazation--
# try each var to surive
# pclass
plcass <- select(train,c('PassengerId','Survived','Pclass')) %>% 
  group_by(Pclass) %>%
  summarise(mean_surived = mean(Survived)) %>% 
  ggplot(aes(x=Pclass,y=mean_surived,color=factor(Pclass)))+
  geom_point()
ggsave(filename = 'pclass',plot = plcass,width = 8,height = 6,dpi = 300)
# sex
sex <- select(train,c('PassengerId','Survived','Sex')) %>% 
  group_by(Sex) %>%
  summarise(mean_surived = mean(Survived)) %>% 
  ggplot(aes(x=Sex,y=mean_surived,color=Sex))+
  geom_point()
ggsave(filename = 'sex.png',plot = sex,width = 8,height = 6,dpi = 300)
# age
train$Age2 <- train$Age
train$Age2[which(train$Age < 1)] <- 1
train$Age2 <- cut(train$Age2,breaks = seq(from=0,to=80,by=10),labels = F)
age <- select(train,c('PassengerId','Survived','Age2')) %>% 
  filter(!is.na(Age2)) %>% 
  group_by(Age2) %>%
  summarise(mean_surived = mean(Survived)) %>% 
  ggplot(aes(x=Age2,y=mean_surived,color=factor(Age2)))+
  geom_point(size=2.0)
ggsave(filename = 'age.png',plot = age,width = 8,height = 6,dpi = 300)

