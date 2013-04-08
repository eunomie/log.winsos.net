---
layout: post
tags: [dev, humeur]
title: Pousser en prod tous les jours, toujours, tout le temps
author: Yves
email: yves@brissaud.name
twitter: _crev_
published: true
image: 2013/04/08/continuous-delivery.png
---

Il y a quelques temps j'ai écris un petit article à propos du fait de pousser du code en production tous les jours : [« Ne pas pousser en prod le vendredi. FAUX ! »][1]. Comme expliqué en introduction, cet article était en partie en réaction au fait de voir tout le monde s'extasier devant le fait de _ne pas_ pousser en production le vendredi.

Bon, faut croire que cet article vous a pas mal intéressé, mais je note surtout une bonne dose de mauvaise fois dans certaines réactions, voir tout simplement une sacré incompréhension. Et on peut aussi ajouter des **pseudo**-raisons pour tenter de justifier de _ne pas_ pousser en production le vendredi.

D'ailleurs, puisque certains voulaient croire que personne ne faisait ça pour de vrai, un autre billet vous listait un certain nombre [d'exemples de déploiement continu][2], entre autre chez flickr, github, facebook, etsy.

Mais bon, faut croire que je vis dans un monde de bisounours. Pourtant, ici aussi (ici = dans la vraie vie, avec des vrais applications, avec des softs basés sur du code tiers, pire sur du code tiers de qualité douteuse) on peut déployer plusieurs fois par jour, quelque soit le jour.

<blockquote class="twitter-tweet" data-conversation="none" lang="fr"><p>@<a href="https://twitter.com/_crev_">_crev_</a> là j'ai du déployer 10 fois depuis ce matin ! (maintenant que je peux sur tous les projets, je me fait plaisir :D)</p>&mdash; Anne-Sophie (@annso_) <a href="https://twitter.com/annso_/status/312218938673082370">14 mars 2013</a></blockquote>
<script async src="//platform.twitter.com/widgets.js" charset="utf-8"></script>

