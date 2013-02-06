---
layout: post
tags: [git]
title: Ma configuration git
author: Yves
email: yves.brissaud@gmail.com
twitter: _crev_
published: false
---

Comme tout bon développeur, vous utilisez [git][]. Par contre, j'espère que vous ne vous limitez pas à la configuration de base. Voici, rapidement, un petit descriptif de la configuration que j'utilise.

# Outils graphiques

Pour commencer simplement, il est parfois intéressant d'avoir quelques outils graphiques. Sous windows et mac j'utilise souvent les clients [git][] de [github][] :

* version [windows][gitwindows]
* version [mac][gitmac]

J'apprécie ses logiciels car ils sont simples dans leur usage. Contrairement à beaucoup de clients qui font tout et n'importe quoi, ceux-ci ne font que ce qu'on leur demande mais le font plutôt bien. Et d'ailleurs, il n'est pas nécessaire d'avoir un dépôt sur [github][] pour les utiliser. J'aimerais réellement un équivalent sous linux, mais je n'ai jamais été convaincu par ceux que j'ai essayé. Non en terme de fonctionnalité, mais en général c'est sur l'ergonomie qu'ils pêchent.

Sous mac j'utilise également [SourceTree][]. C'est un bon logiciel, permettant aussi d'utiliser [mercurial][hg]. Il appartient désormais à [Atlassian][] qui l'a rendu gratuit. Il est vraiment complet, très pratique et puissant. Si vous avez un mac je vous conseil de l'utiliser.

## Workflow

En général le workflow utilisé est assez simple. `master` est la branche principale. La différence qui peut parfois exister est juste le fait que `master` est une branche "stable" dans le sens où elle peut être déployée n'importe quand ou non.

Parfois j'utilise [gitflow][]. C'est plutôt sympa, assez puissant, simple à utiliser. Par contre, c'est préférable sur des projets un peu important, tout seul sur un petit projet ça l'est moins. Voici d'ailleurs un "célèbre" post présentant un tel workflow (par le créateur de [gitflow][]) : _[« A successful Git branching model »][branching]_. Je vous recommande de regarder tout ça, que vous l'utilisiez ou non, c'est intéressant.

A noter que [gitflow][] et son pendant [hg][], [hgflow][], sont intégrés et utilisable directement dans [SourceTree][]. C'est un point positif de plus en faveur de ce logiciel.

## Autres outils

Il m'est arrivé d'utiliser [gitbuster][]. Il s'agit d'un frontend à git `filter-branch` et `cherry-pick`. C'est plutôt sympa pour modifier, corriger un historique avant push. Il permet aussi de modifier pas mal de méta données des commits, sympa si vous vous êtes trompé de config et avez fait des commits sous un mauvais id.

Même si je l'utilise trop peu, il m'arrive souvent d'utiliser [stgit][]. Il permet de gérer une pile de patch puis de les transformer en commits. C'est vraiment agréable à utiliser lorsqu'on souhaite avoir tout le temps un historique propre. Ça demande un peu de prise en main mais c'est vraiment un bon outil qui rend le développement plus agréable.

## Alias

Que serait [git][] sans des alias pour améliorer un peu son utilisation ? Probablement pas grand chose ! Voici donc les alias principaux que j'utilise, à définir dans la section `[alias]` de votre `~/.gitconfig`.

Voici déjà quelques alias tous simples :

```text
st = status
ci = commit
co = checkout
```

Ensuite, un que j'utilise beaucoup :

```text
pr = pull --rebase
```

J'utilise beaucoup `rebase`, je trouve que c'est en général la meilleur manière de se synchroniser avec les autres proprement.

Un classique mais néanmoins pratique log graphique sympa :

```text
oneline = log --pretty=oneline --abbrev-commit --graph
```

Ayant travaillé pendant quelques temps avec [hg][], deux fonctionnalités me manquaient furieusement : pouvoir lister les commits non poussés vers le serveur, et inversement pouvoir lister les commits non récupérés.

Voici donc `git out` et son pendant local (qui ne fetch pas) `git lout` :

```text
lout = log --pretty=oneline --abbrev-commit --graph @{u}..
out = !git fetch && git lout
```

Vous remarquerez `@{u}` qui représente la branche `upstream` et la notaion avec `..` qui permet de n'afficher que les nouveaux commits.

Voici maintenant `git in` et la version sans fetch `git lin` :

```text
lin = log --pretty=oneline --abbrev-commit --graph ..@{u}
in = !git fetch && git log --pretty=oneline --abbrev-commit --graph ..@{u}
```

