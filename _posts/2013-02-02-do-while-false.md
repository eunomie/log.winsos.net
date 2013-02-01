---
layout: post
tags: [code, cpp, javascript, java]
title: do {...} while(false)
author: Yves
email: yves.brissaud@gmail.com
twitter: _crev_
published: true
---

Ces derniers jours j'ai vu passé pas mal d'histoire de bon et mauvais code. Evidemment ça parle aussi de bon et mauvais développeurs mais pour le coup j'ai lu une citation qui m'a beaucoup intéressé :

> A bad programmer talks about bad programming.

Bon, ça, c'est fait !

Maintenant il est une chose qui est rarement faite lorsque certains disent d'un code qu'il est mauvais, contextualiser. Entre autre par rapport au langage. Quelque chose d'horrible dans un langage est tout à fait pertinent dans un autre.

Petit exemple d'une construction qui ferait bondir plus d'une personne :

```c++
do {
  if (bla bla) break;
  if (bla bla) break;

  ...

  plop = getBla();
  if (!plop) break;

  ...
  
  return kOK;
} while(false);

... // du code qui traite les erreurs, log, dump, etc
...

return kFAIL;
```

La question est : mais pourquoi utiliser un `while(false)` ? Comme ce n'est exécuté qu'une fois ça ne sert à rien ton truc !

Sauf que si, c'est intéressant. Pour ma part j'ai rencontré ce type de construction dans du code C++ Adobe, il y a en gros 7 ans. L'intérêt d'une telle construction est qu'elle permet d'utiliser l'instruction `break`. Ce faisant, il devient possible plus facilement de factoriser toute la gestion d'erreur en un endroit.

Naïvement sans cette construction on écrirait plutôt quelque chose du genre :

```c++
if (bla bla) {
  ... // du code qui traite les erreurs, log, dump, etc
  ...

  return kFAIL;
}

if (bla bla) {
  ... // du code qui traite les erreurs, log, dump, etc
  ...

  return kFAIL;
}

...

plop = getBla();
if (!plop) {
  ... // du code qui traite les erreurs, log, dump, etc
  ...

  return kFAIL;
}

return kOK;
```

Ben manque de pot je viens d'écrire trois fois le même code. C'est inutile, ça prend de la place, ça complexifie la lecture et augmente la maintenance avec tous les risques que ça prend. Par exemple si on veut rajouter une action dans le traitement d'erreur, il faudra le faire à chaque endroit au lieu d'un seul.

Je sais que ce genre de code ne se voit plus trop, et qu'on va dire d'utiliser les exceptions. Hum... oui mais non. Enfin, ça dépend.

Si vous êtes en java < 1.7, vous devez écrire quelque chose du genre :

```java
try {
  bla bla

  bla bla

  plop = getBla();

  ...

  return kOK;
} catch(BlaBlaException bbe) {
  ... // du code qui traire les erreurs, log, dump, etc
  ...

  return kFAIL;
} catch(BlaBlaException2 bbe) {
  ... // du code qui traire les erreurs, log, dump, etc
  ...

  return kFAIL;
} catch(GetBlaException gbe) {
  ... // du code qui traire les erreurs, log, dump, etc
  ...

  return kFAIL;
}
```

Il est vrai que ça a un avantage : on déporte tous les traitement d'erreur à la fin du bloc, c'est plus sympa. Mais la duplication est toujours là.

Par contre, si on est en java 1.7 :

```java
try {
  bla bla

  bla bla

  plop = getBla();

  ...

  return kOK;
} catch(BlaBlaException, BlaBlaException2, GetBlaException e) {
  ... // du code qui traire les erreurs, log, dump, etc
  ...

  return kFAIL;
}
```

Ça, j'aime bien !

Pour terminer dans les horreurs pour certains, javascript est plutôt pas mal dans son genre. L'un de ces problèmes, c'est la portée qui est au niveau des fonctions. Donc, pour avoir des variables locales là où on ne peut pas, on encapsule dans des fonctions. Le cas classique est celui de la fonction auto exécutée, à haut niveau (en général au niveau parent des scripts).

```javascript
(function() {
  // bla bla
})();
```

C'est plutôt simple à comprendre, on crée une fonction anonyme, on l'entoure de parenthèses, et on l'exécute. Si c'est assez bien admis en javascript aujourd'hui, allez écrire ça dans un autre langage sans vous faire taper dessus !

D'ailleurs, une variante :

```javascript
!function() {
  // bla bla
}()
```

J'avoue que j'en suis moins fan, je ne l'écris en général jamais comme ça, mais ça fonctionne aussi.

Donc, comme je disais, c'est assez courant. Par contre, ce qui l'est moins, qui serait une abération dans certains langages, c'est qu'on peut faire pareil à plein d'endroits.

```javascript
addListener: (function() {
  if (document.addEventListener) {
    return function() {
      // bla bla
    }
  } else if (...) {
    return function() {
      // bla bla
    }
  } ...
})(),

value: (function() {
  var res = 0;
  for(var i = 0; i < MYVAR; i++) {
    // compute
  }
  return res;
})
```

Horrible, non ? Pourtant c'est classique et plutôt bien admis en javascript.

Tout ça pour dire, au final, que parler de code pourris c'est bien, c'est amusant, mais c'est très souvent genre _"moi je sais bien coder, je fais du code propre, regarde le code de looser que j'ai trouvé !"_. Au contraire, il faudrait surtout parler des codes propres, expliciter certaines constructions qui peuvent choquer au premier abord mais qui ont un intérêt réel dans certains cas.