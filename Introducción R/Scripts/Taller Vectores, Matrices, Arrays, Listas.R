#____________________________2/5/2024
#generacion de una lista con todos los objetos que hemos visto
#vector n=10 x~exp(4) 
set.seed(123)
lambda<-c(4,0.5,2/3,1/3)
m<-100
n<-10
v1<-c(rexp(n,lambda[1]))
v1
#matriz m*n m=100 horas incluyendo vectores de 10 muetras cada una
M1<-matrix(rexp(m*n,4),ncol=n)
M1
#Array ns=3 E(l1)=2 E(l2)=1.5 e(l3)=3
M2<-matrix(rexp(m*n,lambda[2]),ncol = n)
M3<-matrix(rexp(m*n,lambda[3]),ncol = n)
M4<-matrix(rexp(m*n,lambda[4]),ncol = n)
options(max.print = 100000)
A1<-array(c(M2,M3,M4),dim = c(m,n,3))
A1
#lista que tenga m,n Lambda 
mediav1<-mean(v1)
mediaM1<-c(apply(M1,1,mean))
medias<-matrix(c(apply(M2,1,mean),apply(M3,1,mean),apply(M4,1,mean)), ncol=3)
L1<-list(m,n,lambda,mediav1,mediaM1,medias)
#lista de listas
L2<-list(v1,M1,A1,L1)
#medias s2 y s3 número 50
#como medias es matriz:
L2[[4]][[6]][[50,2]]
L2[[4]][[6]][[50,3]]


