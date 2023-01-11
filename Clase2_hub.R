#CLASE 2
#Instale y cargue la libreria del paquete tidyverse
library(tidyverse)

#En R se disponen de distintos data set
mtcars
#busque en help que contiene el data set mtcars

#Los datos se extrajeron de la revista estadounidense Motor Trend de 1974 
#y comprenden el consumo de combustible y 10 aspectos del diseño y rendimiento del automóvil para 32 automóviles (modelos 1973--74).

#A data frame with 32 observations on 11 (numeric) variables.

#[, 1]	mpg	Miles/(US) gallon, millas por galon
#[, 2]	cyl	Number of cylinders, numero de cilindros
#[, 3]	disp	Displacement (cu.in.), desplazamiento
#[, 4]	hp	Gross horsepower, caballos de fuerza
#[, 5]	drat	Rear axle ratio, relacion de eje
#[, 6]	wt	Weight (1000 lbs), peso
#[, 7]	qsec	1/4 mile time, tiempo de 1/4 de mila
#[, 8]	vs	Engine (0 = V-shaped, 1 = straight), ingenieria del motor  (0 = en forma de V, 1 = recto)
#[, 9]	am	Transmission (0 = automatic, 1 = manual) , transmision
#[,10]	gear	Number of forward gears, #numero de marchas
#[,11]	carb	Number of carburetors, numero de carburadores


#Guardemos el paquete mtcars en un objeto llamado "datos_autos"
datos_autos <- data.frame(mtcars)

#cuantas filas y columnas tiene nuestro data frame ?
nrow(datos_autos)
ncol(datos_autos)
#nrow=filas, ncol=columnas
#32 filas y 11 columnas


#queremos ver las primeras 3 filas del data frame
head(datos_autos,3)

#queremos ver las ultimas 5 filas del data frame
tail(datos_autos,5)

# si queremos alguna columna del data frame, nombramos al data frame +$ + nombre de columna:
datos_autos$mpg

#cual es la longitud de mpg?
length(datos_autos$mpg)

#cual sera el valor promedio de millas por galon? (me pide calcular la media)
mean(datos_autos$mpg)

#cual es la longitud de mpg?
length(datos_autos$mpg)

#cual sera el valor promedio de millas por galon? (me pide calcular la media)
mean(datos_autos$mpg)

#Realizar un histograma de la variable mpg
hist(mtcars$mpg,xlab = "Millas por galon",ylab = "Frecuencia",main = "Histograma", col = "green",border = "chocolate")

#Veamos algunas medidas de resumen
summary(mtcars$mpg)
var(mtcars$mpg)
sd(mtcars$mpg)

#Otra forma para calcular los estadisticos en un solo codigo:
mifuncion<-function(x) {c(media=mean(x), 
                          mediana=median(x), 
                          min=min(x), 
                          max=max(x),
                          varianza=var(x),rango=range(x),cuartiles=quantile(x))}
mifuncion(mtcars$mpg)

###########################################################################################
rm(list=ls(all = TRUE))

## Un factor es un vector cuyos elementos pueden asumir una cantidad limitada de valores
## Corresponde a una variable categorica, puede ser numerica o no
## Cada elemento puede ser incluido dentro de una cantidad limitada de categorias
## en las que se divide o clasifica la poblacion o muestra.


#factor(x, levels = ,labels = )

# "levels" especifica los posibles niveles (categorias) del factor (por defecto los valores unicos de x)

# "labels" define los nombres de esos niveles (serian las etiquetas, asigna nombres a las variables). Por defecto, y a menos que se defina, R usa los propios valores de la variable. 

# Se tienen los datos de un grupo de empleados  de una empresa de logistica, 
#donde 1 significa menos de 65 anos y 2 mayor a 65 anos .

empleados<-c(1,2,2,2,1,1,2,1,2,1,2,1,1,1,2,2,1,2,2,1,2,2,2,2,1,2,2,1,1,1,2,1,2,1,1,2,2,2,2,1,2,2,1,2)
empleados
# Usamos ese mismo vector para transformarlo en un factor

