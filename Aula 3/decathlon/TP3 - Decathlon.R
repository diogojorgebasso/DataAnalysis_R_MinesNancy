#Décathlon

getwd()
setwd("C:/Users/Erick/Documents/Softwares/R/TP3")

decathlon <- read.table("decathlon.txt", header = T, dec = ".")

summary(decathlon)

M <- cor(decathlon[,1:12])
corrplot(M, method = "color")
corrplot(M, method = "number")

res.decathlon <- PCA(decathlon, quanti.sup = 11:12,quali.sup = 13)

round(res.decathlon$eig, 2)

plot(res.decathlon$eig[,1], type="l", xlab="", ylab = "Valeurs propres", main = "Ebouli des valeurs propres")
barplot(res.decathlon$eig[,3], ylim = c(0,100)) #??? pdf 6
abline(h=80, col="red",lty=2)

round(res.decathlon$var$contrib[,1:2],2)
round(res.decathlon$var$cos2[,1:2],2)

plot.PCA(res.decathlon, axes = c(1,3), choix = "ind")
