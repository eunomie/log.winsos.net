---
layout: post
tags: [git]
title: Ma configuration git
author: Yves
email: yves.brissaud@gmail.com
twitter: _crev_
published: false
---

Comme toute personne censée, vous utilisez [git][]. Par contre, j'espère que vous ne vous limitez pas à la configuration de base. Voici, rapidement, un petit descriptif de la configuration que j'utilise.

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

```text
#outgoing
  lout = log --pretty=oneline --abbrev-commit --graph @{u}..
  out = !git fetch && git lout
  # incoming
  lin = log --pretty=oneline --abbrev-commit --graph ..@{u}
  in = !git fetch && git log --pretty=oneline --abbrev-commit --graph ..@{u}

  # diff
  dic = diff --cached
  diffstat = diff --stat

  undo = reset --soft HEAD^
  # add modified files
  addm = !git-ls-files -m -z | xargs -0 git-add && git status
  # add unknown files
  addu = !git-ls-files -o --exclude-standard -z | xargs -0 git-add && git status
  # delete files marked as deleted
  rmm  = !git ls-files -d -z | xargs -0 git-rm && git status

  # server files
  serve = daemon --reuseaddr --verbose  --base-path=. --export-all ./.git

  # merge management

  # $ git edit-unmerged
  # $ ... edit ...
  # $ ... test ...
  # $ git add-unmerged
  # $ git commit  # or git rebase --continue or whatever

  # sub is a shell alias to launch SublimeText2
  edit-unmerged = "!f() { git ls-files --unmerged | cut -f2 | sort -u ; }; sub `f`"
  add-unmerged = "!f() { git ls-files --unmerged | cut -f2 | sort -u ; }; git add `f`"

  # legit
  switch = !legit switch \"$@\"
  branches = !legit branches
  sprout = !legit sprout \"$@\"
  unpublish = !legit unpublish \"$@\"
  harvest = !legit harvest \"$@\"
  sync = !legit sync \"$@\"
  publish = !legit publish \"$@\"
  graft = !legit graft \"$@\"

  # add github pull requests
  pullify = config --add remote.origin.fetch '+refs/pull/*/head:refs/remotes/origin/pr/*'
```

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
