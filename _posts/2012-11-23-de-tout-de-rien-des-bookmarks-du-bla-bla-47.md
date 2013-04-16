---
layout: post
tags : [veille, linuxfr]
title: De tout, de rien, des bookmarks, du bla bla 47
author: CrEv
email: yves.brissaud@gmail.com
twitter: _crev_
nolinks: true
---

_note: ce billet de veille a été rédigé et posté sur [linuxfr](http://linuxfr.org), il est visible [ici](http://linuxfr.org/news/de-tout-de-rien-des-bookmarks-du-bla-bla-47). Il est en outre sous licence [CC by-sa](http://creativecommons.org/licenses/by-sa/3.0/deed.fr)_

Comme à sa presque habitude, voici un petit condensé de ma veille.

Vous l'aurez remarqué, il y a un peu de lag… mais bon, c'est aussi le principe ;-)

Comme toujours, il s’agit comme souvent essentiellement de bookmarks, très légèrement commentés. Pour cette fois, il y a un peu moins de contenu, mais pourquoi pas, je pense que ça conviendra peut-être mieux à certains. Et je ne voulais pas attendre une semaine de plus, ce serait moins intéressant.

C’est plutôt orienté développement, essentiellement côté Web, javascript, ruby, mais j’essaie aussi de toujours avoir deux ou trois petites choses annexes. Le but étant juste de partager et d’initier discussions, débats, avis, touckevouvoulez.

Comme toujours, vous trouverez une liste des liens présentés en fin d’article, pour que les plus rapides puissent cliquer directement sans lire le bla‐bla qui traîne autour.

Bonne lecture !


## Contributions

