#______________________________Clase 30/4
options(prompt="👾")
#------------------------------COMANDOS-------------
#para saber el tipo de dato mode()
logi_var<-c(T,F,T,F)
mode(logi_var)
# Usamos el sufijo L, para crear un número entero y diferenciarlo del resto.
int_var <- c(2L, 4L, 7L, 5L)
#jerarquía para cuando un vector tiene mas de un tipo
#logical < integer < double < complex < character
#puedo hacer una conversion con as. 
as.logical(-3)
as.logical(0)
#puedo ver si es de algun tipo con is.
is.character(int_var)
#-------------------------------VECTORES-------------

#vectores na solo sirVe cuando está escrito NA
x_vec <- c(2, 3, NA, 8)
#dos formas de sacar el NA:
x_vec[!is.na(x_vec)]
x_vec[-which(is.na(x_vec))]
#En las dos lineas de arriba solo estoy consultando,
#para cambiar xvec tengo que asignar por ej: 
#x_vec(o cualquier otro nombre)<-x_vec[-which(is.na(x_vec))]

#---------------SECUENCIAS----------------
seq(1,20,2)
#quiero del 1 al 5 pero 100
seq(1,5,length.out=100)
 #aca ya tengo que poner el nombre lenght.out 

#-------------------ORDENACIÓN
# creamos un vector
x <- c(5, -3.2, 6.7, 0.21, 4.6, -1.23, 0, 9.2, -5.34)
# ordenamos de forma ascendente
sort(x, decreasing = FALSE)
  #puede ser decreasing =T para que devuelva de mayor a menor
#order me devuelve la posición de orden decreciente
x
order(x,decreasing = T)
x[order(x)]
#atributos
x <- c(1, 3, 5, 6, 8, 9)
names(x)
# asignamos nombres a las posiciones del vector
#dos formas
names(x)<- c("uno", "tres", "cinco", "seis", "ocho", "nueve")
attr(x, "names") <- c("uno", "tres", "cinco", "seis", "ocho", "nueve")
x

res<-shapiro.test(x)
class(res)
attributes(res)
names(res)
typeof(res)
res$p.value
res[1]
res[2]
res[[2]]
typeof(res[2]) #devuelve el tipo dentro de una lista
typeof(res[[2]])#devuelve el 

#vector de dimension 1
x<- c(1, 3, 5, 6, 8, 9)
x
#vector de 2 dimensiones
attr(x,"dim")<-c(2,3)
x
#str muestra un resumen de los atributos del objeto
str(x)
#Factores
vec_gen <- c("m", "f", "f", "m", "m", "f")
class(vec_gen)
table(vec_gen)
genero <- factor(vec_gen,
                 levels = c("m", "f", "o"),
                 labels = c("Masculino", "Femenino", "Otro"), ordered = FALSE)
#ordered significa si va a ser nominal (por ej genero) u ordinal 
#(por ej Instrucción)
class(genero)
table(genero)
unclass(genero)
levels(genero)
#relevel() permite cambiar el orden de los niveles
#EJEMPLO DE FACTORES
vec <- c("S", "C", "A", "C", "S", "I", "S")
# creamos el factor con niveles y etiquetas
region <- factor(vec, levels = c("C", "S", "A", "I"),
                 labels = c("Costa", "Sierra", "Amazonía", "Insular"))
region
region[2]
# modificamos la primera posición - Insular por Sierra
region[1] <- "Insular"
# visualizamos el factor modificado
region
# ingresamos un nuevo nivel que no estuvo considerado previamente
region[4] <- "Extranjero"
# revisamos el factor region
region
#Al tratar de forzar el ingreso de un nivel que no estuvo considerado previamente se genera un
#conflicto interno, por lo cual R alerta al usuario, y además, reemplaza dicho elemento por un
#valor perdido NA.
# Ampliamos los niveles del factor
levels(region) <- c("Costa", "Sierra", "Amazonía", "Insular", "Extranjero")
# Ingresamos el nivel nuevo
region[4] <- "Extranjero"
# Visualizamos el factor
region
#El filtrado de los elementos de un factor tiene un funcionamiento similar al filtrado de vectores,
#salvo que las comparaciones se realiza sobre el conjunto de etiquetas:
  # comparacion sobre los niveles - modo incorrecto
  region=="I"
  # comparacion sobre las etiquetas - modo correcto
  region=="Insular"
  # filtrado de un factor
  region[region=="Insular"]
  # creamos el factor para: bajo, medio y alto
  etiquetas <- c("bajo", "medio", "alto")
  opciones <- c("a","b","m")
  valores <- c("m", "b", "m", "a", "m", "a", "b", "m", "a")
  new_fac <- factor(x = valores, levels = opciones, labels = etiquetas,
                    ordered = TRUE)
  # Visualizamos el nuevo factor "ordinal"
  new_fac
  table(new_fac)
