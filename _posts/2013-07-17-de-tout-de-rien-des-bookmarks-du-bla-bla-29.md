---
layout: post
tags: [veille]
title: "De tout, de rien, des bookmarks, du bla bla #29"
author: Yves
email: yves@brissaud.name
twitter: _crev_
published: true
image: 2013/07/18/veille.jpg
---

Et oui, après une (beaucoup trop) longue absence, re-voici un numéro de [_« De tout, de rien, des bookmarks, du bla bla »_](http://log.winsos.net/veille.html). Il était temps. Vous trouverez donc, comme précédemment, un peu de tout, beaucoup de choses qui concerne le développement mais pas que, le tout fonction de ce qui m'a intéressé ces derniers temps. N'y cherchez pas spécialement de l'objectivité, le but est de vous faire partager ce qui m'a fait vibrer, de vous donner envie ou juste de vous divertir (ben quoi, on peut se divertir avec de l'info non ?).

Comme toujours, vous trouverez une liste des liens présentés en fin d’article, pour que les plus rapides puissent cliquer directement sans lire le bla‐bla qui traîne autour.

## Avant-propos

Ce numéro est aussi en [dépêche sur linuxfr.org](https://linuxfr.org/news/de-tout-de-rien-des-bookmarks-du-bla-bla-29).

Désolé si ce numéro est un peu moins passionnant que les autres, d'autant plus que certains liens commencent à dater. Néanmoins j'ai essayé de ne garder que le meilleur ;-)

Faut dire que j'ai été un peu moins passionné par le monde du web ces derniers temps. Ok, on trouve beaucoup de choses sur [AngularJS][] par exemple, sur du CSS, sur des libs JS, etc. Mais je dois dire que j'ai un peu l'impression que ça tourne en rond. Certes c'est toujours plus mieux, certes il y a des nouveautés. Mais il y a aussi beaucoup de réinventage de roue, de [NIH][]. Depuis que j'ai commencé à vraiment coder sur le web il y a une petite dizaine d'année, j'ai l'impression que ça n'a pas beaucoup évolué par certaines côtés. On se retrouve à, encore aujourd'hui, refaire une énième bibliothèque de composants html/js pour, par exemple, styliser des listes déroulantes. Le style à changé, c'est vrai. On est d'ailleurs passé par pas mal de choses, des biens lourdes pendant un temps, et on s'oriente vers du minimalisme, avec des couleurs bien utilisées et un accent sur la typographie. Les outils ont changés aussi, on voit maintenant fleurir le code utilisant des pré-processeurs malgré l'aversion de certains ([less][] et [sass][], mais aussi [stylus][] pour le css, [coffeescript][coffee] pour le javascript par exemple). On voit aussi les systèmes de build, de gestion de dépendance ([bower][] et [requirejs][]).

Tout ça c'est bien, ça va dans le sens d'une industrialisation dont le web (et plus généralement malheureusement le développement) manque cruellement. Mais se retourner et voir qu'on fait par certains côtés toujours la même chose depuis 10 ans, c'est tout de même un peu triste, non ?

Ok, je suis peut-être un peu amère, mais n'oubliez pas, ceci n'a pas pour vocation à être objectif ;-)

Allez, ne vous en faites pas, il y a tout de même plein de choses sympa à voir dans la suite. Et même concernant le web, comme quoi !

## Un peu de contenu

### Développement

