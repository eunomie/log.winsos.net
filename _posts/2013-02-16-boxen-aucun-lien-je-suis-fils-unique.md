---
layout: post
tags: [mac, dev, ruby, github]
title: Boxen, aucun lien je suis fils unique
author: Yves
email: yves.brissaud@gmail.com
twitter: _crev_
published: false
---

Il y a peu je vous parlais d'un petit projet, [asentaa][], dont le but est juste de faire un petit outil pour installer des programmes sur mac, depuis ruby. Entre autre chose, c'était inspiré de quelques slides et informations en provenance de github, sur le fait d'avoir un outil qui permet d'installer, automagiquement, tout ce qu'il faut sur un ordi vierge afin de pouvoir développer au plus vite sans perdre de temps (en gros).

Evidemment, il semble que github regarde mon blog ou mon compte github. Et il semble que je l'ai ait pris de court puisqu'en réponse à mon projet, ils viennent de publier [boxen][]. Il est absolument impossible que cela ne soit qu'une coincidence !

[Boxen][boxen] est justement la version _open source_ de **The Setup**. Il s'agit d'un ensemble d'outils, d'un framework, autour de puppet pour grandement simplifier le _bootstraping_ d'un mac.

Je ne vais pas m'amuser à paraphraser toutes informations, toutes leurs docs, allez les lire c'est plutôt clair. Par contre, n'oubliez pas à aller voir la liste de soft déjà tout préparé sur leur github : https://github.com/boxen .

Bon, à vrai dire ça me plait bien tout ça. Il semble plutôt simple de rajouter des choses dedans. Je me ferais bien une petite config à moi, l'avantage est de pouvoir remonter le même environnement n'importe où n'importe quand. Par contre un petit problème : comment tester tout ça ? Je pense que je vais voir avec des VM, mais faire des VM mac c'est jamais le plus simple...

Quoi qu'il en soit, github montre encore une fois qu'ils utilisent beaucoup d'outils en interne, ce qui correspond d'ailleurs à **_development is production_**. Mais aussi qu'ils sont capable d'ouvrir les sources (sous MIT) de leurs outils. Bravo github, et merci (même si j'ai bien compris que vous réagissez juste à mon projet !)

[asentaa]: https://github.com/CrEv/asentaa
[boxen]: http://boxen.github.com/
