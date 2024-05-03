#TENEMOS QUE COMPILAR SIEMPRE PARA QUE FUNCIONE EN OTRO SCRIPT
#ctlr+a ---- ctrl+enter

#cambiamos la funcion EDA para que funcione con el test de Lillie
NEWEDA<-function (x, trim = 0.05, dec = 3) 
{
  #---------------
  #Para lilliefors necesitamos el paquete nortest,
  #require("nortest")
  #podemos poner en un ciclo if (si no está instalado,que me instale)
  if(!require(nortest)) install.packages("nortest",dependencies = TRUE)
  #la funcion curtosis no está y  está en e1071
  if(!require(e1071)) install.packages("e1071",dependencies = TRUE)
  #---------------
  
  opar <- par(no.readonly = TRUE)
  Altblue <- "#A9E2FF"
  Adkblue <- "#0080FF"
  Ared <- "#C51111"
  varname <- deparse(substitute(x))
  N <- length(x)
  UM <- round(sum(is.na(x)), 0)
  x <- x[is.finite(x)]
  n <- length(x)
  Q1 <- round(quantile(x)[2], digits = dec)
  Q3 <- round(quantile(x)[4], digits = dec)
  IQR <- round(Q3 - Q1, digits = dec)
  Min <- round(min(x), digits = dec)
  Max <- round(max(x), digits = dec)
  Stdev <- round(sd(x), digits = dec)
  Mean <- round(mean(x), digits = dec)
  Median <- round(median(x), digits = dec)
  TrMean <- round(mean(x, trim = trim), digits = dec)
  Var <- round(var(x), digits = dec)
  SE <- round(Stdev/sqrt(n), digits = dec)
  Range <- round(Max - Min, digits = dec)
  par(oma = c(1.4, 2, 6, 2))
  #par(mfrow = c(2, 2))
  par(mar = c(1.5, 2, 3, 2))
  hist(x, freq = FALSE, col = Adkblue, xlab = "", ylab = "", main = paste("Histograma de", varname), 
       breaks = "Scott")
  box()
  mtext("Análisis de Datos Exploratorio", side = 3, outer = TRUE, 
        cex = 1.5, col = Ared, line = 1)
  iqd <- summary(x)[5] - summary(x)[2]
  plot(density(x), xlab = "", ylab = "", axes = TRUE, type = "n", 
       main = paste("Densidad de", varname))
  lines(density(x), col = Ared)
  box()
  mtext("Análisis de Datos Exploratorio", side = 3, outer = TRUE, 
        cex = 1.5, col = Ared, line = 1)
  LH <- fivenum(x)[2]
  UH <- fivenum(x)[4]
  HS <- UH - LH
  l.out <- x[x < (LH - 1.5 * HS)]
  r.out <- x[x > (UH + 1.5 * HS)]
  outliers <- c(l.out, r.out)
  rest <- x[x > (LH - 1.5 * HS) & x < (UH + 1.5 * HS)]
  Minrest <- min(rest)
  Maxrest <- max(rest)
  plot(x, x, main = paste("Diagrama de caja de", varname), xlab = "", 
       ylab = "", axes = TRUE, type = "n", xlim = c(min(x), 
                                                     max(x)), ylim = c(0, 1))
  box()
  mtext("Análisis de Datos Exploratorio", side = 3, outer = TRUE, 
        cex = 1.5, col = Ared, line = 1)
  polygon(c(LH, LH, UH, UH), c(0.3, 0.7, 0.7, 0.3), density = -1, 
          col = Altblue)
  points(outliers, c(rep(0.5, length(outliers))), col = Ared)
  lines(c(min(rest), LH), c(0.5, 0.5), lty = 1)
  lines(c(UH, max(rest)), c(0.5, 0.5), lty = 1)
  lines(c(min(rest), min(rest)), c(0.4, 0.6))
  lines(c(max(rest), max(rest)), c(0.4, 0.6))
  lines(c(LH, LH), c(0.3, 0.7))
  lines(c(UH, UH), c(0.3, 0.7))
  lines(c(Median, Median), c(0.3, 0.7))
  lines(c(LH, UH), c(0.3, 0.3))
  lines(c(LH, UH), c(0.7, 0.7))
  points(Mean, 0.5, pch = 16, col = "black")
  qqnorm(x, col = "black", main = paste("Gráfico Q-Q de", varname), 
         xlab = "", ylab = "", axes = TRUE)
  qqline(x, col = Ared)
  box()
  mtext("Análisis de Datos Exploratorio", side = 3, outer = TRUE, 
        cex = 1.5, col = Ared, line = 1)
  on.exit(par(opar))
  #Por defecto viene con swpval, cambiamos a lill
  Lill <- lillie.test(x)
  K <- round(kurtosis(x), digits = dec)
  S <- round(skewness(x), digits = dec)
  Lillpval <- round(Lill$p.value, digits = dec)
  TOT <- c(n, UM, Min, Q1, Mean, Median, TrMean, Q3, Max, Stdev, 
           Var, SE, IQR, Range, K, S, Lillpval)
  names(TOT) <- c("Size (n)", "Missing", "Minimum", " 1st Qu", 
                  "   Mean", " Median", "TrMean", " 3rd Qu", "   Max", 
                  " Stdev", "   Var", "SE Mean", " I.Q.R.", "  Range", 
                  "Kurtosis", "Skewness", "Lill p-val")
  return(TOT)
}
