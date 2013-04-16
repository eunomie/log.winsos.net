---
layout: post
tags : [dev, misc, linuxfr]
title: Ecrire une page web de nos jours
author: Yves
email: yves.brissaud@gmail.com
twitter: _crev_
nolinks: true
---

J'aurais aussi pu l'appeler _Le html c'est surfait !_


Ces derniers jours, je me suis mis à la création d'une page web. En gros, il s'agit d'une simple page, totalement statique (pas de code serveur ni de code côté client). Allez, on va quand même mettre un peu de [css](http://fr.wikipedia.org/wiki/CSS) histoire d'avoir un peu de style, et pour que ça reste relativement sobre, pas d'images.

Logiquement j'aurais pu prendre [un éditeur de texte tout simple](http://www.sublimetext.com/) et écrire mon [css](http://fr.wikipedia.org/wiki/CSS) et mon [html](http://fr.wikipedia.org/wiki/Hypertext_Markup_Language) (la page est vraiment petite).

Mais non, malheureux ! Tout le monde sait bien que l'[html](http://fr.wikipedia.org/wiki/Hypertext_Markup_Language) c'est surfait aujourd'hui !

Voici donc dans la suite comment créer une petite page web tout simple en utilisant [Haml](http://haml.info/), [Sass](http://sass-lang.com/), [solarized](http://ethanschoonover.com/solarized), [Font Awesome](http://fortawesome.github.com/Font-Awesome/), [ruby](http://www.ruby-lang.org/fr/), [rake](http://rake.rubyforge.org/) et [git](http://git-scm.com/), le tout en utilisant [Sublime Text 2](http://www.sublimetext.com/).

Ha oui, et histoire que ce soit drôle, vous verrez que j'ai collé pleins de liens partout pour faire genre, spéciale dédicace à... heu non, allez, restons sympa ;-)

[](about:blank)

# Contexte

Déjà, précisons le contexte :

* une page web tout simple, comportant en gros un peu de bla bla et une liste d'items
* lisible
* pas trop moche si possible
* très facile à mettre à jour (ce qui arrivera de temps en temps)


Ok, une page html avec un peu de css posée sur un serveur fait le boulot. Mais c'était trop simple, allons bon !


# Le [html](http://fr.wikipedia.org/wiki/Hypertext_Markup_Language) c'est surfait !

Déjà, le [html](http://fr.wikipedia.org/wiki/Hypertext_Markup_Language) c'est vraiment surfait. Faut réellement être un développeur de la vieille école pour écrire du PHP^W [html](http://fr.wikipedia.org/wiki/Hypertext_Markup_Language) à la main. Franchement, qui voudrait en écrire encore aujourd'hui ?

La solution (enfin l'une) se trouve donc dans [haml](http://haml.info/). [haml](http://haml.info/) est un langage de balisage léger pour écrire des templates. C'est plutôt orienté [ruby](http://www.ruby-lang.org/fr/) et ça se lit très facilement.

L'indentation est utilisée pour gérer l'enchainement des blocs plutôt que les balises ouvrantes/fermantes (comme en [python](http://www.python.org/) ou [coffeescript](http://coffeescript.org/) par exemple).

Si on prend l'exemple sur [wikipedia](http://fr.wikipedia.org/wiki/Haml) voici ce que ça permet.

Version [html](http://fr.wikipedia.org/wiki/Hypertext_Markup_Language) :

```html
<div id="sidebar">
  <ul class="main">
    <li class="active">
      <a href="accueil.html">
        Accueil
      </a>
    </li>
    <li>
      <a href="nouvelles.html">
        Nouvelles
      </a>
    </li>
    <li class="disabled">
      <a>Membres</a>
    </li>
  </ul>
</div>
```

Version [haml](http://haml.info/) :

```haml
#sidebar
  %ul.main
    %li.active
      %a{"href" => "accueil.html"}
        Accueil
    %li
      %a{"href" => "nouvelles.html"}
        Nouvelles
    %li.disabled
      %a Membres
```

Tout de suite, le gain est énorme ! Plus de syntaxe [xml](http://fr.wikipedia.org/wiki/Xml), plus lisible, indentation forcée, etc.


# [Ruby](http://www.ruby-lang.org/fr/) et [rake](http://rake.rubyforge.org/), pour faire faussement compliqué

Le problème de tout ça c'est qu'il faut maintenant transformer ceci en ... [html](http://fr.wikipedia.org/wiki/Hypertext_Markup_Language) ! Ben oui, votre [navigateur](http://www.google.com/intl/fr/chrome/browser/) il ne comprend pas le [haml](http://haml.info/).

Heureusement, [Ruby](http://www.ruby-lang.org/fr/) vole à notre secours !

Tout d'abord, il est nécessaire d'installer la [gem](http://rubygems.org/) [haml](http://haml.info/) :

```bash
gem install haml
```

Vous pouvez donc ensuite compiler votre fichier [haml](http://haml.info/) (index.haml) en fichier [html](http://fr.wikipedia.org/wiki/Hypertext_Markup_Language) (index.html) :

```ruby
require 'haml'

haml = IO.read("index.haml")
hamlengine = Haml::Engine.new(haml)
html = hamlengine.render()

File.open("index.html", "w") { |f| f.write(html) }
```

Si vous appellez ce fichier `compile.rb` il vous suffit d'exécuter la commande `ruby compile.rb` pour générer votre fichier [html](http://fr.wikipedia.org/wiki/Hypertext_Markup_Language).

Facile, non !

Par contre, arrêtons de voir les choses en petit ! Un tel script n'est pas suffisant, il faut se dépasser un peu quand même !

Ce script va donc être placé dans un fichier [Rakefile](http://rake.rubyforge.org/files/doc/rakefile_rdoc.html). Voici donc le contenu de ce fichier :

```ruby
require 'haml'

task :default => :build

desc 'Build site'
task :build do
  haml = IO.read("index.haml")
  hamlengine = Haml::Engine.new(haml)
  html = hamlengine.render()

  File.open("_site/index.html", "w") { |f| f.write(html) }
end
```

Vous saisissez la différence ? Non ? Ben pourtant elle est évidente, il suffit désormais d'exécuter la commande `rake` au lieu de `ruby compile.rb` !


# Et si on coloriait un peu ?

Maintenant que la partie [html](http://fr.wikipedia.org/wiki/Hypertext_Markup_Language) est réalisée, passons un peu à la mise en style.

Précédemment, on utilisait essentiellement du [css](http://fr.wikipedia.org/wiki/CSS). Tout comme le [html](http://fr.wikipedia.org/wiki/Hypertext_Markup_Language) qui est désormais surfait, le [css](http://fr.wikipedia.org/wiki/CSS) est également aujourd'hui une [technologie quasi obsolète](http://www.php.net).

Heureusement pour nous, des petits gars bien malins nous ont concoqueté [Sass](http://sass-lang.com/). Si vous avez compris ce qu'était [haml](http://haml.info/) par rapport à [html](http://fr.wikipedia.org/wiki/Hypertext_Markup_Language), dites simplement qu'il en est de même à propos de [Sass](http://sass-lang.com/) par rapport à [css](http://fr.wikipedia.org/wiki/CSS).

[Sass](http://sass-lang.com/) est donc un pré-processeur [css](http://fr.wikipedia.org/wiki/CSS) vous permettant de l'écrire plus mieux, en [enlargeant votre productivité](http://www.ruby-lang.org/fr/). Il y a plein de possibilités bien sympa, comme les [mixins](http://sass-lang.com/docs/yardoc/file.SASS_REFERENCE.html#mixins), les [nested rules](http://sass-lang.com/docs/yardoc/file.SASS_REFERENCE.html#nested_rules) et plein d'autres choses.

Lorsque vous écriviez précedemment, en [css](http://fr.wikipedia.org/wiki/CSS) :

```css
ul {
  color: red;
}
ul li {
  margin-left: 1em;
}
ul li.green {
  color: green;
}
ul li a {
  text-decoration: underline;
}
ul li a:hover {
  font-weight: bold;
}
```

Vous pouvez désormais écrire en [Sass](http://sass-lang.com/) :

```sass
ul
  color: red
  li
    margin-left: 1em
    &.green
      color: green
    a
      text-decoration: underline
      &:hover
        font-weight: bold
```

Impressionnant, non !

Evidemment, pour pouvoir tout de même générer le [css](http://fr.wikipedia.org/wiki/CSS) correspondant (car, pour rappel, ton [navigateur](http://www.google.com/intl/fr/chrome/browser/) il ne comprend pas [Sass](http://sass-lang.com/)) on va encore utiliser [Ruby](http://www.ruby-lang.org/fr/) et la [gem](http://rubygems.org) dédiée :

{% highlight bash %}
gem install sass
```

Voici donc un petit script pour transformer notre [Sass](http://sass-lang.com/) (`css/style.sass`) en [css](http://fr.wikipedia.org/wiki/CSS) (`style.css`) :

```ruby
require 'sass'

sassengine = Sass::Engine.for_file("css/style.sass", :syntax => :sass, :style => :compressed)
css = sassengine.render()

File.open("style.css", "w") { |f| f.write(css) }
```

Mais comme on est des gens bien, on va surtout le rajouter au [Rakefile](http://rake.rubyforge.org/files/doc/rakefile_rdoc.html) précédemment créé afin qu'il ressemble à :

```ruby
require 'sass'
require 'haml'

task :default => :build

desc 'Build site'
task :build do
  sassengine = Sass::Engine.for_file("css/style.sass", :syntax => :sass, :style => :compressed)
  css = sassengine.render()

  File.open("style.css", "w") { |f| f.write(css) }

  haml = IO.read("index.haml")
  hamlengine = Haml::Engine.new(haml)
  html = hamlengine.render()

  File.open("_site/index.html", "w") { |f| f.write(html) }
end
```

Et voilà ! Un simple appel à `rake` nous permet donc d'obtenir notre [html](http://fr.wikipedia.org/wiki/Hypertext_Markup_Language) et notre [css](http://fr.wikipedia.org/wiki/CSS) !


# On devait pas parler de couleurs ?

Ha si !

Puisqu'on y est, on ne vas pas utiliser la feuille de style standard, say trop pour les loosers !

Tout d'abord, histoire que tous le monde ait la même trogne, on va commencer par utiliser la feuille de _reset_ [normalize.css](http://necolas.github.com/normalize.css/). C'est une bonne alternative à beaucoup de feuilles de _reset_ qu'on trouve habituellement, et elle fait bien son boulot.

Ensuite, ben c'est simple, on va surtout utiliser les couleurs provenant de [solarized](http://ethanschoonover.com/solarized). Il s'agit d'un ensemble de couleurs plutôt bien homogènes, cohérentes entre elles et agréables à l'oeil. Parfait quoi !

Histoire de mettre aussi un peu de fun dans l'histoire, ajoutons quelques icones. Mais comme on fait les choses biens, point d'image ! C'est trop surfait les images aussi ! Donc direction [Font Awesome](http://fortawesome.github.com/Font-Awesome/). Il s'agit d'une police de caractère orientée icones. L'avantage est que c'est plutôt léger, vectoriel, coloriable facilement, propre, bien intégré à [Twitter bootstrap](http://twitter.github.com/bootstrap/) mais également utilisable sans. C'est propre, c'est net, c'est facile, que demander d'autre ?

Voici d'ailleurs le code [Sass](http://sass-lang.com/) que j'ai utilisé pour ajouter mes quelques icones dans ma page :

```sass
$fontAwesomePath: "font/fontawesome-webfont" !default

@font-face
  font-family: "FontAwesome"
  src: url("#{$fontAwesomePath}.eot")
  src: url("#{$fontAwesomePath}.eot") format('eot'), url("#{$fontAwesomePath}.woff") format('woff'), url("#{$fontAwesomePath}.ttf") format('truetype'), url("#{$fontAwesomePath}.svg#FontAwesomeRegular") format('svg')
  font-weight: normal
  font-style: normal

[class^="icon-"]:before,
[class*=" icon-"]:before
  font-family: FontAwesome
  font-weight: normal
  font-style: normal
  display: inline-block
  text-decoration: inherit

.icon-check-empty:before
  content: "\f096"

.icon-check:before
  content: "\f046"

.icon-envelope-alt:before
  content: "\f0e0"

.icon-phone:before
  content: "\f095"

.icon-comments-alt:before
  content: "\f0e6"

.icon-comments:before
  content: "\f086"
```


# On pousse le style un poil plus loin ?

Histoire d'aller un tout petit peut plus loin, j'ai utilisé deux autres web font pour améliorer un peu la typographie. C'est pas grand chose mais ça fait tout de suite la différence. C'est propre, léger, et agréable visuellement alors pourquoi s'en priver ?

J'ai donc utilisé [Numans](http://www.google.com/webfonts/specimen/Numans) comme police de base et [Josefin Sans](http://www.google.com/webfonts/specimen/Josefin+Sans) pour les titres. C'est pas grand chose mais le gain est réellement intéressant.

Voici le [Sass](http://sass-lang.com/) correspondant :

```sass
@import url("//fonts.googleapis.com/css?family=Josefin+Sans:700")
@import url("//fonts.googleapis.com/css?family=Numans")

html, body
  font-family: "Numans", arial, helvetica, sans-serif
h1, h2, h3, h4, h5, h6
  font-family: "Josefin Sans", arial, helvetica, sans-serif
```


# Modification et mise en ligne

Ha oui, l'objectif initial était également de pouvoir être facilement modifié et mis en ligne.

Pour la publication c'est facile. J'ai simplement mis une règle `deploy` dans mon [Rakefile](http://rake.rubyforge.org/files/doc/rakefile_rdoc.html) qui effectue un [rsync](http://rsync.samba.org/) vers mon serveur web. Comme c'est du statique je n'ai rien d'autre à faire, rien a redémarré. La modification est donc instantanément en ligne.

Mon [Rakefile](http://rake.rubyforge.org/files/doc/rakefile_rdoc.html) a donc la tête suivante. Il faut tout de même prendre en compte que, pour simplifier les choses, je génère mon contenu dans un répertoire `_site` qui me permet de le pousser sans me soucier des fichiers sources.

```ruby
require 'sass'
require 'haml'

task :default => :build

desc 'Build site'
task :build do
  sh 'mkdir _site'
  sh 'rm -rf _site/*'
  sassengine = Sass::Engine.for_file("css/application.sass", :syntax => :sass, :style => :compressed)
  css = sassengine.render()

  File.open("_site/application.css", "w") { |f| f.write(css) }

  haml = IO.read("index.haml")
  hamlengine = Haml::Engine.new(haml)
  html = hamlengine.render()

  File.open("_site/index.html", "w") { |f| f.write(html) }

  sh 'cp -R font _site'
end

desc 'Build and deploy'
task :deploy => :build do
  sh 'rsync --checksum -rtzh --progress --delete _site/ www:/var/www/plop'
end
```

Et voilà ! `rake` me compile mon projet, je peux aller le voir directement dans `_site` ou utiliser [serve](https://github.com/jlong/serve). `rake deploy` quant à lui me génère le contenu et le pousse sur mon serveur web.


# Il ne manquerait pas un truc ?


Et si, il manque une dernière brique : [git](http://git-scm.com/). En effet, tout le contenu source (donc `_site` omis) est versionné en utilisant [git](http://git-scm.com/). Je n'utilise pas de serveur type [github](https://github.com/) ou autre, j'ai juste créé un dépôt sur mon propre serveur de fichier. Je pousse alors via ssh, c'est très largement suffisant et je n'ai pas besoin de plus de droits, je suis le seul à bosser dessus. L'avantage est qu'un dépôt [git](http://git-scm.com/) se monte en un rien de temps et qu'une connexion classique suffit à le récupérer. Je peux alors rappatrier les sources sur une autre machine qui contient [Ruby](http://www.ruby-lang.org/fr/) et les [gem](http://rubygems.org) nécessaire et je peux alors le modifier, générer et pousser vers mon serveur !

# Et voilà !


Et voui, et voilà !

Ok, certains diront que c'est utiliser un bulldozer pour écraser une mouche, et ils n'auront probablement pas tord. Quoi qu'il en soit, cela apporte une réelle plus value en terme de confort. Et surtout c'est une base réutilisable de nombreuses fois, extensible (il suffit par exemple de rajouter une entrée pour compiler du coffeescript et ajouter un peu de dynamisme dans les pages, etc).


# Apparté

'tain mais je sais pas comment il fait, c'est mega super lourd de placer autant de liens dans un post !

# Apparté n°2

Oui, l'écriture de ce billet est probablement plus longue que l'écriture de la dite page oueb en html+css !
