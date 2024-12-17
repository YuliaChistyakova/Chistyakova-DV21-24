rm()
setwd("C:/Modinf/Yaroslav")
# Импортируем необходимые библиотеки
#install.packages()
library(tidyverse)
library(stats)

# Загружаем данные из таблицы
data <- read.csv("greendb.csv")

# Фильтруем данные для деревьев родов Сосна и Лиственица
sосna_data <- data %>% filter(adm_region == "район Орехово-Борисово Северное",species_ru == "Сосна обыкновенная")
listvenica_data <- data %>% filter(adm_region == "район Орехово-Борисово Северное",species_ru == "Лиственница европейская")

#Удалим лишние столбцы и объединим таблицы
sосna_data <- sосna_data[,-3]
listvenica_data <- listvenica_data[,-3]
sосna_data <- sосna_data[,-5]
listvenica_data <- listvenica_data[,-5]
derevo <- rbind(listvenica_data,sосna_data)

derevo.aov <- aov(d_trunk_m ~ species_ru, data = derevo)
summary(derevo)
derevo_resid <- residuals(object = derevo.aov)
shapiro.test(x = derevo_resid)
summary(derevo.aov)
anova(derevo.aov)