empleados<-factor(empleados, levels = c(1,2),labels = c("Menos de 65","Mas de 65"))

empleados
#Con table, me calcula la frecuencia de cada categoria
table(empleados)

#Con prop.table, me calcula la frecuencia porcentual de cada categoria
prop.table(table(empleados))

#redondear a 2 digitos
round(prop.table(table(empleados)),digits = 2)

# si quiero convertir un vector a factor uso as.factor()
a <- c(2:10)
class(a)    
a

a_factor <- as.factor(a)
class(a_factor)

#####################################################################################

#Setear el directorio de trabajo:
#Session,set working directory,to source file location
#Importar data set por codigo
library(readxl)
empleados <- read_excel("empleados.xlsx")
#Otra forma: sino en el panel derecho superior: import data set, from excel

#Se tienen los datos los empleados de una empresa de logistica "CCC"
#Se tiene la informacion de la edad de los empleados, nombres, cantidad de hijos, si alquila o no vivienda
#gastos medicos y cuanto pagan en impuestos

View(empleados)
#Si quiero saber los nombres de las variables (columnas) del data frame uso:
names(empleados)
#"Empleado"  "Edad"      "Hijos"     "Alquila"   "Gas_med"   "Impuestos"
#Si quiero saber las dimensiones del data frame:
dim(empleados)
#25  6
#El data frame tiene 25  filas y 6 columnas

#Tipo de datos del data frame
str(empleados)

#Vemos que alquila es un factor---> se debe pasar a factor
empleados$Alquila<- as.factor(empleados$Alquila)

#Vemos que impuesto es una variable numerica---> se debe pasar a numerica

empleados$Impuestos<- as.numeric(empleados$Impuestos)


#Supongamos que quiero ver en forma descendente la variable edad:
sort(empleados$Edad, decreasing = TRUE)
#67 65 59 56 47 47 45 45 44 43 42 42 39 38 35 34 32 30 29 28 27 26 25 25 22
#En forma ascendente:
sort(empleados$Edad, decreasing = FALSE)
#22 25 25 26 27 28 29 30 32 34 35 38 39 42 42 43 44 45 45 47 47 56 59 65 67
#sino por default:
sort(empleados$Edad)


#Calculemos: media, mediana,varianza,desvio, rango, cuantiles, de la variable hijos .
mean(empleados$Hijos)
median(empleados$Hijos)
sd(empleados$Hijos)
var(empleados$Hijos)
sd(empleados$Hijos)
# otra forma de calcular sd:
sqrt(var(empleados$Hijos))
range(empleados$Hijos)
quantile(empleados$Hijos)

#Recordemos que la funcion summary nos da algunos valores de medidas:
summary(empleados$Hijos)

#Realizar tabla  de frecuencia absoluta:
tabla_hijos <- table(empleados$Hijos)
tabla_hijos
#Realizar tabla de frecuencia relativa:
tabla_fr_hijos <- prop.table(tabla_hijos)
tabla_fr_hijos
#redondear a 2 digitos
round(tabla_fr_hijos,digits = 1)

#Calcular las frecuencias relativas porcentuales
tabla_fr_hijos*100
#redondear a 2 digitos
round(tabla_fr_hijos*100,digits = 2)

#Realizamos un histograma para la variable impuestos
hist(empleados$Impuestos)
#Quiero cambiar el nombre de los ejes, color,borde y el titulo:
hist(empleados$Impuestos,xlab = "Impuestos",ylab="Frecuencia", 
     main = "Histograma de impuestos", col = "violet", border="blue")

#Realizamos un grafico de barras (barplot)
barplot(tabla_hijos,empleados$Hijos,xlab="Cantidad de hijos",ylab = "Frecuencia Relativa",main = "Grafico de barras", col = "violet",border = "black")
# Vemos que la barra mas alta  corresponde a 2, la cantidad de hijos con mayor frecuencia

#Realizamos un grafico de caja (boxplot)
boxplot(empleados$Hijos,main="Boxplot")



