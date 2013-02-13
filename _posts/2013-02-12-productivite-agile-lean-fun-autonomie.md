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

De mon point de vue il y a vraiment eu un gain. Que ce soit finalement en terme de visibilité (alors que les partisants des méthodes traditionnelles le reproche justement) et en terme d'adaptation au changement.

## Et donc, il est où le problème ?

Des problèmes, en fait, il y en a pas mal.

Ok les méthodes agiles c'est mieux, scrum c'est pas mal du tout. Enfin... j'en sais rien au final.

Scrum était vraiment la méthode à la mode il y a tout juste quelques années. J'en ai entendu parlé depuis longtemps. Sur la papier c'est parfait. En vrai, il y a un point qui n'est pas si évident, mais qui à mon avis explique tout de même son adoption : c'est une méthode agile très structurée. Il y a tout un rituel, des réunions, des rôles, des règles. Pour les personnes venant de méthodes plus traditionnelles ça rassure, c'est plus sécurisant.

Sauf que c'est rarement possible de l'appliquer de la sorte. Alors finalement on part de scrum et on adapte. On enlève des choses, on en rajoute, on en modifie certaines. Côté scrum ça a un nom : [scrumbut][]. Voici un exemple :

> (We use Scrum, but) (having a Daily Scrum every day is too much overhead,) (so we only have one per week.)

Honnêtement je ne vois pas vraiment comment on peut appliquer _exactement_ scrum. Et surtout, quel en serait réellement l'intérêt ?

Bon ok, donc on fait du scrum, ou plutôt une méthode dérivée. On s'attache à suivre les principes agile. Sauf que, au final, c'est pas serein. En général, si les équipes de dev sont bien au fait de tout cela, c'est moins le cas pour les autres intervenants (management, direction, etc). Et sans leur implication, ben ça ne marche finaelemnt pas beaucoup mieux qu'avant. Il y a une amélioration intrinsèque au développement mais c'est tout.


## Et alors, on fait comment ?

Le résultat c'est que, au final, je suis parfois mitigé sur les méthodes agiles. Ok, on pourrait aussi parler de kanban par exemple. On passe alors à une organisation en flux, je trouve le concept plus intéressant et réaliste. Mais en général cela ne plait pas trop au mangement/direction car la visibilité est différente de ce qu'ils connaissent.

Si on parle de kanban, il faut aussi parler de lean. Et je reviens donc sur le reportage que je regardais. Dans ce reportage on voyait comment dans une usine, ils faisaient la chasse au gaspillage, comment ils cherchaient à minimiser les encours, les pertes, et cherchaient à maximiser la productivité, le rendement.

Sur le papier c'est plutôt sympa. Qui peut être intéressé par les gaspillages ? Les supprimer est une bonne chose. Mais cela se fait au final d'une manière assez particulière, ou l'humain ne devient qu'un rouage, presque une composante maléable.

Items :

* Github
* satisfaction des employés
* Valve
* 37signals
* Motivation

## Suite ?

Comme vous les savez, ce blog n'a pour l'instant pas de commentaire. Je bosse tout de même dessus ne vous inquiétez pas. Quoi qu'il en soit, si vous souhaitez en discuter n'hésitez surtout pas, via twitter ou g+ par exemple. Je suis vraiment preneur de vos réactions sur le sujet.

[lean]: http://fr.wikipedia.org/wiki/Lean
[la rache]: http://www.risacher.com/la-rache/
[cycle en V]: http://fr.wikipedia.org/wiki/Cycle_en_V
[méthodes agiles]: http://fr.wikipedia.org/wiki/M%C3%A9thode_agile
[manifeste]: http://fr.wikipedia.org/wiki/Manifeste_agile
[scrum]: http://fr.wikipedia.org/wiki/Scrum_(m%C3%A9thode)
[kanban]: http://fr.wikipedia.org/wiki/Kanban
[scrumbut]: http://www.scrum.org/ScrumBut
