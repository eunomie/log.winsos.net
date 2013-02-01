---
layout: post
tags : [dev, misc, linuxfr]
title: Ecrire une page web de nos jours, troisième partie
author: Yves
email: yves.brissaud@gmail.com
twitter: _crev_
---

Hey !

Ca y est, vous avez bien suivis la [première][part1] et [deuxième][part2] \[1\] partie de "Ecrire une page web de nos jours" et vous pensez être devenu un Dieu de l'achetaihèmaille ? Vous auriez tort !

Vous pensiez qu'un peu de [haml][], [sass][], [ruby][], [rake][], [gem][], [git][], [bundler][], [guard][], [guard-rake][] ou encore [coffeescript][] suffisait ? 

![looooser !](../../../images/domino.gif)

Allez, il est temps de passer aux choses sérieuses et voir comment [markdown][], [haml][] (oui encore lui) et [ruby][] (toujours lui) peuvent réellement enlarger votre ~~productivité~~ devis et faire de vous un vrai développeur web !


_Note :_ contrairement aux premiers épisodes, celui-ci ne montre pas l'intégralité du boulot mais détaille les étapes et concepts principaux. Le résultat final n'est pas directement disponible mais sera l'objet d'un prochain article, plus spécifique au projet dans son ensemble.


## Con tenu

C'est bien joli, vous avez une superbe page oueb qui rox des mamans ours. Supaïr ! Mais maintenant il serait temps de passer aux choses sérieuses, et là comment dire... _le [haml][] say nul_ !

Ben oui, vous vous voyez, sérieusement, écrire votre prose comme ça :

```haml
%p
  C'est bien joli, vous avez une superbe page oueb qui rox des mamans ours. Supaïr ! Mais maintenant il serait temps de passer aux choses sérieuses, et là comment dire...
  %i
    le
    %a(href="http://haml.info/")
      haml
    say nul
  !
```

Ou alors, vous préférez écrire comme ceci :

```text
C'est bien joli, vous avez une superbe page oueb qui rox des mamans ours. Supaïr !
Mais maintenant il serait temps de passer aux choses sérieuses, et là comment dire...
_le [haml](http://haml.info/) say nul_ !
```

> Ouah !!! Livre nous ton secret ô maître ! Quelle est cette syntaxe si magnifique !

Comment ça je rêve ? Pffff, c'était mieux à vent !


Ok, vous l'aurez tous compris, on va parler de [markdown][] parce que c'est [hype][ruby] !

Sachez pour la forme qu'il existe d'autres choses plus ou moins équivalentes, comme [reStructuredText][rst] ou [Textile][textile]


## Marc donne. Oui, mais Marc donne quoi déjà ?

[Markdown][markdown] c'est juste la syntaxe de texte enrichi la plus en vogue en ce moment. On la retrouve partout, sur [github][], sur [stack*][stack] et même sur [da linux french page][dlfp], c'est dire !

Ha ok, vous connaissez déjà. Bien bien, passons donc aux choses sérieuses : faire du [markdown][] en [ruby][] !

Pour pouvoir transformer du [markdown][] en [html][], on va évidemment utiliser des [gems][gem] !

La plupart du temps, [Maruku][maruku] ou [rdiscount][] sont utilisés. Mais comme on ne veut pas faire comme les autres, on va utiliser [redcarpet][] !

Comme d'habitude, ça se fait facilement en [ruby][]. Tout d'abord, ajouter la [gem][] au fichier `Gemfile` :

```ruby
gem 'redcarpet'
```

Puis l'installer :

```bash
bundle
```

A ce moment vous pouvez commiter le fichier `Gemfile` mais aussi le `Gemfile.lock`.

Ensuite, si vous avez un fichier [markdown][] `plop.md` à convertir, rien de plus simple avec ce petit bout de [ruby][] :

```ruby
require 'redcarpet'

markdown = Redcarpet::Markdown.new
html = markdown.render File.read 'plop.md'
```

Et voilà !

Evidemment vous pouvez faire plus de chose, mais pour ça allez lire la doc de [redcarpet][].


## Couleuvres

Avant d'aller plus loin dans l'intégration, arrêtons-nous un instant. Ok, on a du [markdown][] qui se transforme en [html][]. Cool. Mais il manque **la** fonctionnalité absolument indispensable : la mise en couleurs du code source !

Ben oui, vous vouliez vous servir du [markdown][] pour quoi d'autre que présenter du code source ?

Vous connaissez [pygments][] ? Ben ça tombe bien, c'est ce qu'on va utiliser ! Enfin via un [wrapper][pygments.rb] [ruby][] quand même, pas question d'utiliser un truc en python ici !

On va juste faire comme d'habitude. D'abord rajouter la [gem][] qui va bien :

```ruby
gem 'pygments.rb'
```

Et l'installer :

```bash
bundle
```

Puis améliorer un peu le script ruby :

```ruby
require 'redcarpet'
require 'pygments'

class HTMLwithPygments < Redcarpet::Render::HTML
  def block_code(code, language)
    Pygments.highlight(code, :lexer => language)
  end
end

markdown = Redcarpet::Markdown.new(HTMLwithPygments, :fenced_code_blocks => true)
markdown.render File.read 'plop.md'
```

