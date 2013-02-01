---
layout: post
tags : [veille, linuxfr]
title: De tout, de rien, des bookmarks, du bla bla 45
author: CrEv
email: yves.brissaud@gmail.com
twitter: _crev_
---

_note: ce billet de veille a été rédigé et posté sur [linuxfr](http://linuxfr.org), il est visible [ici](http://linuxfr.org/news/de-tout-de-rien-des-bookmarks-du-bla-bla-45). Il est en outre sous licence [CC by-sa](http://creativecommons.org/licenses/by-sa/3.0/deed.fr)_

Comme à sa presque habitude, voici un petit condensé de ma veille.
Il s’agit comme souvent (mes journaux et maintenant mes dépêches) essentiellement de bookmarks, très légèrement commentés. C’est plutôt orienté développement, essentiellement côté Web et JavaScript, mais j’essaie aussi de toujours avoir deux ou trois petites choses annexes. Le but étant juste de partager et d’initier discussions, débats, avis, touckevouvoulez.

Comme toujours, vous trouverez une liste des liens présentés en fin d’article, pour que les plus rapides puissent cliquer directement sans lire le bla‐bla qui traîne autour.

Bonne lecture !


## Avant‐propos LinuxFr.org et espace collaboratif

Après quelques [tâtonnements](https://linuxfr.org/users/crev), puis quelques [versions](https://linuxfr.org/news/de-tout-de-rien-des-bookmarks-du-bla-bla-42) [un peu](https://linuxfr.org/news/de-tout-de-rien-des-bookmarks-du-bla-bla-43) [plus sérieuses](https://linuxfr.org/news/de-tout-de-rien-des-bookmarks-du-bla-bla-44), voici la première réelle version [collaborative](https://linuxfr.org/redaction). Cette dépêche, si elle est à mon initiative, a été rédigée dans l’espace de rédaction collaboratif de LinuxFr.org. J’ai ainsi pu bénéficier, comme pour la précédente, des corrections de certains relecteurs (comme [baud123](https://linuxfr.org/users/baud123) ou [xaccrocheur](https://linuxfr.org/users/philippemc)). Mais surtout, un certain nombre de liens ne proviennent pas initialement de moi, et c’est (presque) une première (presque, car [Nyco](https://linuxfr.org/users/nyco) m’avait déjà proposé quelques liens précédemment). Cette fois‐ci, ce sont [NoNo](https://linuxfr.org/users/nono), [needs](https://linuxfr.org/users/needs), [xaccrocheur](https://linuxfr.org/users/philippemc) et [Nonolapéro](https://linuxfr.org/users/nonolapero) qui m’ont proposé certains des liens que vous trouverez dans la suite. Merci beaucoup à eux !

La première fois que j’ai utilisé cet espace collaboratif ce n’était en réalité pas pour le côté collaboratif, mais par facilité de saisie. J’utilisais précédemment soit un _Google doc_, soit un petit éditeur _Markdown_ que j’avais posé sur un serveur, soit l’interface de mon _blog_ pour rédiger mes _news_. Mais l’espace collaboratif est plus sympa. Et je pense que, finalement, je vais continuer à rédiger les prochaines à cet endroit. Ceux qui le souhaitent pourront donc aussi soumettre des liens comme ce fut le cas pour cette version. :)


## Un peu de contenu


### Développement

Si vous souhaitez créer un beau tableau de bord — _dashboard_ —, un _« panic board »_ ou autre, vous pouvez vous intéresser à _[dashing](http://shopify.github.com/dashing/)_ (lien envoyé par [NoNo](https://linuxfr.org/users/nono)). Il s’agit d’un _framework_ basé sur [Sinatra](http://www.sinatrarb.com/), donc en Ruby, permettant de créer facilement des tableaux de bord à base de _widgets_ que vous pouvez déplacer. Très pratique, par exemple dans un bureau de développement, pour avoir les dernières informations en provenance de Twitter, de l’intégration continue, etc. Vous trouverez sur le site deux démonstrations pour vous donner une idée du rendu. Personnellement, je le trouve vraiment sympa, ça a l’air plutôt simple à utiliser. Il ne me reste plus qu’à trouver le temps de le tester réellement. Si certains l’utilisent, n’hésitez surtout pas à en faire part dans les commentaires. ;)

Les programmeurs, les vrais, pas les petits malins qui font du Coffee ou du Python — Lisp est accepté d’office, si vous faites du [Perl](http://en.wikipedia.org/wiki/Obfuscated_Perl_Contest) ou du [Ruby](https://github.com/saizai/iorcc) c’est OK —, seront déjà au fait des résultats du plus beau concours de programmation C : le concours international de code C obfusqué (ioccc : _International Obfuscated C Code Contest_). Pour les autres, vous trouverez les [résultats ici](http://www.de.ioccc.org/years.html#2012) (lien envoyé par [needs](https://linuxfr.org/users/needs)).

Go est souvent montré pour sa facilité à gérer la concurrence. Mais ce n’est pas le seul langage à le permettre, entre autres, Erlang est plutôt pas mal. Voici donc un petit article présentant un [_Hello World_ concurrentiel](http://himmele.blogspot.de/2012/11/concurrent-hello-world-in-go-erlang.html) en Go, Erlang et C++. Sans vous indiquer le gagnant, vous trouverez facilement le grand perdant entre les trois…

Et pour rester dans l’illisibilité, voici une réflexion assez intéressante : [avant, il y avait le _goto_, maintenant il y a les _callbacks_](http://elm-lang.org/learn/Escape-from-Callback-Hell.elm).

Que seraient ces actus sans du JavaScript ou Dart ? Rien, probablement. Voici donc, car elle a été remise à jour dernièrement, la page des [synonymes Dart‐JavaScript](http://synonym.dartlang.org/). Si vous êtes nouveaux sur Dart, ou si vous voulez juste des infos supplémentaires et que vous connaissez un peu JavaScript, ça peut être un très bon début.


### Misc

Si vous trouvez que votre terminal ou _shell_ favori est trop limité, vous serez probablement intéressés par [xiki](http://xiki.org/) (lien envoyé par [needs](https://linuxfr.org/users/needs)). Décrire xiki est assez complexe. C’est en partie un _shell_, mais avec des fonctionnalités avancées, proches des interfaces graphiques. D’ailleurs, xiki ne s’utilise pas directement comme si l’on avait un _xterm_ ou autre, mais à travers un éditeur de texte (Emacs en priorité). Finalement, le mieux est que vous alliez voir le site ou la [vidéo](http://www.youtube.com/watch?v=bUR_eUVcABg).

Dans tous les cas, je suis toujours agréablement surpris par les quelques projets du genre qui existent (je pense notamment à [TermKit](https://github.com/unconed/TermKit), dont voici une [présentation](http://acko.net/blog/on-termkit/), également [GateOne](https://github.com/liftoff/GateOne/), surtout que vous pouvez le tester dans votre navigateur). Mais j’aimerais vraiment qu’il y ait d’autres projets du genre. Car il faut bien avouer que les terminaux n’ont que peu évolué ces derniers temps. Certes, ils sont pratiques sur de nombreux points (j’en ai moi‐même en général un certain nombre d’ouverts lorsque je bosse, entre l’exploration des répertoires, Git, Vagrant, SSH, etc.) et si des petites choses telles que [_oh my zsh_](https://github.com/robbyrussell/oh-my-zsh) et ses greffons sont plutôt intéressantes, je pense qu’on pourrait aller beaucoup plus loin, et surtout sortir de la contrainte purement textuelle. Ce que je veux dire par là c’est que si initialement la contrainte était qu’on était dans des consoles textes, ce n’est majoritairement plus le cas. Il serait donc intéressant de profiter de toutes les améliorations graphiques à notre disposition (ne serait‐ce que pour avoir une meilleure interactivité ou afficher des médias directement), tout en gardant le côté ligne de commande qui, lui, permet d’être régulièrement plus rapide et efficace que sur des logiciels graphiques à la souris. En fait, j’aimerais vraiment une fusion de la ligne de commande et de l’interface graphique.

Histoire de continuer un peu sur la ligne de commande, vous apprécierez probablement [_ls++_](https://github.com/trapd00r/ls--). Il s’agit d’un petit outil, en Perl, permettant d’avoir un `ls -l` un peu plus sympa. Rien de transcendant, mais je trouve ça agréable. Pour ma part, je l’ai reconfiguré sur mon alias `ll`.

Et dans le genre utilitaire pratique (bien que je ne l’ai pas testé), vous pouvez vous intéresser à [_byobu_](http://manpages.ubuntu.com/manpages/precise/en/man1/byobu.1.html) (envoyé par [xaccrocheur](https://linuxfr.org/users/philippemc) et aussi présent dans [mon journal sur le _tiling_ et les terminaux](https://linuxfr.org/users/crev/journaux/tiling-interne-ou-externe-telle-est-la-question)) . Il s’agit d’un _wrapper_ au‐dessus de _tmux/screen_, afin d’en faciliter l’usage. Aux dires de ceux qui l’utilisent, ça semble vraiment sympa, à vous de nous le dire en commentaire ;).

Si vous cherchez des ressources (livres) gratuits (et si possible libres), [_The Hacker Shelf_](http://hackershelf.com/browse/) (lien par [needs](https://linuxfr.org/users/needs)) devrait vous intéresser. Vous y trouverez un certain nombre de livres, comme, par exemple, [_The Art of Unix Programming_](http://catb.org/~esr/writings/taoup/html/) de [Eric S. Raymond](http://fr.wikipedia.org/wiki/Eric_Raymond).

Pour rester dans les livres (ou presque), voici un (long) article qui me semble plutôt sympa. Il y est question d’[écrire des documentations de qualité](http://jacobian.org/writing/great-documentation/). Je n’ai pas eu le temps de le lire, mais ça semble intéressant. Si certains l’ont déjà lu, je ne suis pas contre leur retour ;).

Histoire de changer un peu de thème, voici un article qui pose une question intrigante et intéressante : [Pour réussir, faut‐il être intelligent ou motivé ?](http://www.slate.fr/story/61661/enfants-reussite-qi-intelligence-motivation) Je ne vais naturellement pas vous dévoiler la conclusion, ça gâcherait tout, mais l’article est plutôt intéressant. Et la question de la motivation est quelque chose de très important. Quand on est enfant, élève, évidemment, mais finalement même lorsqu’on est employé. Par exemple, motivation au salaire. Mais ce qui est intéressant est surtout l’effet, ou le non‐effet, de ces motivations (à rapprocher d’un TED talk que j’avais déjà envoyé dans les journaux).


### Graphisme, design & co

Si vous vous intéressez au design des sites/applications Web, vous avez déjà entendu parler du _responsive design_. Voici un article sur le sujet, non pas d’un point de vue développeur, mais plutôt du côté designer, [_The Responsive Designer_](http://simonfosterdesign.com/blog/web-design/the-responsive-designer/). L’article est plutôt bien réalisé (il s’agit en gros de diapos commentées) et assez clair. Pas grand chose de plus à dire dessus, allez le lire ;).

Si vous souhaitez visualiser (ou proposer à vos utilisateurs) des grosses images, vous serez peut‐être intéressés par [HUGEpic](http://www.peterbe.com/plog/introducing-hugepic.io) (lien envoyé par [Nonolapero](https://linuxfr.org/users/nonolapero)). Il s’agit d’une application Web dédiée à cet usage. De mon point de vue, c’est assez similaire à ce qui se fait dans la cartographie (pour y avoir bossé quelques années). D’ailleurs, Google avait utilisé leur technologie dans _Google Maps_ pour afficher des œuvres d’art.

Pour changer un peu et s’éloigner du développement, voici quelques [paysages géométriques](http://www.webdesignertrends.com/2012/11/les-paysages-geometriques-de-jr-schmidt/) plutôt sympas. Ça change un peu, et je trouve ça plutôt bien fait. J’aime bien, entre autres, la référence aux Lego.



## Liste des liens présentés


### Développement

* dashing : <http://shopify.github.com/dashing/>
* Sinatra : <http://www.sinatrarb.com/>
* Obsucated Perl Contest : <http://en.wikipedia.org/wiki/Obfuscated_Perl_Contest>
* International Obfuscated Ruby Code Contest : <https://github.com/saizai/iorcc>
* International Obfuscated C Code Contest 2012 : <http://www.de.ioccc.org/years.html#2012>
* L’enfer des callbacks : <http://elm-lang.org/learn/Escape-from-Callback-Hell.elm>
* Hello World concurrentiel en Go, Erlang et C++ : <http://himmele.blogspot.de/2012/11/concurrent-hello-world-in-go-erlang.html>
* synonymes Dart‐Javascript : <http://synonym.dartlang.org/>


### Misc

* xiki : <http://xiki.org/>
* vidéo de présentation de xiki : <http://www.youtube.com/watch?v=bUR_eUVcABg>
* TermKit : <https://github.com/unconed/TermKit>
* présentation de TermKit : <http://acko.net/blog/on-termkit/>
* GateOne : <https://github.com/liftoff/GateOne/>
* Oh my zsh : <https://github.com/robbyrussell/oh-my-zsh>
* ls++ : <https://github.com/trapd00r/ls-->
* byobu : <http://manpages.ubuntu.com/manpages/precise/en/man1/byobu.1.html>
* The Hacker Shelf : <http://hackershelf.com/browse/>
* The Art of Unix Programming : <http://catb.org/~esr/writings/taoup/html/>
* écrire des documentations de qualité : <http://jacobian.org/writing/great-documentation/>
* Pour réussir, faut‐il être intelligent ou motivé ? : <http://www.slate.fr/story/61661/enfants-reussite-qi-intelligence-motivation>


### Graphisme, design & co

* The Responsive Designer : <http://simonfosterdesign.com/blog/web-design/the-responsive-designer/>
* HUGEpic : <http://www.peterbe.com/plog/introducing-hugepic.io>
* Les paysages géométriques de JR Schmidt : <http://www.webdesignertrends.com/2012/11/les-paysages-geometriques-de-jr-schmidt/>
