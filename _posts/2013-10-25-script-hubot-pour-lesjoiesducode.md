---
layout: post
tags: [hubot, nodejs, lesjoiesducode]
title: "Script hubot pour lesjoiesducode"
author: Yves
email: yves@brissaud.name
twitter: _crev_
published: true
image: 2013/10/25/hubot-scripts.jpg
---

Si vous êtes développeur — ou au moins comprenez leur humour — vous appréciez
forcément [Les joies du code][joies] ou la version en anglais,
[The coding love][code].

Et comme vous êtes un développeur qui aime bien utiliser de bons outils, vous
avez un système de discussion tel irc, [campfire][], [hip chat][] ou
[autre][hubot-adapters].

Et évidemment, vous adorez tout ce qui est tellement inutile que c'est
indispensable.

## Et alors ?

J'ai donc quelque chose qui est rien que pour vous et qui assurément fera votre
journée : un script (module [nodejs][]) pour [hubot][] qui va vous permettre
d'afficher dans votre système de chat les _meme_ des joies du code et de the
coding love !

Une fois la bonne commande entrée, [hubot][] vous répondra avec le gif animé
souhaité précédé du texte de description comme par exemple :

![Dernière les joies du code](lastlesjoiesducode.png)

## Comment qu'on fait ?

Simple, dans le fichier `package.json` de configuration de votre [hubot][],
ajoutez comme dépendance :

```json
"hubot-codinglove": "0.1.0"
```

Ajoutez l'entrée dans le fichier `external-scripts.json` (créez le s'il n'existe
pas)

    ["hubot-codinglove"]

Et déployez-le de nouveau !

Si vous voulez le tester en local, n'oubliez pas de faire un `npm install` avant.

## Dépendances

Le script dépend de [cheerio][] et de [ent][]. [Cheerio][cheerio] permet de très
facilement parser un document et récupérer les éléments souhaités (ça fait
beaucoup plus que ça mais c'est pour cette raison que je l'utilise). [ent][]
quant à lui permet de décoder toutes les _entités_ qu'on trouve dans un contenu
html afin de rendre le texte lisible.

## Usage

L'utilisation est assez basique, mais juste comme il faut.

### Les joies du code

* `robot donne moi de la joie bordel` vous affichera une joie prise au hasard

    Vous pouvez aussi utiliser `robot joie`.

* `robot dernière joie` vous affichera la dernière joie présente sur le site

    Vous pouvez aussi utiliser `robot derniere joie`.


### The coding love

* `robot give me some joy asshole` vous affichera une joie prise au hasard

    Vous pouvez aussi utiliser `robot joy`.

* `robot last joy` vous affichera la dernière joie présente sur le site

## Et le code justement

Mais que serait tout cela sans le dépôt-github-qui-va-bien ? Rien évidemment.
Vous trouverez donc le code [ici][codinglove]. Et histoire que ce soit encore plus
simple, vous le trouverez [forké][fork] dans l'organisation [hubot-scripts][].


[joies]: http://lesjoiesducode.tumblr.com "Les joies du code"
[code]: http://thecodinglove.com "The coding love"
[campfire]: http://campfirenow.com
[hip chat]: http://www.hipchat.com
[hubot-adapters]: https://github.com/eunomie/hubot/blob/master/docs/adapters.md
[nodejs]: http://nodejs.org
[hubot]: http://hubot.github.com
[cheerio]: https://github.com/MatthewMueller/cheerio
[ent]: https://github.com/substack/node-ent
[codinglove]: https://github.com/eunomie/hubot-codinglove "Dépôt github"
[fork]: https://github.com/hubot-scripts/hubot-codinglove "Fork"
[hubot-scripts]: https://github.com/hubot-scripts
