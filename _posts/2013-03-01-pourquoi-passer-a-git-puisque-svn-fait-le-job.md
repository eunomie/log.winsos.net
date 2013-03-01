---
layout: post
tags: [dev, cvs, sv, git, dcvs]
title: Pourquoi passer à git puisque svn fait le job ? Petit retour sur la dernière décennie.
author: Yves
email: yves@brissaud.name
twitter: _crev_
published: false
---

Mon actualité récenter fait que je me suis retrouvé face à un projet utilisant [subversion][svn] comme gestionnaire de sources. L'occasion de me poser quelques questions sur le sujet, entre autre ¨_"Pourquoi passer à [git][] puisque [svn][] fait le job ?"_. Mais c'est aussi l'occasion de revenir sur un peu plus de 10 ans d'utilisation de gestionnaires de sources divers et variés.

## Un peu d'historique personnel de l'usage des gestionnaires de versions

* 2000 - 2001 : Découverte et utilisation de [cvs][] et sourceforge. Pourquoi ? Proximité avec certains développeurs mandrake. Compliqué. Pas d'utilisation personnelle

> apparté :
> à l'époque j'écrivais du code (assembleur) sur papier, déconnecté d'un ordinateur.
> On réfléchissait à chaque ligne de code

* 2005 - 2006 : code directement sur serveurs. Puis sourcesafe. Puis svn
* 2007 : utilisation de svn, de manière beaucoup plus avancée : branches, merge, cherry-picking, etc
* 2009 : tests de git, mercurial, bazaar dans le but de migrer du svn
* utilisation perso de git, git-svn
* 2011 : migration vers mercurial
* 2012 : git pro, github
* 2013 : projet svn

## svn fait le job

En fait non.
Favorise les choses non commités.
Favorise les master commits
Encore pire s'il n'y a pas de branches

## git

Permet le travail "temporaire"
Nettoyage des branches

[svn]: http://subversion.apache.org/
[git]: http://git-scm.com
[cvs]: http://fr.wikipedia.org/wiki/Concurrent_versions_system
[hg]: http://mercurial.selenic.com/
[dcvs]: http://en.wikipedia.org/wiki/Distributed_Concurrent_Versions_System