---
layout: post
tags: [dev, code, humeur]
title: To comment or not to comment. That is the question.
author: Yves
email: yves@brissaud.name
twitter: _crev_
published: true
image: 2013/04/23/brave.png
---

Hier, j'ai participé à une discussion fort intéressante, vis à vis de la nécessité, ou non, de commenter son code. Certains étaient _contre_, d'autres non.

Voici pourquoi moi je suis pour le fait de commenter, et absolument contre la version courante, mauvais dérivé d'[XP][] et des méthodes agiles qui voudrait faire croire que _le code est la documentation_, justification au fait de ne pas commenter.

![be brave](brave.png)

Tout a commencé par la lecture de [cette présentation][sqlite] faite par l'auteur de SQLite, dans laquelle il parle de son code, de comment il le teste, l'écrit, le commente. Bien que datant de 2009, cette présentation est toujours d'actualité et je ne saurais vous conseiller de la regarder. Mais venons en au fait.

Dans cette présentation, il indique que notre cerveau peut être divisé en deux côtés (bon ok, c'est grossier, mais ça fait le job) :

* un côté plutôt orienté math
* un côté plutôt orienté langage

Et il estime qu'on pourrait décrire, si on parle de programmation, les deux côtés ainsi :

* un côté plutôt orienté code
* un côté plutôt orienté commentaires

Et il y voit une justification au fait de commenter son code :

> ## Why put comments in code ?
> 
> 1. Make the code easier to read
> 2. Engage the linguistic side of your brain

Et il continue avec le classique « les commentaires ça sert à rien » :

> ## Well written code needs no comments
> 
> * Ignore reason (2) for writting comments
> * No code is ever that well written

Évidemment, dès que j'ai commencé à rapporter ces propos, cette réaction est tout de suite apparue. Mais je pense, réellement, que c'est se tromper. Et que cette présentation à raison.

D'ailleurs, avant d'aller plus loin sur les commentaires, je voudrais vous montrer une petite présentation elle aussi très intéressante. Il s'agit d'une présentation de Laurent Bossavit de l'Institut Agile : [_« Making sense of Agile design practices »_][sense]. J'ai d'ailleurs eu la chance d'en voir une version (je crois un peu plus rapide) lors d'un MixIT il y a deux ans. Quoi qu'il en soit, cette présentation s'intéresse aux "bugs" de notre cerveau et montre, comment des pratiques telles que le TDD, le pair programming, nous aident à combattre ses bugs, du type _biais de confirmation_, _effet Dunning-Kruger_, etc.

Vous ne croyez pas qu'il existe des bugs dans le cerveau ? Dans ce cas, allez voir [cette video][vid]. Nan mais vraiment, allez la voir avant de continuer à lire.

Alors, vous l'avez regardée ? Pas mal, non ? Je trouve finalement que ça illustre assez bien le côté cerveau, et aussi évidemment le problème des commentaires.

Bon, évidemment, on ne dit pas qu'il faut commenter tout est n'importe quoi. Les choses triviales ne sont pas à commenter. Ce qui est purement du ressort du langage ne l'est pas non plus. Mais plus important que tout, il faut commenter **l'intention**. Non pas ce que fait le code mais pourquoi il le fait. Car, parfois, souvent, l'intention ne peut pas être devinée à partir du code.

Voici un exemple. Il n'est probablement pas parfait, mais ça devrait illustrer suffisamment le principe.

Prenez ce code, et expliquez-moi ce qu'il fait. Vous noterez que j'ai même laissé le commentaire d'entête pour aider.

```javascript
/**
 * The default implementation of the import function.
 * Writes a script tag to
 * import the script.
 *
 * @param {string} src The script source.
 * @return {boolean} True if the script was imported, false
 * otherwise.
 * @private
 */
goog.writeScriptTag_ = function(src) {
  if (goog.inHtmlDocument_()) {
    var doc = goog.global.document;

    if (doc.readyState == 'complete') {
      var isDeps = /\bdeps.js$/.test(src);
      if (isDeps) {
        return false;
      } else {
        throw Error('Cannot write "' + src + '" after document load');
      }
    }

    doc.write(
        '<script type="text/javascript" src="' + src + '"></' + 'script>');
    return true;
  } else {
    return false;
  }
};
```

Petites aides : c'est un code tiré de Google Closure Library, un framework javascript. `inHtmlDocument_` va retourner vrai si on est dans un document html (au contraire d'une appli node.js par exemple). `goog.global.document` va alors contenir `window.document`.

Et donc, il sert à quoi ce code ?

Ok, il charge un script, dont l'url est passée en paramètre. Si on est dans une page html. Mais pourquoi si `doc.readyState` n'est pas `complete` ? Et pourquoi dans un cas on retourne `false` et dans l'autre on sort une erreur ?

Comme ça c'est pas évident à trouver, non ?

Maintenant, voyons la version commentée :

```javascript
/**
 * The default implementation of the import function.
 * Writes a script tag to
 * import the script.
 *
 * @param {string} src The script source.
 * @return {boolean} True if the script was imported,
 *   false otherwise.
 * @private
 */
goog.writeScriptTag_ = function(src) {
  if (goog.inHtmlDocument_()) {
    var doc = goog.global.document;

    // If the user tries to require a new symbol after document
    // load, something has gone terribly wrong. Doing a
    // document.write would wipe out the page.
    if (doc.readyState == 'complete') {
      // Certain test frameworks load base.js multiple times,
      // which tries to write deps.js each time. If that happens,
      // just fail silently. These frameworks wipe the page
      // between each load of base.js, so this is OK.
      var isDeps = /\bdeps.js$/.test(src);
      if (isDeps) {
        return false;
      } else {
        throw Error('Cannot write "' + src + '" after document load');
      }
    }

    doc.write(
        '<script type="text/javascript" src="' + src + '"></' + 'script>');
    return true;
  } else {
    return false;
  }
};
```

Bon alors, tout d'un coup c'est plus facile, non ? Et pourtant, le code était quand même clair pour n'importe qui connaissant le javascript. Mais rien n'indiquait réellement **pourquoi** on testait, et ce qu'on en faisait.

Alors, toujours convaincu par le fait que commenter ça ne sert à rien ? Commenter (et je ne parle pas des API) c'est nécessaire. Car le code ne reflète pas nécessairement l'intention. On peut tous comprendre un code, plus ou moins rapidement. Mais comprendre quel était le but est parfois beaucoup, beaucoup plus compliqué sans commentaires. Alors oui, les développeurs n'aiment pas les commentaires. Ils n'aiment pas les écrire, les maintenir. Mais tant pis. Et ne nous planquons pas derrière de fausses excuses pour ne pas commenter, car cela est nécessaire.

Et vous, vous en pensez quoi des commentaires ? Il faut commenter ? Ne pas commenter ? Quoi commenter ? (en attendant les commentaires sur ce blog, allez-y par twitter/g+/github ;-)


[XP]: http://fr.wikipedia.org/wiki/Extreme_programming
[sqlite]: http://www.sqlite.org/talks/wroclaw-20090310.pdf
[sense]: http://blog.institut-agile.fr/2010/11/reykjavik-prezi-conception-agile.html
[vid]: http://www.youtube.com/watch?v=ubNF9QNEQLA
