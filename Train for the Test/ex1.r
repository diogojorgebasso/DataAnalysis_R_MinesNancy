data(iris)
iris
iris2 <- iris[, 1:2]

library(MASS)
library(FactoMineR)

hcpc <- HCPC(pca_auto)

modele <- aov(NAG ~ site, data = poissons)
summary(modele)
