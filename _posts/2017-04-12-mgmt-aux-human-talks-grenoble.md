---
layout: post
tags: [dev, mgmt, humantalks, talk]
title: "mgmt aux HumanTalks Grenoble"
author: Yves
email: yves.brissaud@gmail.com
twitter: _crev_
published: true
image: 2017/04/12/mgmt.png
description: "Présentation de mgmt, une nouvelle et prometteuse solution de
gestion de configuration pour des architectures cloud native"
---

Mardi 11 avril 2017 j'ai présenté _[mgmt](https://github.com/purpleidea/mgmt): next generation config management_ aux [HumanTalks Grenoble](http://humantalks.com/cities/grenoble).

Cette présentation a été principalement réalisée à base de démo. Mais voici les
différentes slides que j'ai présenté (très légèrement modifiés) avec quelques
commentaires et surtout des vidéos des différentes démonstrations utilisées.

> _Note_ : la présentation durant 10 minutes, je ne suis pas rentré dans les
> détails, le but était juste de présenter un outil que probablement beaucoup
> ne connaissent encore pas.

Si vous voulez avoir directement les slides, vous pouvez les retrouver à la fin
de l'article.

![](page_0000.jpg)

> mgmt est un système de gestion de configuration, au même titre qu'Ansible,
> Puppet, Chef, etc. Néanmoins il est assez différent sur beaucoup d'aspects.

