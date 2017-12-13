---
layout: post
tags: [dev, docker, prometheus, grafana, humantalks, talk]
title: "Human Talks: docker et metriques applicatives"
author: Yves
email: yves.brissaud@gmail.com
twitter: _crev_
published: true
image: 2017/12/13/ruby.png
description: "Petite introduction à la programmation par contrat, en ruby"
---

Mardi 12 décembre j'ai présenté un court sujet aux [HumanTalks Grenoble](https://humantalks.com/cities/grenoble/events/362).
Il s'agissait de présenter rapidement le principe de programmation par contrat et surtout comment l'utiliser avec
un langage très dynamique, ruby. Le choix de ruby est presque à contre courant de la programmation par contrat, qu'on
associe facilement avec des langages plus strictes tels Ada.

Si vous voulez avoir directement les slides, vous pouvez les retrouver à la fin
de l'article.

![](contract_00.jpg)

![](contract_01.jpg)

> Il est question de supprimer un maximum de bug.

![](contract_02.jpg)

> Pour ça on a déjà plein de solutions de tests. Mais qui dit test dit "vérifier
> que le programme écrit fait bien ce qu'on lui demande"

![](contract_03.jpg)

> Donc comment augmenter la qualité du code avant même les tests ?

![](contract_04.jpg)

> https://fr.wikipedia.org/wiki/Programmation_par_contrat

![](contract_05.jpg)

> Et oui, c'est pas tout jeune. Etiez-vous déjà né d'ailleurs ?

![](contract_06.jpg)

> La programmation par contrat se trouve beaucoup dans l'aviation, le féroviaire,
> le spatial, le militaire, etc. Tout un tas de domaines où on va parler de criticité
> du logiciel, de vies.

![](contract_07.jpg)

> Les 3 grands concepts de la programmation par contrat

![](contract_08.jpg)

> La précondition s'applique sur les paramètres en entrée

![](contract_09.jpg)

> La postcondition sur les valeurs en sortie

![](contract_10.jpg)

![](contract_11.jpg)

> Je vous ai prévu un exemple hyper complexe pour bien comprendre

![](contract_12.jpg)

> Trop facile, n'est pas ? Pourquoi vouloir rajouter des contrats sur un tel code ?
> Il n'y a aucun problème dans ce code, c'est vrai.
> Qui s'arrête ici si on lui demande un tel code ?

![](contract_13.jpg)

![](contract_14.jpg)

> hum...

![](contract_15.jpg)

> Oops. A noter que c'est la méthode écrite qui va lever l'exception, vous ne
> saurez pas forcément qui a passé la mauvaise valeur, d'où elle vient.

![](contract_16.jpg)

> Programmation défensive FTW!

![](contract_17.jpg)

![](contract_18.jpg)

> Bon ben voilà, c'était pas si compliqué

![](contract_19.jpg)

> ...

![](contract_20.jpg)

> -_- Et oui, il va falloir rajouter plein d'autres cas à vérifier

![](contract_21.jpg)

> En voilà des questions qu'elles sont primordiales

![](contract_22.jpg)

> Dans les exemples précédent tout est inversé. Si la méthode retourne `nil` quand
> une mauvaise valeur est entrée c'est l'appelant qui va la recevoir et doit
> se débrouiller avec. Et si la valeur en entrée est mauvaise, c'est à la méthode
> qui effectue le traitement qui doit s'en occuper.

![](contract_23.jpg)

> Et si au lieu de corriger les problèmes ont ne les laissaient juste pas rentrer ?

![](contract_24.jpg)

> Indiquons les "types" (ce ne sont pas nécessairements des types mais des contraintes)
> sur les entrées et sorties

![](contract_25.jpg)

> Comme vous pouvez le voir, c'est pas juste un type. C'est un type + une contrainte

![](contract_26.jpg)

![](contract_27.jpg)

> Un exception est levée. Comme avant ? Pas exactement, l'exception est levée
> au moment de l'appel, pas dans le corps de la méthode.

![](contract_28.jpg)

![](contract_29.jpg)

> Idem ici (et pour tout ce qui ne correspond pas à la contrainte)

![](contract_30.jpg)

> Comme dit, l'exception est au moment de l'appel. La responsabilité de fournir
> la donnée correcte incombe donc à l'appelant, ce n'est plus à la méthode de
> le gérer

![](contract_31.jpg)

> Et si on s'amusait avec la sortie ?

![](contract_32.jpg)

> Encore une exception de levée. Dans le corps de la méthode.

![](contract_33.jpg)

> L'exception est levée dans la méthode, pas dans le code appelant. C'est donc
> à la méthode de respecter son propre contrat et non à l'appelant de faire avec
> une mauvaise donnée reçue.

![](contract_34.jpg)

> Imaginons qu'on veuille ce comportement. Pourquoi ? Parce que ;-)

![](contract_35.jpg)

> Le plus simple, rajoutons de la logique dans la méthode

![](contract_36.jpg)

> Ca marche, certes

![](contract_37.jpg)

> Mais grace à cette lib de contrat, on peut maintenant faire de l'overloading
> de méthode, en matchant sur les contrats. Suivant la valeur du paramètre, une
> méthode ou une autre va être exécutée -> Code plus clair, plus lisible, plus simple

![](contract_38.jpg)

> Ok, on a joué avec un positif. Il y a autre chose de dispo ?

![](contract_39.jpg)

> On peut explicitement dire qu'on ne veut pas de paramètres, et qu'on retourne
> n'importe quoi

![](contract_40.jpg)

> On peut aussi dire que notre tableau ne doit contenir que des `String`. Pas d'autres types
> pas de `nil`. Ou spécifier notre `Hash`. Ou tiens, un tableau qui contient des `Hash`
> chacun contenant une clé avec le symbole `:date` et une valeur numérique.

> Expressif, simple, clair, lisible

![](contract_41.jpg)

> En ruby on peut nommer les arguments. Ca permet de faire `connect("sqsc", user: current_user.name", password: input.value)`

> Ici on indique que `host` est optionnel (et la valeur par défaut est dans la méthode)
> mais aussi que `password` est une chaine de caractères avec **au moins 8** caractères

![](contract_42.jpg)

> Bien évidemment ca fonctionne aussi sur des fonctions

![](contract_43.jpg)

> Et sur du _duck typing_. Tout objet ayant une méthode `parent_user` sera valide.
> Et associé avec de l'overloading on va gérer et renvoyer une erreur propre si ce
> n'est pas le cas. Encore une fois, clair, très concis, beaucoup plus lisible et utilisable.

![](contract_44.jpg)

> La bibliothèque utilisée ici

![](contract_45.jpg)

> Plus que de la documentation, on a une documentation exécutable et donc forcément
> à jour. Il peut néanmoins y avoir un coût à l'exécution mais on peut désactiver en
> production par exemple. Et par certains côtés ont s'éloigne un peu de l'idiomatique
> ruby, mais je pense que ca vaut le coût !

> Bref, allez tester !

![](contract_46.jpg)

<script async="async" class="speakerdeck-embed" data-id="97311ac1c9d54119aec9f2b70d619489" data-ratio="1.77777777777778" src="//speakerdeck.com/assets/embed.js"></script>

Si vous préférez [voici la version pdf](contract.pdf).