setwd("C:/Users/diogo/code/Analyse de Donne/Aula 5")

fromage <- read.table("fromage.txt", header=T, row.names = 1, dec = ".")

fromage

summary(fromage)

fromage2 <- scale(fromage, center=T, scale=T)
fromage.d <- dist(fromage2)

cah.ward <- hclust(fromage.d, method = "ward.D2")
plot(cah.ward)
