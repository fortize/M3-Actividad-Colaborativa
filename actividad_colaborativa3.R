# Actividad colaborativa módulo 3
# Autor: Javier Ortiz

#Cargamos las librerias necesarias
library(gsheet)

#setwd("C:\Users\Javier Ortiz\Desktop\Master Big Data\Modulo 3\M3-Actividad-Colaborativa")

# Bajamos la hoja de cálculo
url <- 'https://docs.google.com/spreadsheets/d/1CDWBeqpUTBd1TkmDz_M6UGRWdHgU7LOcoiGRTvIttKA/edit#gid=0'
datos <- gsheet2tbl(url)

# Ponemos en minúscula todos los datos
tolower(datos)

