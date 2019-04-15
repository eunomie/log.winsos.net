---
layout: post
tags: [dev, cloud_native, cloud, humantalks, talk]
title: "Cloud Native : sous les buzzwords, le nuage"
author: Yves
email: yves.brissaud@gmail.com
twitter: _crev_
published: true
image: 2019/04/12/cloud.png
description: "Cloud Native. En quelques années, c'est devenu un mot fourre-tout. Tout le monde l'emploi, tout le monde le voit. Et pourtant il n'y a pas si longtemps personne ne le connaissait. Mais ça veut dire quoi en vrai ? Cela représente-t-il des micro services docker sur kubernetes ? Ou une application déployée sur AWS ? En quelques mots, retour sur l'origine de ce terme pour mieux le comprendre, et ainsi mieux développer des applications Cloud Native."
---

Mardi 9 avril 2019 j'ai présenté une définition de _Cloud Native_ aux [HumanTalks Grenoble](https://humantalks.com/cities/grenoble/events/490).

Voici une (il est possible que je n'ai pas employé exactement les mêmes formules mais le message est similaire) transcription de cette présentation.

A la fin de l'article vous pourrez retrouver le pdf à télécharger.

---

![Cloud Native : sous les buzzwords, le nuage](cloud_native-00.jpg)

> _Cloud Native_. C'est un terme qu'on entend partout aujourd'hui dans la tech.
> Mais qui serait capable de précisément expliquer ce que ça veut dire, quelles
> en sont les limites, les caractéristiques.

![microservices, docker, kubernetes](cloud_native-01.jpg)

> Souvent, dès qu'on va parler de _Cloud Native_ on va penser à des microservices
> sous forme de conteneurs qui tournent dans kubernetes.
> Avouez, vous avez tous pensé à ça, non ?

![pas de microservices, pas de docker, pas de kubernetes](cloud_native-02.jpg)

> Et pourtant, _Cloud Native_ ce n'est aucun de ces termes.

![Une définition ?](cloud_native-03.jpg)

> Et si on commençait par chercher une définition.

![CNCF : Cloud Native Computing Foundation](cloud_native-04.jpg)

> Et ça tombe bien, il y a une fondation qui a pour but d'héberger des outils
> Cloud natifs

![Cloud native technologies empower organizations to build and run scalable applications](cloud_native-05.jpg)

> Ok, donc [la définition](https://github.com/cncf/toc/blob/master/DEFINITION.md) nous dit que ça permet de créer et exécuter des applications
> scalables. Hum, si vous êtes plus avancés avec ça c'est super, moi pas vraiment.
>
> Ok, ça dit aussi que ça peut tourner dans des clouds publics, privés, hybrides. Bien.

![Containers, service meshes, microservices, immutable infrastructure, declarative APIs](cloud_native-06.jpg)

> Ho ben non, j'avais dit que _Cloud Native_ ce n'était pas des microservices,
> des conteneurs, etc. Je fais comment moi maintenant ?

![L'approche cloud native vise à exploiter tous les avantages du cloud](cloud_native-07.jpg)

> Et si on regardait du côté de Pivotal ? Depuis des années ils ont des pages
> qui présentent [leur vision du _Cloud Native_](https://pivotal.io/fr/cloud-native). Bon à chaque fois que j'y vais
> la page à changé, mais pourquoi pas.
>
> Donc là on nous dit que du _Cloud Native_ revient à exploiter les avantages
> du cloud.

![DevOps + Continuous Delivery + Microservices + Containers](cloud_native-08.jpg)

> Et juste après on retombe sur les microservices en conteneurs. Bien bien...

![I've been thinking about what it means to work well in a cloud environment on top of infrastructure as a service](cloud_native-09.jpg)

> Ceci est [la plus vieille définition](http://pzf.fremantle.org/2010/05/cloud-native.html) de _"Cloud Native"_ que je connaisse.
>
> Au premier abord c'est logique, une application _Cloud Native_ doit bien fonctionner
> dans un environnement cloud. Mais on commence à rajouter quelques précisions sur
> ce qu'on entend par cloud, ici on parle d' **Infrastructure as a Service**.

![existing applications may not fully utilize that environment](cloud_native-10.jpg)

> Et si on continue la définition, on attaque un point intéressant : il ne suffit
> pas de s'exécuter dans le cloud pour être _Cloud Native_. Il faut aller plus loin.

![Cloud Native == exploiter les possibilités du cloud](cloud_native-11.jpg)

> On vient de lire trois définitions de plutôt bonne qualité, l'élément principal
> qu'on peut en retirer c'est qu'être _Cloud Native_ c'est exploiter les possiblités
> du cloud.

![Thank you Captain Obvious](cloud_native-12.jpg)

> Merci merci (c'est le moment où tout le monde se lève et applaudit).
>
> Comment ça, c'est pas fini ?

![on top of an infastructure as a service](cloud_native-13.jpg)

> Bon d'accord, on va continuer. Et d'ailleurs si on revient sur la dernière
> définition, il y a un point vraiment intéressant. Imaginez, la définition a
> aussi 9 ans...
>
> Ce point c'est la notion d' **infrastructure as a service**.
>
> Avant les IaaS, vous aviez un (ou plusieurs) serveurs que vous bichonniez. Vous
> leurs donniez des petits nom, et quand ça se passait mal vous les répariez.

![Elasticité](cloud_native-14.jpg)

> Avec des IaaS c'est terminé, les serveurs deviennent jetable, ont une faible
> durée de vie. C'est l' **élasticité**.

![horizontal scale, vertical scale, recycling](cloud_native-15.jpg)

> Vous en avez besoin de plus, hop un appel d'API. Vous en avez
> trop, hop un appel d'API. Il en faut un plus gros, un plus petit ?
> Il y en a un qui est plus lent, qui n'est plus à jour et il faut le remplacer ?
> Hop un appel d'API.

![Optimisation des coûts, rapidité d'accès au marché, résilience](cloud_native-16.jpg)

> Et au fait, pourquoi on voudrait ça ? Pour aller plus vite, pour moins cher
> et de manière plus fiable. Et oué.
>
> Plus besoin de provisionner pour une consommation variable, on ne paye que
> ce que l'on consomme, quand on le consomme. Du matériel qui brule ? Ce n'est
> plus notre problème, le fournisseur s'en charge.

![Conséquences sur les applications](cloud_native-17.jpg)

> Ok, on y vient. Exploiter ces nouvelles possibilités, ça a justement des
> conséquences. Dans un hébergement traditionnel, les serveurs ne sont pas
> jetable, on en prend soin. Et nos applications qui tournent dessus
> sont relativement statiques. Mais là, on veut du dynamique de partout.

![Application distribuée](cloud_native-18.jpg)

> Vous l'aurez bien compris, il n'est plus question ici de fonctionner sur une seule
> machine. Il s'agit de pouvoir fonctionner sur plusieurs machines simultanément,
> et donc cela implique de changer des choses, entre autre au niveau des partages
> de données, fichiers, etc.

![Elasticité](cloud_native-19.jpg)

> Bien évidemment il faut que votre application soit concue pour être élastique.
> Votre nombre de serveurs, votre nombre d'instances d'application va fréquement
> varier. Vos clusters doivent être dynamiques.

![Multi tenant](cloud_native-20.jpg)

> Dans le but de mutualiser certains coûts, il n'est plus non plus question
> de déployer votre application pour chaque client. Au lieu de ça vous allez
> créer des applications multi tenant, et héberger tous vos clients sur une
> seule plateforme.

![Self service](cloud_native-21.jpg)

> De part la nature dynamique de tout ceci, vous voulez réaliser le moins
> d'action manuelle possible. Si vous vous basez sur une API pour gérer vos
> serveurs, ce n'est pas pour avoir besoin d'un humain pour lancer les commandes.
> Automatisation est le maître mot ici.

![Déploiement incrémental](cloud_native-22.jpg)

> Avec tout ça en place, vous voulez aussi aller vers du déploiement incrémental.
> Déjà parce que c'est à Gilles, mais aussi parce que vous avez tout pour le faire.
> Fini la corvée de déployer, de gérer les serveurs, tout est automatisé.
> Le déploiement de votre application aussi.

![Comment qu'on fait ?](cloud_native-23.jpg)

> Ok, c'est bien beau tout ça. Ça fait joli sur les CV, sur les articles de blog
> (oups) mais comment on fait en vrai ?

![Idempotence](cloud_native-24.jpg)

> Et bien on se base sur un concept clé : **l'idempotence**

![l'idempotence signifie qu'une opération a le même effet qu'on l'applique une ou plusieurs fois](cloud_native-25.jpg)

> L'idempotence c'est l'idée qu'une opération a toujours le même effet.
> `abs(abs(abs(x)))` c'est toujours pareil que `abs(x)`. C'est ça l'idempotence.
>
> Dans ce qui nous intéresse c'est l'idée que démarrer un serveur, ça a toujours
> le même effet, qui est d'avoir des ressources. Si vous en démarrez 10, et que
> vous en démarrez un onzième, ça a toujours le même effet, vous ajoutez des ressources.
>
> Si vous avez trois instance de votre application et que vous en démarrez une
> quatrième, vous avez toujours le même effet qui est que votre application est
> disponible. Avec plus de ressources, mais l'effet est que démarrer une fois de
> plus votre application n'aura pas eu de comportement différent à la quatrième
> qu'à la première.

![application idempotente : conteneurs, orchestrateur](cloud_native-26.jpg)

> Et pour ça, au niveau de notre application on va utiliser des conteneurs.
> Ceux-ci vont permettre de garantir que le fonctionnement, l'effet, est toujours
> le même, quelque soit l'instance que vous démarrez. Si l'instance démarre
> à partir de la même image, l'effet est le même.
>
> Et comme on veut quand même automatiser les choses, on va se faire aider d'un
> orchestrateur dont le but va être de les démarrer à notre place. _Self service_
> n'oubliez pas.

![infrastructure idempotente : images systèmes, infrastructure as code](cloud_native-27.jpg)

> Au niveau de notre infrastructure, on va s'appuyer sur des images sytèmes
> figées. L'idée est que chaque démarrage d'un serveur a toujours le même effet.
> Et donc pour ça tout est figé. Pas question d'avoir des mises à jours sur un serveur
> et pas sur un autre. Tout est dans l'image (tout le système, pas votre application)
> et toutes les machines peuvent se comporter de la même manière. Imaginez l'image système
> comme un conteneur identique, ça marche aussi.
>
> Et pour organiser tout ça, on va utiliser le concept d' _Infrastructure as Code_.
> Pas question ici d'avoir des actions manuelles. Et si en plus vous avez une
> solution d'IaC déclarative, avec gestion d'état, vous pouvez appliquer
> autant de fois que vous voulez votre infrastructure, l'effet sera toujours
> exactement le même : avoir votre infrastructure.

![Outils : docker, jar ; kubernetes, nomad ; packer ; terraform](cloud_native-28.jpg)

> Quelques outils qui peuvent vous aider. Et oui, on retombe sur nos petits.
> Mais ce ne sont que des exemples.
>
> Vous pouvez utiliser docker pour vos applications. Mais un jar peut aussi faire
> le job, pas de problème, tant que tout est contenu.
>
> Kubernetes ou nomad vont permettre d'orchestrer cela.
>
> Packer va vous permettre de définir votre image système.
>
> Et Terraform va vous permettre de gérer toute votre infrastructure de manière
> déclarative.

![Conclusion](cloud_native-29.jpg)

> On arrive au bout (faut pas oublier que le but était que ça rentre dans un
> talk de 10 minutes...)

![Cloud Native == Idempotence](cloud_native-30.jpg)

> La notion la plus importante à retenir est l'idempotence. C'est elle la clé
> du _Cloud Native_. Si vous la respectez, ça devrait bien se passer.
>
> Faut aussi avouer que _Cloud Native_ ça claque un peu plus qu'idempotent, non ?

![docker, kubernetes, etc sont des moyens](cloud_native-31.jpg)

> Vos outils... sont des outils. Ils vous aident, mais ils ne font pas de votre
> application une application Cloud Native. N'oubliez pas qu'il est tout à fait
> possible de faire une application avec des conteneurs sur kubernetes qui
> s'exécute dans un cloud sans jamais ne serait-ce qu'approcher la notion de
> _Cloud Native_.

![microservices : voir la loi de Conway](cloud_native-32.jpg)

> Vous noterez que j'ai soigneusement évité de parler de microservices.
> Les microservices ne sont ni bon, ni mauvais. Ils sont une réponse à un problème.
>
> Extraire un composant qui a des besoins spécifiques de scalabilité (par exemple
> un traitement particulier qui a besoin de beaucoup plus de ressources que tout
> le reste) est tout à fait valable, même couplé à un bon gros monolithe.
>
> Les microservices sont surtout un mode d'organisation et de communication, qui
> dépasse largement le cadre de l'application mais qui a aussi des conséquences
> sur vos équipes.
>
> Il est tout à fait valable de créer une application _Cloud Native_ monolithique
> ou hybride.

![aller plus loin : Cloud Native is about culture, not containers ; Holly Cummins](cloud_native-33.jpg)

> Si vous voulez aller plus loin que ce survol, je ne peux que vous conseiller
> d'aller voir [cette conférence](https://gotocph.com/2018/sessions/612) de
> [Holly Cummins](https://twitter.com/holly_cummins).

![Cloud Native : sous les buzzwords, le nuage](cloud_native-34.jpg)

> On est arrivé au bout, j'espère que vous aurez appris quelque chose.
>
> Si vous voulez poursuivre la discussion, n'hésitez pas à me contacter sur
> twitter [@_crev_](https://twitter.com/_crev_)

---

Si vous préférez, vous pouvez lire [ces slides en ligne](https://speakerdeck.com/eunomie/cloud-native-sous-les-buzzwords-le-nuage)
ou télécharger [la version pdf](cloud_native.pdf).
