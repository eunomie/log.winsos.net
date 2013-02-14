---
layout: post
tags: [mac, dev, ruby]
title: Installer des applications mac depuis du code
author: Yves
email: yves.brissaud@gmail.com
twitter: _crev_
published: false
---

Récemment j'ai revu une présentation très intéressante (ça fera l'objet d'un prochain billet) de [Zach Holman][holman] (Github) : _["Unsucking your teams development environment"][unsucking]_.

Aujourd'hui ce qui nous intéresse c'est le fait de pouvoir passer, en un temps très court, d'un ordi vide à une machine de développement. Sympa, non ?
Sous linux, c'est relativement facile. Si tous est dans les dépôts, la liste des paquets et un petit script suffisent. Sous windows... heu... . Et sous mac ? Ben là j'ai pas la solution directement.

Je me suis donc dit que j'allais faire un petit programme pour installer tout ce qu'il faut sur un mac, entre autre :

* git
* sourcetree
* oh my zsh
* homebrew
* chrome
* firefox
* ...

Pour ceux qui ont des _oneliner_ ça se présente plutôt bien. Mais tous ceux livrés en images `dmg` on fait comment ?

En réalité c'est très facile, il vous suffit de trois commandes :

- [hdiutil][] va vous permettre de monter / démonter le fichier `dmg`
- cp va vous permettre de copier le `.app` dans `/Applications`
- [installer][] va vous permettre d'installer le `.pkg`

Il est donc assez facile de faire un script pour installer toutes vos applications.
Par contre, comme je ne suis pas un grand fan de shell, j'ai décidé de le faire en ruby.

Vous trouverez donc sur mon github [asantaa][] qui vous permet d'installer n'importe quel fichier `dmg` ! Il va monter l'image, installer les `app` et `pkg` à l'intérieur et démonter l'image.

L'utilisation est vraiment très simple :

```ruby
require 'macinstall.rb'

myapp = MacInstall.new "/a/path/to/a/dmg/file"
myapp.install
```

Et voilà, l'application est installée !

Bon, il ne me reste plus qu'à coder tout le reste, c'est à dire toutes les petites choses sympa, les dotfiles, etc. Suite dans un prochain épisode :)


[holman]: http://zachholman.com/
[unsucking]: https://speakerdeck.com/holman/unsucking-your-teams-development-environment
[hdiutil]: http://developer.apple.com/library/mac/#documentation/Darwin/Reference/ManPages/man1/hdiutil.1.html
[installer]: https://developer.apple.com/library/mac/#documentation/Darwin/Reference/ManPages/man8/installer.8.html
[asantaa]: https://github.com/CrEv/asantaa