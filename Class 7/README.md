## 1. Modélisation d’un problème de fouille de données symbolique en chimie

On souhaite exploiter une base de données d’environ 80 000 réactions chimiques pour proposer, par exemple, des éléments permettant la synthèse de nouvelles molécules. Une réaction, dans la base de données ressemble à celle-ci (réaction #13426 dans la base jsm-2002) :

Les molécules organiques issues de la chimie des molécules à base de carbone peuvent être décomposées en un squelette carboné ou radical lié à des fonctions chimiques particulières auxquelles sont associées des propriétés chimiques spécifiques. On s’intéresse ici aux transformations de ces fonctions au sein des réactions chimiques et c’est pour cela que l’on peut faire des abstractions sur certains atomes en les remplaçant par des nombres. Dans la réaction ci-dessus, on peut reconnaître les fonctions ci-dessous :

### Questions
1. Si M est l’ensemble d’attributs pour l’extraction de motifs, quel est cet ensemble M ?
2. Coder la réaction #13426 sous forme d’une table binaire.
3. Si l’on dispose de ce niveau d’annotation pour les réactions, expliquer comment sera codée cette réaction dans une table binaire.
4. Donner le motif correspondant à la réaction #13426. Peut-on prédire le support de ce motif ?
5. Donner quelques exemples de sous-motifs de la réaction #13426 selon la première représentation. Peut-on déduire quelque chose des attributs absents d’un motif ?

## 2. Extraction de motifs avec R

La base de données AdultUCI contient des enregistrements de la forme :

`39, State-gov, 77516, Bachelors, 13, Never-married, Adm-clerical, Not-in-family, White, Male, 2174, 0, 40, United-States, <=50K 50, Self-emp-not-inc, 83311, Bachelors, 13, Married-civ-spouse, Exec-managerial, Husband, White, Male, 0, 0, 13, United-States, <=50K 38, Private, 215646, HS-grad, 9, Divorced, Handlers-cleaners, Not-in-family, White, Male, 0, 0, 40, United-States, <=50K 53, Private, 234721, 11th, 7, Married-civ-spouse, Handlers-cleaners, Husband, Black, Male, 0, 0, 40, United-States, <=50K 28, Private, 338409, Bachelors, 13, Married-civ-spouse, Prof-specialty, Wife, Black, Female, 0, 0, 40, Cuba, <=50K 37, Private, 284582, Masters, 14, Married-civ-spouse, Exec-managerial, Wife, White, Female, 0, 0, 40, United-States, <=50K`


La base AdultUCI est présentée à cette adresse : [http://archive.ics.uci.edu/ml/datasets/Adult](http://archive.ics.uci.edu/ml/datasets/Adult). Vous y trouverez notamment la description des attributs décrivant les individus.

On souhaite étudier caractériser les populations en fonction de leurs salaire : `> 50K` par an (`income=large`) ou `<= 50K` (`income=small`).

### Questions

6. Sous R, charger le package `arules`, puis charger les données de la base AdultUCI.
7. Observer les données de la base AdultUCI. Que faire pour que les données soient sous une forme de table binaire ?

   Restent les attributs : age, hours-per-week, capital-gain, capital-loss. Pour age et hours-per-week, on crée des catégories pour ces champs.

8. Binariser ces attributs :
    - age
      - 15 – 25 ans → Young
      - 25 – 45 ans → Middle-aged
      - 45 – 65 ans → Senior
      - 65 – 100 ans → Old
    - hours-per-week
      - 0 – 25 → Part-time
      - 25 – 40 → Full-time
      - 40 – 60 → Over-time
      - 60 – 168 → Work-Aholic
    - capital-gain
      - -Inf – 0 → None
      - 0 – médiane → Low
      - médiane – +Inf → High
    - capital-loss
      - -Inf – 0 → None
      - 0 – médiane → Low
      - médiane – +Inf → High

9. Transformer AdultUCI en une base de transactions Adult. Une base de transaction est un mode de représentation condensé d’un dataframe "creux" (sparse).
   - Il est possible d’observer la relative fréquence des attributs :
> itemFrequencyPlot(Adult, support = 0.1, cex.names=0.8)


10. On peut maintenant extraire les motifs fréquents dans une variable itemsets. Voir [documentation sur le paramétrage de Apriori](https://www.rdocumentation.org/packages/arules/versions/1.6-6/topics/ASparameter-classes).

11. Observer les deux premiers motifs de itemsets.
12. Trier les motifs extraits en fonction de leur fréquence (count) et visualiser les 50 premiers motifs.
13. Analyser les motifs extraits. Quelles sont les difficultés d’interprétation des motifs rencontrez-vous ?
14. Réduire le nombre de motifs en extrayant les motifs fermés seulement : `target= "closed frequent itemsets"`. On appellera cet ensemble `itemsetC`. Quelle est la différence en nombre de motifs. Dans le cas présent, la différence est plutôt faible. En général, on réduit drastiquement le nombre de motifs.

Les opérations suivantes peuvent s’appliquer au motifs :
- `union(x, y)`
- `intersect(x, y)`
- `setequal(x, y)`
- `setdiff(x, y)`
- `is.element(el, set)`

15. Vérifier que les motifs fermés fréquents sont bien un sous-ensemble des motifs fréquents.
16. Lister les itemsets qui contiennent l’item `income=large`. Quel inconvénient aurait-on à ne pas travailler qu’avec les motifs fermés ?
17. Lister les itemsets qui contiennent l’item `income=large`, les trier par support décroissant et afficher les 30 premiers motifs. Que peut-on en dire ?
18. Lister les itemsets qui contiennent l’item `income=small`, les trier par support décroissant et afficher les 30 premiers motifs. Que peut-on en dire ?