#If else
#con ifelse se nos devolverá un valor para cada elemento de un vector en el que la condición sea TRUE, 
#además nos devolverá otro valor para los elementos en que la condición sea FALSE.


empleados$Edad<-ifelse(empleados$Edad<30,"Joven",ifelse(empleados$Edad<50, "Adulto", "Mayor"))
empleados$Edad
#Si la edad es menor a 30: Joven, Menor a 50 (y meyor a 30): Adulto, caso contrario: mayor


#Mas de data frame
#Cargamos los siguientes vectores:
edad<-c(27, 30, 32, 32, 33, 34, 37, 37, 37, 37, 37, 38, 38, 39, 39, 39, 40, 40, 40, 40, 40, 41, 41, 41, 
        41, 41, 41, 42, 42, 42, 42, 42, 42, 43, 43, 43, 44, 45, 45, 45, 45, 45, 45, 45, 45, 46, 46, 46, 
        46, 46, 46, 47, 47, 47, 48, 48, 49, 49, 49, 49, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 51, 51,
        51, 51, 51, 51, 52, 52, 52, 52, 52, 52, 52, 52, 53, 53, 53, 53, 53, 53, 54, 54, 54, 54, 54, 54, 
        54, 54, 54, 54, 54, 55, 55, 55, 55, 55, 56, 56, 56, 56, 56, 56, 57, 57, 57, 57, 57, 57, 58, 58, 
        58, 58, 58, 58, 58, 58, 58, 58, 58, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 
        60, 60, 60, 61, 61, 61, 61, 61, 61, 61, 61, 61, 62, 62, 62, 62, 62, 62, 63, 63, 63, 63, 63, 64, 
        64, 64, 64, 64, 65, 65, 65, 65, 65, 65, 66, 66, 66, 66, 66, 67, 67, 68, 68, 68, 68, 69, 69, 69, 
        70, 70, 71, 71, 71, 71, 72, 72, 72, 72, 73, 74, 75, 75, 75, 77, 78, 78)


sexo<-factor(c("Masculino", "Masculino", "Masculino", "Masculino", "Femenino", "Femenino", "Femenino", "Femenino", "Masculino", "Femenino", "Masculino", "Femenino", "Femenino", "Masculino", "Masculino", "Masculino", "Masculino", "Masculino", "Femenino", "Femenino", "Femenino", "Femenino", "Masculino", "Masculino", "Femenino", "Masculino", "Femenino", "Femenino", "Masculino", "Femenino", "Femenino", "Masculino", "Femenino", "Masculino", "Femenino", "Masculino", "Masculino", 
               "Masculino", "Masculino", "Femenino", "Femenino", "Femenino", "Femenino", "Femenino", "Masculino", "Masculino", "Masculino", "Femenino", "Femenino", "Femenino", "Masculino", "Femenino", "Masculino", "Masculino", "Femenino", "Femenino", "Femenino", "Femenino", "Masculino", "Femenino", "Masculino", "Masculino", "Masculino", "Femenino", "Femenino", "Masculino", "Masculino", "Masculino", "Femenino", "Masculino", "Femenino", "Masculino", "Masculino", "Masculino", 
               "Masculino", "Femenino", "Masculino", "Masculino", "Masculino", "Masculino", "Femenino", "Femenino", "Masculino", "Femenino", "Masculino", "Femenino", "Masculino", "Femenino", "Femenino", "Masculino", "Femenino", "Masculino", "Femenino", "Masculino", "Femenino", "Femenino", "Masculino", "Masculino", "Masculino", "Masculino", "Femenino", "Masculino", "Femenino", "Masculino", "Femenino", "Femenino", "Masculino", "Femenino", "Masculino", "Femenino", "Masculino",
               "Femenino", "Masculino", "Femenino", "Masculino", "Femenino", "Masculino", "Femenino", "Femenino", "Masculino", "Masculino", "Femenino", "Masculino", "Femenino", "Masculino", "Masculino", "Masculino", "Femenino", "Masculino", "Masculino", "Femenino", "Femenino", "Masculino", "Femenino", "Femenino", "Femenino", "Femenino", "Masculino", "Femenino", "Femenino", "Femenino", "Femenino", "Masculino", "Femenino", "Femenino", "Masculino", "Masculino",
               "Masculino", "Femenino", "Femenino", "Femenino", "Femenino", "Femenino", "Femenino", "Masculino", "Masculino", "Femenino", "Masculino", "Masculino", "Masculino", "Masculino", "Femenino", "Femenino", "Masculino", "Femenino", "Femenino", "Masculino", "Femenino", "Masculino", "Masculino", "Masculino", "Femenino", "Femenino", "Masculino", "Masculino", "Femenino", "Masculino", "Masculino", "Femenino", "Femenino", "Femenino", "Masculino", "Femenino",
               "Femenino", "Femenino", "Masculino", "Femenino", "Masculino", "Femenino", "Masculino", "Masculino", "Masculino", "Masculino", "Femenino", "Masculino", "Masculino", "Femenino", "Femenino", "Femenino", "Femenino", "Masculino", "Femenino", "Femenino", "Femenino", "Femenino", "Masculino", "Femenino", "Masculino", "Masculino", "Masculino"))

