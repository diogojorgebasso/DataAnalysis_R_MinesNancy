#TP3 - Analyse en Composantes Principales

#[1]

    #[1.1] Importer le jeu de donées sous R
    
    getwd()
    setwd("C:/Users/Erick/Documents/Softwares/R/TP3")    
    orange <- read.csv("orange_sansaccent.csv", sep = ";", dec = ".", header = T, row.names = 1)    
    summary(orange)
    jus <- orange[,1:7]
    
    #[1.2,3] Donner quelques statistiques descriptives sur les variables d’interet
    
    #C'est important de mettre row.names = 1 pour utiliser le corrplot, prc ça veut dire que la premier column sont des noms des lignes
    M = cor(jus)
    corrplot(M, method="color")
    corrplot(M, method="number")
    
    res.pca <- PCA(orange,quanti.sup = 8:15, quali.sup = 16:17)
    
    #[1.4]
    
    round(res.pca$eig,2) #Ça sert pour simplifier les valeurs propres (eigenvalue). Pour déterminer la qntt, ça depend de la 'seuil' (?)
    
    #[1.5]
    
    plot(res.pca$eig[,1], type="l", xlab="", ylab = "Valeurs propres", main = "Ebouli des valeurs propres")
    
    barplot(res.pca$eig[,2], names=paste("Dim",:nrow())) #??? pdf 6
    
    round(res.pca$var$coord[,1:2],2)
    
    round(res.pca$var$cos2[,1:2],2)
    
    round(res.pca$var$contrib[,1:2],2)
    
    round(res.pca$var$contrib[,1:3],2)
    
    plot.PCA(res.pca, axes = c(1,2), choix = "ind")
    plot.PCA(res.pca, axes = c(1,3), choix = "ind")
    
    #Resultats relatifs aux individus
    res.pca$ind$coord[,1:2]
    
    barplot(orange$Intensite.odeur~orange$Produit)
    mean_orange <- mean(orange$Intensite.odeur)
    abline(h = mean_orange, lty = 2)
    
#[2]
    
    #[1] Prendre le document
    
    decathlon <- read.table("decathlon.txt", header = T)
    summary(decathlon)
    