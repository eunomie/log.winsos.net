---
layout: post
tags: [sleipnir, go, linuxfr]
title: Sleipnir proxy quick & dirty pour bien coder
author: CrEv
email: yves.brissaud@gmail.com
twitter: _crev_
nolinks: true
---

Je partage avec vous un petit dév que j'ai fait [en go](http://golang.org/).

En fait, ça répond à un vrai problème que je rencontre lorsque je fais du dév d'interface web (css essentiellement) : comment développer simplement et agréablement des css lorsque l'application est sur un serveur ? On clone un dépôt ? On rsync/scp/nfs les fichiers ? On code sur le serveur ?
Et, comment faire pour tester tout ça, avec des données réelles, des données de prod ?

Et voilà, c'est là que `Sleipnir` entre en action !
Il s'agit d'un petit proxy pour lequel on peut définir des "exceptions" : suivant des patterns (des regexp), les requêtes sont interceptées et la réponse est remplacée par le contenu d'un fichier local.

Le but est donc de pouvoir naviguer sur un site, tout en servant un fichier local (typiquement un fichier css) à la place du css distant.

L'avantage est donc que je peux modifier mon css (ou js, ou autre) sur mon poste, en local, tout en testant sur un serveur distant, voire tester en live des modifs sur un serveur de prod (bouh, pas bien) ; enfin surtout avec des données de prod. Et une fois ok, commit, push, deploy, toussa.

Bon, j'espère que c'est assez clair :)

Le programme est écrit en go, c'est mon premier avec ce langage donc il y a probablement beaucoup de choses à améliorer (et n'hésitez pas ;) )

Il est sous licence BSD.

Les sources se trouvent ici : <https://github.com/CrEv/Sleipnir/>

La configuration se fait dans un csv avec trois colonnes :

* pattern
* type mime de la réponse
* fichier à retourner

Et histoire de voir un peu comment ça marche, j'ai fait un petit programme d'exemple (à downloader sur le github) qui remplace toutes les images jpeg et png par des petits animaux comme on en trouve beaucoup sur la toile…

Amusez-vous bien :)

----
Je me disais bien que j'avais oublié un point, go.

C'est donc mon premier programme en go et je dois avouer que je suis très agréablement surpris.
Surpris par la simplicité de mise en oeuvre.
Surpris par la syntaxe qui, au premier abord, ne me plaisait pas trop (`:=` par exemple) mais qui s'avère claire et concise.
Surpris par l'expressivité du langage.
Très agréablement surpris par le [comma ok](http://golang.org/doc/effective_go.html). Je trouve que c'est vraiment agréable comme façon de traiter les erreurs, vraiment.
Surpris par le nombre de libs standard et non standard accessibles, pour un langage "jeune" c'est vraiment très bon.

En gros, j'ai presque l'impression d'écrire un script comme je le ferai avec ruby par exemple, sauf que c'est compilé. C'est beaucoup plus simple et expressif que java. C'est beaucoup plus simple que c++ par exemple.

Enfin voilà, que du bon de ce côté, je vais probablement continuer à faire du go, c'est vraiment sympa (et je comprend pourquoi certains s'y sont mis, par exemple pour le serveur d'images de linuxfr ;))

Par contre il me reste des choses à faire/apprendre, je voudrais par exemple séparer le "proxy" de son appel, faire une lib quoi. Et là j'ai encore un peu de taff. Il faut que je comprenne un peu mieux comment fonctionnent les "objets" et les maps.

Mais franchement, pour tous ceux qui n'ont jamais testé, faites le.
Si vous ne savez pas quoi apprendre comme nouveau langage, essayez go !
