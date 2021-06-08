### Base de datos USAID 
### 7 de junio de 2021
### Pregunta: A donde van los recursos de USAID a México

####1. Base de datos y bibliotecas
rm(list=ls()) 
full <- read.csv("input/us_foreign_aid_complete.csv")
library(tidyverse)
library(janitor)

mex <- full %>%
 filter(country_name == "Mexico")

col <- full %>%
  filter(country_code == "COL")
