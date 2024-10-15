setwd("C:/Users/diogo/code/Analyse de Donne/Aula 5")

library(FactoMineR)

autos <- read.csv("autos2005.csv",
  sep = ";", dec = ",",
  header = TRUE, row.names = 1,
  fileEncoding = "Latin1"
)

summary(autos)

# Corolation matrix
cor(autos)

pca_auto <- PCA(autos, scale.unit = TRUE, ncp = 6)
summary(acptest)

# Print ACP results
"/
pca.auto$eig
pca.auto$var$coord[, 1:2]
pca.auto$var$cor[, 1:2]
pca.auto$var$cos2[, 1:2]
pca.auto$ind$coord[, 1:2]
pca.auto$ind$cos2[, 1:2]
pca.auto$ind$contrib[, 1:2]
dimdesc(pca.auto)
/"

hcpc <- HCPC(pca_auto)
