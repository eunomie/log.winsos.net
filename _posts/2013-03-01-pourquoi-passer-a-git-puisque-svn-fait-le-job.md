---
layout: post
tags: [dev, cvs, sv, git, dcvs]
title: Pourquoi passer à git puisque svn fait le job ? Petit retour sur la dernière décennie.
author: Yves
email: yves@brissaud.name
twitter: _crev_
published: false
---

Mon actualité récente fait que je me suis retrouvé face à un projet utilisant [subversion][svn] comme gestionnaire de sources. L'occasion de me poser quelques questions sur le sujet, entre autre _« Pourquoi passer à [git][] puisque [svn][] fait le job ? »_. Mais c'est aussi l'occasion de revenir sur un peu plus de 10 ans d'utilisation de gestionnaires de sources divers et variés.

## Un peu d'historique personnel de l'usage des gestionnaires de versions

Histoire de commencer, voici de manière rapide mon expérience des gestionnaires de source.

Tout commença réellement dans les années 2000-2001. A l'époque je débutais mes études d'ingénieur. Je codais essentiellement en assembleur (masd, sur hp). Et on m'a fait découvrir [sourceforge](http://sf.net) et [cvs][]. Intéressant, mais [cvs][] n'est pas franchement le plus simple à apréhender, surtout quand on te file juste la doc de sourceforge comme exemple. Pourquoi sf et cvs ? Tout simplement parce que je trainais avec quelques dev intéressants, entre autre liés à Mandrake.

A ce moment, je l'utilisais avec d'autres développeurs mais je ne l'utilisais pas de manière personnelle.

> En fait je me souviens même qu'il m'arrivait de coder avec … du papier et un crayon ! Donc de là à utiliser [cvs][]…
> A y réfléchir, coder de la sorte avait un vrai avantage (attention on parle toujours d'assembleur) : il était nécessaire de bien se poser la question de ce qu'on faisait, pour chaque ligne écrite ! Pas question de <abbr title="var_dump debug">vdd</abbr> ni de `sysout` ou autre. Le debug n'était là qu'en dernier ressort, il convenait d'écrire juste mais surtout de savoir et réellement comprendre ce qu'on écrivait. Assez loin de ce qu'on rencontre beaucoup trop souvent aujourd'hui…

Il s'en est suivi quelques années comme ça, quelques projets, et aussi l'arrivée de [svn][]. Honnêtement je ne pourrais pas dater le moment où j'ai commencé à le découvrir / utiliser.

En 2005, je me suis retrouvé dans une situation assez étrange. J'étais dans une équipe qui codait directement sur le serveur. Oui oui, vous avez bien lu. J'ai bien essayé de les faire passer à [svn][], mais c'était mission impossible. J'en avais d'ailleurs fait un [journal linuxfr](https://linuxfr.org/users/crev/journaux/gestion-de-version-pour-applis-web).

En 2006, j'arrive dans une équipe un peu différente. Pas question de coder sur les serveurs, on utilise [sourcesafe][]. Finalement je ne sais pas ce qui est le pire...

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
[sourcesafe]: http://fr.wikipedia.org/wiki/Microsoft_Visual_SourceSafe
