---
layout: post
tags: [veille]
title: De tout, de rien, des bookmarks, du bla bla 10
author: Yves
email: yves@brissaud.name
twitter: _crev_
published: false
---

Le [dernier numéro][last] date maintenant d'il y a un bon moment (l'an dernier). Pas mal de choses se sont passées qui m'ont beaucoup ralenti. Entre autre, j'ai passé pas mal de temps sur mon moteur de blog statique [wlt][]. Mais j'ai aussi changé d'emploi. Tout ça fait que j'ai pas raconté grand chose côté veille.

Je ne vais pas rattraper ce qu'il s'est passé, ce serait trop complexe et surtout inutile car vous avez du avoir ces informations par ailleurs. Mais voici tout de même quelques petites news, en espérant que j'arrive à reprendre le rythme :)

Comme toujours, les plus pressés trouveront à la fin de l'article la liste brute des liens présentés.

## Un peu de contenu

### Développement

Si vous êtes intéressés par le développement iOS et/ou ruby, vous connaissez probablement [Mattt Thompson][mattt]. Si non, ben il parait que c'est un bon, entre autre développeur iOS et ruby. Il est par exemple _"Mobile Lead"_ chez [Heroku](http://www.heroku.com/), papotte sur [NSHipster][], code sur [plein de trucs][matttgithub].

Mattt a été invité par l'antenne lyonnaise des [CocoaHeads][] pour parler de **Ruby + iOS**. Vous pouvez trouver plus d'informations [ici][infomattt] sachant que la soirée, qui se déroulera le 3 avril, est sur inscription (mais gratuite évidemment).

La version 1.5.0 de [CoffeeScript][coffee] est sortie récemment. La grande nouveauté est la sortie du [literate CoffeeScript][literatecoffee]. Vous pouvez retrouver quelques infos sur l'article que j'ai écris récemment : _[« Literate programming, pour un code toujours documenté ? »][litarticle]_ (qui comporte aussi quelques infos et présentations sur le literate programming).

Par contre, je ne vous conseil absolument pas cette version, elle pose un certain nombre de problèmes, entre autre liés aux parenthèses et accolades implicites. Vous pouvez voir un exemple de problème sur [ce bug sur le teabook open reader][bugteabook]. Heureusement, une version 1.6.1 (dont voici le [changelog][coffeechangelog]) est sortie est corrige ce problème. Elle inclus aussi, et ça c'est une très très bonne nouvelle, le support des _[Source Maps][coffeesrc]_. Les source maps permettent au debugger javascript de faire le lien avec la source coffeescript et affichent donc le code coffeescript originel en lieu et place du javascript généré. Un grand pas en avant je trouve.

Twitter continue d'ouvrir un certain nombre de code. Cette fois ci (enfin c'était il y a un petit moment déjà) il s'agit de [flight][], (encore) un framework javascript. Il est orienté événementiel mais pour tout dire je ne l'ai pas testé. En fait je ne sais pas vraiment en quoi il serait plus intéressant qu'un autre, si quelqu'un a testé je suis preneur d'informations.

On continue dans les libs d'interface avec [Topcoat][topcoat] d'Adobe. Il s'agit pour le coup uniquement de style (css) et c'est plutôt sympa, même si c'est surtout un de plus ;)

A noter que les Google API sont désormais [officiellement supportées  sous node.js][googlenode].

Si vous développez sous android, vous serez probablement intéressés par [Action Bar Scherlock][sherlock]. Il s'agit d'une lib au dessus des barres d'action d'android, permettant de les gérer plus facilement quelque soit le matériel de destination (tablette ou smartphone).

jQuery est sorti en version [2 beta 2][jquery2]. Pour ma part je ne suis en général pas trop le développement de jQuery (c'est loin d'être la lib javascript que je préfère). Par contre, ce fut pour moi l'occasion de voir que la version 2 ne supportera plus les version 6, 7 et 8 d'Internet Explorer ! Ça c'est une vrai bonne nouvelle ! Par contre, la crainte que j'ai c'est que cela freine et morcelle encore plus le paysage javascript (avec les deux versions utilisées). Mais il serait temps que les IE < 9 disparaissent enfin (et quand j'entends certaines entreprises migrer sous IE7 et vista, comment dire…)

### Graphisme, design & co

