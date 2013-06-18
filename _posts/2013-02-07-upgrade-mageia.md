---
layout: post
tags: [mageia, linux]
title: Upgrade mageia
author: Yves
email: yves.brissaud@gmail.com
twitter: _crev_
published: true
nolinks: true
---

Il y a quelques jours, j'ai eu besoin de monter en version ma [mageia][]. Petit retour sur cette opération.

En fait, je voulais mettre en place le [déploiement via git][deploy] de mon blog. Le problème était tout simple : j'avais une [mageia][] 1, un ruby 1.8, et pas moyen d'installer proprement les gem nécessaires à [Web Log Today][wlt].

Il a donc fallu que je me décide à passer à la version 2 (oui, je sais, la 3 arrive bientôt mais ça attendra). Pour préciser un peu, on parle d'une machine virtuelle, qui tourne sur un ESXi. Le but de cette machine est quasi uniquement de servir des sites web. J'en ai pas des masses, pas de contenu énorme, mais c'est en prod et ça fait quelques visites tous les jours. Pas de problème à couper le serveur dans la journée, mais je ne voulais pas que ça dure trop longtemps non plus. Voilà pour le contexte.

## Bon, comment qu'on fait ?

Alors en gros, c'est juste super simple !

Déjà, voici la [documentation][docmageia].

1. Suppression des sources `urpmi` existantes

  ```sh
  urpmi.removemedia -a
  ```

2. Ajout des sources

  ```sh
  urpmi.addmedia --distrib --mirrorlist http://mirrors.mageia.org/api/mageia.2.$ARCH.list
  ```

3. On met à jour !

  La documentation indique de le faire avec la commande suivante :

  ```sh
  urpmi --replacefiles --auto-update --auto
  ```

  Pour ma part j'ai juste fait une petite variation :

  ```sh
  urpmi --replacefiles --auto-update --auto --download-all
  ```

  La différence est que tous les paquets vont être téléchargés avant la mise à jour. Il faut de la place dispo, mais ça évite des problèmes. Il n'y a pas longtemps, j'ai eu une mise à jour sur un ordi sous mageia. Le problème était que la carte réseau était pas super bien gérée. Et une mise à jour ramenait des paquets liés à la carte. Donc lorsque la mise à jour est passée, j'ai perdu la connexion, résultat le reste de la mise à jour à foiré. Génial...

4. Reboot

## Résultat

Résultat, une distrib qui marche au poil. Entre autre, passage au décrié `systemd`... sans aucun soucis !

J'ai alors pu installer tout ce dont j'avais besoin, en autre faire mumuse avec rbenv et les gems dont j'avais besoin.

## Petit problème

Ok, il y avait juste un petit soucis. Qui d'ailleurs m'a rempli tout mon espace libre avec des fichiers `core.xxx` (on parle quand même de plusieurs Go...).

J'ai fini par trouver le problème. Une application php utilisait `gd`. Bon, c'est assez classique. Mais problème, il semble qu'il y ait une incompatibilité, une partie compilée avec un `.h` dans une version, et la lib dans une autre.

Au final, j'ai simplement remplacé `php-gd` par `php-gd-bundled` et tout est rentré dans l'ordre.

Parfait !

Franchement, [mageia][] j'aime bien ! Je retrouve ce que j'appréciais dans les mandrake de la grande époque (que mandriva n'a pas réussi à concervé, et s'en est triste).

Vu la facilité, je pense que je migrerai probablement rapidement en mageia 3 sans crainte.


[mageia]: http://www.mageia.org
[deploy]: http://log.winsos.net/2013/02/05/git-pour-deployer-votre-site.html
[wlt]: https://github.com/eunomie/wlt
[docmageia]: https://wiki.mageia.org/en/Mageia_2_:_Notes_de_Version_-_FR#Mise_.C3.A0_niveau_en_ligne.2C_en_utilisant_urpmi_.28ligne_de_commande.2FCLI.29
