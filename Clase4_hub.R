# CLASE 4 HUB LOGISTICO

# Visualizacion de datos
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


#stat_bin() using bins = 30. Pick better value with binwidth.
#Las posibles opciones para solucionar esto es estableciendo el número de barras con el argumento bins o 
#modificar el ancho de cada barra con el argumento  binwidth .
#binwidth= ancho de las barras que recogen los rangos de representación de la variable.

#bins=5 (tengo 5 intervalos=5 barras apiladas)

ggplot(mpg, aes(displ,fill="coral")) + geom_histogram()+stat_bin(bins=5)+ xlab("Desplazamiento del motor") + 
  ylab("Frecuencia") + ggtitle("Desplazamiento del motor") +
  theme_linedraw()


#bins=10

ggplot(mpg, aes(displ,fill="coral")) + geom_histogram()+stat_bin(bins=10)+ xlab("Desplazamiento del motor") + 
  ylab("Frecuencia") + ggtitle("Desplazamiento del motor") +
  theme_linedraw()

# bins=20
ggplot(mpg, aes(displ,fill="coral")) + geom_histogram()+stat_bin(bins=20)+ xlab("Desplazamiento del motor") + 
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

ggplot(mpg, aes(displ,fill="blue"),binwidth=10) + geom_density()+ xlab("Desplazamiento del motor") + 
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





#############################################################################################

#Ultimo ejercicio!


library(ISLR)
library(tidyverse)
library(ggplot2)
data("Carseats")
Carseats


#Para un nuevo lanzamiento de una butaca de autos para niños, 
#se estudió la base de datos Carseats.

#La base de datos Carseats contiene las siguientes variables:
#Sales: Ventas unitarias (en miles) en cada ubicación
#CompPrice: Precio cobrado por la competencia en cada ubicación
#Income: Nivel de ingresos de la comunidad (en miles de dólares)
#Advertising: Presupuesto de publicidad local para la empresa en cada ubicación (en miles de dólares)
#Population: Tamaño de la población en la región (en miles)
#Price: Precio que cobra la empresa por los asientos de seguridad en cada sitio
#ShelveLoc: Un factor con niveles Malo, Bueno y Medio que indica la calidad de la ubicación de las
#estanterías para los asientos de seguridad en cada sitio.
#Age: Edad media de la población local
#Education: Nivel de educación en cada ubicación
#Urban: Un factor con niveles No y Sí para indicar si la tienda se encuentra en una ubicación urbana
#o rural.
#US: corresponde a un factor con niveles No y Sí para indicar si la tienda está en EE. UU o no.

#1) Guardar el data set carseats en un objeto llamado autos
autos <- data.frame(Carseats)

#2) Calcule el valor promedio  del precio de asientos de seguridad (price)
mean(autos$Price)

#3) Seleccione las variables Sales, Price e Income del data frame
autos %>% select(Sales,Price, Income)
autos %>% select(1,3,6)

#4) Seleccione las variables Age y Education, mostrando las ultimas 5 filas
autos %>% select(Age,Education) %>% tail(5)

#5) Seleccione aquellas filas que corresponden a tiendas de US (US=TIENDAS DE USA, YES /NO)
autos %>% filter(US=="Yes")

#6) Seleccione aquellas filas que corresponden a tiendas de US (US=TIENDAS DE USA, YES /NO)
#y con ingreso (income) mayor a 120
autos %>% filter(US=="Yes" & Income>=120)

#7) Ordene de forma ascendente la variable Age, mostrando las primeras 20 filas
autos %>% arrange(Age) %>% head(20)

#8) Realice un boxplot de la variable Income, segun US
ggplot(autos,aes(US,Income))+geom_boxplot()+ggtitle("Boxplot")+xlab("Tienda en US")+ylab("Ingreso")

#9) Realizar el grafico de densidad de la variables Sales
ggplot(autos,aes(Sales,fill="violet"))+geom_density()+ggtitle ("Grafico de densidad")

#10) Colocar los dos graficos anteriores en una misma hoja
g11<- ggplot(autos,aes(US,Income))+geom_boxplot()+ggtitle("Boxplot")+xlab("Tienda en US")+ylab("Ingreso")
g22<- ggplot(autos,aes(Sales,fill="violet"))+geom_density()+ggtitle ("Grafico de densidad")



library(gridExtra)
library(dplyr)
grid.arrange(g11, g22)
#11) Realizar un diagrama de dispersion entre Sales (y) y Price (x)


#12)  Realice un barplot para la variables Urban (yes= se encuentra en zona urbana)