antiguedad<-factor(c(0, 1, 0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 1, 1, 0, 0, 1, 0, 1, 0, 1, 0, 1, 1, 0, 1, 0, 0, 1, 0, 0, 1, 0, 1, 0, 1, 0,
               0, 0, 0, 1, 0, 0, 1, 0, 0, 1, 1, 0, 0, 1, 0, 0, 1, 1, 1, 0, 1, 1, 0, 0, 0, 0, 0, 1, 0, 0, 1, 1, 1, 0, 0, 0, 
               0, 0, 1, 0, 0, 1, 0, 1, 1, 1, 1, 0, 1, 0, 0, 0, 1, 0, 0, 1, 0, 1, 1, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1,
               1, 1, 0, 1, 0, 1, 1, 0, 0, 0, 0, 1, 0, 1, 0, 1, 0, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 1, 1, 0, 0, 0, 0,
               1, 0, 1, 0, 0, 0, 1, 1, 1, 1, 1, 0, 1, 0, 0, 1, 0, 1, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 
               1, 0, 1, 1, 1, 1, 0, 1, 0, 1, 0, 1, 0, 0, 1, 0, 0, 0, 0, 1, 0, 1, 0, 1, 1, 1, 0, 1))

estudios<-factor(c(1, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 1, 0, 0, 1, 1, 1, 1, 0, 0, 0, 1, 1, 1, 0, 0, 1, 1, 1, 0, 0, 0, 1, 0, 0, 1, 0, 
                       0, 1, 0, 1, 0, 0, 1, 1, 1, 1, 0, 1, 0, 1, 1, 1, 1, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 1, 1, 0, 0, 0, 0, 1, 
                       0, 1, 1, 1, 0, 1, 0, 0, 0, 0, 1, 0, 1, 1, 0, 0, 0, 1, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 1, 1, 
                       1, 0, 1, 0, 0, 1, 1, 0, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 0, 0, 0, 1, 0, 1, 0, 0, 1, 0, 1, 1, 0, 0, 0, 0, 0, 0, 
                       1, 1, 0, 0, 0, 0, 1, 1, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 1, 1, 0, 1, 0, 0, 0, 0, 1, 1, 1, 1, 0, 1, 1, 1, 
                       1, 1, 0, 1, 0, 0, 1, 0, 0, 0, 0, 1, 1, 1, 1, 0, 0, 0, 0, 1, 0, 0, 0, 1, 0))


#Antiguedad---> antiguedad en la empresa: 0 (menor a 5 anos), 1 (mayor a 5 anos)
#Estudios ----> si tiene titulo universitario 0 (no ), 1 (si)

#Verificar para cada uno de los vectores la cantidad de elementos que tiene y el tipo de vector:
length(edad); class(edad)
length(sexo); class(sexo) 
length(antiguedad); class(antiguedad) 
length(estudios); class(estudios)
# todos tienen la misma longitud (210)

