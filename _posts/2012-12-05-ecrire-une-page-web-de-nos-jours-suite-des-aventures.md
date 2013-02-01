---
layout: post
tags : [dev, misc, linuxfr]
title: Ecrire une page web de nos jours, suite des aventures
author: Yves
email: yves.brissaud@gmail.com
twitter: _crev_
---

Il faut croire que l'[épisode précédent][1] vous a intéressé (mon petit doigt me dit qu'il est même passé sur un [incubateur d'excellence][3] aux dires des [mytiloïdes][4] qui s'y trouvent). Voici donc la suite tant attendue.

> Comment ça une suite ?

Ben vous croyez quoi ?! On fait de la page oueb monsieur ! C'est un sujet sérieux ! Pas question de s'arrêter avec juste un peu de [Haml][haml], [Sass][sass], [Ruby][ruby], [Rake][rake] et [git][git]. Cela suffirait à des [développeurs inexpérimentés][5], pas pour des [vrais bons comme nous][6] !

[haml]: http://haml.info/
[sass]: http://sass-lang.com/
[ruby]: http://www.ruby-lang.org/fr/
[rake]: http://rake.rubyforge.org/
[git]: http://git-scm.com/
[1]: http://www.winsos.net/~yves/index.php?post/2012/12/03/Ecrire-une-page-web-de-nos-jours
[3]: http://linuxfr.org/board
[4]: http://fr.wikipedia.org/wiki/Mytiloida
[5]: http://www.php.net
[6]: http://www.ruby-lang.org/fr

# Introduction

> Et il va nous sortir quoi de son chapeau ce bon monsieur ? Le problème il était de faire une page internet^W oueb statique hein !

Que des choses indispensables pour briller en société ! En l'occurence l'utilisation de [bundler][] et [guard][] et, histoire d'aller un peu plus loin, un peu de [coffeescript][] parce qu'on le mérite bien.

# Bendleure

Comme vous avez pu le remarquer, la génération de votre page [html][] nécessitait l'utilisation de plusieurs [gem][] [ruby][] en l'occurrence :

* [haml][]
* [sass][]

Il était donc nécessaire de réaliser deux actions manuelles pour les installer. Mais les commandes c'est surfait, tout le monde le sait !

Heureusement [bundler][] est là pour nous ! Tout d'abord, étant donné que c'est également une [gem][], il faut l'installer :

```bash
gem install bundler
```

Ha oui, je vous vois venir !

> Oué mais l'autre il nous dit qu'on va supprimer l'installation manuelle des [gem][] et il ne trouve rien de mieux à faire que d'installer une nouvelle [gem][] !

Et là de répondre :

> C'est pas faux

D'ailleurs, vous allez même créer un nouveau fichier, `Gemfile` qui contiendra le code suivant :

```ruby
source 'https://rubygems.org'

gem 'haml'
gem 'sass'
```

Vous pouvez désormais installer ces deux [gem][] via la commande :

```bash
bundle
```

C'est 'achement plus facile, non ?

