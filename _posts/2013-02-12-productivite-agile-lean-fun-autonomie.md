---
layout: post
tags: [misc]
title: Productivité, agile, lean, fun, autonomie
author: Yves
email: yves.brissaud@gmail.com
twitter: _crev_
published: false
---

Au moment où je débute ce billet, il y a un reportage sur la 2 intitulé _"La mise à mort du travail"_. Entre autre ce reportage parle de la mise en oeuvre de _[lean][]_ dans les entreprises. Ca tombe plutôt bien, ça fait un moment que je me pose des questions sur les méthodes de travail, l'agile, le lean, etc.

## Méthodes ?

Avant, la seule méthode que je voyais dans divers emplois tenait plutôt du _"voici la date, débrouillez vous pour que ce soit terminé dans les temps"_. Oui, ça se rapproche pas mal de [la rache][].

Evidemment, ça ne fonctionne jamais, ou presque. Lorsqu'on se rend compte que ça ne fonctionne pas et que [la rache][] en vrai c'est nul, la première chose est souvent de structurer. En général on arrive alors, si jamais ça n'avait pas vraiment été le cas avant, à l'utilisation de [cycle en V][].

Si dans certains cas c'est pertinent, notamment dans l'industrie, en informatique je n'en suis franchement pas convaincu. D'ailleurs lorsque je dis dans l'industrie, c'est aujourd'hui de plus en plus faux. Initialement c'est une méthode qui se comprend. On spécifie, on prototype, on fabrique, on vérifie, etc. Et si on se plante à une étape montante du V, on retourne vers l'étape descendante correspondante. Pourquoi ça se comprend ? Tout simplement parce qu'on ne peut pas vraiment tester l'assemblage de plusieurs pièces entre elles sans avoir validé chaque pièce. Enfin, ça, c'était avant. Aujourd'hui les capacités de prototypage, de modélisation, de simulation sont telles qu'on peut faire de l'incrémental et de l'itératif dans l'industrie.

Evidemment dans l'informatique le problème initial n'existe pas. On peut faire fonctionner des parties de programmes sans attendre la totalité. Les tests unitaires et fonctionnels nous permettent de les tester. La simulation (mocks par exemple) est tellement facile et évidente qu'elle permet de ne pas attendre l'intégralité pour fonctionner. Le cycle en V est de mon point de vue plutôt absurde, lourd, inutile.

Ok, mais quoi alors ?

## Ha, Gilles !

Et pourquoi pas les [méthodes agiles][] ?

Sur le papier c'est plutôt sympa. Le [manifeste][] est plus qu'intéressant. Ces méthodes ont pour but de réellement renverser le principe de cycle en V afin d'avoir un fonctionnement agréable, fluide, efficace et adapté aux métiers de développement informatique.

L'une des méthodes les plus en vogue actuellement est [scrum][]. On en trouve parfois d'autres, mais c'est assez rare. Le challenger est pour le moment [kanban][], plus proche du [lean][], mais il y a il me semble un effet de mode derrière ça - attention, ça ne change rien aux qualités de la méthode.

## Apparté

Avant d'aller plus loin, un petit apparté plus perso mais ça permet de situer un peu le contexte de la réflexion.

Lors d'un de mes précédents emplois, il s'est passé la chose suivante. Nous avions développés une nouvelle version majeur de notre logiciel. La méthode était un mélange de pas grand chose et de [cycle en V][]. Et le logiciel est sorti très en retard. Vraiment. Les évolutions elles aussi ont eu beaucoup de mal à sortir. Plein de raisons pour cela, mais entre autre des problèmes de méthodes.

Un peu plus tard, il a été question de développer une nouvelle version majeure. Une estimation grossière (qui a pourtant pris de trop nombreuses heures, mais faut dire que je ne crois pas en une vrai capacité d'estimation à cette échelle) a indiqué qu'il nous fallait de l'ordre de 18 mois à environ 7 personnes à temps plein (de mémoire) pour y venir à bout.

Et là, pas évident. Dans ma tête ça à surtout fait :

> Même pas en rêve mon gars.

Franchement, on n'arrivait pas à tenir des délais sur des projets plus petit, sur un tel projet avec une visibilité _complexe_ je ne voyais pas comment ça pouvait tenir.

J'ai donc poussé pour qu'on utilise des méthodes agiles. Ce fut fait, nous sommes donc passés à [scrum][], en ajustant divers paramètres. De mon côté j'avais en gros un rôle de développeur, _scrum master_ et référent produit (le _product owner_ était un commité de cinq personnes dont j'en étais le référent).

[lean]: http://fr.wikipedia.org/wiki/Lean
[la rache]: http://www.risacher.com/la-rache/
[cycle en V]: http://fr.wikipedia.org/wiki/Cycle_en_V
[méthodes agiles]: http://fr.wikipedia.org/wiki/M%C3%A9thode_agile
[manifeste]: http://fr.wikipedia.org/wiki/Manifeste_agile
[scrum]: http://fr.wikipedia.org/wiki/Scrum_(m%C3%A9thode)
[kanban]: http://fr.wikipedia.org/wiki/Kanban
