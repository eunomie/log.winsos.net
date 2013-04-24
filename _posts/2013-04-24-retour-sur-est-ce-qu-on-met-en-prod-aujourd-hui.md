---
layout: post
tags: [dev, humeur]
title: "Retour sur « Est-ce qu'on met en prod aujourd'hui ? »"
author: Yves
email: yves@brissaud.name
twitter: _crev_
published: true
image: 2013/04/24/launch.png
---

Je pense que vous avez tous suivi mes quelques articles sur le fait de déployer ou non en production le vendredi. Non ?

Voici un bref rappel en liens :

* [estcequonmetenprodaujourdhui.info](http://www.estcequonmetenprodaujourdhui.info/)
* [Ceci est un message de prévention](http://www.commitstrip.com/2013/03/08/ceci-est-un-message-de-prevention/)
* [Ne pas pousser en prod le vendredi. FAUX !](http://log.winsos.net/2013/03/12/ne-pas-pousser-en-prod-le-vendredi-faux.html)
* [Déploiement continu, quelques exemples](http://log.winsos.net/2013/03/14/deploiement-continu-quelques-exemples.html)
* [Pousser en prod tous les jours, toujours, tout le temps](http://log.winsos.net/2013/04/08/pousser-en-prod-tous-les-jours-toujours-tout-le-temps.html)

Récemment j'ai eu une _« Pull Request »_ sur le projet hébergeant ce blog. Youhou ! Il s'agit en fait de [Nicolas Hoffmann][nico3333fr] qui m'a laissé un petit message, que je vous livre :

> Je suis Nicolas Hoffmann, l'auteur de la page "Est-ce qu'on met en prod...".
> 
> Merci pour l'article et l'explication, mais il y a un point qui a dû t'échapper :
> 
> C'est **POUR RIRE**. 
> 
> J'ignore pour les autres, mais perso, je suis au courant qu'on peut pousser des mises à jour en prod le vendredi, j'en fais constamment et ça se passe très bien, et même si c'est fait à la RACHE (méthode certifiée ISO-1664).
> 
> Il y a un point important : ce n'est pas parce que techniquement on n'a pas de problème particulier à le faire qu'on apprécie d'avoir un coup de fil le Samedi ou le Dimanche pour avoir une rectification urgente demandée par le client : même pas forcément un bug, mais une mise à jour, genre parce qu'il a enfin vu que le contenu qu'on lui a montré 600 fois sur le serveur n'était pas le bon - parce qu'il n'avait pas fourni la dernière version par exemple, et que ça ne peut pas attendre, parce que le calendrier du club de pétanque de l'Amicale du Club de Bridge d'Auxon-Dessus devant être mis à jour avant la Kermesse.
> 
> Donc, je le redis, back to basics : c'est **POUR RIRE** cette page.
> 
> <img src="http://i.imgur.com/jMpt3.gif" alt="" />
> 
> :)

Bon d'abord, merci pour cet éclairsissement :) D'ailleurs, pour ceux qui voudraient savoir d'où vient ce site, allez lire ceci : [Retour sur le mini-buzz « mise en prod »][buzz] sur le site de l'auteur.

Nan mais ça j'avais bien compris en fait que c'était pour rire. Mais ce qui, à mon avis, a justement dû t'échapper c'est que, pour **beaucoup** de personnes ce n'est absolument pas une blague. Beaucoup de développeurs ne mettent pas en production le vendredi. Jamais. D'ailleurs dans certaines boites, les mises en prod sont **interdites** les lundis et vendredi. Et on est bien loin d'un truc marrant. C'est tellement fait à l'arrache, n'importe comment, avec du code non testé, vaguement commité, sans méthodes pour déployer, que c'est la seule chose qu'ils peuvent faire. En fait, s'ils le pouvaient, ils ne déploiraient ni le lundi, ni le mardi, ni le mercredi, ni le jeudi, ni le vendredi, ni même le samedi et encore moins le dimanche.

Et oui, ce genre de boites / personnes existe. Y compris sur du gros logiciel, pas que dans des tout petits trucs fait à la rache.

Et plus que ton site ou la reprise de commitstrip, ce qui m'a fait réagir est justement cet aspect. Car certaines personnes ont pris ton message au contraire très au sérieux, en général en l'appliquant déjà eux même de manière stricte.

Et ça franchement, c'est vraiment triste.

Et des réactions sérieuses, il y en a eu.

> Donc, NON, on ne déploie pas du code en prod le vendredi. Sauf si vous en voulez aux gens qui sont d'astreinte le week-end.
>
> — [sebsauvage](http://sebsauvage.net/links/?MSPhTQ)

Donc merci pour la mise au point, tu as raison de préciser que c'était qu'une blague. Mais il faut croire que certains l'appliquent réellement. Et c'est cela que je voulais décrier, contrer (pire, je suis actuellement dans une boite qui applique la règle du ni lundi ni vendredi `-_-'`).


[nico3333fr]: http://www.nicolas-hoffmann.net
[buzz]: http://www.nicolas-hoffmann.net/source/1536-Retour-sur-le-mini-buzz-mise-en-prod.html