#Para la edad , calcular la media, la mediana,, el maximo, el minimo y la varianza
mifuncion<-function(x) {c(media=mean(x), 
                          mediana=median(x), 
                          min=min(x), 
                          max=max(x),
                          varianza=var(x))}

mifuncion(edad)
summary(edad)
var(edad)

#Crear un data frame llamado ccc, a partir de los 4 vectores anteriores
ccc <- data.frame(edad,antiguedad, sexo,estudios)
ccc



#Borrar los vectores originales
rm(edad,antiguedad,sexo,estudios)

# Agregar el siguiente vector con los numeros de legajos, como nombres de filas
row.names(ccc)<-c(101, 102, 103, 104, 105, 106, 107, 108, 109, 110, 111, 112, 113, 114, 115, 116, 117, 118, 
                      119, 120, 121, 122, 123, 124, 125, 126, 127, 128, 129, 130, 131, 132, 133, 134, 135, 136, 
                      137, 138, 139, 140, 141, 142, 143, 144, 145, 146, 147, 148, 149, 150, 151, 152, 153, 154, 
                      155, 156, 157, 158, 159, 160, 161, 162, 163, 164, 165, 166, 167, 168, 169, 170, 171, 172, 
                      173, 174, 175, 176, 177, 178, 179, 180, 181, 182, 183, 184, 185, 186, 187, 188, 189, 190, 
                      191, 192, 193, 194, 195, 196, 197, 198, 199, 200, 201, 202, 203, 204, 205, 206, 207, 208, 
                      209, 210, 211, 212, 213, 214, 215, 216, 217, 218, 219, 220, 221, 222, 223, 224, 225, 226, 
                      227, 228, 229, 230, 231, 232, 233, 234, 235, 236, 237, 238, 239, 240, 241, 242, 243, 244, 
                      245, 246, 247, 248, 249, 250, 251, 252, 253, 254, 255, 256, 257, 258, 259, 260, 261, 262, 
                      263, 264, 265, 266, 267, 268, 269, 270, 271, 272, 273, 274, 275, 276, 277, 278, 279, 280, 
                      281, 282, 283, 284, 285, 286, 287, 288, 289, 290, 291, 292, 293, 294, 295, 296, 297, 298, 
                      299, 300, 301, 302, 303, 304, 305, 306, 307, 308, 309, 310)

#Cambiarle el nombre a una columna
#Cambiar edad por EDAD
names(ccc)[names(ccc)=="edad"]<- "EDAD"

#Otro ejemplo con IFELSE:
#Cargamos de nuevo el vector edad
edad<-c(27, 30, 32, 32, 33, 34, 37, 37, 37, 37, 37, 38, 38, 39, 39, 39, 40, 40, 40, 40, 40, 41, 41, 41, 
        41, 41, 41, 42, 42, 42, 42, 42, 42, 43, 43, 43, 44, 45, 45, 45, 45, 45, 45, 45, 45, 46, 46, 46, 
        46, 46, 46, 47, 47, 47, 48, 48, 49, 49, 49, 49, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 51, 51,
        51, 51, 51, 51, 52, 52, 52, 52, 52, 52, 52, 52, 53, 53, 53, 53, 53, 53, 54, 54, 54, 54, 54, 54, 
        54, 54, 54, 54, 54, 55, 55, 55, 55, 55, 56, 56, 56, 56, 56, 56, 57, 57, 57, 57, 57, 57, 58, 58, 
        58, 58, 58, 58, 58, 58, 58, 58, 58, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 
        60, 60, 60, 61, 61, 61, 61, 61, 61, 61, 61, 61, 62, 62, 62, 62, 62, 62, 63, 63, 63, 63, 63, 64, 
        64, 64, 64, 64, 65, 65, 65, 65, 65, 65, 66, 66, 66, 66, 66, 67, 67, 68, 68, 68, 68, 69, 69, 69, 
        70, 70, 71, 71, 71, 71, 72, 72, 72, 72, 73, 74, 75, 75, 75, 77, 78, 78)