x_est<-factor(valores)
#cambiamos el orden de "opciones"
levels(x_est)<-c("b","m","a")
#relevel(x_est,)

#_________________Clase 1/5/24

Mat <- matrix(seq(2,32, by=2), ncol=4, byrow = TRUE)
Mat
#Puedo sacar valores con lógicos
Mat[3,c(T,F,T)]
#generar valores de x con probabilidad p
x<-c(0,1,2,3)
p<-c(0.3,0.2,0.4,0.1)
sample(x,100,replace=TRUE,p)
set.seed(123)
C <- matrix(sample(seq(1,20), size=9), nrow = 3, byrow = FALSE)
C
det(C)
solve(C)
vp<-eigen(C)
vp

l<-matrix(vp[[2]][2,],nrow=3)

p<-matrix(vp$vectors[2,],nrow=3)

B<-diag(c(3,4,5),3)
B

lista <- list(c(2L, 5L, 8L), diag(4),c("a", "b", "c", "d", "e"))
attr(lista,"names")<-c("x1","x2","x3")
#también se puede con names(lista)<-c("x1","x2","x3")

c(l,p)
U <- matrix(sample(seq(1,10),6), nrow = 2)
V <- matrix(sample(seq(10,20),6),nrow = 2)

array(c(U,V),dim=c(2,3,2))

#______________________________2/5/2024

datos <- data.frame(vec1=seq(1,4), vec2=c(T,F,T,F), vec3=LETTERS[1:4])
datos
#puedo hacer en una dataframe pero no en una lista
datos[,3]
datos[c(T,T,T,F),3]
str(datos)
#Por defecto, R transforma los vectores de caracteres en factores, 
#para evitar esta conversión automática colocamos el argumento 
#stringsAsFactors=FALSE:
dat <- data.frame(vec1=seq(1,4), vec2=c(T,F,T,F), vec3=LETTERS[1:4],
                    vec4=c(-1,-3), vec5=c("EC"), stringsAsFactors = FALSE)
str(dat)
#modificación de dataframes
datos$vec4<-1:4
#al nombre de las columnas va a ser la unión de la columna 1  con la 3
rownames(datos)<-paste0(datos$vec1,datos$vec3)
datos
#ver la dimension del dataframe dim()
#sin el attach tengo queponer por ej datos$vec1
#el attach reconoce los nombres vec en este caso y así ya podemos llamar a los vec por separado
attach(datos)
vec1
#formas de llamar a los dataframes
datos$vec1
datos[[1]]
datos[,1]
datos[1][[1]]
datos[,c(-2,-3,-4)]
datos[,-c(2,3,4)]
  #si tengo attach puedo llamar con vec1
#detach hace lo contrario al attach
detach(datos)
vec1
attach(datos)

datos
# Añadimos la variable vec7 con los valores TRUE, FALSE, FALSE, TRUE
datos <- data.frame(datos, vec7=c(TRUE, FALSE, FALSE, TRUE))
# Observamos el objeto sobreescrito
datos
#añadimos datos de una dist normal media 4 sigma 2
set.seed(123)
datos$norm<-rnorm(4,4,2)

#Filtrado de filas con la norma mayor a 4
#dos formas
datos[datos$norm>4,]
subset(datos,norm>4)
#puedo condicionar sobre filas y columnas
datos[vec4>2,c("vec1", "vec3", "norm")]
subset(datos, vec4>2, select = c(vec1, vec3, norm))
#Eliminación de variables
# Eliminamos la segunda variable
datos[,2] <- NULL
# Eliminamos vec4
datos$vec4 <- NULL
# Observamos los resultados
datos

#---------------------DATATABLE
#un datatable es una version mejorada de un dataframe
library(data.table)
set.seed(12345)
base <- data.table(B1=1:12, B2=LETTERS[1:4], B3=round(rnorm(3), 4),B4=c(2L, 5L, 8L))
class(base)
class(base[1])
base
base[1]
length(base)
base[9:11]
#La estructura tabular de data.table cuenta con un símbolo especial .N 
#el cual contiene el número total de filas.
# Imprimimos la última fila de la base empleando ’.N’
base[.N]
# Imprimimos la antepenúltima fila
base[.N-2]
#El total de filas en una base puede ser obtenido por medio del símbolo .N o nrow .
base[,.N]
nrow(base)
#extracción de variables
base$B1
base[["B3"]]
base[,B2]
# Extracción de dos variables "B2" y "B3"
#dos formas
base[,.(B2,B3)]
base[,list(B2,B3)]
# Obtenemos el promedio de la variable B3
base[,mean(B3)]
#puedo hacer varias operaciones
# Obtenemos la suma y la desviación de las variables B4 y B3 respectivamente
base[,list(SUMA=sum(B4), DESVIACION=sd(B3))]
base[,.(B2, DESVIACION = sd(B3))]











