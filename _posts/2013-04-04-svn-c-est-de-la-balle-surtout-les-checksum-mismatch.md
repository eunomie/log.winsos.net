---
layout: post
tags: [dev, svn]
title: SVN c'est de la balle, surtout les checksum mismatch
author: Yves
email: yves@brissaud.name
twitter: _crev_
published: true
image: 2013/04/04/svn.png
---

Ce qui est bien avec SVN c'est qu'à force de l'utiliser on peut même trouver des points positifs.

Par exemple, svn est lent. C'est un fait, et d'ailleurs c'est difficilement autrement. Pourquoi ? Simplement parce que quasiment tout ce que fait svn demande un accès au serveur. Un commit va par exemple être obligé de contacter le serveur. Logique me direz-vous puisqu'il n'y a pas de commit locaux.

Mais finalement, la lenteur de svn est une bonne chose ! Imaginez un instant que votre doigt ait fourché et que vous veniez de cliquer sur le bouton réalisant le commit alors que vous ne le vouliez pas. Genre vous n'avez pas encore saisi de message de commit, et vous savez que ça passera (ben oui, les hooks empêchant les commits avec un message vide c'est trop inutile, les messages vides c'est comme les master commits, c'est l'essence même de l'utilisation de svn…).

Mais en fait il n'y a aucun problème. Svn est tellement lent que vous avez 10 secondes (au moins) pour appuyer sur le bouton d'annulation ! Et hop, commit annulé. Encore plus facile qu'avec git. Ben oui, c'est quoi déjà la commande, c'est `git commit -ame` heu `git commit --ammend` heu `git commit --amend`. Vous voyez, svn est plus simple, bouton annuler, `CTRL-C`, hop !

Maintenant que tout est bien annulé comme il faut, il ne reste plus qu'à faire un commit correct. Vous entrez donc un zoli message qui va bien, vous sélectionnez les fichiers à envoyer, vous avez fait un update avant (histoire que ça ne crash pas en plein vol). Parfait…

Ou pas…

Mais oui, vous avez osé interrompre svn ! Que le malheur s'abatte sur vos claviers durant les trois prochaines génération de macbook !

Et oui, le commit ne passe pas. Bon finalement c'est pas très problématique, les 'ti gars de svn ont pensé à vous. Il existe la commande `svn cleanup`. Pourquoi ? Ben tout simplement parce que lorsque vous avez interrompu le commit, il était entrain d'envoyer les modifications d'un fichier. Et le fichier est donc désormais _locké_. `cleanup` va supprimer le lock.

Ok, tout va bien alors. Allez, commit !

Ou pas…

Et oui, il ne veut toujours pas. Une sombre histoire de _checksum mismatch_. En gros le fichier de base (celui provenant du serveur) ne correspond plus. Il faut savoir que les fichiers initiaux sont stockés dans le `.svn`. Ainsi cela permet de connaître les modifications, de faire un `revert`, etc. Le truc c'est que svn a du s'emmeler les pinceaux et foirer quelque part. Et le hash de ce fichier (de base) ne correspond pas à celui du serveur. Ou un truc dans le genre.

Et là, ben il ne reste plus qu'à jouer avec les `.svn`…

Histoire que ce billet ne serve pas totalement à rien, voici la procédure. Imaginons que vous n'arriviez pas à commit le fichier `plop.txt` et qu'il vous affiche un _checksum mismatch_.

1. Ouvrez une console (vous croyez tout de même pas qu'on allait faire ça en graphique quand même…)
2. Déplacez vous dans le répertoire contenant votre fichier
3. `cd .svn/text-base`
4. Là vous devriez trouver un fichier `plop.txt.svn-base`. C'est ce fichier qui pose problème. Il faut donc le remplacer par une nouvelle version provenant du serveur.
5. Faites un _checkout_ de votre répertoire (pour ma part je l'ai fait dans un dossier `tmp` directement dans `text-base`). Pour connaître le bon chemin à _chekout_, remontez de deux cran (dans le répertoire parent au `.svn` et faites un `svn info`)
6. `svn co <plop> tmp`
7. Copiez le fichier du serveur : `cp .svn/text-base/plop.txt.svn-base .`
8. Supprimez votre copie pour ne pas trop foutre la merde : `rm -Rf tmp`
9. Done! Vous pouvez désormais commiter vos modifications

Alors, trop de la balle svn, non ?