Côté diff, juste un alias pour visualiser rapidement ce qui est déjà ajouté mais en attente de commit :

```text
  dic = diff --cached
```

Un petit alias tout bête mais terriblement utile :

```text
undo = reset --soft HEAD^
```

Viens ensuite une série d'alias que j'utilisé énormément, surout le premier. Il s'agit juste d'améliorations autour de `add` et `rm` mais fait gagner pas mal de temps.

```text
# add modified files
addm = !git-ls-files -m -z | xargs -0 git-add && git status
# add unknown files
addu = !git-ls-files -o --exclude-standard -z | xargs -0 git-add && git status
# delete files marked as deleted
rmm  = !git ls-files -d -z | xargs -0 git-rm && git status
```

En temps normal, je réalise un commit avec les instructions suivantes :

```sh
git diff
git addm
git ci -m "bla bla"
```

Si jamais mon diff n'est pas propre, en général je remplace `git addm` par un classique mais ô combien utile `git add -p` qui permet de ne commiter que ce qu'on souhaite. Si vous ne l'utilisez pas, je vous conseille réellement d'aller voir. C'est vraiment très pratique et vous permet de faire des commits propre assez facilement. Rien que ce point est une bonne raison de passer d'un svn à un git/hg (avec l'extension `record`).

Mais c'est pas tout, n'oublions pas qu'on parle quand même de système de gestion de version **décentralisé**. Il est donc important de pouvoir servir un dépôt afin de permettre, par exemple, à un collègue de récupérer votre travail sans passer par un serveur central. Surtout que servir du git est quand même plutôt facile :

```text
serve = daemon --reuseaddr --verbose  --base-path=. --export-all ./.git
```

Un autre point qui arrive souvent : la gestion des conflits lors des merges. Je dis souvent mais c'est pas tant que ça non plus, git fonctionne tout de même plutôt bien. Par contre, si vous avez plusieurs fichiers en conflits c'est parfois un peu galère à utiliser. Voici donc quelques alias qui vont vous facilité la vie.

Avant de présenter les alias, voici leur usage :

1. Vous venez de faire un merge ou rebase, et il y a des conflits
2. `git edit-unmerged` va ouvrir l'éditeur de votre choix avec l'ensemble des fichiers en conflits (l'idéal étant même de n'avoir aucun fichier ouverts dans l'éditeur, le travail s'en trouve simplifié)
3. Correction des conflits
4. `git add-unmerged` ajoute tous les fichiers en conflit
5. Selon les cas, `git commit` ou `git rebase --continue` par exemple

Voici donc les deux alias. A noter que dans le premier `sub` est dans mon cas une commande shell ouvrant Sublime Text 2. Vous pouvez aussi envisager d'utiliser `$EDITOR` par exemple.

```text
edit-unmerged = "!f() { git ls-files --unmerged | cut -f2 | sort -u ; }; sub `f`"
add-unmerged = "!f() { git ls-files --unmerged | cut -f2 | sort -u ; }; git add `f`"
```

Et un petit dernier vraiment pratique. Il vous permet d'ajouter des branches à fetcher lorsque vous êtes sur un projet [github][]. Ces branches correspondent aux _pull requests_ et vous permettent donc de les tester en local avant de les accepter. Vous pouvez aussi, un peu dans le même genre, regarder du côté de [hub][].

```text
pullify = config --add remote.origin.fetch '+refs/pull/*/head:refs/remotes/origin/pr/*'
```

Lorsque vous clonez un projet github, vous pouvez donc ensuite simplement faire un `git pullify` puis un `git fetch`. Les _pull requests_  seront alors disponibles dans des branches `pr/...`.

## End

Voici, un petit aperçu rapide de ma conf. Au final rien de très spécial, juste une petite collection d'outils et d'alias. Et vous, vous utilisez quoi pour améliorer votre usage de [git][] ?

[git]: http://git-scm.org
[github]: https://github.com
[gitwindows]: http://windows.github.com/
[gitmac]: http://mac.github.com/
[SourceTree]: http://www.sourcetreeapp.com/
[hg]: http://mercurial.selenic.com/
[Atlassian]: http://www.atlassian.com
[gitbuster]: https://github.com/mike-perdide/gitbuster
[gitflow]: https://github.com/nvie/gitflow
[hgflow]: https://bitbucket.org/yinwm/hgflow/wiki/Home
[branching]: http://nvie.com/posts/a-successful-git-branching-model/
[stgit]: http://www.procode.org/stgit/
[legit]: http://www.git-legit.org/
[hub]: http://defunkt.io/hub/
