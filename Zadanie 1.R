#Задание 1. Чистякова
#для района Орехово-Борисово Северное докажите что 
#диаметр стволов родов Лиственница и Сосна значимо отличаются.
rm(list=ls())
setwd("C:/Modinf/modeling")
# Импортируем необходимые библиотеки
#install.packages()
library(tidyverse)
library(stats)

# Загружаем данные из таблицы
derev <- read.csv("greendb.csv")

spec=derev$species_ru
genus=stringr::str_split(spec, pattern=" ",simplify=T)[,1]
derevo=derev%>%mutate(Genus=genus)

derevo=derevo%>%filter(Genus%in% c("Лиственница","Сосна")) %>%
  filter(adm_region=="район Орехово-Борисово Северное")

derev$Genus%>%unique()
derev$adm_region%>%unique()

derevo.aov <- aov(d_trunk_m ~ Genus, data = derevo)
summary(derevo.aov)
# нет значимых различий между высотами.т.к. p>0,05 принимаем Но