> Il est réalisé par [@purpleidea](https://github.com/purpleidea) qui est
> employé par Red Hat.

![](page_0001.jpg)

> En général il y a deux principaux modèles de fonctionnement au niveau des
> outils de gestion de configuration

![](page_0002.jpg)

> Un agent sur chaque machine à configurer va, avec un intervalle de temps
> donné, contacter un serveur contenant la configuration pour savoir quoi
> faire.

![](page_0003.jpg)

> Ou un orchestrateur va régulièrement pousser la configuration sur chacun des
> noeuds à opérer.

![](page_0004.jpg)

> Globalement ces deux architectures sont très similaires et possèdent un
> certain nombre de problèmes.

![](page_0005.jpg)

![](page_0006.jpg)

> Que ce passe-t-il si le serveur ou orchestrateur est indisponible ? (reboot
> pour mise à jour, impossible à joindre, crash, etc)

> La configuration ne pourra pas être appliquée durant l'indisponibilité

![](page_0007.jpg)

![](page_0008.jpg)

> Si on prend le cas de l'orchestrateur en exemple, on va vouloir réaliser des
> commandes au travers de ssh sur chacune des machines. Si on a quelques
> machines ça peut fonctionner. Mais une fois qu'on commence à en avoir un
> nombre conséquent, est-ce vraiment une bonne idée ? Quelles sont les limites
> de parallélisation possibles ? Quelle durée pour appliquer une configuration
> ?

> _Attention_ je ne dis pas que ça ne peut pas scaler, juste que ce n'est pas
> nécessairement trivial

> Et d'ailleurs, alors qu'il est aujourd'hui facile de disposer de clusters
> (par exemple avec [CoreOS](/2016/11/10/introduction-pratique-coreos-terraform.html))
> l'approche de se connecter à chaque machine est-elle encore valable ?

![](page_0009.jpg)

![](page_0010.jpg)

> Vous voulez vraiment attendre une heure que vos changements soient appliqués ?
> Alors même qu'on met en oeuvre des orchestrateurs pour déployer des services en
> quelques secondes ?

> Imaginez plutôt qu'on puisse avoir des changements en temps réel : on parle de délais
> inférieurs à la seconde, du même ordre de grandeur que les autres composants
> que vous opérez, containers,
> [serverless](/2016/09/14/c-est-l-histoire-d-une-app-web.html), etc.

![](page_0011.jpg)

![](page_0012.jpg)

> Pour commencer, prenons un example tout simple. Voici un fichier `yaml` qui
> va décrire la configuration. Pour info, ce format sera probablement changé
> par la suite.

```yaml
---
graph: mygraph
resources:
  file:
  - name: file1
    path: "/tmp/mgmt/f1"
    content: |
      i am f1
    state: exists
  - name: file2
    path: "/tmp/mgmt/f2"
    content: |
      i am f2
    state: exists
  - name: file3
    path: "/tmp/mgmt/f3"
    content: |
      i am f3
    state: exists
  - name: file4
    path: "/tmp/mgmt/f4"
    content: |
      i am f4 and i should not be here
    state: absent
```

> Ce fichier `file1.yaml` décrit trois fichiers `/tmp/mgmt/f1`, `/tmp/mgmt/f2` et
> `/tmp/mgmt/f3` ainsi que leurs contenu. Il décrit égalemment que
> `/tmp/mgmt/f4` sera absent.

> Dans la vidéo qui suit, vous pouvez voir que `/tmp/mgmt/` est dans un premier
> temps vide. Au lancement de `mgmt` les trois fichiers vont être créés.

<iframe width="560" height="315" src="https://www.youtube.com/embed/sPfGY5BYnuY" frameborder="0" allowfullscreen="allowfullscreen"></iframe>

> Dans un second temps on peut voir que modifier les fichiers n'a pas d'impact
> visible, y compris en rafraichissant la liste de fichiers leur contenu toutes
> les 0.1 seconde.

> On remarque aussi qu'il nous est impossible de rajouter un fichier `f4`, dès
> qu'il est détecté par `mgmt` celui-ci le supprime aussi tôt.

<iframe width="560" height="315" src="https://www.youtube.com/embed/PI8weUhSpeM" frameborder="0" allowfullscreen="allowfullscreen"></iframe>

> Dernier détail sur cet aspect, `mgmt` surveille égalemment son fichier `yaml`
> de config. Ainsi si le contenu est modifié, l'état est automatiquement
> changé. Voici par exemple la modification du contenu d'un des fichiers créé
> par `mgmt` au travers du fichier de configuration.

<iframe width="560" height="315" src="https://www.youtube.com/embed/NPh6GF2q6ak" frameborder="0" allowfullscreen="allowfullscreen"></iframe>

![](page_0013.jpg)

> Dans cette démonstration, 3 machines vont être simulées. Elles sont
> différentiées par le
> paramètre `--hostname` de `mgmt` et par leur répertoire de travail,
> `/tmp/mgmtA`, `/tmp/mgmtB` et `/tmp/mgmtC`

> Chaque machine va créer un fichier et va permettre aux autres de récupérer ce
> fichier.

> Les machines vont être lancées successivement pour bien voir ce qui va se
> passer :
>
> - au lancement de la première machine, un fichier va être créé dans
>   `/tmp/mgmtA`
> - au lancement de la deuxième machine, un fichier va être créé dans
>   `/tmp/mgmtB`, fichier qui va aussi se retrouver dans `/tmp/mgmtA` tout
>   comme le fichier de la première machine va se retrouver dans l'emplacement
>   de la deuxième
> - la troisième machine va rajouter un fichier dans `/tmp/mgmtC` et chaque
>   machine va maintenant avoir les 3 fichiers

> Toute cette synchronisation est réalisée de pair à pair, sans intervention
> d'un serveur central ou d'un orchestrateur. Cette synchronisation passe par
> [etcd](https://coreos.com/etcd) qui est un système de clé/valeur distribué.

> Voici le fichier de la première machine, les autres étant similaires:

```yaml
---
graph: mygraph
resources:
  file:
  - name: "@@filea"
    path: "/tmp/mgmtA/fA"
    content: |
      i am fA, exported from host A
    state: exists
collect:
- kind: file
  pattern: "/tmp/mgmtA/"
edges: []
```

> La communication entre les différents `mgmt` se fait grace à `--seeds` qui va
> indiquer le serveur etcd à utiliser.

> `mgmt` crée son propre cluster etcd mais il est possible d'utiliser un
> cluster etcd existant. C'est une solution lorsqu'on utilise déjà des clusters
> CoreOS par exemple.

> Dans la vidéo qui suit vous pouvez voir l'exécution des trois `mgmt` et les
> différents fichiers apparaissant dans les trois environnements.

> Cette différence de fonctionnement, via etcd et donc une discussion de pair
> à pair au lieu du passage par un point central est une importante différence
> de fonctionnement par rapport aux autres solutions. Et si vous opérez déjà
> des clusters cela vous semblera aussi terriblement logique !

<iframe width="560" height="315" src="https://www.youtube.com/embed/XdmGc7zmVGU" frameborder="0" allowfullscreen="allowfullscreen"></iframe>

![](page_0014.jpg)

> Dans cette dernière démonstration on va pouvoir créer un service au niveau de
> systemd. Le service va être composé d'un fichier de service ainsi que du
> contrôle de ce service:

```yaml
---
graph: svc
resources:
  file:
  - name: mgmt-test.service
    path: "/etc/systemd/system/mgmt-test.service"
    content: |
      [Unit]
      Description=Test service

      [Service]
      ExecStart=/bin/sh -c "while true; do echo plop; sleep 2s; done"
  svc:
  - name: mgmt-test
    state: running
    startup: enabled
```

> La partie `svc` va s'assurer que le service `mgmt-test` (dont la description
> est dans le fichier juste au dessus) est bien exécuté.

> Le point critique à comprendre est surtout que, comme pour les fichiers,
> `mgmt` va s'assurer que l'état ne change pas. Si on arrête le service, `mgmt`
> va le détecter et appliquer la correction, à savoir que le service va être
> redémarré. Attention tout de même, ça peut être perturbant quand, pour des
> question de debug, vous tentez d'arrêter un service directement sur une
> machine...

<iframe width="560" height="315" src="https://www.youtube.com/embed/hn6MefRxpgs" frameborder="0" allowfullscreen="allowfullscreen"></iframe>

> Il faut par contre noter que la gestion des services est pour le moment assez
> réduite, entre autre un changement du fichier de service ne va pas redémarrer
> le service correspondant.

![](page_0015.jpg)

> `mgmt` est (très) jeune. Il n'en est pas encore à une version `0.1`.
> Néanmoins [nous](https://www.squarescale.com) croyons beaucoup dans son
> potentiel ! La manière proposée nous semble correspondre aux nouveaux besoins
> auxquels il faut faire face lorsqu'on opère de multiples clusters entre
> autre.

![](page_0016.jpg)

> Un point hyper important à noter : il est très simple d'aller discuter de
> `mgmt` avec son créateur, que ce soit au travers d'irc [#mgmtconfig](https://webchat.freenode.net/?channels=#mgmtconfig), [github](https://github.com/purpleidea/mgmt) ou [twitter](https://github.com/purpleidea).

> L'accueil aux _nouveaux_ (\o/ [mildred](https://twitter.com/purpleidea/status/845396786730676225))  n'est pas en reste, avec des issues github
> specifiquement marquées pour quiconque voudrait contributer facilement
> : [#mgmtlove](https://github.com/purpleidea/mgmt/issues?q=is%3Aissue+is%3Aopen+label%3Amgmtlove)

![](page_0017.jpg)

## Slides

<script async="async" class="speakerdeck-embed" data-id="da8b4b4c2aca45cb88bff76b0e659e5d" data-ratio="1.33333333333333" src="//speakerdeck.com/assets/embed.js"></script>

Si vous préférez [voici la version pdf](mgmt.pdf).