edad<- ifelse(edad<40,"Joven", "Adulto")
edad

######NOTA:
# LA ESTRUCTURA BÁSICA DE UNA SENTENCIA PARA ELEGIR VARIABLES Y OBSERVACIONES EN UN DATA.FRAME ES
## nombre_data_frame [ observaciones  ,  variables   ]

# Los data.frames tienen dos formas de nombras a las filas y a las variables:
# o por su posición, o por su nombre

#cargar de nuevo vectores y data frame ccc. Cambiar el nombre de la variable edad (linea 293)
#Que edad tiene la persona cuyo informe es el numero 22???
ccc["22","EDAD"]


#De que sexo tienen las personas cuyos numeros informes son 200, 205 y 210?
ccc[c("200","205", "210"),"sexo"]
# masculino, femenino, femenino

# otra forma mas larga:
ccc[("200"),"sexo"]
ccc[("205"),"sexo"]
ccc[("210"),"sexo"]

# Traer todos los datos del informe numero 101
ccc["101" , ]
# observar que me da todos los valores de las columnas correspondientes a la fila 101

# Crear un nuevo data.frame llamado "estudio2" a partir de "estudio", que contenga solo
# la edad, el sexo y antiguedad.
ccc2 <-data.frame(ccc[c("EDAD","sexo","antiguedad")])

ccc2


######################################################################################
#EJERCICIOS DE LOGISTICA
#3
#La base de datos que vamos a utilizar a continuacion fue extraida de
#https://brunel.figshare.com/articles/dataset/Supply_Chain_Logistics_Problem_Dataset/7558679
#Los datos fueron tomados por Brunel University of London


#Service level: nivel de servicio
#DTD (Door to Door), puerta a puerta
#DTP (Door to Port), puerta a puerto
#CRF (Customer Referred Freight), flete recomendado por clientes


#Importar la base de datos y la nombramos sp
library(readxl)
sp<- read_excel("sp.xlsx")
#Describir la estructura de la base de datos


#La variable weight debe pasarse a una variable numerica:
sp$Weight<- as.numeric(sp$Weight)

#Calcular la media de las variables weight y unit quantity
mean(sp$Weight)
mean(sp$Unit_quantity)

#Calcular la mediana de las variables weight y unit quantity
median(sp$Weight)
median(sp$Unit_quantity)


#Realizar el grafico adecuado para la variable weight
hist(sp$Weight,xlab = "Peso",ylab = "Frecuencia", main="Histograma de la variable peso", col="coral")
#VA CONTINUA


#Realizar el grafico adecuado para la variable Unit_quantity
#VA DISCRETA
barplot(table(sp$Unit_quantity),sp$Unit_quantity,xlab="Unidades",ylab = "Frecuencia Relativa",
        main = "Grafico ", col = "blue",border = "black")

#Ordenar de forma ascendente la variable weight (menor a mayor)
sort(sp$Weight)
#de forma descendente
sort(sp$Weight,decreasing = TRUE)

####################################################################################
#DATOS FALTANTES  
#Cargar la base de datos supply_chain(na) y la nombramos datos (esta en hoja2)
datos <- read_excel("sp.xlsx", sheet = "Hoja2")
#Vemos que la variable peso la leyo como caracter, hay que pasarla a variable numerica
datos$Peso<- as.numeric(datos$Peso)
#Calculamos la media de la variable peso
mean(datos$Peso)
#NA
#Se debe especificar que se deben omitir los NA:
mean(datos$Peso,na.rm = TRUE)

#206.0652

sum(is.na(datos))
#Vemos que tenemos 19 datos faltantes

#Visualizacion de datos faltantes
#instalar paquete visdat
library(visdat)
vis_miss(datos, sort=TRUE)
vis_miss(datos, cluster = TRUE)
vis_dat(datos)
colSums(is.na(datos))

#https://rpubs.com/paraneda/missingdata
#Paquete mice sirve para imputacion de datos faltantes
