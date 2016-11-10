# Actividad colaborativa módulo 3
# Autor: Javier Ortiz

#Cargamos las librerias necesarias
library(gsheet)
library(xlsx)

#setwd("C:\Users\Javier Ortiz\Desktop\Master Big Data\Modulo 3\M3-Actividad-Colaborativa")

# Bajamos la hoja de cálculo
url <- 'https://docs.google.com/spreadsheets/d/1CDWBeqpUTBd1TkmDz_M6UGRWdHgU7LOcoiGRTvIttKA/edit#gid=0'
datos <- gsheet2tbl(url)

# Preservamos los datos en una hoja de excel
write.xlsx(datos, "datos.xlsx")

# Modificamos las cabeceras del set de datos
names(datos[]) 

y <- regexpr("\\.[^\\.]*$", colnames(datos), TRUE)
z <- y + attr(y, "match.length") - 1
colnames(datos) <- substr(colnames(datos), 0, z)

# Ponemos en minúscula todos los datos
tolower(datos[2:5])

# Conversión caracteres html
tolower(datos[2:5])

# Quitamos caracteres extraños y comas
tolower(datos[2:5])
