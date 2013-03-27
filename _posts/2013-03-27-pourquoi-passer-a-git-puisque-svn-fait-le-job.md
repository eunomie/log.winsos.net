---
layout: post
tags: [dev, cvs, svn, git, hg, dcvs]
title: Pourquoi passer à git puisque svn fait le job ? Petit retour sur la dernière décennie.
author: Yves
email: yves@brissaud.name
twitter: _crev_
published: true
image: 2013/03/27/cvs.png
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

S'ensuit une période plutôt [svn][] only. Mais avec vraiment l'utilisation des fonctionnalités, pas seulement je commit et basta. C'est à dire gestion de branches (que ce soit plutôt des _topic branches_ ou des branches de maintenance), fusion ou _cherry-picking_. Et avec tout ça, c'est en partie moi qui m'occupait du serveur svn, donc aussi des sauvegardes, monté en version, toussa.

Période intéressante, jouer avec la fusion de branches dans svn est quelque chose de… particulier…

<pre style="font-size:small;">
                       .+ssyss+:.                  ..     /-                    
                      +dhhhhhhhhhh+-`        `:`   mN`   yMN`                   
                     `dhhhhhhhhhhhhdhyo:     /M+   sM-  +MmMs                   
                `:oyhdhhhs++oosyhhhhy-`      `My`-+dM/ `mN.yN.  :-   :-         
              :shhhhhhs/---------/oydo-`      mNNMMNMs +MyohMs -M+  .M+   :+    
            -yhhhhhhh:------------:::/---.    hMh:` md mMNdydN.hN-::hm` -dMM    
           +dhhhhhhhy-------...----+:--:::-   sM+   mN+My`  -MdMMmdNM/ +Nshd    
          +dhhhhhhhhd------...-s```-   `s..   /d+   sd-/.    -mN`  ym.hMs/ms    
         `dhhhhhhhhhh+---:`    ` `.:----.-.                  .y/  /MymdyyhM+    
         -dhhhhhhhyhhs----------/----------:                      -+/+   /M-    
         -dhhhhhhh:/d+----------::--------::-.`                          ./-.   
         `dhhy+ohy-:+---------------------------`                     .------:  
          +hd:::::--:+syyhy-..:------::::::::---`                 ..-:-------`  
           shhso+--hMMMMMMMNdmMmsym/.`.                       ..-:----.-:/-     
           `hhhhd/:MMMMMMMMMMMMMMMN/`                    ..--:------::+:..:     
            /hhhdy-+dNNdyyyy+o+:::--:::::  .-.`     ..--:--------------/::::    
            `dhdhd+-----:::::---------:/:/+/o/++-------.--------::::::/:---:    
            :dhsosoo:---------------/ss+///o/:-----------------.------/--..     
          `.oso+++ooso///:::--:://++/+sos//o.------------------------`          
        -/////+so+o++s+////////////////sos++:.---------:--...`                  
      -/////////so+++os/////////////////s+s+o---::/-..`                         
    `////////////so+++os////////////////+s+s++oo+/+`                            
   `+////////////oo++++s/////////////////soos++//-                              
   `s+::::///+///+s++++os///////++++++++/+soo:                                  
    :---------/o/so+++++s//////////////////ooo                                  
   :----------soso++++++s+//////////////////+s.                                 
  -----------o+++++++++ooo///////////////////+/                                 
 `:.--------oo+++++++++ooo////////////////////+.                                
 --.------.+o+++++++++++oo/////////////////////+
</pre>

Au bout d'un moment par contre ça commence à suffir ! Vers 2009-2010 (approximatif) il est temps de se demander vers quoi migrer. On a de plus en plus de mal à gérer les branches et les conflits. Il m'arrive de ne plus utiliser de merge mais de tout faire par cherry-picking. C'est lourd, et il y en a marre. Surtout que d'autres systèmes, des [dcvs][] sont sortis et sont désormais réellement utilisables. C'est donc le moment d'étudier un peu les autres, aussi bien de manière unitaire que d'étudier la migration.

Je fais donc pas mal de tests des trois qui se partagent la visibilité (dans l'open source) à cette époque :

* [bazaar][bzr]
* [Mercurial][hg]
* [git][]

Les trois ont des avantages, des inconvénients. La lenteur de [bzr][] est juste insupportable. [Mercurial][hg] est sympa mais son défaut est d'être parfois moins puissant que [git][]. [Git][git] est cool, mais le support windows laisse à désirer. Mais c'est le plus agréable.

Pendant le temps de réflexion, on se fait aider par `git-svn`. Faut bien ça pour arriver à le supporter…

Finalement, on prend du [hg][] à cause de windows et d'une courbe d'apprentissage un poil moins complexe que [git][]. C'est pour moi un faux argument car n'est qu'une vision à très court terme mais [hg][] n'étant simplement pas mauvais ça passe bien.

Ha le plaisir de bosser déconnecter, de faire ses commits en locaux, de fusionner sans problème ! Franchement, à ce moment là on se dit :

> Plus jamais un gestionnaire de version classique (centralisé) sans commits locaux !

Evidemment j'utilise [git][] de mon côté, essentiellement pour du perso.

2012 - 2013 arrive, et mes professionnellement je passe sous [git][] (et même sous [github](https://github.com)). J'aime bien [hg][] mais là c'est juste encore un cran au dessus.

D'ailleurs j'ai déjà écris à propos de [ma configuration git][confgit].

Et pour finir, 2013, je tombe sur un projet avec [svn][]. `o_O'`

## Svn fait le job

