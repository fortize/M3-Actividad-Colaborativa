# Actividad colaborativa módulo 3
# Autor: Javier Ortiz

getwd()
setwd("C:/Users/Javier Ortiz/Desktop/Master Big Data/Modulo 3/M3-Actividad-Colaborativa")
ls()
rm(list=ls())

#Cargamos las librerias necesarias
library(gsheet)
library(xlsx)
library(datamart)

# Bajamos y guardamos en una tabla la hoja de cálculo
url <- 'https://docs.google.com/spreadsheets/d/1CDWBeqpUTBd1TkmDz_M6UGRWdHgU7LOcoiGRTvIttKA/edit#gid=0'
datos <- gsheet2tbl(url)

# Preservamos los datos en una hoja de excel
write.xlsx(datos, "datos.xlsx")

# Modificamos las cabeceras del set de datos
colnames(datos) <- c("Year","Area","Street","Street2","Strange")

# Conversión caracteres html
datos$Strange <-lapply(datos$Strange,strdehtml)

# Quitamos caracteres extraños
datos$Street <- gsub("å","a",datos$Street)

# Quitamos espacios en blanco
datos$Street2 <- trimws(datos$Street2)

# Rellenamos la columna del Area
rellenar_vacios <- function(x, missing=""){
  rle <- rle(as.character(x))
  empty <- which(rle$value==missing)
  rle$values[empty] <- rle$value[empty-1] 
  inverse.rle(rle)
}

datos$Area <- rellenar_vacios(datos$Area)

# Ordenamos Street y Street2
datos <- datos[order(datos$Area,datos$Street, datos$Street2),]