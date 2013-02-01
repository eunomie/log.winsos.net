---
layout: post
tags : [agile, dev]
title: Pourquoi la qualité n'est pas négociable
author: Yves
email: yves.brissaud@gmail.com
twitter: _crev_
---

Je voudrais vous faire part d'un point qui me trotte dans la tête en ce moment.

Avant tout, comme vous le savez il n'y a pas de commentaires sur ce site, donc si vous voulez me donner votre avis, et je trouverais ça intéressant, le plus simple reste encore de passer, ou au moins pinger, par twitter ou g+ par exemple.

Le sujet n'est pas simple. Il s'agit de la qualité. Evidemment je parle de développement logiciel, il y a donc deux types de qualité :

* qualité interne
* qualité externe

Voici, pour commencer, un extrait de [_Scrum et XP depuis les tranchées_](http://www.crisp.se/bocker-och-produkter/scrum-and-xp-from-the-trenches) que vous pouvez [trouver ici](http://www.infoq.com/minibooks/scrum-xp-from-the-trenches) en version originale ou en français.

Voici le passage qui m'intéresse plus précisément :

> ### Pourquoi la qualité n'est pas négociable
>
> * La _qualité externe_ est ce qui est perçu par les utilisateurs du système. Une interface utilisateur lente et pas intuitive est un exemple de mauvaise qualité externe.
> 
> * La qualité interne fait référence à des points qui habituellement ne sont pas visibles par l'utilisateur, mais qui ont un profond effet sur la maintenabilité du système. Des choses comme la cohérence de la conception, la couverture de test, la lisibilité du code, les remaniements ( _refactoring_ ).
> 
> En général, un système avec une qualité interne élevée peut tout de même avoir une qualité externe faible. Mais un système avec une faible qualité interne aura rarement une qualité externe élevée. Il est difficile de bâtir quelque chose de bien sur des fondations pourries.
> 
> Je traite la qualité externe comme faisant partie de la portée. Dans certains cas il peut y avoir d'excellentes raisons pour livrer une version du système qui aurait une interface utilisateur lente et peu élégante, et livrer ensuite une version nettoyée plus tard. Je laisse ce compromis au directeur de produit, puisqu'il est responsable de définir la portée.
> 
> Toutefois la qualité interne n'est pas sujette à discussion. C'est la responsabilité de l'équipe de maintenir la qualité du système dans toutes les circonstances et ceci est simplement non négociable. Jamais.
> 
> (Eh bien, OK, _presque_ jamais)
> 
> Alors comment faisons-nous la différence entre les problèmes de qualité interne et ceux de qualité externe ?
> 
> Considérons que le directeur de produit dise : « OK les gars, je respecte votre estimation de temps de 6 points d'histoire, mais je suis certain que vous pouvez faire quelque chose de rapide pour ça en moitié moins de temps pour peu que vous y réfléchissiez. »
> 
> Aha ! Il est en train d'essayer d'utiliser la qualité interne comme variable. Comment je le sais ? Parce qu'il veut que nous réduisions l'estimation de l'histoire sans « payer le prix » de réduire la portée. Les mots « quelque chose de rapide » devraient déclencher une alarme dans votre tête...
> 
> Et pourquoi est-ce que nous n'autorisons pas ça ?
> 
> Mon expérience est que sacrifier la qualité interne est presque toujours une très très mauvaise idée. Le temps économisé est largement dépassé par le coût à court et à long terme. Une fois qu'une base de code est autorisée à commencer à se détériorer, il est très difficile d'y remettre de la qualité plus tard.
> 
> A la place, j'essaie de faire avancer la discussion vers la portée. « Puisqu'il est important pour vous d'avoir cette fonctionnalité rapidement, pouvons-nous réduire sa portée pour qu'elle soit plus rapide à implémenter ? Peut-être que nous pourrions simplifier la gestion d'erreur et avoir 'Gestion d'erreur avancée' comme histoire utilisateur séparée à conserver pour plus tard ? Ou bien pouvons-nous réduire la priorité des autres histoires pour pouvoir nous focaliser sur celle-ci ? »
> 
> Une fois que le directeur de produit a appris que la qualité interne n'était pas négociable, il devient normalement assez bon à manipuler les autres variables à la place.


Que pensez-vous de ce passage ? La qualité interne est-elle pour vous négociable ou non ? (tout en laissant les exceptions et cas particuliers de côté hein...)

Si elle est négociable, jusqu'à quel point ?

En fait, c'est même pas tout à fait ça mon problème, mon questionnement. Récemment j'ai entendu un discours exactement contraire, indiquant que seule la qualité externe, la qualité ressentie comptais. Et finalement même si cela doit impacter la qualité interne, la qualité des développements. Si je comprend l'intérêt, encore que, côté business, j'ai en réalité un sérieux problème avec ça. En gros cela voudrait dire qu'on peut sacrifier la maintenabilité, la robustesse, la propreté des développements du moment que ça _semble_ extérieurement de qualité (et je ne parle pas d'un contexte SSII...).

Honnêtement je ne suis pas vraiment d'accord avec cette vision, beaucoup plus avec le passage cité plus haut. N'est-ce pas d'ailleurs juste une bonne solution pour créer, augmenter, aggraver une [dette technique](http://fr.wikipedia.org/wiki/Dette_technique) ?

Si on prend l'article wikipedia, il est indiqué qu'il y a deux types de dette, intentionnelle ou non. Lorsqu'elle n'est pas intentionnelle elle est mauvaise car on ne peut rien en retirer de valable, c'est le cas lorsque qu'on constate des malfaçons, non respect des règles, etc.

Et il y a aussi la dette _intentionnelle_. Celle là apparaît lorsque justement on sacrifie la qualité interne dans le but de respecter un objectif à court terme, typiquement une livraison. Evidemment cette dette devrait être mesurée (dans le sens ne pas être trop importante) et devrait être remboursée dès l'objectif obtenu (dès la livraison par exemple).

Bon, c'est un point qui se discute. Je trouve personnellement dangereux la dette intentionnelle car deux choses deviennent trop simple ensuite :

* continuer à sacrifier intentionnellement à chaque fois
* ne jamais rembourser la dette

Maintenant, que faire lorsqu'on demande sciemment d'augmenter intentionnellement une dette actuelle voir même de ne pas corriger une dette existante. Jusqu'à quel point peut-on accumuler intentionnellement de la dette ? N'est-ce pas hypothéquer 

Ha oui, je sais que certains vont justement me parler de [done is better than perfect](http://blog.eerlings.com/index.php/2012/12/30/done-is-better-than-perfect/). Je préfère d'ailleurs la version de [37 signals](http://37signals.com/) :

![Good enough is fine](http://farm5.staticflickr.com/4053/4419053858_3caf782027_d.jpg)

En effet, chercher la perfection est souvent une mauvaise chose. Trop coûteuse, beaucoup trop, pour un gain très complexe à chiffrer, et qui n'est pas assuré. Par contre, il y a un sérieux écart (un _chasm_ pour reprendre une expression entendue récemment) entre vouloir la prefection et juste vouloir bien faire les choses. Car je ne parle pas de sacrifier un peu de qualité interne, mais de dire que seule la qualité externe compte.

Je ne sais pas vraiment comment finir cet article alors je vais simplement le laisser en suspend, c'est aussi bien. Je pense que vous aurez tout de même compris grossièrement ce que j'en pensais. N'hésitez pas à réagir sur cette problématique si vous le souhaitez.

Allez si, juste pour finir, je remet une partie déjà citée plus haut :

> C'est la responsabilité de l'équipe de maintenir la qualité du système dans toutes les circonstances
