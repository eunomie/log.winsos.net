---
layout: post
tags: [dev, coffeescript]
title: Literate programming, pour un code toujours documenté ?
author: Yves
email: yves@brissaud.name
twitter: _crev_
published: true
---

Très récemment est sortie une nouvelle version de [coffeescript][], la [1.5][]. Entre autres choses, cette version introduit le principe de _Literate CoffeeScript_. Il s'agit tout simplement de mixer dans un même fichier documentations — commentaires, même si c'est plus que ça en réalité — et code, comme on peut le voir dans le _[literate programming][]_.

Le _Literate programming_ est une approche de la programmation où le but est d'écrire le programme non plus en premier lieu pour la machine, mais pour l'humain. L'objectif est que ce soit le plus lisible possible, qu'il y ait le moins de différence entre la documentation et le code. Ainsi la relecture, la maintenance, et même l'écriture s'en trouvent simplifiés, plus agréable.

En programmation _classique_, on écrit le code et on rajoute les commentaire par dessus. On utilise souvent diverses notations, mais la principale reste calquée sur le principe de la _javadoc_. Dans le _literate programming_ c'est finalement l'inverse. On insère le code dans la documentation. Voici par exemple [une introduction][pdf] au _literate programming_ faite par [Nicolas Roard](http://www.roard.com)  en Mai 2008 au _Google OpenSource Jam_.

En [coffeescript][] il était possible de s'en rapprocher en utilisant, par exemple, [docco][]. Néanmoins, la source se trouvais peu lisible car la documentation était dans des blocs de commentaires. Ce n'est pas trop gênant mais ça pouvait être mieux.

Désormais en coffeescript il devient possible de le réaliser très simplement, avec des fichiers portant l'extension `.litcoffee`. Je ne vais pas rentrer dans le détail de l'implémentation, le mieux étant de voir l'exemple fourni :

* voici le fichier [version document][document]
* voici la [source][raw]
* voici la [source colorée][src]

C'est, je trouve, assez parlant et ça donne plutôt envie.

Franchement je trouve que le _literate programming_ est réellement une bonne chose. Mais il reste un problème. C'est en effet très bien pour des scripts, mais comment le mettre en place lorsqu'on utilise des langages objets ? Comment rendre le tout _fluide_ avec de telles constructions ? Si jamais on arrive à répondre à cette question, je pense que c'est alors la meilleur façon de documenter le code, car la documentation — et le code — sont alors réellement à destination des développeurs, des humains.

[coffeescript]: http://coffeescript.org
[1.5]: http://coffeescript.org/#changelog
[coffeeliterate]: http://coffeescript.org/#literate
[literate programming]: http://en.wikipedia.org/wiki/Literate_programming
[pdf]: http://www.roard.com/Presentations/literate-programming.pdf
[document]: https://gist.github.com/jashkenas/3fc3c1a8b1009c00d9df
[raw]: https://raw.github.com/jashkenas/coffee-script/master/src/scope.litcoffee
[src]: http://cl.ly/LxEu
[docco]: http://jashkenas.github.com/docco/
