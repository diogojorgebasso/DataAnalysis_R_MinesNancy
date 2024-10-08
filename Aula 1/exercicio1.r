setwd("c:/Users/diogo/code/Analyse de Donne/Aula 1/")

### EX 1

dados <- read.table("freinage.txt", header = TRUE, encoding = "UTF-8")
dados

## EX 2

plot(dados$vitesse, dados$distance,
     xlab = "Vitesse (km/h)",
     ylab = "Distance de freinage (m)",
     main = "Distance de freinage en fonction de la vitesse")

### EX 3

correlation <- cor(freinage$vitesse, freinage$distance)
test_correlation <- cor.test(freinage$vitesse, freinage$distance)


### EX 4

modele <- lm(distance ~ vitesse, data = dados)

### EX 5
coefficients(modele)

plot(freinage$vitesse, freinage$distance,
     xlab = "Vitesse (km/h)",
     ylab = "Distance de freinage (m)",
     main = "Distance de freinage en fonction de la vitesse")
abline(modele, col = "red")


### EX 6

ecart_type_residuel <- summary(modele)$sigma

### EX 7

r_carre <- summary(modele)$r.squared

### EX 8

summary(modele)

### EX 9

confint(modele, level = 0.95)

### EX 10

par(mfrow = c(2, 2))
plot(modele)

### EX 11

freinage$vitesse2 <- freinage$vitesse^2

### EX 12
modele_nouveau <- lm(distance ~ vitesse + I(vitesse^2), data = freinage)

### EX 13

nouvelle_vitesse <- data.frame(vitesse = 60)
distance_predite <- predict(modele, newdata = nouvelle_vitesse)

### EX 14
xnew <- 3600
xnew <- as.data.frame(xnew)

