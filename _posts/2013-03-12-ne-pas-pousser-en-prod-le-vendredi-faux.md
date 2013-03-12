---
layout: post
tags: [dev, humeur]
title: Ne pas pousser en prod le vendredi. FAUX !
author: Yves
email: yves@brissaud.name
twitter: _crev_
published: true
image: 2013/03/12/Ne-pas-pousser-en-prod-le-vendredi-small.png
---

Ces derniers temps j'ai vu pas mal de références à une question souvent critique pour certains : « Est-ce qu'on met en prod aujourd'hui ? » (surtout lorsque aujourd'hui est vendredi).

Les références qui circulent le plus sont [estcequonmetenprodaujourdhui.info](http://www.estcequonmetenprodaujourdhui.info/) et la version imagée, dédiée au vendredi par [commitstrip](http://www.commitstrip.com/) : [Ceci est un message de prévention](http://www.commitstrip.com/2013/03/08/ceci-est-un-message-de-prevention/).

[![Ceci est un message de prévention](Ne-pas-pousser-en-prod-le-vendredi-medium.jpg)](Ne-pas-pousser-en-prod-le-vendredi.jpg)

Tout le monde semble donc trouver normal de ne pas déployer de mises à jour certains jours, principalement les lundi mais surtout les vendredi.

Soit.

**FAUX !!!!**

Sérieux, vous êtes d'accord avec ça ?

Les refus de mise en production certains jours sont surtout symptomatiques de réels problèmes. L'un des principaux problèmes est l'absence de système de déploiement ou, au mieux, un système partiellement manuel et bancal. Dans ce cas, mettre en production prend du temps et beaucoup de temps cerveau. Pire, souvent il n'existe pas de moyen propre de revenir à la version précédente d'où une certaine frilosité.

Un autre problème ô combien classique est tout simplement l'absence de tests de cette nouvelle version. Il faut donc pouvoir être dispo pour corriger, en urgence, les problèmes. Ce qui s'avère complexe un vendredi après midi.

Autre raison : des changements de type _big bang_ ou au moins trop important. Plus les changements sont importants, plus il y a de risques, d'effets de bord potentiels, de craintes.

Bon, c'est bien joli tout ça. Donc si je comprend bien, en général on a un certain nombre de problèmes qu'on peut identifier (non exhaustif) :

* pas de système de déploiement
* pas de tests suffisant
* changements trop important entre deux versions

Et la réponse, la solution à tout cela serait de ne pas mettre en production certains jours ?

Et ben non, il faut _juste_ corriger les problèmes. Sérieusement.

On commence par mettre en place un système de déploiement. Qu'il soit maison ou basé sur une technologie telle que [capistrano][] importe peu. Ce qui compte est d'avoir une confiance absolue dans le système. On demande le déploiement → ça déploie. Et d'ailleurs, on demande un rollback → on a un rollback. Evidemment les systèmes de caches sont rafraichis, les assets regénérés, etc.

Pour le deuxième problème, il n'y a pas 36 solutions. Mise en place de tests unitaires et de tests fonctionnels. Les tests unitaires vont vous permettre, vous développeur, d'être assuré tant que possible que le code que vous avez écrit est bien conforme à ce que vous lui demandez, et que vous n'avez pas de régression suite à un refactoring par exemple. Tous les langages ont des outils de tests unitaires, donc utilisiez-les. Côté tests fonctionnels il y a plein de solutions, tout dépend ce que vous voulez tester exactement. Quoi qu'il en soit ces tests sont l'assurance que ce que vous demandez d'un point de vue utilisateur est bien obtenu. Pour du web vous pouvez par exemple effectuez des tests en utilisant [CasperJS][] c'est sympa à mettre en oeuvre, plutôt simple et terriblement puissant.

Dernier problème à addresser. Il convient en réalité de faire de nombreuses mises à jour, même si c'est juste pour une ligne de code, plutôt que peu de mises à jour mais avec tellement de changements que vous ne comprendrez jamais ce qui se passe… si cela ne se passe pas comme prévu. Si vous avez un changement d'une ligne et que ça casse, il est très facile de revenir en arrière — enfin ça c'est votre outil de déploiement — mais surtout il est très facile de comprendre pourquoi. Si vous avez modifié 200 fichiers et 3000 lignes de code, c'est beaucoup plus compliqué et c'est là qu'interviennent les problèmes.

Allez, il peut y avoir encore un autre type de problème : la coupure de service. Sauf qu'en général ça se règle avec d'une part des sessions distribuées (si c'est le problème) et des reverse proxy en frontal qui vont permettre d'avoir à un instant donné les deux versions en route et basculer sans coupure entre les deux. D'ailleurs le rollback est également très facile avec cette architecture.

Au final il faut simplement viser le déploiement en continue. Même si vous ne souhaitez pas le réaliser proprement dit, placez-vous dans cette optique.

Et ne me dites pas que ce n'est pas possible sur des grosses applications, des gros sites, ce serait mensonger. Vous ne me croyez pas ?

* Flickr déploie en général plus de 10 fois par jour (oui il y avait une page mais je ne la retrouve plus).
* Chez github tout le monde déploie, même les designers. D'ailleurs [Hubot][] le fait pour eux. C'est indiqué dans de nombreuses présentations sur leur fonctionnement interne.

Personnellement je l'ai vécu il y a peu. On travaillait sur un site d'e-commerce. Autant dire que s'il tombe c'est le business qui tombe. Le déploiement était fait quasiment à la main (en gros à coup de patch). Par chance (sic) c'était du PHP, donc en général écraser les fichiers suffit. Quoi qu'il en soit, personne ne voulait déployer. Tout le monde attendait le dernier moment tellement il y avait de craintes. Il y avait justment ces règles du genre "on ne met pas en production le lundi ni le vendredi". Et un jour, après pas mal de batailles, on a enfin eu le temps disponible pour passer sous [capistrano][]. On est donc passé de 1 mise en production par semaine à 2, 4, 10 mises en productions par jour. En fait chaque besoin, chaque amélioration était mise en production dès qu'elle était ok. Alors que la partie "produit" était plutôt réticente, craignait que ça prenne beaucoup de temps (mouai faut pas pousser quand même) pour pas grand chose, ce fut la partie la plus heureuse de ce changement. Ben oui, chaque fonctionnalité est désormais passée en prod bien plus tôt, la qualité s'en ressent, l'expérience utilisateur s'en ressent, et le déploiement n'occupe plus que 0.5% du temps cerveau des développeurs, c'est tout autant de temps gagné à améliorer l'existant, ajouter des nouvelles fonctionnalités, etc.

Donc **non**, on déploie **tous les jours**, et même **plusieurs** fois par jour !

Celui qui me colle un "Ne pas pousser en prod le vendredi" risque de s'en souvenir longtemps !

[capistrano]: https://github.com/capistrano/capistrano
[CasperJS]: http://casperjs.org/
[Hubot]: http://hubot.github.com/