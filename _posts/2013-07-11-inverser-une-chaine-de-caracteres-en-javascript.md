---
layout: post
tags: [code, javascript]
title: "Inverser une chaine de caractères en javascript"
author: Yves
email: yves@brissaud.name
twitter: _crev_
published: true
image: 2013/07/11/javascript.png
---

> Écrivez un programme qui renverse une chaîne de caractères.

Il parait que c'est une question assez _classique_ lors d'entretiens java. Bon moi j'en ai jamais eu, la seule fois où on m'a fait passer un test je devais écrire un parseur XML en C# avec détection d'erreur. Résultat je l'ai fait à base d'expressions régulières `;-)`.

Mais revenons à la question. Le principe est bien évidemment de réaliser la chose sans utiliser les fonctions classiquement disponible permettant déjà de renverser la chaîne, ce serait beaucoup trop facile.

J'ai vu pas mal de choses différentes, avec de la récursivité, de la dichotomie, etc. Pour ma part j'ai voulu m'amuser un peu en le réalisant en Javascript. Rien de bien magique, mais juste l'occasion de jouer un peu, et voici donc le résultat :

```javascript
function reverse(str) {
    var hazStr = !!str;
    if (!hazStr) {
        return str;
    }
    var l = str.length;
    var ll = Math.floor(l / 2);
    var i = 0;
    var j = l - 1;
    var res = str.split('');

    while(i < ll) {
        res[i] = String.fromCharCode(res[i].charCodeAt(0) + res[j].charCodeAt(0));
        res[j] = String.fromCharCode(res[i].charCodeAt(0) - res[j].charCodeAt(0));
        res[i] = String.fromCharCode(res[i].charCodeAt(0) - res[j].charCodeAt(0));
        i++;
        j--;
    }
    return res.join('');
}
```

Et vous, vous auriez écrit cela comment ?

