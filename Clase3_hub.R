#Clase 3 

####################################################################################
#DATOS FALTANTES   (clase 2)
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

###############################################################################################3
#Un paquete (package) es una colección de funciones, datos y código R que se almacenan en una carpeta conforme a una estructura bien definida,
#fácilmente accesible para R.
#Primero se debe instalar los paquetes (ej. install.packages("ggplot2")) y luego se carga la libreria
#La instalacion de paquetes se realiza por unica vez.


#Tidyverse nos permite:
#Importar datos, ordenarlos
#Transformación, visualización y creación de modelos, para luego  comunicar los resultados. 

#Tibbles (tbl) son parecidos a los data.frames, y tienen algunas mejoras que facilitan su manejo.
#Se observan como una tabla de datos (observaciones x variables), el tipo de
#datos de cada variable (int, chr, ... ) y muestra las primeras 10 filas de la estructura (esto se puede modificar con options)

#La función tribble() se utiliza para tablas pequeñas

#Se puede utilizar la función as_tibble() sirve para forzar los objetos data.frame a tbl_df

#Dentro de tidyverse, tenemos dplyr: para manipular datos
#Cargamos el data set iris:
library(tidyverse)
library(dplyr)
iris
names(iris)


#El data set iris contiene las mediciones en centímetros de las variables longitud
#(Length) y ancho (Width) de los pétalos (Petal) y sépalos (Sepal) de 50 flores de cada
#una de las 3 especies (Species) del género Iris: Iris setosa, Iris versicolor e Iris
#virginica. El data set presenta 150 filas y 5 variables

#conector %>% (tuberia/pipe)
#Permite transformar llamadas de funciones
#anidadas (con muchos paréntesis) en una simple serie de operaciones


#Ejemplo:
#veamos  la logica de dplyr:
#nombre del data set %>% funcion


#Paquete dplyr proporciona una "gramática" (particularmente verbos) para la manipulación y operaciones con data frames

#select: devuelve un conjunto de columnas
#filter: devuelve un conjunto de filas según una o varias condiciones lógicas
#arrange: reordena filas de un data frame
#rename: renombra variables en una data frame
#mutate: añade nuevas variables/columnas o transforma variables existentes
#summarise/summarize: genera resúmenes estadísticos de diferentes variables en el data frame
#group by:agrupa un conjunto de filas seleccionado, en un conjunto de filas 
#de resumen de acuerdo con los valores de una o más columnas o expresiones


#Algunos ejemplos:


#Selecciona las columnas Sepal Lenght y Sepal Width
iris %>% select(Sepal.Length, Sepal.Width)

#Si quiero seleccionar todas las variables menos especies:
iris %>% select(-Species)
#con el menos indico que esa variable la excluyo

#Si quiero las columnas 2 y 4:
iris %>% select(2,4)