Sur le coup, ma réaction fut plutôt de la surprise. [svn][]. En 2013. Sérieusement.

Heu…

Allez, laissons le bénéfice du doute.

> - Pourquoi vous avez du svn ? Vous ne voulez pas passer à autre chose ?
> - Svn il fait le job.

Oula non ! [svn][] il fait juste pas le job. Ou alors je ne sais pas de quel job on parle.

Souvent on va vous dire que les [dcvs][] c'est génial car décentralisé, car ça permet de commiter dans le métro (supaïr utile lorsqu'on parle de boulot), depuis plusieurs postes.

Oui, c'est vrai. Mais oui, on s'en fout un peu lorsqu'on parle boulot. 

Par contre, il y a des qualités réelles aux [dcvs][]. Les principales étant pour moi :

* commits locaux
* branches et tout ce qui va avec (fusion, rebase, etc)


### Commits locaux (et plus puissants)

Bon ça c'est assez simple, c'est surtout le fait qu'un commit ne va pas être envoyé au serveur immédiatement. Il va falloir le pousser. L'avantage (énorme) est qu'on va avoir un poil de temps de plus pour vérifier avant d'envoyer sur le serveur de source. Combien de commits genre _fix_, _oups_, _fichier oublié_, … sur un svn ?

En poussant un peu plus loin on peut même utiliser des systèmes de gestion de patch, tels [mq][] pour [hg][] et [stgit][] pour [git][]. Je ne vais pas les décrire ici, mais c'est juste très pratique cela.

Dans le genre de choses agréable, il est aussi possible de commiter partiellement. C'est à dire de choisir les modifications à ajouter au commit parmis l'ensemble des modifications. Sous [git][] c'est surtout la commande `git add -p`. Extrèmement pratique si vous avez travaillez sur plusieurs choses mais souhaitez séparer en plusieurs commits. Et il ne faut pas oublier que le coût d'un commit, local, est juste quasi nul, au contraire de [svn][] qui doit le pousser immédiatement sur le serveur. Il est donc tout à fait possible de réaliser _beaucoup_ de commits.

### Branches

Oué alors là c'est juste la **principale** différence avec les systèmes comme [svn][]. Pour faire simple, les fusions de branches sous [dcvs][] _« ça juste marche »_ !

La création de branches à un coût quasi nul. La fusion idem. Tout est fait pour fonctionner de cette manière. Ok il y a des différences entre les différents [dcvs][] mais au final c'est presque pareil. Mais surtout, dans tous les cas on peut brancher et fusioner. Chose un peu trop suicidaire avec [svn][] pour le tenir longtemps.


### Mais svn alors ?

En fait svn favorise exactement l'inverse et un tas de mauvaises pratiques.

Par exemple, vu qu'on utilise pas, peu, jamais, les branches, il devient très compliqué de travailler sur plusieurs choses. Par exemple vous développez une fonctionnalité. Et là, subitement, au beau milieu, on vous annonce qu'il y a un bug en prod et qu'il faut le corriger.

> facile, je crée une topic branch avec mon travail en cours si c'est pas déjà le cas, je retourne sur master, corrige et pousse le code.

Ou pas.

Ben non, en [svn][] vu qu'on ne t'encourage pas à avoir des branches, ben tu n'en as pas. Pire, là sous les yeux j'ai des projets qui ne contiennent même les dossiers `trunk`, `tags` et `branches`…

Vu qu'on ne peut pas facilement découper un commit, le mettre de côté, etc, on favorise ce qu'on peut appeler des _master commits_. C'est plutôt simple, c'est des commits qui contiennent tout et n'importe quoi, mais surtout des choses qui ne sont pas en relation.
Par exemple, le commit va simplement contenir le travail de la journée, que ce soit fonctionnalité, amélioration ou correction. En général avec un message de commit des plus explicites, genre _« corrections »_. `-_-'`

Au final, on a souvent un historique horrible, qui n'est d'ailleurs presque jamais lu. Ben oui, comment voulez-vous lire un historique où les messages ne sont pas explicites et où les diff sont juste énormes ou comportant des modifications sans lien entre elles ? Ben on peut pas / on fait pas.

Et mine de rien ce qui est en jeux, c'est bien la maintenance du code. Un historique propre, où il est possible de retrouver, par exemple, comment on a corrigé un problème, comment on a cru corriger un problème, avec des branches permettant de gérer les versions, tout en voyant les liens entre elles, etc, c'est juste primordial pour pouvoir travailler proprement et efficacement.


## Un conseil pour terminer ?

Facile, je n'en ai qu'un, tout simplement :

> Utilisez un système de gestion de source correct, vous permettant de gérer des branches, des fusions, du travail local, etc. N'importe quel [dcvs][] peut convenir (même [bzr][]). Mais surtout, surtout, virez moi [svn][] ! Vos développeurs (et vos développements) ne s'en porteront que mieux !


[svn]: http://subversion.apache.org/
[git]: http://git-scm.com
[cvs]: http://fr.wikipedia.org/wiki/Concurrent_versions_system
[hg]: http://mercurial.selenic.com/
[bzr]: http://bazaar.canonical.com/
[dcvs]: http://en.wikipedia.org/wiki/Distributed_Concurrent_Versions_System
[sourcesafe]: http://fr.wikipedia.org/wiki/Microsoft_Visual_SourceSafe
[confgit]: http://log.winsos.net/2013/02/06/ma-configuration-git.html
[mq]: http://mercurial.selenic.com/wiki/MqExtension
[stgit]: http://www.procode.org/stgit/