Et voilà, si vous avez du code entre trois (ou plus) backticks il sera mis en forme. Et en plus c'est compatible avec [linuxfr][dlfp] ce qui est absolument obligatoire !


## Et maintenant ?

Quoi ? Vous avez du [haml][], du [sass][], du [ruby][], du [bundler][], du [rake][], du [guard][], du [rake][], du [markdown][], etc et vous n'êtes pas encore satisfait ? Comment ça ça sert à rien tout ça si on ne peut pas inclure le [markdown][] dans la page oueb ?

Bon, c'est facile : vous lancez [rake][] ou [guard][] et ensuite, vous exécutez le [markdown][] et enfin copier/coller dans le fichier [html][] généré. Voilà !

Toujours pas content ?

Ok, on va faire un peu mieux alors...


## [haml][] et [markdown][]

Lorsqu'on transforme un fichier [haml][] en [html][], il est possible de lui passer un objet dont les membres vont pouvoir être appelé dans le [haml][]. Si on crée un object qui lui va convertir le [markdown][] en [html][] via une méthode (qu'on va appeler `content`) alors rien de plus simple pour intégrer votre fichier [markdown][] en [haml][] !

Tout d'abord, on va changer un peu le fichier [haml][] pour qu'il ressemble à ça :

```haml
!!! 5
%html(lang="en")
  %head
    %meta(charset="utf-8")
    %link(rel="stylesheet" type="text/css" href="application.css")
    %title= "Écrire une page web de nos jours"

  %body(class="blue")
  = content
```

On va aussi prendre un fichier [markdown][], `plop.md` qui ressemble à ça :

```text
# Yeah !

Supaïr, je suis un fichier markdown !

Et je peux faire plein de trucs cool

* comme
* ceci
```

Et il convient ensuite de changer notre script ruby.

Initialement on avait un bloc content ceci :

```ruby
haml = IO.read("index.haml")
hamlengine = Haml::Engine.new(haml)
html = hamlengine.render()

File.open("_site/index.html", "w") { |f| f.write(html) }
```

On va donc ajouter une classe gérant notre markdown :

```ruby
class Content
  def content
    markdown = Redcarpet::Markdown.new(HTMLwithPygments, :fenced_code_blocks => true)
    markdown.render File.read 'plop.md'
  end
end
```

Et on va en passer une instance à notre convertisseur [haml][] :

```ruby
haml = IO.read "index.haml"
hamlengine = Haml::Engine.new haml
html = hamlengine.render Content.new

File.open("_site/index.html", "w") { |f| f.write(html) }
```

Et c'est tout ! Lorsque le haml sera transformé, il va appelé la méthode `content` de l'instance de `Content` qui va transformer le [markdown][] en [html][] et l'ajoutera au document.


> Elle est pas belle la vie ?


## Je pars à maître

Et oui, c'est bien joli tout ça mais si on allait plus loin ? Et surtout, si on paramétrait tout ça.

Car là, dans le cas présent, ça permet de déléguer une partie du [haml][] par du [markdown][]. Mais ce serait beaucoup plus sympa si on se concentrait sur le [markdown][] qui indiquerait de lui-même dans quelle "page" [haml][] il voudrait être rendu.

Dans cette optique, et histoire de ne pas réinventer inutilement la roue, on va partir sur ce que fais [jekyll][]. C'est à dire que le fichier [markdown][] va comporter un entête qui va en indiquer différents paramètres.

Ces paramètres vont être séparés du reste du markdown par des tirets. Le contenu est simplement sous forme d'un [yaml][] parce que say bien !

Voici un exemple de paramètres :

```text
---
param: valeur du paramètre
param2: autre valeur
---

Suite du fichier...
```

Par contre, ce paramètrage ne devra pas être inclus dans la génération du [html][] à partir du [markdown][].

On va donc remplacer le `File.read 'plop.md'` par quelque chose d'un peu plus évolué :

```ruby
content = File.read 'plop.md'
datas = Hash.new
begin
  if content =~ /^(---\s*\n.*?\n?)^(---\s*$\n?)/m
    content = $'
    datas = YAML.load $1
  end
rescue => e
  puts "YAML Exception reading 'plop.md': #{e.message}"
end
```

Voici ce qui est réalisé :

* on lit tout le fichier
* extraction de l'entête si elle existe
* si c'est le cas :

  * on récupère tout ce qui suit l'entête et on dit que c'est le vrai contenu [markdown][]
  * on parse l'entête [yaml][]
  * si ça foire on balance un message

Ok, mais pourquoi on fait tout ça déjà ? Ben on va simplement y placer un paramètre `layout` qui va avoir comme valeur le nom du fichier [haml][] dans lequel insérer le [html][] généré à partir du [markdown][]. Ainsi, on se concentre sur le contenu réel (le [markdown][]) et non sur la page oueb.

Si on veut refaire l'exemple précédent avec ce principe, on aurait d'abord ceci en tête de notre `plop.md` :

```text
---
layout: index.haml
---
```

et le ruby ressemblerait à quelque chose du genre :

