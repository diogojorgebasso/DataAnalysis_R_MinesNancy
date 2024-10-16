universite <- read.csv("universite.csv", sep=";", header=TRUE, row.names = 1, fileEncoding = "ISO-8859-1")

universite

#summary(universite)

profil <- function(x){x/sum(x)*100}
profil.ligne <-t(apply(universite[,1:6], 1, profil))
profil.colonne <- apply(universite[,1:6], 2, profil)
profil.colonne

chideux <-chisq.test(universite[,1:6])
chideux

# alpha de corte é geralmente em 5%

res.ca <- CA(universite, col.sup=7:12)

barplot(res.ca$eig[,2], names=paste("Dim", 1:nrow(res.ca$eig)))
round(res.ca$eig, 3)

plot(res.ca)
plot(res.ca, invisible="row")
plot(res.ca, invisible=c("col", "col.sup"))
plot(res.ca, invisible = "col")
plot(res.ca)

a <- round(cbind(res.ca$row$coord[,1:3], res.ca$row$contrib[,1:3], res.ca$row$cos[,1:3]),2)
plot(a)

round(cbind(res.ca$col$coord[,1:3], res.ca$col$contrib[,1:3], res.ca$col$cos[,1:3]),2)


## EX 2

vacances <- read.csv("vacances.csv", header = T, row.names = 1, sep = ";")
vacances

summary(vacances)

profil <- function(x){x/sum(x)*100}
profil.ligne <-t(apply(vacances[,1:6], 1, profil))
profil.colonne <- apply(vacances[,1:6], 2, profil)
profil.colonne

chideux <-chisq.test(vacances[,1:6])
chideux

plot(res.ca)
plot(res.ca, invisible="row")
plot(res.ca, invisible=c("col", "col.sup"))
plot(res.ca, invisible = "col")
plot(res.ca, axes = 2:3)


res.ca <- CA(vacances)
barplot(res.ca$eig[,2], names=paste("Dim", 1:nrow(res.ca$eig)))
round(res.ca$eig, 3)

credit <- read.csv("credit")