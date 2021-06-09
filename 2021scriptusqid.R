### Base de datos USAID 
### 7 de junio de 2021
### Pregunta: A donde van los recursos de USAID a México

###1. Base de datos y bibliotecas
rm(list=ls()) 
full <- read.csv("input/us_foreign_aid_complete.csv")
library(tidyverse)
library(janitor)

mex <- full %>%
 filter(country_name == "Mexico")

# Todos los apoyos del año 19. 
mex9 <- filter(mex, fiscal_year == "2019")

# Solamente desembolsos. Las obligaciones contractuales hoy se convierten
# en desembolsos en el año actual y el siguiente, entonces el mejor dato
# es desembolso. 

mex9d <- filter(mex9, transaction_type_name =="Disbursements")

####2. RESULTADOS
#####2.1 Presupuesto por propósito específico
mex9dg <- group_by(mex9d, dac_purpose_name)
mex9dgdpc <- summarise(mex9dg, sum(current_amount))

#####2.2 Presupuesto por tipo de ayuda (proyecto, técnico, o admin)
mex9atg <- group_by(mex9d, aid_type_group_name)
mex9ats <- summarise(mex9atg, sum(current_amount))

#####2.3 Presupuesto por categoría de asistencia (militar o económica)
mex9ca <- group_by(mex9d, assistance_category_name)
mex9cas <- summarise(mex9ca, sum(current_amount))

#####2.4 por tipo de socio implementador
mex9si <- group_by(mex9d, channel_subcategory_name)
mex9sis <- summarise(mex9si, sum(current_amount))

####2.4 Por nombre de sector DAC
mex9nsdac <- group_by(mex9d, dac_sector_name)
mex9nsdacs <- summarise(mex9nsdac, sum(current_amount))

####2.6 por tipo de canal de implementación
mex9cc <- group_by(mex9d, channel_category_name)
mex9ccs <- summarise(mex9cc, sum(current_amount))

####2.7 por último, la asistencia estadounidense a México por año, en term.reales

mexAllYrs <- group_by(mex, fiscal_year)
mexAllYrsSum <- summarise(mexAllYrs, sum(constant_amount))

####2.8 desglose de cuánto recibimos en 1948

mex48 <- filter(mex, fiscal_year == "1948")
mex48d <- filter(mex48, transaction_type_name == "Disbursements") # No hay desembolsos registrados en 48
# Solamente dos obligaciones de pago
