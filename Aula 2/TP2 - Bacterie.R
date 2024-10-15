#TP2 - BACTERIE

#[1.1]
    #1. Pour configurer de directory
    getwd()
    setwd("C:/Users/Erick/Documents/Softwares/R/TP2")
    
    #2. Prendre le document "bacterie.txt"
    bacterie <- read.table("bacterie.txt", header = T)
    bacterie
    
    #3. faire le modèle linéaire et ploter le graphique
    modele <- lm(bacterie$NOMBRE~bacterie$TEMPS)
    par(mfcol = c(2,1)) #pour regarder 2 graphiques au même temps
    plot(bacterie$NOMBRE~bacterie$TEMPS)
    abline(modele, col="red")
    summary(modele)
    
    sd(modele$residuals) #Resultat: 40.3
    
    res.modele <- rstudent(modele) #resíduos externamente studentizados
    plot(res.modele~bacterie$TEMPS, ylim = c(-7,7))
    abline(h = c(-2,0,2), lty = c(2,1,2)) # h = ajoute les lignes horizontales et
                                          # lty = indique les types
    
    #C'est évident que le modèle lineaire ne décrit pas bien
    
#[1.2]
    
    #1. Pour fair le modèle lineaire, on doit modifier l'expression par une exp lineaire
    
    ln_y <- log(bacterie$NOMBRE)
    ln_y
    
    #2. Maitenant, on peut faire la relation
    
    modele2 <- lm(ln_y ~ bacterie$TEMPS)
    summary(modele2) #5,973160 = b1 | -0,218425 = b2
    par(mfcol = c(2,1))
    plot(ln_y ~ bacterie$TEMPS, ylim = c(0,10))
    abline(modele2, col="red")
    # y = -0,218425*x + 5,973160
    
    #3. Pour vérifier les residus
    
    res.modele2 <- rstudent(modele2)
    plot(res.modele2 ~ bacterie$TEMPS, ylim = c(-4,4))
    abline(h = c(-2,0,2), lty = c(2,1,2))
    
#[2.1]
    
    #1. Prendre le document "bacterie.txt"
    fitness <- read.table("fitness.txt", header = T)
    fitness    

    #2. Plotation des curves
    fitness_by_age <- fitness[order(fitness$Age, decreasing = FALSE),]
    fitness_by_pouls_run <- fitness[order(fitness$Run_Pulse, decreasing = FALSE),]
    fitness_by_pouls_rest <- fitness[order(fitness$Rest_Pulse, decreasing = FALSE),]
    fitness_by_poids <- fitness[order(fitness$Weight, decreasing = FALSE),]
    par(mfrow = c(2,2)) #ça sert pour regarder les 4 graphiques au même temps
    plot(fitness_by_age$Oxygen_Consumption~fitness_by_age$Age)
    plot(fitness_by_pouls_run$Oxygen_Consumption~fitness_by_pouls_run$Run_Pulse)
    plot(fitness_by_pouls_rest$Oxygen_Consumption~fitness_by_pouls_rest$Run_Pulse)
    plot(fitness_by_poids$Oxygen_Consumption~fitness_by_poids$Weight)
    
    # En regardant les graphiques, il n'y a pas des rélations évidents entre les variables énoncés et la Consomation de O2

#[2.2]
    
    #1. Correlation entre les paramètres
    cor(fitness_by_age$Oxygen_Consumption, fitness_by_age$Age)
    cor(fitness_by_pouls_run$Oxygen_Consumption, fitness_by_pouls_run$Run_Pulse)
    cor(fitness_by_pouls_rest$Oxygen_Consumption, fitness_by_pouls_rest$Run_Pulse)
    cor(fitness_by_poids$Oxygen_Consumption, fitness_by_poids$Weight)
    
    # Les résultats sont tous négatifs et leurs modules sont plus petits que 0.4
    
#[2.3]
    
    #1. Par age
    cor(fitness_by_age$Runtime, fitness_by_age$Age)
    cor(fitness_by_age$Maximum_Pulse, fitness_by_age$Age)
    cor(fitness_by_age$Performance, fitness_by_age$Age)
    
    #2. Par poids
    cor(fitness_by_poids$Runtime, fitness_by_poids$Weight)
    cor(fitness_by_poids$Maximum_Pulse, fitness_by_poids$Weight)
    cor(fitness_by_poids$Performance, fitness_by_poids$Weight)

    #3. Par pouls run
    cor(fitness_by_pouls_run$Runtime, fitness_by_pouls_run$Run_Pulse)
    cor(fitness_by_pouls_run$Maximum_Pulse, fitness_by_pouls_run$Run_Pulse) #0,9297
    cor(fitness_by_pouls_run$Performance, fitness_by_pouls_run$Run_Pulse)
    
    #4. Par pouls rest
    cor(fitness_by_pouls_rest$Runtime, fitness_by_pouls_rest$Rest_Pulse)
    cor(fitness_by_pouls_rest$Maximum_Pulse, fitness_by_pouls_rest$Rest_Pulse)
    cor(fitness_by_pouls_rest$Performance, fitness_by_pouls_rest$Rest_Pulse)
    
    plot(fitness_by_pouls_run$Maximum_Pulse ~ fitness_by_pouls_run$Run_Pulse)

#[2.4]
    
    #1. Pour multiple régresseurs, on peut utiliser lm
    modele3 <- lm(fitness$Oxygen_Consumption ~ fitness$Age+fitness$Weight+fitness$Run_Pulse+fitness$Rest_Pulse)
    summary(modele3)
    