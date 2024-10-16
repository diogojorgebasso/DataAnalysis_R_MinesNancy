# Test Analyse de Données

## Ecole des Mines de Nancy - Tronc commun 2A  
**7 janvier 2020**  
**Durée**: 2h  

*Notes de cours et de TP autorisées*  
*Sujet de S. Ferrigno (séances 1 à 7)*

### Consignes
Veuillez répondre directement aux questions sur la feuille d'énoncé dans les espaces laissés libres à cet effet. Toutes les réponses devront être justifiées.

Les données "Les iris de Fisher" ont été collectées par Edgar Enderson et proposées en 1933 par le statisticien Ronald Aylmer Fisher comme données de référence pour l'analyse discriminante et la classification. Le but est de reconnaître le type d'iris (setosa, virginica, et versicolor) à partir des longueurs et largeurs des pétales et sépales. Le fichier contient 50 fleurs de chaque type.

Les données sont disponibles dans le **data frame** `iris` du package de base de R. Pour charger ce **data frame**, utilisez la commande `data(iris)`.

En utilisant vos connaissances acquises en cours et TD/TP avec l'aide du logiciel R, répondez aux questions suivantes.

## Partie 1 (7 points) : Étude bivariée et Analyse en Composantes Principales (ACP)

1. Existe-t-il un lien entre les variables `Sepal.Length` et `Sepal.Width` ? Utilisez un test statistique pour répondre à cette question. Précisez les hypothèses du test, la statistique de test et la valeur de la p-value. Concluez en utilisant un risque de 5%.

2. Reprenez la question 1 pour les variables `Petal.Length` et `Petal.Width`.

3. Lancez une ACP normée sur ce jeu de données, en ne conservant que les variables adaptées à ce type d'étude. Quels sont les individus de cette étude d'ACP ? Dans quel espace sont-ils définis ?

4. Une ACP normée était-elle nécessaire dans le contexte de cette étude ? Justifiez votre réponse.

5. Pour cette étude, combien d'axes allez-vous conserver pour effectuer la projection des données selon le critère de Kaiser ? Et selon votre "bon sens" ? Justifiez votre réponse.

6. Quelles variables contribuent le plus à la construction de l'axe 1 et de l'axe 2 ? Justifiez votre réponse.

7. Quelles variables sont bien représentées dans le plan (1, 2) ? Justifiez votre réponse.

8. Parmi les 150 iris, donnez un exemple d'iris mieux représenté dans le plan (1, 3) que dans le plan (1, 2). Justifiez votre réponse.

## Partie 2 (8 points) : Classification Automatique Hiérarchique (CAH)

Lancez une classification hiérarchique ascendante sur le jeu de données `iris` sans la variable `Species` en utilisant la méthode de Ward et la distance Euclidienne.

1. Quelle est la distance entre les iris 6 et 3 ?

2. Donnez le code R utilisé pour effectuer cette classification à partir de la matrice des distances.

3. Combien de classes choisiriez-vous à partir du dendrogramme ? Justifiez votre réponse.

4. Combien d'iris sont affiliés aux classes 1, 2, et 3 ?

5. À quelle classe appartient l'iris numéro 70 ?

6. Quelle est la moyenne de la variable `Sepal.Length` dans chacune des trois classes ?

7. Lancez une classification hiérarchique ascendante sur l'ensemble des composantes principales obtenues par l'ACP (sans la variable `Species`). Combien de classes le dendrogramme suggère-t-il ? Justifiez votre réponse.

8. Donnez le numéro de l'iris le plus représentatif et celui le plus éloigné des centres de gravité des autres classes pour chacune des trois classes. Justifiez votre réponse.

## Partie 3 (5 points) : Analyse Discriminante

Nous travaillerons avec l'ensemble des variables du jeu de données `iris` pour retrouver les espèces d'iris.

1. Classez les quatre variables quantitatives de la plus discriminante à la moins discriminante. Justifiez votre réponse.

2. Réalisez un test de Wilks sur ces données. Précisez les hypothèses, la statistique de test, la p-value, et concluez avec un risque de 5%.

3. Effectuez une analyse discriminante avec toutes les variables du jeu de données `iris`. Combien d'axes discriminants sont retenus ? Quelle est la proportion de variance captée par chaque axe ?

4. Si vous appliquez ce modèle aux données, quel est le taux d'erreur ?

5. Prédisez à quelle espèce appartient un iris avec les caractéristiques suivantes : `(6.3, 3, 5.2, 1.8)`.

