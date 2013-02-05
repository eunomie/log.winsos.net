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

Le principe est donc le suivant : lorsque je push sur un dépôt dédié, automatiquement `wlt` est exécuté pour générer le contenu et met à jour le site en ligne. Evidemment cela suppose que `wlt` soit installé et fonctionnel sur la machine contenant le dépôt, et exécutable par l'utilisateur.

Facile, non ?

## Mise en oeuvre

Voici ce qu'il va donc se passer. Sur le serveur web (ça pourrait être en réalité n'importe où ailleurs) un dépôt lié à mes sources va être créé. Il va contenir un `hook` qui sera exécuté juste avant d'intégrer les commits. Ce hook va générer le site et le copier au bon endroit.

Sans plus attendre, les quelques étapes à suivre pour réaliser tout cela.

1. Sur votre poste, créer un clone `bare` de vos sources. `bare` signifie qu'il ne contient pas de copie locale, en gros ce n'est que le `.git`

    ```sh
    git clone --bare ./your-repo your-repo.git
    ```

2. Copier le `hook` `pre-receive` dans ce dépôt (il est détaillé un peu plus loin)

    ```sh
    cp ~/.wlt/tools/pre-receive your-repo.git/hooks/
    ```

3. Transferez ce dépôt sur le serveur

    ```sh
    ssh plop@server -c "mkdir ~/your-repo.git"
    rsync -a --stats --delete ./your-repo.git/ plop@server:~/your-repo.git/
    ```

    Vous pouvez désormais supprimer votre dépôt bare en local, il ne sert plus à grand chose.

4. Viens la partie amusante. On va simplement définir une nouvelle `remote` (un dépôt distant vers lequel on peut pousser les modification) correspondant à notre dépôt

    ```sh
    git remote add deploy ssh://plop@server/home/plop/your-repo.git
    ```

5. Et voilà, lorsque vous voulez déployer, il ne vous reste qu'à exécuter la commande suivante :

    ```sh
    git push deploy master
    ```

    Et lors de la réception du push côté serveur, le hook sera executé et le code déployé.

Je vous l'avais dit que c'était simple !

## Un peu de détails sur le hook

Le hook utilisé, `pre-receive` intervient lorsque le dépôt reçoit un `push`. La valeur de sortie de ce hook conditionne l'acceptation de ces modifications (`0`) ou non.

Le hook va réaliser deux choses très simples :

1. création d'une copie de travail du dépôt
2. exécution d'une tâche `rake` générant le site et le copiant dans le bon répertoire (cela nécessite donc que votre `Rakefile` soit configuré en fonction)

Voici la partie du `Rakefile` effectuant cette opération de déploiement en local (ie : depuis le serveur)

```ruby
task :deploylocal => :build do
  sh "rsync --checksum -rtzh --progress --delete _site/ /var/www/log/"
end
```

Et voici le hook :

```sh
#!/usr/bin/env bash
set -e

source ~/.bash_profile

FULL_GIT_DIR=$(cd "$GIT_DIR" && /bin/pwd || "$GIT_DIR")

SCRATCH_DIR=$HOME/autobuild/scratch
GIT_DIR_NAME=$(basename $FULL_GIT_DIR)
GIT_DIR_NAME=${GIT_DIR_NAME%.*}
echo "-----> $GIT_DIR_NAME app."
while read OLDREV NEWREV REF
do
    if [ "$REF" != "refs/heads/master" ]; then
        echo "$REF is not master"
        continue
    fi
    rm -rf $SCRATCH_DIR/$GIT_DIR_NAME 
    mkdir -p $SCRATCH_DIR/$GIT_DIR_NAME
    GIT_WORK_TREE=$SCRATCH_DIR/$GIT_DIR_NAME git checkout -f $NEWREV &> /dev/null
    cd $SCRATCH_DIR/$GIT_DIR_NAME && bundle exec rake deploylocal
done
echo "-----> Deploy OK"
# Very important to return 0 for the new revision to be accepted
exit 0
```

L'une des lignes les plus importantes est évidemment :

```sh
cd $SCRATCH_DIR/$GIT_DIR_NAME && bundle exec rake deploylocal
```

On se déplace dans la copie de travail de ce qu'on push et on exécute la tâche `rake` qui va générer le site à partir de `wlt` puis le copier.

## Fin

Alors, c'était pas si difficile, non ? Ok cette présentation est sommaire, mais elle montre comment, en très peu de temps il est possible de radicalement changer la façon de travailler. Précédemment on avait l'habitude de générer les choses en local puis de les pousser manuellement vers le serveur. Ou au moins de demander tout volontairement. Avec les hooks (ce n'est évidemment pas limité à git) il est très simple d'automatiser cela un peu plus. L'avantage pour le développeur est qu'il ne quitte finalement pas ses outils, git ici. Le confort est donc bien meilleur pour le développeur, il n'y a plus à s'en soucier. Et ça fait un peu plus de temps de cerveau disponible pour coder correctement `;-)`

[git]: http://git-scm.org
[wlt]: https://github.com/CrEv/wlt
[blog]: https://github.com/CrEv/log.winsos.net
[danterroches]: http://danterroches.org/
[private paas]: http://notes.ceondo.com/mongrel2-zmq-paas/
[gitdeploy]: http://xhtml.net/articles/git-deploiement-application-web
