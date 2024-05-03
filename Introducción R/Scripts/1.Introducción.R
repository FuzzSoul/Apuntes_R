#__________________________________Introducción a R
#Cuando iniciamos R tenemos dos formas de trabajar 
  #Sin proyecto: las variables no se guardan en el environment
  #con proyecto: las variables se guardan en el environment
#Creamos un proyecto con
  #File-New Proyect-New Directory-New Project
#---------------------------------------COMANDOS RÁPIDOS
#ctrl+enter ---> compilo
#ctrl+a     ---> selecciono todo
#ctrl+1     ---> cambio a script
#ctrl+2     ---> cambio a consola
#ctrl+s     ---> guardo el script
#ctrl+o     ---> abro un script
#ctrl+alt+m ---> commit a GitHub
#---------------------------------------PAQUETES
#Podemos instalar un paquete con 
  ##install.packages("Nombre del paquete", dependencies=TRUE)
    #Las dependencias significan que el mismo paquete 
    #usa funciones de otros paquetes, para que no exista problemas,
    #instalamos las dependencias también

#Podemos también hacerlo desde la pestaña 
    #Packages-Install-nombre paquete

#Para poder usar un paquete tenemos que poner
  ##library("Nombre del paquete")

#O simplemente en la pestaña Packages- buscamos el nombre del paquete
#previamente instalado- le ponemos un visto en el cuadrito.

#Para quitar un paquete le quitamos el check
#O también detach("Nombre del paquete", unload = TRUE)

#Si sólo quiero usar una función de un paquete previamente instalado, puedo 
#poner nombre_paquete::función_que_quiero y así ya no estoy cargando 
#todo el paquete PASWR a mi proyecto
PASWR::EDA()
  #Puedo ver qué es lo que hace esta función seleccionando "PASWR::EDA" y
  #dando ctrl+enter
#------------------------------DIRECTORIO Y OPTIONS
#Puedo cambiar el prompt con 
options(prompt="👾")
  #en la pestaña help podemos ver qué más hace este comando 

#Para ver el directorio (puedo escribirlo en la consola)
dir()

#La siguiente función nos da el directorio donde estamos trabajando
getwd()

#Podemos cambiar este directorio con 
  ##setwd("dirección del pc donde queramos que se guarden los archivos")

#O simplemente desde la pestaña files-buscamos el lugar en el pc-
#More- Set as Working Directory

#---------------------------ASIGNACIÓN
#El operador asignación es <- o -> depende de dónde apunte la flecha, 
  #además podemos usar el = pero no es recomendable
a<-1
2->b
c=3

#--------------------------FUNCIONES
#ls() nos da todos las variables que tenemos
ls()
#Puedo asignar esto a obj para poder guardarlo
obj<-ls()
save(obj,file = "res.RData")
 #Si no estuviera trabajando en un proyecto,así se guardarían mis variables en 
  #un archivo en la carpeta destino de mi compu

#---------------------------------------------
#Vamos a experimentar con la función EDA
  #Seleccionamos la función que me mostró la consola
    #Abrimos un nuevo script
      #Copiamos y pegamos la función de la consola al nuevo script
        #Por defecto, la función EDA viene con el test de Shapiro-Wilk
          #Vamos a cambiarla por el test de Lilliefors

#Para poder usar la funcion creada en otro script tenemos que llamarla
  #Escribimos source("") 
  #dentro de las comillas podemos navegar con el tab y las flechas
source("Scripts/Funciones.R")

#----------------------------
#Ponemos una semilla para trabajar con datos aleatorios
set.seed(123)

#Asignamos a x 100 muestras de una distribución normal, media 5 desviación 2
x<-rnorm(100,mean = 5,sd=2)
x

#x tiene propiedades:
length(x) #Retorna la cantidad de elementos que tiene x
mode(x) #Retorna de qué tipo es el vector
typeof(x) #Retorna qué tipo son las variables dentro del vector

#gracias a source podemos llamar a nuestra función NEWEDA
NEWEDA(x)

#Names me trae los nombres de los vectores
res<-PASWR::EDA(x,trim=0.1)
names(res)
#puedo actualizar los valores de names con 
 ##paste() una función para poder concatenar cadenas de texto
names(res)<-paste("cod",1:17)
names(res)
#Si no quiero con espacio en blanco:
names(res)<-paste("cod",1:17,sep="-")
res

#como EDA, hist() nos retorna un histograma
hist(res)











