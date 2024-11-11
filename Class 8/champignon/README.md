# Analyse de données – TD2

**Yannick Toussaint**  
9 novembre 2020

L’objectif est d’extraire des règles sur un petit exemple et de bien comprendre également la manipulation des ensembles de motifs et de règles. À chaque étape, observer les résultats avec la fonction `inspect`. Pour ne pas surcharger votre machine, n’hésitez pas à quitter R et à le relancer quand vous changez de base de données.

## 1. Base Mushroom

Nous allons travailler sur une base de données réelle appelée Mushroom décrivant un certain nombre de champignons. La description de la base est accessible à l’adresse suivante : [Mushroom Database](https://archive.ics.uci.edu/ml/machine-learning-databases/mushroom/).

La section 7 du fichier `agaricus-lepiota.names` explique à quoi correspondent les différentes colonnes du fichier data. Le fichier `agaricus-lepiota.data` est le fichier de description à proprement parler. On voit que tous les champignons sont décrits par le même nombre d’attributs, ils sont multivalués. Il faudrait donc pré-traiter ce fichier pour rendre binaires les attributs multivalués. C’est ce qui a été fait dans la base Mushroom sous R.

Un champignon est soit vénéneux (poisonous), soit comestible (edible).

### Question 1

Charger la librairie `arules` et la base Mushroom. Extraire dans deux variables `I` et `IC` respectivement les motifs fréquents et les motifs fermés fréquents avec σs = 0.1. Observer la différence dans le nombre de motifs. Et vérifier quelle est la relation attendue entre ces deux ensembles.

### Question 2

Extraire les règles d’associations de ces deux ensembles de motifs, respectivement dans les variables `R` et `CR`. On prendra un seuil de confiance à 0.4.

### Question 3

Comment trouver des critères pour identifier les champignons vénéneux (Poisonous). On appellera `PR` et `PCR` les deux ensembles de règles construits respectivement à partir des motifs et des motifs fermés.

## 2. Base Adult

### Question 4

Trier par confiance et support décroissants et sauver respectivement dans les variables `PRord` et `PCRord`.

### Question 5

Éliminer les règles redondantes et sauvegarder dans les deux variables `PRordNR` et `PCRordNR`.

### Question 6

Observer les 10 premières règles de chacun des ensembles `PRordNR` et `PCRordNR`. Qu’observez-vous ? Comment cela s’explique-t-il ? Au final, que retiendriez-vous comme règles pour partir à la cueillette de champignons ?

### Question 7

Comment identifier les champignons comestibles ?

### Question 8

À partir de la base initiale, peut-on expérimenter un autre codage dans l’idée de voir si on arrive à des règles plus simples pour les deux catégories de champignons ?

## 2. Base Adult

### Question 9

Sur la base Adult, trouver les caractéristiques des populations gagnant plus de 50K/an et de celles gagnant moins de 50K/an.

### Question 10

Trouver les types de jobs occupés par des blancs et ceux par des noirs (On regarde les 10 premiers résultats). Afficher quelques éléments de la base de données pour trouver comment sont formulés les attributs.

### Question 11

Quels liens peut-on trouver entre le niveau d’éducation et le type de travail ?

## 3. Base Groceries

L’entreprise X veut améliorer la vente de quelques produits qui sont peu vendus. Pour cela, elle veut identifier les produits peu vendus puis disposer ces produits `Z` près d’autres produits `W` tels que `Z` est souvent acheté en même temps que `W`.

### Question 12

Trouver un produit peu vendu. En réalité, pour ne pas que cela soit trop coûteux en calcul, on va prendre un support pas trop faible.

### Question 13

Extraire les motifs et règles d’association avec le support adéquat.

### Question 14

Définir la méthode pour faire en sorte que les clients voient mieux ce rayon.
