---
layout: post
tags: [dev, misc]
title: "Tip : un éditeur de texte dans votre navigateur"
author: Yves
email: yves@brissaud.name
twitter: _crev_
published: true
image: 2013/04/16/text-editor.png
---

Comme toute personne normale, vous passez presque tout votre temps dans votre navigateur.

Comment ?

Non ?

Ha mince… Bon ben c'est pas grave, ça peut quand même vous intéresser :)

Peut-être vous est-il déjà arrivé de vouloir prendre quelques notes, rapidement, alors que vous êtes en train de naviguer^W travailler. Et là, c'est le drame. Lancer Word ? N'y pensez pas. Notepad ? beurk. Autre chose ? Finalement, rien que le temps de penser à tout ça est une horreur, un supplice, un calvaire !

![Text editor](text-editor.png)

Heureusement, j'ai une solution pour vous !

Entrez simplement dans la zone de saisie d'URL le contenu suivant :

```text
data:text/html, <html contenteditable>
```

Et voilà ! Vous avez devant vous une page blanche, qui ne demande qu'à recevoir vos précieux caractères !
Ensuite, vous pouvez enregistrer le tout dans un fichier.

Bon, évidemment vous n'allez pas taper ceci à chaque fois -> Hop, un signet que vous placerez dans la barre des marques-pages visibles, parfait, accessible, facile.

Ha oui, comment ça marche ? Ben tout simplement : on dit au navigateur que le contenu suivant est de l'html. Et on ouvre simplement une balise en mode édition. Facile, non ?

Mais si on veut on peut aller un tout petit peu plus loin. C'est d'ailleurs avec cet outil que j'écris cet article.

Cette fois-ci, entrez :

```text
data:text/html, <html><head><body><script src="http://goo.gl/kqA8j"><script>
```

Un tout petit peu plus complexe. Vous allez vous retrouver avec deux panneaux. Celui de gauche — fond blanc — est éditable. C'est votre zone de saisie. Celui de droite — fond gris clair — est un aperçu de ce que vous entrez.

> Un aperçu ? Pourquoi faire ?

Tout simplement parce que ce que vous entrez à gauche est interprété comme du [markdown][] `:-)`

Ok, ça mériterait une feuille de style correcte, mais pour saisir rapidement du markdown, avec une prévisualisation en temps réel, c'est juste nikel !

Voilà, c'est tout. Tout simple, mais toujours à portée de main. La première version a en plus l'intérêt d'être totalement utilisable hors connexion. La deuxième vous permet de préparer votre markdown n'importe où, sans avoir besoin d'un éditeur spécial, ni de vous arranger pour avoir de la prévisualisation quelque part. Et en plus les deux sont ultra rapides.
