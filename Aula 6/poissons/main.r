# Setar o diretório de trabalho
setwd("C:/Users/diogo/code/Analyse de Donne/Aula 6/poissons")

# Importar as bibliotecas necessárias
update.packages()
library(MASS)

# 1ª passo: Preparação dos Dados:
# Geralmente, os dados são importados de um arquivo .csv, .txt, .xlsx, etc.
# ou seja, poissons <- read.csv("poissons.csv")
# Nesse caso, os dados já estão disponíveis no ambiente de trabalho através do
# formato .rda

load("poissons.rda")
poissons

# 2ª Passo: Análise Exploratória de Dados (AED):

poissons2 <- split(poissons[, c(2:15)], poissons[, 1])
poissons2

summary(poissons2$site1)
summary(poissons2$site2)
summary(poissons2$site3)

# 2.b Visualização Gráfica:
boxplot(YEU ~ site, data = poissons, main = "YEU por Site")
boxplot(BR ~ site, data = poissons, main = "BR por Site")
boxplot(FOI ~ site, data = poissons, main = "FOI por Site")

# 3ª Passo: Teste de Diferenças entre Grupos
# Verificar quais variáveis diferem significativamente entre os sites.

anova_results <- sapply(poissons[, -1], function(x) {
  summary(aov(x ~ poissons$site))[[1]][["Pr(>F)"]][1]
})

anova_results <- data.frame(
  Variável = names(anova_results),
  p_value = anova_results
)

print(anova_results)

# Variáveis com p-value < 0.05 indicam
# diferenças significativas entre os sites
# e são boas candidatas para o modelo LDA.

# 4ª Passo: Verificação de Multicolinearidade

library(corrplot)

cor_matrix <- cor(poissons[, -1])

corrplot(cor_matrix, method = "circle")

# Identifique variáveis altamente correlacionadas
# (coeficiente de correlação > 0.9).

# 5ª Passo: Seleção de Variáveis

# Existem duas opções:

# 5.1 Você pode rodar os modelos individulmente, vendo através do summary
# e do modelo

modele <- aov(NAG ~ site, data = poissons)
summary(modele)

modele_test <- lda(site ~ ., data = poissons)
modele_test

modele2 <- lda(site ~ YEU + BR, data = poissons)
modele2

modele3 <- lda(site ~ YEU + BR + NAG + EC, data = poissons)
modele3

prev1 <- lda(site ~ ., data = poissons, CV = TRUE)$class
table(prev1, poissons$site)

sum(prev1 != poissons$site) / nrow(poissons)

# A gente escolhe o modelo 2!
prev2 <- lda(site ~ YEU + BR, data = poissons, CV = TRUE)$class
table(prev2, poissons$site)
sum(prev2 != poissons$site) / nrow(poissons)

prev3 <- lda(site ~ YEU + BR + NAG, data = poissons, CV = TRUE)$class
table(prev3, poissons$site)
sum(prev3 != poissons$site) / nrow(poissons)

prev4 <- lda(site ~ YEU + BR + NAG + EC, data = poissons, CV = TRUE)$class
table(prev4, poissons$site)
sum(prev4 != poissons$site) / nrow(poissons)

prev5 <- lda(site ~ EC, data = poissons, CV = TRUE)$class
table(prev5, poissons$site)
sum(prev5 != poissons$site) / nrow(poissons)

modele2_pred <- predict(modele2, newdata = poissons)$class
modele2_pred

# 2 Você pode fazer automaticamente usando a biblioteca Klar

library(klaR)

preditoras <- poissons[, -1] # Todas as colunas exceto 'site'
resposta <- poissons$site

modelo_step <- stepclass(
  preditoras,
  poissons$site,
  method = "lda",
  direction = "both"
)

# Como a melhoria na taxa de acerto foi inferior a 5% após a inclusão de "YEU",
# o processo stepwise foi interrompido. Isso significa que a adição de outras
# variáveis não proporcionaria um ganho significativo na precisão do modelo.

# 6ª Passo: Construção do Modelo LDA

# Com base no que vimos, o modelo_step$formula representa quais variáveis
# são as mais significativas para rodar o lda.
formula_lda <- modelo_step$formula

modelo_lda <- lda(formula_lda, data = poissons)
modelo_lda
plot(modelo_lda)

# 7ª Passo: Validação do Modelo

# Taxa de acerto do modelo
predicoes <- predict(modelo_lda, poissons)$class
print(predicoes)

confusao <- table(Predito = predicoes, Real = resposta)
print("Matriz de Confusão:")
print(confusao)

taxa_acerto <- sum(diag(confusao)) / sum(confusao)
print(paste("Taxa de acerto:", round(taxa_acerto * 100, 2), "%"))

# Validação Cruzada

formula_lda <- modelo_step$formula

# Previsões com validação cruzada leave-one-out
predicoes_cv <- lda(formula_lda, data = poissons, CV = TRUE)$class

# Matriz de confusão com validação cruzada
confusao_cv <- table(Predito = predicoes_cv, Real = poissons$site)
print("Matriz de Confusão com Validação Cruzada:")
print(confusao_cv)

# Taxa de acerto com validação cruzada
taxa_acerto_cv <- sum(diag(confusao_cv)) / sum(confusao_cv)
print(paste(
  "Taxa de acerto com validação cruzada:",
  round(taxa_acerto_cv * 100, 2), "%"
))

# 8ª Passo: Entendendo os dados

print("Coeficientes das funções discriminantes:")
print(modelo_lda$scaling)

## Os coeficientes indicam o peso de cada variável na função discriminante.
## Valores maiores em módulo significam maior influência na discriminação
## entre os grupos.

# Teste de normalidade
print("Teste de Shapiro-Wilk para NAG:")
by(poissons$NAG, poissons$site, shapiro.test)

print("Teste de Shapiro-Wilk para YEU:")
by(poissons$YEU, poissons$site, shapiro.test)

# 9ª Passo: simulação de um novo dado

n_don1 <- matrix(
  c(10, 70, 50, 100, 20, 120, 130, 1, 120, 200, 50, 50, 18, 10),
  ncol = 14,
  byrow = TRUE
)
n_don1 <- data.frame(n_don1)
names(n_don1) <- names(poissons[-1])
n_don1
predict(modele2, newdata = n_don1)

plot(modelo)