#Cambiar el nombre de algunas variables:
iris %>% rename("Especie"= "Species", "Long
Sepalo"="Sepal.Length", "Ancho Sepalo"= "Sepal.Width")

#Para filtrar algunas filas del data set:
iris %>% filter(Species == "versicolor")
#me selecciono aquellas especies "versicolor"


iris %>% filter(Species == "setosa" | Species == "virginica")
#filtrar setosa o virginica
# | este operador significa o 


#Se puede ordenar el data set  por la variable longitud del pétalo (Petal.Length): arrange
#. Por defecto, el ordenamiento es ascendente:

iris %>% arrange(Petal.Length) 

#De forma descendente
iris %>% arrange(desc(Petal.Length))

#Puedo combinar funciones en una misma linea de codigo
iris %>% arrange(Petal.Length) %>%
  head


#ordeno de forma ascendente la longitud del petalo y a su vez me arrojo las primeras 6 filas
#(por default, head y tail, son 6 filas)

#Si quiero las primeras 3 filas
iris %>% arrange(Petal.Length) %>%
  head (3)

#Me selecciona aquellas especies que son "setosa"
iris %>% subset(Species=="setosa")

#En este caso me interesan los valores medios para cada categoría de las especies (mean), y que solo provengan de las flores con
#sépalos mayores a 5
iris %>% subset(Sepal.Length > 5) %>% aggregate(. ~ Species, ., mean)


#1ero subset de flores con sépalos mayores a 5
#2do con la funcion aggregate, se toman todos los datos y los comprime en un  valor (media)

#Si quiero crear nuevas variables a partir de otras existentes del data set, se puede utilizar mutate:
iris %>% mutate(Petal.Shape = Petal.Width / Petal.Length,Sepal.Shape = Sepal.Width / Sepal.Length)

#forma de petalos (petal shape) seria la nueva variable creada, siendo la relacione entre ancho y longitud


#La función summarise() colapsa un conjunto de datos en una sola fila. Esta funcion se combina
#con group by (toma como argumentos los nombres de columna que contienen las variables categóricas para las que desea
#calcular medidas de resumen, ej. media)

iris %>%group_by(Species) %>% summarise(Mean.Petal.Length = mean(Petal.Length))
#aca se calculo ;a media de la longitud de pétalos por especie




#VISUALIZACION DE DATOS
#Un paquete (package) es una colección de funciones, datos y código R que se almacenan en una carpeta conforme a una estructura bien definida,
#fácilmente accesible para R.
#Primero se debe instalar los paquetes (ej. install.packages("ggplot2")) y luego se carga la libreria
#La instalacion de paquetes se realiza por unica vez.


#Tidyverse nos permite:
#Importar datos, ordenarlos
#Transformación, visualización y creación de modelos, para luego  comunicar los resultados. 
# ggplot2 se encuentra dentro del paquetye tidyverse
#Sitios recomendados para visualizacion de datos:

#https://www.data-to-viz.com/ 
#https://ggplot2.tidyverse.org/
#https://datanalytics.com/libro_r/elementos-de-un-grafico-en-ggplot2.html


#Instalamos ggplot2 y cargamos la libreria en memoria
library(tidyverse)
library(ggplot2)
#ggplot2 arma los graficos  utilizando capas
#Las distintas capas son:
#data (datos): data set
#aes (estetica): Cómo se relacionan cada una de las variables de los datos con las propiedades estética del gráfico
#geom (geometrica): tipo de geometria a graficar (punto, barras,lineas, etc)
#facet (facetas): se subdivide el grafico en facetas segun los datos (ej por variables categoricas)
#theme (tema): permite controlar los colores, líneas, tipografía, etc.
#sistema de coordenadas: para modificar los ejes
#stats (estadistica): se realiza alguna operacion estadistica a los datos

#En help se puede buscar ggplot
#Vamos a trabajar con el data set mpg, un data set con 234 filas y 11 variables
mpg
#lo guardo en un objeto como mpg
mpg<- data.frame(mpg)

#model : model name (nombre del modelo)

#displ: engine displacement, in litres (desplazamiento de cilindros, ing del motor)

#year: year of manufacture (an~o de manufactura)

#cyl:  number of cylinders (numero de cilindros)

#trans:  type of transmission (tipo de transmision)

#drv: the type of drive train, where f = front-wheel drive, r = rear wheel drive, 4 = 4wd

#am tipo de tren de transmisión, donde f = tracción delantera, r = tracción trasera, 4 = 4wd)

#cty: city miles per gallon (millas por galon en ciudad)

#hwy: highway miles per gallon (millas por galon en autopista)

#fl:fuel type (tipo de combustible)

#class: "type" of car  (tipo de auto)

#Vamos a estudiar un poco el data set antes de empezar a graficar
#Veamos las medidas de resumen 
summary(mpg)

#Que variables son cualitativas? y cuales son cuantitativas?


#Queremos estudiar la relacion entre 2 variables numericas, para ello realizamos un
#scatterplot (diagrama de dispersion)
ggplot(mpg, aes(displ, hwy)) +
  geom_point()
#En este caso vemos la relacion de hwy (millas/galon) en funcion de displ (desplazamiento), 
#que observamos??

#Veamos las partes del codigo:
#ggplot( data set, aes(x,y))+ geometria (point=punto---> scatterplot) 
#Con el mas vamos agregando capas

#Podemos seguir agregando capas
ggplot(mpg, aes(
  displ, hwy)) +
  geom_point(col="violet") +
  labs(
    x = "Desplazamiento del motor (litres)",
    y = "Millas de autopista por galon")+ ggtitle("Kilometraje por tamaño de motor y cilindros")
#con labs agregamos titulo a los ejes, al grafico, y en geom point pido un color determinado 
#con ggtitle: titulo al grafico

# Podemos  " facetar"  o subdividir el gráfico de acuerdo a los niveles o categorías de la variable de comparación
ggplot(mpg, aes(displ, hwy)) + geom_point(col="green") + facet_wrap(~class)
#vemos 7 graficos: 1 por cada tipo de auto (variable class)

#que podemos observar?

#Se puede cambiar la forma de los puntos: shape

ggplot(mpg, aes(displ, hwy)) + geom_point(col="brown1", shape=17)
#Si queremos agregar una regresion lineal al grafico, lo hacemos con geom_smooth
ggplot(mpg, aes(
  displ, hwy)) +
  geom_point(col="violet") +geom_smooth(method = "lm")

#Grafico de barras (bar plot)
#Lo utilizabamos para variables cuantitativas discretas
#Vamos a realizar un barplot de la variable cyl: numero de cilindros

ggplot(mpg, aes(cyl)) + 
  geom_bar(col="darkslategray", fill="coral") + 
  xlab("Número de cilindros") + 
  ylab("Frecuencia") + 
  ggtitle("Gráfico de Barras de la variable cyl")
#fill=para relleno

#Se puede   cambiar la orientación de los ejes usando coord_flip():
ggplot(mpg, aes(cyl)) + 
  geom_bar(col="darkslategray", fill="cyan3") + 
  xlab("Número de cilindros") + 
  ylab("Frecuencia") + 
  ggtitle("Gráfico de Barras de la variable cyl")+coord_flip()

#que observamos?

#aca tenemos la lista de colores https://r-charts.com/es/colores/

#Si quiero colorear las barras por otra variable, ej fl (tipo de conbustible)
#para eso debo convertir la variable a factor, uso dentro de aes , fill
ggplot(mpg, aes(cyl, fill = as.factor(fl))) + 
  geom_bar() + 
  xlab("Numero de cilindros") + 
  ylab("Frecuencia") + 
  ggtitle("Numero de cilindros segun combustible") +
  labs(fill = "Tipo de combustible")

#que observamos?

#Si quiero modificar el estilo de fondos uso theme_minimal
ggplot(mpg, aes(cyl, fill = as.factor(fl))) + 
  geom_bar() + 
  xlab("Numero de cilindros") + 
  ylab("Frecuencia") + 
  ggtitle("Numero de cilindros segun combustible") +
  labs(fill = "Tipo de combustible")+ theme_minimal()

#con un tema vacio de fondo: theme_void
ggplot(mpg, aes(cyl, fill = as.factor(fl))) + 
  geom_bar() + 
  xlab("Numero de cilindros") + 
  ylab("Frecuencia") + 
  ggtitle("Numero de cilindros segun combustible") +
  labs(fill = "Tipo de combustible")+ theme_void()

#Con fondo mas oscuro
ggplot(mpg, aes(cyl, fill = as.factor(fl))) + 
  geom_bar() + 
  xlab("Numero de cilindros") + 
  ylab("Frecuencia") + 
  ggtitle("Numero de cilindros segun combustible") +
  labs(fill = "Tipo de combustible")+ theme_dark()

#Con cuadricula con lineas negras de fondos
ggplot(mpg, aes(cyl, fill = as.factor(fl))) + 
  geom_bar() + 
  xlab("Numero de cilindros") + 
  ylab("Frecuencia") + 
  ggtitle("Numero de cilindros segun combustible") +
  labs(fill = "Tipo de combustible")+ theme_linedraw()


#Histograma
#Lo utilizamos para variable aleatorias cuantitativas continuas
#En este caso, construimos un histograma de la variable displ
ggplot(mpg, aes(displ)) + geom_histogram()

#binwidth= ancho de las barras que recogen los rangos de representación de la variable.

ggplot(mpg, aes(displ,fill="coral")) + geom_histogram()+stat_bin(bins=30)+ xlab("Desplazamiento del motor") + 
  ylab("Frecuencia") + ggtitle("Desplazamiento del motor") +
  theme_linedraw()


ggplot(mpg, aes(displ,fill="coral"),binwidth=30) + geom_histogram()+ xlab("Desplazamiento del motor") + 
  ylab("Frecuencia") + ggtitle("Desplazamiento del motor") +
  theme_linedraw()



#Si quiero un histograma por variable tipo de auto, debo facetar:

ggplot(mpg, aes(displ,fill="coral"),binwidth=30) + geom_histogram()+ xlab("Desplazamiento del motor") + 
  ylab("Frecuencia") + ggtitle("Desplazamiento del motor") +
  theme_linedraw()+ facet_grid(class~.)

#Podemos emplear la función geom_density() para trazar un gráfico de densidad que asemeja una distribución continua:

ggplot(mpg, aes(displ,fill="blue"),binwidth=30) + geom_density()+ xlab("Desplazamiento del motor") + 
  ylab("Frecuencia") + ggtitle("Desplazamiento del motor") +
  theme_linedraw()





#otra alternativa , el poligono de frecuencias: se ven  lineas en vez de barras
ggplot(mpg, aes(hwy)) + geom_freqpoly()

ggplot(mpg, aes(hwy)) + geom_freqpoly(col="aquamarine2") +xlab("Desplazamiento del motor") + 
  ylab("Frecuencia") + ggtitle("Desplazamiento del motor") +
  theme_minimal()


#BOXPLOT (GRAFICO DE CAJA)
#Una gráfica de caja resume la distribución de una variable continua. 
# Muestra su mediana, su primer y tercer cuartiles y outliers.

ggplot(mpg, aes(x = drv, y = hwy)) +
  geom_boxplot() 
#En el eje x tengo drv (tipo de transmision), y en eje y, hwy (millas por galon)

# que observamos?

#con geom_jitter, puedo "manejar" los puntos en el boxplot

#Si quiero darle color a los puntos:
ggplot(mpg, aes(x = drv, y = hwy)) +
  geom_boxplot(aes(color = drv), alpha = 0.7) + 
  geom_jitter(aes(color = drv), size = 1, alpha = 0.7)+ 
  xlab("Transmision") + 
  ylab("Millas/galon") +
  ggtitle("Boxplot") + 
  theme_minimal() 

#con size, modifico el tamano de los puntos
ggplot(mpg, aes(x = drv, y = hwy)) +
  geom_boxplot(aes(color = drv), alpha = 0.7) + 
  geom_jitter(aes(color = drv), size = 3, alpha = 0.7)+ 
  xlab("Transmision") + 
  ylab("Millas/galon") +
  ggtitle("Boxplot") + 
  theme_minimal() 

#con alpha, el tono de color de los puntos
ggplot(mpg, aes(x = drv, y = hwy)) +
  geom_boxplot(aes(color = drv), alpha = 0.1) + 
  geom_jitter(aes(color = drv), size = 3, alpha = 0.1)+ 
  xlab("Transmision") + 
  ylab("Millas/galon") +
  ggtitle("Boxplot") + 
  theme_minimal() 

#otra alternativa al boxplot es el VIOLIN PLOT (grafico de violines)
ggplot(mpg, aes(x = drv, y = hwy)) +
  geom_violin()

ggplot(mpg, aes(x = drv, y = hwy)) +
  geom_violin(aes(fill = drv))

ggplot(mpg, aes(x = drv, y = hwy)) +
  geom_violin(aes(fill = drv), alpha = 0.7) + 
  geom_jitter(aes(color = drv), size = 1, alpha = 0.7)+ 
  xlab("Transmision") + 
  ylab("Millas/galon") +
  ggtitle("Boxplot") + 
  theme_minimal() 

#Encima del grafico de violines puedo superponer el boxplot:
ggplot(mpg, aes(x = drv, y = hwy)) +
  geom_violin(aes(fill = drv))+geom_boxplot()

#Para variables cualitativas se pueden usar los barplot:

g1<- ggplot(mpg,aes(class))+geom_bar(aes(fill=class))+
  xlab("Tipo de auto")+ylab("Frecuencia")+theme_minimal()+
  ggtitle("Tipos de autos")



g2 <- ggplot(mpg, aes(cyl, fill = as.factor(fl))) + 
  geom_bar() + 
  xlab("Numero de cilindros") + 
  ylab("Frecuencia") + 
  ggtitle("Numero de cilindros segun combustible") +
  labs(fill = "Tipo de combustible")+ theme_dark()

g3<- ggplot(mpg, aes(
  displ, hwy)) +
  geom_point(col="violet") +geom_smooth(method = "lm")

g4<- ggplot(mpg, aes(hwy)) + geom_freqpoly(col="aquamarine2") +xlab("Desplazamiento del motor") + 
  ylab("Frecuencia") + ggtitle("Desplazamiento del motor") +
  theme_minimal()


#si quiero tener en una misma hoja multiples graficos:


#Utilizo el paquete gridExtra
#Instalar el paquete y cargar la libreria en memoria
library(gridExtra)
library(dplyr)
grid.arrange(g1, g2, g3, g4, ncol=2, nrow =2)


#Para colores instalar colourPicker:
library(colourpicker)
colourPicker()
ggplot(mpg, aes(hwy)) + geom_freqpoly(col="#FFA500") +xlab("Desplazamiento del motor") + 
  ylab("Frecuencia") + ggtitle("Desplazamiento del motor") +
  theme_minimal()


#############################################################################################
#EJERCICIO LOGISTICA
#4
#Cargar la base sp (hoja 1)
library(readxl)
sp <- read_excel("sp.xlsx")
sp$Weight

#La variable weight debe pasarse a una variable numerica:
sp$Weight<- as.numeric(sp$Weight)

#1) Seleccionar las columnas weight y unit quantity, y guardarlas en un data frame llamado d_sp




#que pasa con variable weight?que transformacion debemos realizar?
#2) Seleccionar las filas con un Weight mayor a 60


#3)Ordenar la variable Weight de forma ascendente y arrojar las primeras 20 filas del data set



#4) Ordenar la variable Weight de forma ascendente y arrojar las ultimas 20 filas del data set


#5) Generar la media (Media) y mediana (Mediana) de la variable Unit_quantity


#6)Generar el rango (Rango) y el desvio estandar (SD) de la variable weight




#volvemos a trabajar con el data set sp
#7) Renombrar las variables Weight en Peso y Unit_quantity en Unidades



#8)Realizar un diagrama de dispersion entre Weight (y) y Unit_quantity (x).
#Utilizar el paquete ggplot2



#9)Subdividir el grafico por tipo de Servicio (Service_level)



#10)Realizar un grafico de densidad para la variable Weight. Por que?



#11) Realizar un boxplot para la variable Unit_quantity segun el tipo de Servicio



