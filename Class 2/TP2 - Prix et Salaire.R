#TP2 - Prix et Salaire

      #1. COnfigurer le directory
      
      getwd()
      setwd("C:/Users/Erick/Documents/Softwares/R/TP2")
      
      #2. Prendre les tables
      
      prix <- read.csv("ubs_regression.csv", sep = ";", dec = ",", header = TRUE, na.strings = "NA")
      prix
      
      modele <- lm(prix$SHNET ~ prix$ALIM+prix$VETF+prix$VETH+prix$EQUIP+prix$MEUBL+prix$APPART+prix$TRANSP+prix$TAXI+prix$AUTO+prix$RESTO+prix$HOTEL+prix$SERVICES)
      summary(modele)
