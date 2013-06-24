---
layout: post
tags: [code, ada]
title: "Ada, langage et ressources"
author: Yves
email: yves@brissaud.name
twitter: _crev_
published: true
image: 2013/06/24/ladyada.gif
---

Récemment j'ai commencé à regarder un peu le langage [Ada][ada]. C'est un langage que je trouve vraiment intéressant, à plusieurs titres.

Bon, un point négatif pour commencer : la syntaxe. C'est vrai que j'ai plus été habitué aux syntaxes type `c`, `c++`, `c#`, `java`, `javascript` que `pascal` ou `basic` par exemple, même si je fais du `ruby`. Au premier abord on peut trouver la syntaxe un peu lourde, le respect des majuscules, etc. Mais utiliser le mod ada pour emacs vous aidera mine de rien, entre autre en gérant tout seul comme un grand les majuscules des variables ! Et ça c'est juste génial !

Ensuite, le principe même du langage, son sytème de type essentiellement, est vraiment intéressant. Je ne vais pas vous le détailler, il y a pas mal de ressources sur le sujet (et c'est aussi une question au travers de ce billet) mais juste prendre un exemple.

Lorsque vous voulez travailler avec des heures dans un langage quelconque, vous allez utiliser en général un entier. Ok, ça marche, pourquoi pas. Le problème initial est qu'il est possible de mélanger des choux et des carottes. Par exemple, vous pouvez affecter la variable heure avec une valeur d'incrément d'une boucle. Ben oui, pourquoi pas puisque c'est un entier aussi ? (oui ce n'est pas souhaitable, mais les bugs existent souvent parce que des choses non souhaitables arrivent)

Bon, on peut faire mieux, en déclarant une nouvelle classe heure par exemple. Cette classe va stocker la valeur dans un entier et ça va quand même améliorer les choses puisqu'on ne pourra plus faire `monheure = i;` aussi facilement. Mais ça ne suffit pas. Comment gérer la plage de valeurs ? Il va falloir rajouter de tests un peu partout pour gérer les cas, les limites, l'égalité, etc.

Au final vous risquez de vous retrouver avec quelque chose du genre (oui c'est grossier, et en plus vous perdez, en java, les opérateurs `+` et `-`) :

```java
public class Hour {
    private Integer value = 0;

    public Integer getInt() {
        return value;
    }

    public void fromInt(Integer hour) {
        value = hour % 24;
    }

    public void incr() {
        fromInt(value + 1);
    }

    public void decr() {
        fromInt(value - 1);
    }

    // [...]
}
```

Supaïr, non ?

Ha oui, pourquoi faire ça ? Ben juste pour écrire des logiciels un peu plus _sûr_, avec moins de possibilité de bugs, d'effets de bords, etc. Vous croyez pas que ce serait un peu mieux non ?

Bon ok, mais comment qu'on fait en Ada alors ?

Ben c'est plutôt facile :

```ada
type Hour is mod 24;
```

Alors, elle est pas belle la vie ?

De la même manière, on peut facilement faire des intervales genre

```ada
type Day_Of_Year is range 1..366;
```

Bon tout ça pour dire que Ada m'intéresse de plus en plus. Il est peut-être moins _fun_ que certains langages, mais je pense que la satisfaction de bien faire les choses l'emportera sans aucun doute ! Finalement ça donne un peu l'impression que Ada demande à ce qu'on réfléchisse avant de coder, alors que de plus en plus dans les autres langages on voit beaucoup de monde coder puis réfléchir lorsque cela ne fonctionne pas. Mais surtout, ces systèmes sont intégrés aux langage et ne nécessitent pas de lib externe supplémentaire (comme par exemple pour faire de la programamtion par contrat).

Maintenant, à vous de travailler un peu : connaissez-vous, avez-vous des ressources intéressantes concernant Ada ?

Voici ce que j'ai pour le moment :

* [Cours sur Ada en MIAGE](http://www.lifl.fr/~touzet/ADA/)
* [Cours Ada à l'IUT d'Aix-En-Provence](http://libre.adacore.com/tools/more-resources/ada-course-in-french/)
* [Une introduction lors du fosdem 2013](http://people.cs.kuleuven.be/~dirk.craeynest/ada-belgium/events/13/130203-fosdem/01-ada-intro.pdf)
* [Présentation des fonctionnalités ada2012 au fosdem 2013](http://people.cs.kuleuven.be/~dirk.craeynest/ada-belgium/events/13/130203-fosdem/05-ada-2012-features.pdf)

En avez-vous d'autres ? Ou des livres par exemple ?

Si vous voulez, vous pouvez me répondre par twitter ou, mieux, sur [g+](https://plus.google.com/u/0/112813954986166280487/posts/Sh1gFiqrX84).


[ada]: https://fr.wikipedia.org/wiki/Ada_(langage)

