---
layout: post
tags: [web_log_today]
title: Un peu de validation ne fait pas de mal
author: Yves
email: yves@brissaud.name
twitter: _crev_
published: true
image: 2013/04/09/i-heart-validator.png
nolinks: true
---

Peut-être l'aviez-vous remarqué, mais mon dernier billet n'était malheureusement pas valide (ni le html ni le xml du flux atom). Fort heureusement un fidèle lecteur (salut frangin o/) me l'a fait remarquer. L'occasion de revenir sur deux-trois petites choses.

Mais avant tout, je crois que je vais bientôt voir si je peux forcer le passage par les validateurs du w3c ([html][1] et [feed][2]) automatiquement au _build_ afin de ne plus avoir, au minimum, de flux cassé si le lecteur fait les choses correctement. Surtout que ce n'est pas la première fois.

Donc, quels étaient les problèmes ?

## Atom

Déjà côté flux, plusieurs problèmes liés à l'insertion d'un tweet. Le code fournit par twitter possède deux problèmes :

```html
<blockquote class="twitter-tweet" data-conversation="none" lang="fr"><p>@<a href="https://twitter.com/_crev_">_crev_</a> là j'ai du déployer 10 fois depuis ce matin ! (maintenant que je peux sur tous les projets, je me fait plaisir :D)</p>&mdash; Anne-Sophie (@annso_) <a href="https://twitter.com/annso_/status/312218938673082370">14 mars 2013</a></blockquote>
<script async src="//platform.twitter.com/widgets.js" charset="utf-8"></script>
```

L'entitée `&mdash;` ne fait pas partie des entitées par défaut en XML. Il n'y a en réalité que :

* `lt`
* `gt`
* `amp`
* `apos`
* `quot`

Voir la [spécification](http://www.w3.org/TR/xml/#sec-predefined-ent). On peut rajouter les autres via l'inclusion de la DTD [xhtml-special.ent](http://www.w3.org/TR/xhtml1/dtds.html#a_dtd_Special_characters) ou alors simplement remplacer par `&#8212;`, ce qui a été fait.

Le deuxième problème est lié au script :

```html
<script async src=… />
```

Et oui, il manque la valeur de l'attribut `async`. Tous les attributs doivent être de la forme `name="value"` : [Attribute](http://www.w3.org/TR/xml/#NT-Attribute). Il convient donc d'y affecter une valeur, du type `async="async"` ou `async=""`.


## Html

Côté Html, quelques petits problèmes aussi.

Déjà côté `meta`, les `og:*` de [opengraph](http://ogp.me) doivent utiliser l'attribut `property` et non `name`. Le html doit également contenir le prefix `og: http://ogp.me/ns#`.

Bon, tout ceci n'est pas totalement valide, ce n'est qu'au stade des propositions. Mais c'est mieux que twitter, qui demande à utiliser `name` mais qui n'a pas demandé la déclaration des entités. Les meta twitter laisseront donc des erreurs lors de la validation.

Ensuite, côté billet, j'avais placé la liste des tags (une `ul`) dans une balise de titre `h4`. Ben oui mais pas le droit. J'ai donc remplacé le `h4` par un simple `div`.

Enfin, il manquait un échappement dans le pied de page.

Et voilà, normalement le flux atom devrait être correct, et l'html presque ok (avec les erreurs twitter).


[1]: http://validator.w3.org/
[2]: http://validator.w3.org/feed/