Et justement, pourquoi ne pas commencer par du web ? Voici donc une présentation concernant les [« Web components, l'avenir des développeurs web »][prezwebcomponents]. Pfiou, il était temps qu'on essai un peu d'avancer sur ce point, histoire de standardiser tout cela.

Si vous faites du web, je pense que vous avez forcément utilisé jQuery. Non ? Bien ! (ben quoi, moi je n'utilise pas jQuery pour faire du web, j'aime pas vraiment jQuery) Quoi qu'il en soit, vous serez par contre probablement intéressé par cette [version documentée de jQuery 1.6.2][jquerydoc]. Un sacré travail pour annoter tout ce javascript, mais de quoi comprendre plus en détail le fonctionnement de cette bibliothèque si utilisée. La version annotée a été créée en utilisant [docco][] dont je vous avais déjà parlé.

Voici aussi une présentation assez sympa sur le javascript et le mode strict : [« Web directions »][webdirections]. A regarder, elle est plutôt cool et le message est vraiment intéressant.

Et une autre présentation qui cette fois nous apprend comment devenir un expert en javascript alors qu'on est un développeur intermédiaire : [_« Javascrip Masterclass »_][masterclass]

Histoire de jouer un peu avec le javascript, voici comment [créer un compilateur Lisp vers Javascript][lispjavascript].

Puisque j'en parlais en introduction, voici une [comparaison entre less et sass][lesssass].

Et pour rester sur du design web, voici une très bonne explication sur comment faire des [balles en CSS][balls]. Didactique, bien illustré, c'est plutôt un bon article. D'ailleurs vous pouvez suivre les liens pour voir les autres, c'est pas mal non plus.

Sortons un peu du javascript… pour aller vers du Java ! Je n'ai jamais essayé (et si certains l'ont fait ça m'intéresse) mais voici [takipi][]. Il s'agit d'un système de débugage à distance pour des applications Java. Ça à l'air plutôt cool et pratique, l'interface semble plutôt pas mal aussi.

Comme à chaque fois qu'il sort un article, c'est une véritable mine d'or. Honnêtement je ne l'ai pas lu en entier, faut dire que c'est d'un sacré niveau. Allez, je vais vous faire deviner le lien, c'est facile. Il s'agit d'un Français qui a sa boite au Canada. Il a juste un niveau plutôt impressionnant, surtout en ce qui concerne le bas niveau, le c, le c++, et les jeux. Et [John Carmack][carmack] a [retweeté][tweetcarmack] sa dernière revue de code. Alors, trouvé ? Et oui, il s'agit de [Fabien Sanglard][fabiensanglard] qui a réalisé une [revue de code de Doom 3 BFG][doom3].

Et vu que je sais que vous en redemandez encore, voici une autre revue de code concernant cette fois [Prince of Persia][prince]. Que ce jeux à pu bercer mon enfance ! Je me souviens encore, vu les dates ça devait être en 1990, je descendais dans le bureau de mon père pour qu'il allume son ordinateur (un 286) et pouvoir jouer quelques minutes à Prince of Persia. Le bruit des lames, sortant du buzzer de la machine, résonne encore dans ma tête ! Franchement c'est un des meilleurs souvenirs de jeux vidéo que je peux avoir. Peut-être parce que c'était probablement l'un des (le ?) premiers auquel j'ai joué. J'en verserais presque une petite larme `;-)`

Franchement, certains s'ennuient vraiment. Mais heureusement pour nous car cela donne des choses genre [_« The Shortest Crashing C Program »_][crashingc].

(J'espère que ce lien n'est pas déjà passé sur linuxfr) Si vous vous intéressez aux maths dans l'informatique ou aux jeux vidéos, voici un (long) article passionnant sur les [grilles hexagonales][hexagons]. Et il faut en plus dire que cet article est très bien illustré, avec même des animations pour bien comprendre comment cela fonctionne. Vraiment à lire !

Je suis tombé (ouille) sur cet article vraiment intéressant, sur une façon de (bien) faire de la programmation par objet : [Object Calisthenics][objectcalisthenics]. En gros il s'agit de neuf règles assez simples, mais qui une fois mises en œuvre rendent le code plutôt sympa. A rapprocher de [SOLID][] aussi. Voici les règles, pour les détails allez lire le lien :

1. Un seul niveau d'indentation par méthode
2. N'utilisez pas le mot clé `else`
3. Emballez (wrap) toutes les primitives et chaînes de caractères
4. Les collections dans leurs propres classes
5. Un `.` par ligne
6. N'abrégez pas
7. Gardez toutes les entités petites
8. Pas de classe avec plus de deux variables d'instance
9. Pas de méthodes de Getter/Setter

Qu'en pensez-vous de ces règles ? Si certains me semble vraiment bien, la 8 me semble plutôt stricte et complexe à mettre en œuvre, surtout si on la rapproche de la 5.

Histoire de terminer cette partie, avez-vous déjà lu ce livre : [_« Real-time Systems and Programming Languages: Ada, Real-Time Java and C/Real-Time POSIX »_][realtime] ? C'est probablement le prochain que je lirai après [_« Programming in Ada 2005 »_][ada].

### Misc

[_« ABC: Always Be Coding »_][abc] : Article très intéressant sur les développeurs, savoir si on est un bon candidat, et quelques astuces pour devenir encore meilleur. C'est très rapide à lire, et même si ça enfonce quelques portes ouvertes c'est plutôt sympa.

D'ailleurs, tiré de ce même lien, voici un [pense-bête sur la complexité des algorithmes][algo]. A garder dans un coin ça peut toujours servir.

Un problème très souvent rencontré dans l'ingénierie logicielle concerne l'estimation du temps de développement. Il y a plein de raisons à cela, de toutes natures. Et il y a aussi beaucoup de courants différents, par exemple ceux qui veulent estimer (prédire ?) très précisément les développements, en étant très précis (inférieur à la demi-journée). Il y a aussi un courant des méthodes agiles, plutôt orienté estimation (genre 2 points ça veut dire entre 1 et 3 jours idéaux). Et il y a encore au delà de tout cela, un courant plutôt orienté _pas d'estimations_. Il m'est arrivé de vouloir faire du _pas d'estimations_ mais cela nécessite pas mal de boulot mine de rien, entre autre bien découper les tâches par exemple. M'enfin ça c'est si on veut tout de même essayer de suivre un peu l'avancement, sinon on arrive de nouveau à [la rache][larache]. Bon allez, tout ça pour introduire ce lien plutôt intéressant au sujet des estimations, entre autre en réponse au _pas d'estimation_ : [_« Estimates in Software Development. New Frontiers. »_][estimates].

Et pour continuer sur le thème des estimations, un message assez intéressant : [_« Don't get demoralized by bad estimates! »_][demoralized].

Les commentaires sont-ils nécessaires ? Comment ça [un air de déjà vu ?][commentsornot] Non, cette fois-ci il s'agit des commentaires sur les blogs. Est-ce vraiment nécessaire ? Est-ce indispensable ? Que penser d'un blog qui n'en aurait pas ? Et je ne parle pas de quelqu'un qui les désactive, mais vraiment aucun commentaire. Pour ma part je comprends tout à fait qu'il n'y ait pas de commentaires. D'ailleurs je n'en ai pas sur mon blog. Pourquoi ? Initialement une raison technique (blog statique et auto hébergement), finalement est-ce si important que cela ? Des réactions j'en ai tout de même, que ce soit sur tweeter, google+, par mail, par pull request aussi. Certes c'est plus dispersé, et alors ? Bon c'est sur que venir taper sur les commentaires tout en publiant sur linuxfr c'est tout de même assez drôle, surtout à quel point, souvent, le contenu intéressant et particulier de linuxfr est justement dans les commentaires. Mais là c'est différent, il y a réellement une communauté. Il ne s'agit plus de commenter sur un blog perso. Un jour il y aura probablement des commentaires sur mon blog, en attendant je vous renvoi donc vers cet article traitant de [la nécessité des commentaires][comments].

Un mythe s'effondre ! Vous connaissez tous Valve je pense. Peut-être certains connaissent le système de management de Valve (dont j'ai déjà parlé dans de précédents numéros) et qui me semblait intéressant voir motivant. Mais voici que quelqu'un s'élève contre ce système qui est plutôt qualifié de _management masqué_. Je vous laisse le lire ici : [Valve's 'perfect hiring' hierarchy has 'hidden management' clique like high school][valve]. Mais finalement, existe-t-il des managements qui soient vraiment bien et sans intérêts masqués ?

### Graphisme, design & co

Ok c'est pas vraiment du graphisme, ni du design, mais on va mettre ça dans le _co_. J'ai toujours une fascination étrange à propos des lieux abandonnés. Surtout ceux désertés en laissant tout sur place, rapidement. Oui je sais, c'est particulier. Mais si ça vous intéresse ou que vous voulez juste voir quelques belles photos, voici [« 50 lieux abandonnés et villes fantômes incroyables »][abandon].

Voici deux liens vers des polices de caractères à utiliser, par exemple sur le web. L'un concernant des polices de type [Stencil][], l'autre des polices de type [Cursive][].

Comment réaliser une bonne interface utilisateur (sur le web) ? Cet article imagé tente de proposer quelques pistes, essentiellement autour de la cohérence : [goodui.org][]

## Liste des liens présentés

### Avant-propos

[AngularJS]: http://angularjs.org/ "AngularJS"
* AngularJS : <http://angularjs.org/>

[NIH]: http://fr.wikipedia.org/wiki/Not_Invented_Here "Not Invented Here"
* NIH : <http://fr.wikipedia.org/wiki/Not_Invented_Here>

[less]: http://lesscss.org/ "less"
* less : <http://lesscss.org/>

[sass]: http://sass-lang.com/ "sass"
* sass : <http://sass-lang.com/>

[stylus]: http://learnboost.github.io/stylus/ "stylus"
* stylus : <http://learnboost.github.io/stylus/>

[bower]: http://bower.io/ "bower"
* bower : <http://bower.io/>

[requirejs]: http://requirejs.org/ "requirejs"
* requirejs : <http://requirejs.org/>

### Développement

[prezwebcomponents]: https://speakerdeck.com/julienvey/web-components-lavenir-des-developpeurs-web "Web components, l'avenir des développeurs web"
* Web components, l'avenir des développeurs web : <https://speakerdeck.com/julienvey/web-components-lavenir-des-developpeurs-web>

[jquerydoc]: http://robflaherty.github.io/jquery-annotated-source/ "jQuery annotated source"
* jQuery annotated source : <http://robflaherty.github.io/jquery-annotated-source/>

[docco]: http://jashkenas.github.io/docco/ "docco"
* docco : <http://jashkenas.github.io/docco/>

[webdirections]: http://geelen.github.io/web-directions-talk/ "Web directions"
* Web directions : <http://geelen.github.io/web-directions-talk/>

[masterclass]: http://afabbro.github.io/jsconf2013 "Javascript Masterclass: How to go from being a good developer to a great one"
* Javascript Masterclass: How to go from being a good developer to a great one : <http://afabbro.github.io/jsconf2013>

[lispjavascript]: http://honza.ca/2013/05/building-a-lisp-to-javascript-compiler "Building a Lisp to Javascript compiler"
* Building a Lisp to Javascript compiler : <http://honza.ca/2013/05/building-a-lisp-to-javascript-compiler>

[lesssass]: http://www.hongkiat.com/blog/sass-vs-less/ "Sass vs less"
* Sass vs less : <http://www.hongkiat.com/blog/sass-vs-less/>

[balls]: http://hop.ie/blog/balls/ "CSS Balls"
* CSS Balls : <http://hop.ie/blog/balls/>

[takipi]: http://www.takipi.com/index.html "God Mode in Production Code"
* takipi : <http://www.takipi.com/index.html>

[carmack]: http://fr.wikipedia.org/wiki/John_Carmack "John Carmack"
* John Carmack : <http://fr.wikipedia.org/wiki/John_Carmack>

[tweetcarmack]: https://twitter.com/ID_AA_Carmack/status/337660683732803584 "Tweet de John Carmack"
* Tweet de John Carmack : <https://twitter.com/ID_AA_Carmack/status/337660683732803584>

[fabiensanglard]: http://fabiensanglard.net/ "Fabien Sanglard"
* Fabien Sanglard : <http://fabiensanglard.net/>

[doom3]: http://fabiensanglard.net/doom3_bfg/index.php "Doom3 BFG Source Code Review"
* Doom3 BFG Source Code Review : <http://fabiensanglard.net/doom3_bfg/index.php>

[prince]: http://fabiensanglard.net/prince_of_persia/index.php "Prince of Persia Code Review"
* Prince of Persia Code Review <http://fabiensanglard.net/prince_of_persia/index.php>

[crashingc]: http://llbit.se/?p=1744 "The Crashing C Program"
* The Shortest Crashing C Program : <http://llbit.se/?p=1744>

[hexagons]: http://www.redblobgames.com/grids/hexagons/ "Hexagonal Grids"
* Hexagonal Grids : <http://www.redblobgames.com/grids/hexagons/>

[objectcalisthenics]: http://williamdurand.fr/2013/06/03/object-calisthenics/ "Object Calisthenics"
* Object Calisthenics : <http://williamdurand.fr/2013/06/03/object-calisthenics/>

[SOLID]: http://en.wikipedia.org/wiki/SOLID_(object-oriented_design) "SOLID"
* SOLID : <http://en.wikipedia.org/wiki/SOLID_(object-oriented_design)>

[realtime]: http://www.amazon.fr/Real-Time-Systems-Programming-Languages-POSIX/dp/0321417453/ref=sr_1_1 "Real-time Systems and Programming Languages: Ada, Real-Time Java and C/Real-Time POSIX"
* Real-time Systems and Programming Languages: Ada, Real-Time Java and C/Real-Time POSIX : <http://www.amazon.fr/Real-Time-Systems-Programming-Languages-POSIX/dp/0321417453/ref=sr_1_1 >

[ada]: http://www.amazon.fr/Programming-Ada-2005-John-Barnes/dp/0321340787/ref=sr_1_3 "Programming in Ada 2005"
* Programming in Ada 2005 : <http://www.amazon.fr/Programming-Ada-2005-John-Barnes/dp/0321340787/ref=sr_1_3>


### Misc

[abc]: https://medium.com/tech-talk/d5f8051afce2 "ABC: Always Be Coding"
* ABC: Always Be Coding : <https://medium.com/tech-talk/d5f8051afce2>

[algo]: http://bigocheatsheet.com/ "Pense-bête sur la complexité des algorithmes"
* Pense-bête sur la complexité des algorithmes : <http://bigocheatsheet.com/>

[larache]: http://www.byatoo.com/la-rache/ "International Institute of La RACHE"
* International Institute of La RACHE : <http://www.byatoo.com/la-rache/>

[estimates]: http://www.targetprocess.com/articles/estimates-software-development.html "Estimates in Software Development. New Frontiers."
* Estimates in Software Development. New Frontiers. : <http://www.targetprocess.com/articles/estimates-software-development.html>

[demoralized]: http://blog.newrelic.com/2013/07/03/dont-get-demoralized-by-bad-estimates/ "Don't get demoralized by bad estimates"
* Don't get demoralized by bad estimates : <http://blog.newrelic.com/2013/07/03/dont-get-demoralized-by-bad-estimates/>

[commentsornot]: http://linuxfr.org/users/crev/journaux/to-comment-or-not-to-comment-that-is-the-question "To comment or not to comment. That is the question."
* To comment or not to comment. That is the question. : <https://linuxfr.org/users/crev/journaux/to-comment-or-not-to-comment-that-is-the-question>

[comments]: http://gordon.re/hacktivisme/la-necessite-des-commentaires.html "La nécessité des commentaires"
* La nécessité des commentaires : <http://gordon.re/hacktivisme/la-necessite-des-commentaires.html>

[valve]: http://www.develop-online.net/news/44746/Valves-perfect-hiring-hierarchy-has-hidden-management-clique-like-High-School "Valve's 'perfect hiring' hierarchy has 'hidden management' clique like high school"
* Valve's 'perfect hiring' hierarchy has 'hidden management' clique like high school : <http://www.develop-online.net/news/44746/Valves-perfect-hiring-hierarchy-has-hidden-management-clique-like-High-School>

### Graphisme, design & co

[abandon]: http://blog.jettours.com/lieux-abandonnes/ "50 lieux abandonnés et villes fantômes incroyables"
* 50 lieux abandonnés et villes fantômes incroyables : <http://blog.jettours.com/lieux-abandonnes/>

[Stencil]: http://designmodo.com/stencil-typefaces/ "Stencil fonts"
* Stencil fonts : <http://designmodo.com/stencil-typefaces/>

[Cursive]: http://designmodo.com/cursive-webfonts/ "Cursive fonts"
* Cursive fonts : <http://designmodo.com/cursive-webfonts/>

[goodui.org]: http://goodui.org "goodui.org"
* goodui.org : <http://goodui.org>