* [xunfr](http://linuxfr.org/users/xunfr)


# Introduction


Il m'arrivait souvent (surtout lorsque je le faisais pour mon travail) de commencer par une introduction. Ok, il m'est aussi arrivé de faire une conclusion de 3 pages…

C'est entre autre pour ce genre de contenu qu'initialement, je voulais ces contenus en journaux (de seconde pages s'ils existaient encore). À voir, si ça vous dérange ou non, de mon côté ma "veille" n'a toujours été que mon reflet personnel et absolument pas objectif / équitable / neutre.

Quoi qu'il en soit, j'aurais voulu juste reposer un lien ici, même s'il est déjà passé sur linuxfr. Il s'agit de l'[article de slate sur `_why`](http://www.slate.fr/story/60473/ou-est-why-ruby). Cet article, je l'ai trouvé réellement intéressant. Non pour le côté ruby au final, non pour le côté "people", mais pour le côté "info-suicide". N'avez-vous jamais eu envie de fermer tous vos comptes et de recommencer (ou non d'ailleurs) à côté ? Au final, à quoi ça sert tout ça ? Tous ces comptes ? Toute cette vie numérique et fausse ? On voit de plus en plus de monde qui ne vit presque que pour avoir un follower de plus, un like de plus sur leur page, leur post. Et finalement, le monde du développement est pareil, regardez sur github (le facebook des dev), sur coderwall, etc. Mais tout ceci sert à quoi au final ? Quand je regarde, j'ai un compte g+, un facebook, un github, un twitter, un viadeo, un linkedin, un coderwall (et même un linuxfr). Dans chacun des cas, on a surtout une illusion d’interaction. Oui, parfois il y a de vrais interactions, mais en général c'est du vent. Et la grande majorité des interactions que j'ai via ces plateformes sont en fait avec des gens que je connais personnellement, IRL.

Bon, je ne sais pas trop comment terminer cette introduction qui n'en est pas une, mais je voulais juste ouvrir une porte sur ce sujet que je trouve plutôt intéressant et important. Il faudrait probablement le détailler un peu plus, ce que je ferai un jour (je ne le mets pas sur ma liste des choses à faire, elle déborde déjà au point que je ne la regarde plus…).


# Un peu de contenu


## Développement

Si vous vous intéressez un peu à HTML(5) vous aurez probablement noté que pas mal d'API voient le jour. Dans le genre plutôt pratique, il existe désormais [une API de gestion de la batterie](http://www.w3.org/TR/battery-status/), [une API de préchargement de contenu](http://www.w3.org/TR/2009/WD-html5-20090423/history.html#link-type-prefetch), [une API permettant de savoir quand un utilisateur affiche une page](http://www.w3.org/TR/page-visibility/), et même [une API permettant d’accéder à votre matériel](http://dev.w3.org/2011/webrtc/editor/getusermedia.html) type webcam (en simplifiant un peu). On peut trouver ça plutôt étrange mais ça répond, pour une fois, à certains besoins intéressants et remplace réellement de plus en plus ce qui était autrefois réalisé par des greffons, tels flash. Voici donc un article vous présentant rapidement [5 API HTML5](http://davidwalsh.name/more-html5-apis). Et pour ceux qui ne sont pas au fait je vous recommande aussi de jeter un œil à ces [autres API](http://davidwalsh.name/html5-apis), notamment [element.classList](https://developer.mozilla.org/en-US/docs/DOM/element.classList).


Dans le genre un peu plus léger, si vous faites du ruby vous serez probablement intéressés par [nutella](https://github.com/gbchaosmaster/nutella). Rien de très magique ni exceptionnel, mais simplement une petite collection d'utilitaires visant à simplifier encore un peu Ruby.


Restons un peu dans le monde Ruby pour vous présenter rapidement le module [Benchmark](http://ruby-doc.org/stdlib-1.9.3/libdoc/benchmark/rdoc/Benchmark.html) de ruby 1.9. Honnêtement je n'ai pas testé ceci, mais ça peut répondre à certaines problématiques de recherche de performances.


Vous vous êtes probablement toujours demandé (si, si) comment convertir des nombres en chiffres romains… heureusement, il y a une gem pour ça ! Et oui, c'est le boulot (mais aussi pour l'inverse) de [`roman-numerals`](https://github.com/AndrewVos/roman-numerals).


Bon, quittons ceux qui font mumuse avec Ruby pour retourner vers le vrai monde web, PHP ! Vous le savez probablement, PHP c'est pas vraiment toujours rapide… Pour corriger ce problème, certains se sont mis en tête de créer, par exemple, des serveurs optimisés pour servir du PHP. C'est, entre autres, le cas de [Pancake](http://pancakehttp.net/) (dont vous trouverez [les sources ici](https://github.com/pp3345/Pancake)). Ha oui, histoire de rigoler un peu, Pancake est un serveur PHP… écrit en PHP ;-) Sans cela, ça aurait été beaucoup moins drôle ! Plus sérieusement, il y a certaines choses qui semblent réellement intéressantes, notamment le fait de ne pas avoir à recharger le code PHP (ce qui est fait en général), tout en évitant certains problèmes liés aux éléments statiques. Ben oui, il faut bien comprendre que vu que PHP est rechargé tout le temps, la gestion des éléments statiques est "un peu" différente… et genre, pas forcément besoin de fermer des `handler`, puisque l'exécution n'est pas persistante… (et sinon, j'aime les projets qui ont des noms sympa).

Je ne sais plus trop d'où je sors ce lien (j'espère que ça ne provient pas d'ici ;)) mais il est plutôt intéressant. Il s'agit de la découverte d'un mauvais effet de bord sur le site de twitter lors du passage de jquery 1.4.2 à 1.4.4. Suite à cette mise à jour mineure, une baisse significative des performances s'est faite ressentir. Qu'est-ce qui a bien pu causer se problème ? Tout simplement, l'utilisation de `querySelectorAll` à la place des classiques `getElementsByTagName` et `getElementsByClassName`. Faites bien attention à tout ça, on a tendance (surtout lorsque c'est masqué par des bibliothèques comme jquery) à utiliser des opérateurs de recherche plutôt flous, tel `querySelector` (comme on le ferait en CSS), alors qu'une simple petite combinaison des opérateurs classiques serait plus propre et plus performante. C'est sûr que les sélecteurs sont vraiment sympa, mais il faut faire attention à ce qu'on fait. Attention aussi à ne pas tomber dans l'excès inverse, les "micro-optimisations" peuvent avoir un gain utilisateur totalement nul et une perte de lisibilité/maintenance du code importante. Pour lire l'histoire, intéressante, c'est ici : [_learning from twitter_](http://ejohn.org/blog/learning-from-twitter/)


Avant propos : dans le paragraphe suivant je vais parler de [Go](http://golang.org/). Je sais très bien que Go n'a pas tout inventé, beaucoup de choses qui sont présentées en Go (que ce soit langage ou les outils créés avec) peuvent déjà exister par ailleurs (outils existants, langages implémentant les mêmes fonctionnalités, etc). Maintenant que c'est précisé, je traite donc le sujet suivant comme je traite tous les autres en réalité.


[pandastream](http://www.pandastream.com/) est une société qui développe une API d'encodage vidéo. Afin de faciliter leurs déploiements et surtout le rechargement d'applications réseau sans perte de paquets, ils viennent de développer (en libre) [socketmaster](https://github.com/pandastream/socketmaster). Socketmaster est un petit utilitaire en Go qui va permettre de mettre en attente les demandes arrivant sur le service en gardant les `sockets` ouvertes le temps que le service réel redémarre. Bon, je sais pas si c'est super clair, mais c'est vraiment pratique. En gros, lorsqu'un demande arrive, elle arrive au niveau de socketmaster et non au niveau du serveur réellement. Si le serveur peut répondre, la demande lui est transférée. Si ce n'est pas le cas (par exemple pendant un redémarrage) les demandes sont mises en attente et transmises au serveur dès qu'il redevient disponible. Vous trouverez sur le blog de pandastream [un article présentant socketmaster](http://blog.pandastream.com/post/36203579328/socketmaster-zero-downtime-restart-for-your-apps). Dans cet article, ils présentent entre autre certaines raison qui les ont fait utiliser Go :


> The tool is written in Go which allowed me to shorten my development time considerably compared to C. Go allowed me to tap into the lower-level POSIX constructs while also having access to handy higher-level abstractions. For you, it means that it can easily be cross-compiled and distributed in a binary form.


En gros, Go permet d'aller beaucoup plus vite que C. C'est plus mieux en étant à la fois bas niveau, avec des structures de haut niveau. Et ça permet de faire des binaires facilement.


Toujours côté développement, voici quelques présentations que je vous conseille :


* [Making the Web Faster at Google and Beyond](http://www.infoq.com/presentations/Web-Fast-Google) : présentation sympa sur les performances du web, temps de réponse, etc. Lorsque je vois la rapidité de certains sites (c'est évidement malheureusement ironique), je me dis par contre que cette présentation est réellement loin de la médiocrité (pour ne pas dire pire) de certains :-(
* [A Gentle Introduction to Ember](http://www.infoq.com/presentations/Ember-Demo) : une introduction sympa à Ember, entre autres, montrant comment créer un lecteur de RSS.


## Graphisme, design & co


Dans le genre étrange, voici les photos de [25 endroits sur Terre qui ne semblent pas normaux](http://www.buzzfeed.com/miniusanotnormal/25-places-that-look-not-normal-but-are-actually-r-7lct)… et pourtant ils sont bien réels ! J'en connaissais déjà certains (comme la Namibie), mais d'autres sont réellement impressionnants. Si vous voulez vous extasier quelques instants, prenez le temps d'aller voir ces 25 photos, c'est intriguant mais agréable.


Pendant un temps il m'arrivait de placer des lego dans quasiment toutes mes news. Cette fois-ci (grâce à [xunfr](http://linuxfr.org/users/xunfr)) voici une [image du brevet](http://melissaeastondesign.com/blog/?p=5863) de ces petites briques. Ok, ça ne sert pas à grand chose mais moi j'aime bien :)


# Liste des liens présentés


## Développement

* API de gestion de la batterie : <http://www.w3.org/TR/battery-status/>
* API de préchargement : <http://www.w3.org/TR/2009/WD-html5-20090423/history.html#link-type-prefetch>
* API permettant de savoir quand un utilisateur affiche une page : <http://www.w3.org/TR/page-visibility/>
* API permettant d’accéder à votre matériel : <http://dev.w3.org/2011/webrtc/editor/getusermedia.html>
* 5 API HTML5 : <http://davidwalsh.name/more-html5-apis>
* Autres API HTML5 : <http://davidwalsh.name/html5-apis>
* element.classList : <https://developer.mozilla.org/en-US/docs/DOM/element.classList>
* Nutella pour Ruby : <https://github.com/gbchaosmaster/nutella>
* Benchmark en Ruby : <http://ruby-doc.org/stdlib-1.9.3/libdoc/benchmark/rdoc/Benchmark.html>
* roman-numerals <https://github.com/AndrewVos/roman-numerals>
* Pancake <http://pancakehttp.net/>
* Sources de Pancake : <https://github.com/pp3345/Pancake>
* learning from twitter : <http://ejohn.org/blog/learning-from-twitter/>
* pandastream : <http://www.pandastream.com/>
* socketmaster : <https://github.com/pandastream/socketmaster>
* présentation de socketmaster : <http://blog.pandastream.com/post/36203579328/socketmaster-zero-downtime-restart-for-your-apps>
* Making the Web Faster at Google and Beyond : <http://www.infoq.com/presentations/Web-Fast-Google>
* A Gentle Introduction to Ember : <http://www.infoq.com/presentations/Ember-Demo>


## Graphisme, design & co

* 25 endroits qui n'ont pas l'air normaux… et pourtant : <http://www.buzzfeed.com/miniusanotnormal/25-places-that-look-not-normal-but-are-actually-r-7lct>
* brevet lego : <http://melissaeastondesign.com/blog/?p=5863>