Cette commande va vous installer les deux [gem][] si vous ne les aviez pas déjà et va créer un fichier `Gemfile.lock` qui contient les installations réalisées et leur version. Si un tel fichier n'existe pas, [bundler][] va essayer de récupérer la dernière version des [gem][]. Si un fichier lock existe déjà, il va essayer d'installer la version spécifiée dans le fichier. L'avantage est que si vous partagez ce fichier entre vos différents environnements (par exemple en le versionnant dans votre [git][]) il vous assure d'avoir les mêmes dépendances partout. Et ça [c'est bien][dep_hell] !

Développer votre page statique est donc d'autant plus aisée qu'il vous suffit de faire un clone de votre [git][] et d'exécuter [bundler][] (de toute façon, qui n'a pas [bundler][] sur sa machine aujourd'hui ?).


# Moins j'en fait, mieux je me porte !

Etant donné que vous êtes une vrai [feignasse][], vous n'avez surtout pas envie de devoir relancer [rake][] à chaque modification réalisée (car le temps gagné pourra être passé à mouler^W faire sa [veille technologique][]).

La première chose est donc d'ajouter [guard][] a votre `Gemfile` (vous voyez que finalement ça sert à quelque chose [bundler][]) et l'installer via `bundle`.

```ruby
gem 'guard'
```

La deuxième chose est d'initialiser [guard][]. Une bonne pratique est de toujours utiliser [bundler][] pour exécuter [guard][]. Vous n'allez donc pas exécuter `guard init` mais

```bash
bundle exec guard init
```

Ceci va vous créer un fichier `Guardfile` qui va bien (mais qui ne fait rien).

Je vous conseil d'aller voir la documentation de [guard][] car un certain nombre d'usages classiques sont déjà supportés et leur mise en oeuvre est vraiment simple.
Dans notre cas, on utilise [rake][] pour construire notre page statique. Tout naturellement nous allons donc nous tourner vers le plugin [guard-rake][].

Dans le `Gemfile` rajouter

```ruby
gem 'guard-rake'
```

et exécuter `bundle`.

Ensuite, initialiser le `Guardfile` avec [guard-rake][] :

```bash
bundle exec guard init rake
```

Vous devez donc avoir un fichier `Guardfile` qui contient

```ruby
guard 'rake', :task => 'build' do
  watch(%r{^my_file.rb})
end
```

J'espère que vous avez déjà compris ce que ça voulait dire : lorsque le/les fichiers surveillés par `watch` seront modifiés, [rake][] sera executé avec la cible `build`. Parfais, c'est exactement ce qu'on cherche à faire !

Il ne reste donc plus qu'à modifier un peu le `watch` pour que ça corresponde à notre cas :

```ruby
guard 'rake', :task => 'build' do
  watch %r{^index.haml$}
  watch %r{^css/(.+)\.sass$}
end
```

De cette manière, dès que `index.haml` ou l'un des fichiers [sass][] va être modifié, [rake][] va être exécuté.

Faisons un petit test. Tout d'abord il convient de lancer [guard][] :

```bash
bundle exec guard
```

Et voilà !
A chaque fois que vous modifierez un des fichiers surveillés, la sortie sera regénérée ! Le gain en terme de confort est loin d'être négligeable, c'est vraiment un plus pour développer correctement une page oueb statique !


# L'inter a ctivité

Comme on est pas des [mickeys][] on va faire les choses en grand : on va rajouter un peu d'interactivité et de fun dans cette page tristounette !

Pour ce faire, on va rajouter un peu de code côté client. Mais bon, tout le monde le sait, le javascript c'est has been. On va donc le faire en [coffeescript][] !

Tout d'abord, créer un répertoire `js` (oui, js, pas coffee) et dedans un fichier `mickey.coffee`.

Dans ce fichier, écrire le contenu suivant :

```coffeescript
init = ->
  img = document.createElement 'img'
  img.src = "data:image/png;base64,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"
  img.style.position = 'absolute'
  img.style.top = '-1000px'
  img.style.left = '-1000px'
  document.body.appendChild img

  window.onmousemove = (e) ->
    img.style.left = "#{e.clientX + 10}px"
    img.style.top  = "#{e.clientY + 10}px"

init()
```

Bon, c'est bien joli mais comment on l'intègre ?

Déjà, on va rajouter la [gem][] qui va bien à bundler :

```ruby
gem 'coffee-script'
```

Puis l'installer :

```bash
bundle
```

Ensuite, il faut compiler le tout en javascript. Dans le fichier `Rakefile` ajouter en tête

```ruby
require 'coffee-script'
```

Et ajouter à la tâche `:build` :

```ruby
js = CoffeeScript.compile File.read("js/mickey.coffee")
File.open("_site/mickey.js", "w") { |f| f.write(js) }
```

Enfin, appeler le script dans la page web. Pour ce faire, ajouter une balise script pointant vers `mickey.js` à la fin du fichier :

```haml
%script(src="mickey.js")
```

Il reste une dernière petite chose à faire, l'ajouter au `Guardfile`

```ruby
watch %r{^js/mickey\.coffee$}
```

Désormais c'est fait ! Vous avez donc une super animation de haute voltige sur votre page web statique !


# Conclusion

> It's time to kick ass and chew bubble gum, and I'm all outta gum !

Et voilà, tout roule. Vous avez **enfin** une page web statique de [très haut niveau][]. A ce stade vous pouvez travailler [parmis les meilleurs][] et vous avez désormais une justification pour [le prix de vos oeuvres d'art][].

Et sinon, ben vous aurez juste eu l'occasion de découvrir certaines technologies plutôt cool au travers d'une réalisation totalement inutile ;)

Les sources utilisées sont disponibles sur [un dépôt github][] et le résultat tant attendu est [visible][]


[html]: http://fr.wikipedia.org/wiki/Hypertext_Markup_Language
[gem]: http://rubygems.org/
[haml]: http://haml.info/
[sass]: http://sass-lang.com/
[ruby]: http://www.ruby-lang.org/fr/
[rake]: http://rake.rubyforge.org/
[git]: http://git-scm.com/
[bundler]: http://gembundler.com/
[coffeescript]: http://coffeescript.org/
[guard]: https://github.com/guard/guard
[guard-rake]: https://github.com/guard/guard-rake
[dep_hell]: http://en.wikipedia.org/wiki/Dependency_hell
[feignasse]: http://fr.wikipedia.org/wiki/D%C3%A9veloppeur
[veille technologique]: https://linuxfr.org/tags/veille_technologique/public
[mickeys]: http://concours.livre-css3.fr/jeu.php?mode=voter#realisations
[très haut niveau]: http://fr.wikipedia.org/wiki/Bullshit
[parmis les meilleurs]: http://fr.wikipedia.org/wiki/Ssii
[le prix de vos oeuvres d'art]: http://www.lemonde.fr/technologies/article/2010/08/18/france-fr-un-site-de-4-millions-d-euros_1399998_651865.html
[un dépôt github]: https://github.com/CrEv/web_page_today
[visible]: http://www.winsos.net/web_page_today/