On sort un peu (mais pas trop, ne vous inquiétez pas) du développement pour passer du côté de la typographie. Tout d'abord avec l'excellent [Typelate][typeplate]. Il s'agit d'un framework css (disponible en sass, stylus, less ou css) s'occupant uniquement du rendu des textes. Et franchement c'est bien fait. Je pense d'ailleurs que je l'inclurai désormais dans mes développements. La typographie est loin d'être quelque chose d'anodin, souvent négligé (même si c'est un peu moins vrai ces derniers temps) et pourtant revêt d'une importance capitale étant donné que la majorité du contenu sur internet reste le texte.

Et pour continuer dans la typo, une question : vous n'en avez pas marre du _lorem ipsum_ ? Si oui, vous apprécierez probablement [Blokk][blokk]. Il s'agit d'une police de caractère spécialement étudiée pour vos wireframes et mockups, surtout si vous ne comprenez pas le latin. Allez voir le site pour un aperçu, moi j'aime bien !

### Misc

Dans le genre totalement inutile dont absolument indispensable, je vous présente [coffitivity][]. Ça ne fait rien d'autre que… jouer du bruit comme si vous êtiez au café ! Personnellement je n'arrive pas à me concentrer dans le silence. C'est juste horrible. Résultat le passe la majeur partie de mon temps avec de la musique dans les oreilles. Là par exemple, je bosse dans une boite silencieuse. J'avais jamais vu ça, je suis dans un grand open space et… rien. Pas de bruit. Finalement avec [coffitivity][] et ma musique, ça ressemble enfin à une atmosphère pour bien bosser !


## Liste des liens présentés

### Développement

* Mattt Thompson: http://mattt.me
[mattt]: http://mattt.me

* NSHipster: http://nshipster.com
[NSHipster]: http://nshipster.com

* Github de Mattt: https://github.com/mattt
[matttgithub]: https://github.com/mattt

* CocoaHeads: http://cocoaheads.fr/
[CocoaHeads]: http://cocoaheads.fr/

* Venue de Matt à Lyon : http://cocoaheads.fr/2013/02/lyon-evenement-special-le-3-avril-avec-mattt-thompson/
[infomattt]: http://cocoaheads.fr/2013/02/lyon-evenement-special-le-3-avril-avec-mattt-thompson/

* CoffeeScript: http://coffeescript.org
[coffee]: http://coffeescript.org

* Changelog CoffeeScript : http://coffeescript.org/#changelog
[coffeechangelog]: http://coffeescript.org/#changelog

* Literate CoffeeScript: http://coffeescript.org/#literate
[literatecoffee]: http://coffeescript.org/#literate

* Literate programming, pour un code toujours documenté ? : http://log.winsos.net/2013/02/26/literate-programming-pour-un-code-toujours-documente.html
[litarticle]: http://log.winsos.net/2013/02/26/literate-programming-pour-un-code-toujours-documente.html

* Bug CoffeeScript dans Teabook Open Reader: https://github.com/TEA-ebook/teabook-open-reader/pull/30
[bugteabook]: https://github.com/TEA-ebook/teabook-open-reader/pull/30

* Source Maps CoffeeScript: http://coffeescript.org/#source-maps
[coffeesrc]: http://coffeescript.org/#source-maps

* Twitter flight: http://twitter.github.com/flight/
[flight]: http://twitter.github.com/flight/

* Adobe Topcoad: http://topcoat.io/
[topcoat]: http://topcoat.io/

* Google API pour nodejs: https://github.com/google/google-api-nodejs-client
[googlenode]: https://github.com/google/google-api-nodejs-client

* Action Bar Scherlock: http://actionbarsherlock.com/
[sherlock]: http://actionbarsherlock.com/

* jQuery 2 beta 2: http://blog.jquery.com/2013/03/01/jquery-2-0-beta-2-released/
[jquery2]: http://blog.jquery.com/2013/03/01/jquery-2-0-beta-2-released/

### Graphisme, design & co

* Typeplate: http://typeplate.com/
[typeplate]: http://typeplate.com/

* Blokk: http://www.blokkfont.com/
[blokk]: http://www.blokkfont.com/

### Misc

* coffitivity: http://www.coffitivity.com/
[coffitivity]: http://www.coffitivity.com/



[last]: http://log.winsos.net/2012/11/23/de-tout-de-rien-des-bookmarks-du-bla-bla-47.html "De tout, de rien, des bookmarks, du bla bla #47"
[wlt]: http://log.winsos.net/2013/01/30/web-log-today-est-juillet.html "Web Log Today"


