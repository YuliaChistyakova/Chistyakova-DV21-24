rm()
setwd("C:/Modinf/Zadanie1")
# Импортируем необходимые библиотеки
library(tidyverse)
library(stats)

# Загружаем данные из таблицы
data <- read.csv("greendb.csv")

# Фильтруем данные для деревьев родов Сосна и Лиственица
sосna_data <- data %>% filter(adm_region == "район Орехово-Борисово Северное",species_ru == "Сосна обыкновенная")
listvenica_data <- data %>% filter(adm_region == "район Орехово-Борисово Северное",species_ru == "Лиственница европейская")

# Считаем средние и сравниваем
mean_socna=mean(sосna_data$d_trunk_m)
mean_socna
mean_listv=mean(listvenica_data$d_trunk_m)
mean_listv