```ruby
class Content
  def initialize
    @content = File.read 'plop.md'
    @datas = Hash.new
    begin
      if @content =~ /^(---\s*\n.*?\n?)^(---\s*$\n?)/m
        @content = $'
        @datas = YAML.load $1
      end
    rescue => e
      puts "YAML Exception reading 'plop.md': #{e.message}"
    end
  end

  def content
    markdown = Redcarpet::Markdown.new(HTMLwithPygments, :fenced_code_blocks => true)
    markdown.render @content
  end

  def render
    haml = IO.read @datas['layout']
    hamlengine = Haml::Engine.new haml
    html = hamlengine.render self

    File.open("_site/index.html", "w") { |f| f.write(html) }
  end
end
```

Et on pourrait alors faire un

```ruby
content = Content.new
content.render
```

qui lirait le [markdown][], irait cherché le [haml][] nécessaire, rendrait le [markdown][] lors de l'appel à `content` à l'intérieur du code [haml][].

Alors, elle est pas belle la vie ?

Evidemment on peut imaginer chainer l'ensemble. C'est à dire que le fichier [haml][] peut aussi n'être qu'une sorte de fichier "partiel" et contenir lui-même un entête [yaml][].

Pour aller encore plus loin, on peut aussi rendre disponible le contenu de `@datas`, donc de l'entête. Soit en présentant un accesseur sur `@datas`, soit en ajoutant des accesseurs spécifiques, soit en utilisant `method_missing`. Quelque soit la solution, le but est d'ajouter des méta données, telles le titre, l'auteur, des liens, catégories, tags, etc. Finalement tout ce qu'on veut, de toute manière la majorité du boulot se fera par l'appel à ces données dans des fichiers [haml][].


## Petit bonus

Et oui, comme c'est nowel voici un petit bonus.

Dans votre fichier `Gemfile` (ou manuellement) ajoutez une référence à [gollum][]. Il s'agit d'un éditeur / visualiseur markdown réalisé par [github][]. Il permet donc de voir vos posts, d'en éditer le contenu au format [markdown][] (il supporte en réalité d'autres types) et d'en avoir la prévisualisation. C'est tout de suite beaucoup plus sympa.

Donc installez [gollum][], rendez-vous dans le dossier concerné, par exemple `_posts`, et exécutez `gollum`. Enfin, rendez-vous à l'adresse <http://localhost:4567/pages> (oui le lien est pour pages car ça permet de lister les pages trouvées, étant donné qu'il n'y a pas de `Home`.

Vous pouvez maintenant éditer et visualiser vos posts, voir même en créer des nouveaux. Attention, lorsque vous enregistrez cela fait un commit [git][].

Alors, sympa, non ?

## Conclusion

Fin de la petite série de trois articles sur _"Écrire une page web de nos jours"_. Mais non, ne pleurez pas, c'est pas tout à fait terminé `;-)`

J'espère que cette série aura pu vous intéressant, au moins vous présenter quelques outils plutôt sympa qui pourraient vous être utiles, même si ça reste assez classique (le combo [ruby][], [haml][], [coffeescript][], [sass][] est plutôt courant côté [rails][]).

Le résultat de tout ceci est une vrai mise en application de tout ce que vous avez pu voir ici, et propulse entre autre ce site web.

Les sources / explications seront bientôt disponibles, il ne manque qu'un petit coup de polish pour que ce soit présentable (un peu de doc, explications, etc).

Bon web à tous !

[part1]: http://log.winsos.net/2012/12/03/ecrire-une-page-web-de-nos-jours.html
[part2]: http://log.winsos.net/2012/12/05/ecrire-une-page-web-de-nos-jours-suite-des-aventures.html

[html]: http://fr.wikipedia.org/wiki/Hypertext_Markup_Language
[haml]: http://haml.info/
[sass]: http://sass-lang.com/
[ruby]: http://www.ruby-lang.org/fr/
[rake]: http://rake.rubyforge.org/
[git]: http://git-scm.com/
[gem]: http://rubygems.org/
[bundler]: http://gembundler.com/
[coffeescript]: http://coffeescript.org/
[guard]: https://github.com/guard/guard
[guard-rake]: https://github.com/guard/guard-rake
[markdown]: http://daringfireball.net/projects/markdown/
[rst]: http://docutils.sourceforge.net/rst.html
[textile]: http://textile.sitemonks.com/
[github]: http://github.com
[stack]: http://stackexchange.com/
[dlfp]: http://www.linuxfr.org
[maruku]: https://github.com/bhollis/maruku
[rdiscount]: https://github.com/rtomayko/rdiscount
[redcarpet]: https://github.com/vmg/redcarpet
[pygments]: http://pygments.org/
[pygments.rb]: https://github.com/tmm1/pygments.rb
[jekyll]: http://jekyllrb.com/
[yaml]: http://www.yaml.org/
[gollum]: https://github.com/github/gollum
[rails]: http://rubyonrails.org/


\[1\]: `"#{part_1}#{part_2}".to_linuxfr` <https://linuxfr.org/users/crev/journaux/ecrire-une-page-web-de-nos-jours>