Mais par contre, vous n'imaginez même pas à quel point la résponsable produit fut satisfaite une fois qu'on a pu déployer en continu. Le gain au niveau produit, utilisateur est réel (ce n'est pas juste une lubie de développeur).

Dernière réaction en date, celle de [sebsauvage][3] :

> C'est mignon, mais un peu hors de la réalité

> Donc, NON, on ne déploie pas du code en prod le vendredi.

Sa réaction (un jour je rajouterai enfin des commentaires, ce sera peut-être plus pratique) me fait également penser à [celle-ci chez keiruaprod][4].

Ben si on pousse du code en prod le vendredi. Le vendredi matin. Le vendredi midi. Et même le vendredi après midi d'ailleurs.

En fait, la majorité des réactions _contre_ le déploiement en prod le vendredi indiquent surtout qu'il y a un certain nombre de problèmes.

Le principal problème ici c'est surtout un manque de maitrise de _ce qui est_ déployé. Pourtant c'est une des conditions clés. Les déploiements doivent être les plus petits possibles. Tout le temps. On pourrait rapprocher ça de passer de svn, souvent des gros commits, mélanger un peu tout et n'importe quoi, à git (ou autre) avec de nombreux petits commits, avec peu d'incidence.

Ben là c'est pareil. Si vosu cherchez à déployer une nouvelle fonctionnalité le vendredi, après 2 semaines de boulot, dans ce cas il est presque évident :

* que ça va merder
* que Murphy va être de la partie
* qu'il va manquer un truc
* que c'est mal testé
* …

Il convient de déployer cette fonctionnalité petit à petit. Morceau par morceau. Au fil des développements. Jamais de big bang.

Au mieux, le big bang arrive en réalité quand on passe une variable `ma_nouvelle_feature_active` à vrai. Mais ça veut surtout dire que tout le code aura déjà été passé en prod. Que tout aura pu être testé en situation réelle, petit à petit. Par exemple en utilisant des accès non publiques. En activant la fonctionnalité à certains utilisateurs seulement.

Mais c'est certain. Agire de la sorte demande de l'organisation. Demande de bosser proprement. Demande d'avoir des outils pour pousser en prod de manière (très) simple : quand on pousse 10, 20 fois par jour faut pas que ça prenne plus de 10s. En général, les deux solutions les plus agréables de mon point de vue sont quelque chose du genre :

* `git push prod master`
* `cap prod deploy`

(et vous avez évidemment la même chose avec `local`, `preprod`, …)

Ce genre de truc c'est juste parfait pour passer chaque amélioration / correction sans attendre. Ha oui, et pour ceux qui veulent passer une branche spécifique (ou un tag, ou autre) avec capistrano vous pouvez aussi le spécifier assez facilement comme indiqué sur le blog de Mickael [« Déployer une version spécifique via capistrano »][5].

En fait on pourrait très bien faire un article expliquant tout ce qu'il faut faire (ou ne pas faire) pour ne pas être capable de pousser en production un vendredi. Ce serait assez marrant, un genre de _bad practices du déploiement logiciel_. Mais le point qui serait le plus important est bien celui dont il est question ici, pousser trop de choses, sans recul. Le secret d'un déploiement en continu est vraiment là.

Prenons un exemple cité en réponse à mon article. Changer les urls d'un site (par exemple pour des question de _SEO_). Il est évident que vouloir changer toutes les urls, en une fois, sur la prod car on peut pas bien tester en dehors, est juste suicidaire.

> « Oui mais on ne peut pas le faire petit à petit, il faut tout changer en une fois ! »

<p style="font-size: 220%;text-align: center;font-weight: bold;">FAUX !</p>

Au contraire, il _faut_ le faire en petit à petit. Même si ça veut dire avoir deux urls (l'ancienne et la nouvelle) qui pointent vers la même page, tout en les supprimant des sitemap et autre. Et dans ce cas, il est possible d'en modifier une (ou plusieurs), de pousser en prod et de tester en situation réelle sans que cela n'affecte les utilisateurs. Et une fois tout passé, tout testé, il ne reste plus que la bascule à réaliser. Si vous voulez tout changer en une fois, c'est juste que c'est du mauvais boulot.

Ha oui, vous venez de voir un autre point : ça demande de l'anticipation, une vision de ce qui est, doit être, fait.

Alors oui, peut-être que je vis dans un monde de bisousnours, ou alors c'est juste que j'aime le travail bien fait, et que le déploiement continu doit être un objectif à atteindre. Pire, c'est un objectif atteignable dans beaucoup de situations. Mais surtout, il ne sert à rien de chercher des justifications dans des mauvaises pratiques.

* Vous n'arrivez pas à pousser en prod tous les jours (donc plusieurs fois par jour n'y pensez pas) parce que l'impact est trop important ? Réduisez l'impact.
* Vous n'arrivez pas car il faut faire des tests en réel ? Dupliquez et masquez les accès.
* Vous ne savez pas comment les utilisateurs vont le prendre ? Activez les fonctionnalités pour des sous-ensembles.
* Vous avez peur ? Votre système de déploiement doit vous permettre de remettre la version précédente au moins aussi rapidement que de pousser la nouvelle version (genre `cap prod rollback`).

Mais c'est sur que si c'est votre déploiement qui va tout faire, qui va pousser _et_ activer une fonctionnalité c'est déjà plus risqué (et encore, ça dépend de la fonctionnalité). Mais si vous le faites proprement, petit à petit, vous pourrez déployer plusieurs fois par jour. Mais encore faut-il le vouloir et ne pas se cacher derrière des excuses. (et non, ce n'est pas toujours _simple_ de déployer en continu, mais le gain est vraiment important et visible)

_Je pense qu'il faudrait aussi faire un article sur les bienfaits du déploiement en continu, il y aurait pas mal de choses à dire, et surtout cela montrerait à quel point ne pas le faire peut être préjudiciable._

[1]: http://log.winsos.net/2013/03/12/ne-pas-pousser-en-prod-le-vendredi-faux.html
[2]: http://log.winsos.net/2013/03/14/deploiement-continu-quelques-exemples.html
[3]: http://sebsauvage.net/links/?MSPhTQ
[4]: http://blog.keiruaprod.fr/2013/03/14/deploiement-fin-de-semaine-et-bon-sens/
[5]: http://www.mikaelrandy.fr/2013/03/28/deployer-une-version-specifique-via-capistrano/
