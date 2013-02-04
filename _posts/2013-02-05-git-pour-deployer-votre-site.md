---
layout: post
tags: [git, web_log_today]
title: Git pour deployer votre site
author: Yves
email: yves.brissaud@gmail.com
twitter: _crev_
published: false
---

[Git][git] est un outil merveilleux pour gérer vos projets. Non content de vous permettre de versionner correctement vos fichiers, c'est aussi un véritable outils de _devops_ qui vous permet de déployer votre site automagiquement.Petit tour dans le monde merveuilleux ~~du capitaine crochet~~ des hooks et des remotes.

## Contexte

Mon blog est créé à partir de [Web Log Today][wlt] mon petit générateur de site statique en ruby. Il est bien évidemment hébergé sous git (dont voici les [sources][blog]).

Jusqu'à présent, je modifiais mes fichiers, ajoutais des billets, visualisais en local, etc. Puis je commitais et poussais mes modifications dans un dépôt git.

Lorsque je voulais publier une nouvelle version, deux solutions s'offraient à moi :

* une presque automatique, à base de `rake deploy` et d'un fichier `Rakefile` qui appelait `wlt` puis `rsync`
* une un peu plus manuelle, je génère le contenu à partir de `wlt build` et je copiais par des moyens divers et variés (ftp, rsync, ssh)

Dans tous les cas, cette opération reste quelque peu ennuyant, répétitive. Et ça c'est maaaaaaaal !

## L'idée

Et pourtant, j'avais presque tout à ma disposition pour améliorer substentiellement les choses.

L'idée m'est en partie venue en lisant cet article de [Loïc d'Anterroches][danterroches], _[A Private PaaS with Mongrel2 and ZeroMQ][private paas]_ ainsi que celui-ci, _[Comment utiliser git pour gérer le déploiement de votre application web][gitdeploy]_.

Je vous suggère d'aller lire ces deux articles.

Pour ma part je me suis concentré sur un point : l'utilisation de git et des hooks pour effectuer des tâches automatiquement lors du push.

Le principe est donc le suivant : lorsque je push sur un dépôt dédié, automatiquement `wlt` est exécuté pour générer le contenu et met à jour le site en ligne.

Facile, non ?

## Mise en oeuvre

```sh
git clone --bare ./your-repo your-repo.git
```

```sh
cp ~/.wlt/tools/pre-receive your-repo.git/hooks/
```

```sh
ssh plop@server -c "mkdir ~/your-repo.git"
rsync -a --stats --delete ./your-repo.git/ plop@server:~/your-repo.git/
```

```sh
git remote add deploy ssh://plop@server/home/plop/your-repo.git
```

```sh
git push deploy master
```

[git]: http://git-scm.org
[wlt]: https://github.com/CrEv/wlt
[blog]: https://github.com/CrEv/log.winsos.net
[danterroches]: http://danterroches.org/
[private paas]: http://notes.ceondo.com/mongrel2-zmq-paas/
[gitdeploy]: http://xhtml.net/articles/git-deploiement-application-web
