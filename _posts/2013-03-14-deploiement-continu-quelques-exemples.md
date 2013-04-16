---
layout: post
tags: [dev, humeur]
title: Déploiement continu, quelques exemples.
author: Yves
email: yves@brissaud.name
twitter: _crev_
published: true
image: 2013/03/14/continuous.png
nolinks: true
---

Il faut croire que mon article sur [le déploiement en continu][dredi] vous a intéressé. Voici pour completer quelques liens vers des articles ou présentations sur le sujet. Attention, ce ne sont pas des liens qui vous dirons comment mettre en place du déploiement en continu, mais plus quelques informations, motivations sur le sujet.

Tout d'abord, même si elle date d'il y a un moment, voici une présentation à propos de Flickr: [10 deploys per day — Dev & ops cooperation at Flickr][flickr].

Voici ensuite un document intéressant à propos du déploiement chez Github : [deploying at Github][github]. C'est github qui explique comment ils déploient github avec github.

Et, un peu sur le même sujet avec un peu les mêmes acteurs, vous trouverez des infos sur cet article sur [GitHub Flow][flow] (oué bon, c'est écrit par [Scott Chacon][schacon] qui bosse aussi chez Github…).

Voici également une présentation plutôt sympa faite au QCon 2012 à San Francisco : [Adopting Continuous Delivery][qcon].

La version Facebook : [Facebook Release Process][facebook]. Dans les petits trucs, voici leurs types de livraison suivant les jours :

* lundi : petits changements
* mardi : gros changements
* mercredi : gros changements
* jeudi : changements normaux
* vendredi : attention, mais changements quand même

Ce qui compte plus, c'est surtout qu'il peut y avoir des mises en prod tous les jours. Tout est ensuite affaire de responsabilisation.

La même chose chez Etsy : [Etsy's Product Development with Continuous Experimentation][etsy]. On y apprend par exemple, pour avoir un ordre de grandeur, qu'il y a environ 30 déploiements par jour.


Et de votre côté, vous êtes plutôt :

* déploiement continu évidemment, automatisé genre hook sur le contrôleur de sources
* tout est là pour du déploiement continu mais on ne l'automatise volontairement pas
* <3 déploiements big bang, jamais plus d'une mise en prod par quinzaine !

(oui, j'ai toujours pas mis de commentaires sur ce blog, ça arrivera un jour, mais en attendant vous pouvez toujours me répondre via mon compte [twitter][] et si j'ai des réponses sympa je pourrai toujours les rajouter ici ou dans un prochain billet)

![Continuous](continuous.png)

[dredi]: http://log.winsos.net/2013/03/12/ne-pas-pousser-en-prod-le-vendredi-faux.html
[flickr]: http://fr.slideshare.net/jallspaw/10-deploys-per-day-dev-and-ops-cooperation-at-flickrhttp://fr.slideshare.net/jallspaw/10-deploys-per-day-dev-and-ops-cooperation-at-flickr
[github]: https://github.com/blog/1241-deploying-at-github
[flow]: http://scottchacon.com/2011/08/31/github-flow.html
[schacon]: http://scottchacon.com/about.html
[qcon]: http://www.infoq.com/presentations/Adopting-Continuous-Delivery
[facebook]: http://www.infoq.com/presentations/Facebook-Release-Process
[etsy]: http://www.infoq.com/presentations/Etsy-Deployment
[twitter]: http://twitter.com/_crev_
