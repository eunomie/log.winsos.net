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

En 2006, j'arrive dans une équipe un peu différente. Pas question de coder sur les serveurs, on utilise [sourcesafe][]. Finalement je ne sais pas ce qui est le pire… Heureusement il y avait quand même un peu de [svn][].

S'ensuit une période plutôt [svn][] only. Mais avec vraiment l'utilisation des fonctionnalités, pas seulement je commit et basta. C'est à dire gestion de branches (que ce soit plutôt des _topic branches_ ou des branches de maintenance), fusion (_ha ha!_) ou _cherry-picking_. Et avec tout ça, c'est en partie moi qui m'occupait du serveur svn, donc aussi des sauvegardes, monté en version, toussa.

Période intéressante, jouer avec la fusion de branches dans svn est quelque chose de… particulier.

Au bout d'un moment par contre ça commence à suffir ! Vers 2009-2010 (approximatif) il est temps de se demander vers quoi migrer. On a de plus en plus de mal à gérer les branches et les conflits. Il m'arrive de ne plus utiliser de merge mais de tout faire par cherry-picking. C'est lourd, et il y en a marre. Surtout que d'autres systèmes, des [dcvs][] sont sortis et sont utilisables. C'est donc le moment d'étudier un peu les autres, aussi bien de manière unitaire que d'étudier la migration.

Je fais donc pas mal de tests des trois qui se partagent la visibilité à cette époque :

* [bazaar][bzr]
* [Mercurial][hg]
* [git][]

Les trois ont des avantages, des inconvénients. La lenteur de [bzr][] est assez insupportable. [Mercurial][hg] est sympa mais son défaut est d'être parfois moins puissant que [git][]. [Git][git] est cool, mais le support windows laisse à désirer. Mais c'est le plus agréable.

Pendant le temps de réflexion, on se fait aider par `git-svn`. Faut bien ça pour arriver à le supporter…

Finalement, on prend du [hg][] à cause de windows et d'une courbe d'apprentissage un poil moins complexe que [git][]. C'est pour moi un faux argument car n'est qu'une vision à très court terme mais [hg][] n'étant simplement pas mauvais ça passe bien.

Ha le plaisir de bosser déconnecter, de faire ses commits en locaux, de fusionner sans problème ! Franchement, à ce moment là on se dit :

> Plus jamais un gestionnaire de version classique (centralisé) sans commits locaux !

Evidemment j'utilise [git][] de mon côté, essentiellement pour du perso.

2012 - 2013 arrive, et mes professionnellement je passe sous [git][] (et même sous [github](https://github.com)). J'aime bien [hg][] mais là c'est juste encore un cran au dessus.

D'ailleurs j'ai déjà écris à propos de [ma configuration git][confgit].

Et pour finir, 2013, je tombe sur un projet avec [svn][]. `o_O'`

## svn fait le job

Sur le coup, ma réaction fut plutôt de la surprise. [svn][]. En 2013. Sérieusement.

Heu…

Allez, laissons le bénéfice du doute.

> - Pourquoi vous avez du svn ? Vous ne voulez pas passer à autre chose ?
> - Svn il fait le job.

Oula non ! [svn][] il fait juste pas le job. Ou alors je ne sais pas de quel job on parle.

Souvent on va vous dire que les [dcvs][] c'est génial car décentralisé, car ça permet de commiter dans le métro (supaïr utile lorsqu'on parle de boulot), depuis plusieurs postes.

Oui, c'est vrai. Mais oui, on s'en fout un peu lorsqu'on parle boulot. 

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
[bzr]: http://bazaar.canonical.com/
[dcvs]: http://en.wikipedia.org/wiki/Distributed_Concurrent_Versions_System
[sourcesafe]: http://fr.wikipedia.org/wiki/Microsoft_Visual_SourceSafe
[confgit]: http://log.winsos.net/2013/02/06/ma-configuration-git.html

