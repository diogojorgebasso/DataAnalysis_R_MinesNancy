setwd("C:/Users/diogo/code/Analyse de Donne/Aula 5")

autos <- read.csv("autos2005.csv", sep=";", dec=",", header=TRUE, row.names=1, fileEnconding="latin1")

if (!require(FactoMineR)) {
  install.packages("FactoMineR")
  library(FactoMineR)
}

summary(autos)
autos

cor(autos)

acptest <- acp(autos, scale.unit = TRUE, ncp=6)
summary(acptest)