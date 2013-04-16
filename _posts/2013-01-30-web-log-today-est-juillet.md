---
layout: post
tags: [web_log_today]
title: Web Log Today est juillet
author: Yves
email: yves.brissaud@gmail.com
twitter: _crev_
published: true
nolinks: true
---

Après la superbe trilogie « écrire une page web de nos jours », voici enfin la suite tant attendue.

Pour rappel :

1. [Ecrire une page web de nos jours][episode1]
2. [Ecrire une page web de nos jours, suite de aventures][episode2]
3. [Ecrire une page web de nos jours, troisième partie][episode3]

Mais quelle suite pouvait-on donner alors ? Avec ces trois épisodes nous avons touché du bout des doigts la création d'une page web aujourd'hui. Bon, on en est resté au strict minimum avec [haml][], [git][], [markdown][], [ruby][], [gem][], [guard][], [rake][], [sass][], [coffeescript][], [bundler][], [redcarpet][], [gollum][], etc. Evidement pas question d'en rester là !

Voici un petit résumé tout de même :

* le html c'est surfait
* le css c'est tellement 2012
* ruby c'est indispensable
* gem say bien
* markdown ça enlarge ta capacité à écrire
* javascript c'est pour les boutonneux, coffeescript c'est pour les vrais

Pfiou, on en avait vu des choses tout de même !

L'ensemble était orienté "simple page web". Mais les simples pages, say trop nul, il en faut deux ! (ou plus...) Et c'est ainsi qu'est né _Web Log Today_ ! Voyons donc désormais comment _écrire un blog de nos jours_ !


## Présentation

_Web Log Today_ (`wlt`) est né d'un besoin très simple : remplacer mon vieux blog dotclear par un ensemble beaucoup plus sympa :

* site / blog statique (pas besoin d'un langage côté serveur)
* [markdown][] comme langage principal de contenu
* génération simple de flux atom, sitemap, etc
* gestion (bien qu'un peu sommaire pour le moment) de tags
* gestion de billets mais aussi de pages statiques
* utilisation de templates pour ne pas se répéter tout le temps
* que des technos cool (mais pour le coup elles sont presque toutes dans la version "écrire une page web de nos jours")

Au final, ça donne quelque chose dans le même genre que [jekyll][] avec quelques différences :

* [haml][] est utilisé aussi bien comme langage de template que comme générateur de html
* [sass][] est utilisé par défaut pour les css
* [coffeescript][] est utilisé par défaut pour le javascript
* uniquement [markdown][] est supporté côté contenu, et on ne peux pas utiliser de template dans les contenus

Sinon c'est un peu le même principe, il y a pas mal de ressemblances entre autre sur les headers des fichiers (pour indiquer le layout à utiliser, le titre, les tags, etc).

## Installation

La majeur partie de _Web Log Today_ est la commande `wlt`. Cette commande est basée sur [sub][] et ça c'est juste très pratiques. Pour la suite, je pars du principe que vous allez l'installer dans `~/.wlt`.

1. Dépendances

    [git][], [ruby][] 1.9.3, [bundler][]

2. Récupération des sources

    ```sh
    git clone https://github.com/CrEv/wlt.git ~/.wlt
    cd ~/.wlt
    ```

3. Récupération des dépendances

    ```sh
    bundle
    ```

4. Mise à disposition

    Pour bash :

    ```sh
    echo 'eval "$(<wltpath>/bin/wlt init -)"' >> ~/.bash_profile
    exec bash
    ```

    Pour zsh :

    ```sh
    echo 'eval "$(<wltpath>/bin/wlt init -)"' >> ~/.zshenv
    source ~/.zshenv
    ```

Et voilà, `wlt` est dispo !

## Mise à jour

Evidemment, c'est juste trop facile !

```sh
cd ~/.wlt && git pull && bundle
```

Un petit apparté sur le côté git : le but est de garder la branche `master` toujours installable. Il devrait donc être possible en permanence de faire un `pull` depuis le master sans craindre le moindre problème. Les développements futurs seront +

## Usage

Le principe global est plutôt simple. `wlt` va lire des informations dans des dossiers spécifiques, va les compiler en css, js et html afin d'en générer un site statique. De manière globale le principe est :

> convention over configuration

La majorité des choses repose donc sur certaines conventions, en premier lieu les fichiers et répertoires.

### `_site`

Ce répertoire contient l'ensemble des fichiers générés. Il s'agit réellement de votre site web, il suffit de le copier sur votre serveur pour le rendre disponible.

### `_posts`

Le répertoire `_posts` contient logiquement les billets de votre blog. Il s'agit de fichiers markdown dont le titre a la structure suivante :

    yyy-mm-dd-title-of-the-blog-post.md

* `yyyy` : année de publication
* `mm` : mois de publication
* `dd` : jour de publication
* `title-of-the-blog-post` : nom du fichier, en général le titre du billet sans accent ni espace ni caractère spéciaux

Le fichier html généré sera :

    yyyy/mm/dd/title-of-the-blog-post.html

### `_pages`

Vous pouvez définir des fichiers statiques qui ne sont pas des billets de blog. Ces fichiers se trouvent dans le répertoire `_pages` et sont des fichiers markdown. Le nom du fichier markdown sera le nom du fichier html généré. Par exemple `index.md` deviendra `index.html`.

Certaines fichiers un peu plus spéciaux peuvent être présents, voir la partie spécifique.

### `_css`

Contient l'ensemble des fichiers [sass][] destinés à être compilés en css. Les fichiers "racines" sont spécifiés dans la configuration (voir plus loin). Le fichier généré est le nom du fichier [sass][] avec l'extension css. Par exemple `application.sass` donnera `application.css`

Vous pouvez utiliser toutes les fonctionnalités de [sass][], entre autre les `@import` vous permettant de factoriser vos css.

Si vous avez des fichiers `css` à inclure, et donc ne nécessitant pas une compilation, se référer à la partie publique.

_Note :_ il est bien sur possible d'avoir plusieurs fichiers css de sortie.

### `_js`

Contient l'ensemble des fichiers [coffeescript][] destinés à être compilés en javascript. Les fichiers à compilés sont à spécifier dans la configuration.

Le fichier généré est le nom du fichier [coffeescript][] avec l'extension js. Par exemple `application.coffee` donnera `application.js`.

Pour le moment il n'y a pas de mécanismes permettant de concaténer plusieurs fichiers [coffeescript][] en un. Dans un premier temps ce n'est pas réellement nécessaire car le but était de faire un site/blog simple et non une application web. Néanmoins un système type [sprockets][] pourra être envisagé par la suite.

Si vous avez des fichiers `js` à inclure, et donc ne nécessitant pas une compilation, se référer à la partie publique.

_Note :_ il est bien sur possible d'avoir plusieurs fichiers javascript de sortie.

### `_layouts`

Contient l'ensemble des fichiers [haml][] de templates. Il peut s'agir aussi bien de fichiers "racines" fournissant l'html de base que de fichiers partiels (à charger avec `render :partial => "..."`) ou des fichiers "intermédiaires".

Les contenus (pages, posts) déclarent dans leur entête le template à utiliser. Un template peut également faire appel à un template parent. Ceci permet par exemple d'avoir un premier template correspondant à tout ce qui tourne autour du contenu généré par le markdown, et un autre dédié à la page en elle-même. Pour plus d'explications, je vous suggère juste d'aller voir les exemples.

### `_pub`

Ce répertoire est probablement le plus simple. Tout ce qui est contenu dedans sera copié à la racine du site. Il permet donc d'inclure des fichiers css, des javascript, des images, des ressources diverses, des fichiers html générés par d'autres moyens, etc.

### `config.yaml`

Le fichier `config.yaml` contient les paramètres nécessaire à la génération du site. Il s'agit de paramètres "systèmes" (par exemple l'url, le chemin de déploiement) ou simplement des paramètres destinés à être factorisés (comptes, infos twitter, etc).

Voici un exemple de fichier, commenté :

```yaml
# URL du site généré (les liens sont tous absolus)
site_url: http://log.winsos.net
# URL de déploiement, via rsync
deploy_to: ...@www.....lan:/var/www/log/
# Titre des pages
title: CrEv's log

# Informations twitter cards, opengraph, etc
# Nom de l'auteur
name: Plop Plop
# Twitter site / creator -> twitter cards
twitter_site: _crev_
twitter_creator: _crev_
# Description par défaut si non fournie
default_description: My personal weblog

# Divers comptes, permettant d'être affichés dans une page about dans les templates par défaut
accounts:
    twitter: https://twitter.com/_crev_
    gplus: https://plus.google.com/112813954986166280487
    github: http://github.com/CrEv
    coderwall: https://coderwall.com/crev
    linkedin: http://fr.linkedin.com/in/yvesbrissaud

# Assets, description des css/js à générer (nom des fichiers sans extension)
assets:
    css: [application, cv]
    js: [application]

```

A part le premier (`site_url`) qui est réellement conseillé, le reste est toujours optionnel et dépend de vos templates. Ceci n'est donc qu'un exemple et vous pouvez en rajouter autant que vous voulez. Ils seront donc accessible de partout via les objets ruby.

### Headers

Chaque fichier [markdown][] et [haml][] peut débuter par un entête ajouter quelques méta données. Selon les cas (pages, billet, template) les paramètres ne sont pas forcément tous obligatoire. Voici les paramètres dans le cas d'un billet de blog.

Tout d'abord l'entête doit **toujours** débuter à la première ligne du fichier, par `---` et termine par une ligne contenant uniquement `---`.
Ce qui est entre ces lignes est du [yaml][].

Voici donc les données les plus courantes :

* `layout` : nom du fichier [haml][] qui va recueillir la sortie de [markdown][]
* `tags` : tableau contenant les tags relatif au billet
* `title` : Titre clair, avec accents et autres
* `author` : Nom de l'auteur
* `email` : email de l'auteur. L'email n'est pas affiché, il est utilisé pour afficher le gravatar correspondant
* `twitter` : compte twitter de l'auteur. Optionnel, il peut être défini dans la configuration
* `published` : si `false` permet de ne pas généré la sortie. Cela permet de versionner certains contenus avant qu'ils soit publiés

Par exemple :

    ---
    layout: post
    tags: [web_log_today]
    title: Web Log Today est juillet
    author: Yves
    email: plopplop@....com
    twitter: _crev_
    published: false
    ---

_Note :_ vous pouvez rajouter sans aucun problème des métadonnées propres. Elles seront accessibles via les objets ruby comme détaillé plus bas. Cela peut vous permettre d'améliorer vos templates, votre site, en posant le maximum de données dans les fichiers [markdown][] ce qui permet de rendre la saisie plus agréable.

### Fichiers spéciaux

Deux fichiers un peu plus spéciaux peuvent être présent dans le répertoire `_pages` et un dans le répertoire `_layouts`.

Le premier est simplement le fichier `atom.xml.haml`. Comme son nom l'indique il permet de générer un fichier `atom.xml` et donc permet d'offrir à vos lecteurs un flux à placer dans un quelconque lecteur. Par défaut il permet de générer un flux basé sur les articles de blogs uniquement.

Le deuxième, un peu dans le même veine, est le fichier `sitemap.xml.haml`. Il permet de générer un fichier `sitemap.xml` listant l'ensemble des ressources html de votre site.

Enfin le fichier `tags.haml` peut être présent dans le répertoire `_layouts` afin d'afficher tous les billets d'un tag commun. Contrairement à tous les autres cas, ce fichier aura de multiples sorties, un fichier par tag, présent dans le répertoire `tags`.

## Objets ruby

Les fichiers [haml][] peuvent accéder à un certain nombre de propriétés et méthodes. L'ensemble n'est pas parfaitement unifié mais cela fonctionne plutôt bien. C'est un point qui sera amélioré par la suite.

Voici les propriétés les plus importantes accessibles dans les fichiers [haml][] :

* `name` : nom du fichier
* `@contents` : propriétés globales du contenu

    * `config` : [yaml][] du fichier du configuration
    * `list` : ensemble des posts
    * `list_lasts(number)` : ensemble des posts, au plus `number`
    * `list_by_date` : ensemble des posts organisés par année, mois, jour
    * `account?(name)` : vérifie la présence d'un compte `name` dans la configuration
    * `account(name)` : valeur du compte `name` dans la configuration
    * `tag` : tag courant, dans le cadre de `tags.haml`
    * `urls` : l'ensemble des urls des billets et pages

* `link_to(url)` : transforme une url relative en url absolue en utilisant la configuration
* `gravatar?` : teste la présence d'un email pour afficher un gravatar
* `gravatar` : url de l'image gravatar
* `published?` : présence du paramètre `published` dans l'entête
* `published` : valeur du paramètre `published` de l'entête ou `true`
* `date` : date, dans le cas d'un billet
* `<...>?` : teste la présence de `<...>` dans l'entête
* `<...>` : valeur de `<...>` dans l'entête
* `@scope` : En gros idem que tout cela, mais spécifiquement au contenu [markdown][]. Cela permet d'avoir accès aux valeurs de l'entête du contenu ainsi que celles de l'entête du [haml][]
* `content` : contenu html à insérer (généré à partir du [markdown][] ou à partir du [haml][])

D'autres propriétés existent, mais entre ça et les exemples ça devrait permettre de commencer `;-)`


## Et donc, comment que ça marche en pratique ?

Quelques petites commandes au niveau de `wlt` :

### `wlt assets`

Compilation des css et javascript.

### `wlt build`

Vide le répertoire de sortie et génère l'intégralité des données.

### `wlt clean`

Vide le répertoire de sortie

### `wlt gollum`

Lance [gollum][] afin de visualiser et éditer les fichiers markdown du projet. Attention, seuls les fichiers ajoutés à [git][] sont gérés.

### `wlt serve`

Compile l'ensemble des données en changeant l'url de destination et le rend disponible sur http://localhost:4000

### `wlt scaffold`

Permet de générer une version de base, simple ou déjà relativement complexe, facilitant le démarrage avec `wlt`.

Les deux commandes sont `wlt scaffold basic` et `wlt scaffold full`.

La version basique contient le strict minimum pour bien commencer :

* fichier css de base
* fichier js de base
* une page d'index listant tous les billets
* un template pour les billets
* un header contenant les infos twitter, opengraph, etc
* un atom, un sitemap
* un fichier [rake][] et un fichier [guard][]

La version complète rajoute :

* un css déjà correct (couleurs, mise en page, etc)
* tags, pages
* quelques partiels

## Getting started

Pour finir, voici un mini tuto pour prendre en main `wlt`.

1. Créer un répertoire destiné à recevoir vos sources, dans notre cas `mon_supair_blog`

    ```sh
    mkdir mon_supair_blog
    cd mon_supair_blog
    ```

2. On échafaude en version basique (pour la version full je vous laisse regarder)

    Attention, `wlt scaffold` nécessite un répertoire vide.
    
    ```sh
    wlt scaffold basic
    ```

    Vous vous retrouvez donc avec tout ce qu'il faut pour commencer.

3. Vous pouvez déjà voir le rendu tout de suite :

    ```sh
    wlt serve
    ```
    
    Puis rendez-vous sur http://localhost:4000
    
    Et voilà, votre blog est en route !

4. Créer un dépôt git (utile pour plein de raisons, entre autre pour l'édition)

    ```sh
    git init
    git add .
    git ci -m "Initial scaffold"
    ```

5. Un peu de configuration

    Editez le fichier `config.yaml`. La configuration est plutôt simple et claire.
    
    Editez le fichier `_pub/robots.txt` pour changer l'adresse du fichier sitemap.
    
    Si vous voulez utiliser le déploiement via [rake][] ajoutez une clé `deploy_to`. Vous pouvez voir l'usage dans le fichier `Rakefile`.

6. Editez le contenu, ajoutez un post, etc.

    Si vous voulez éditer un contenu existant (et versionné dans git) le plus simple est d'utiliser [gollum][] :
    
    ```sh
    wlt gollum
    ```
    
    Puis rendez-vous sur http://localhost:4567/pages
    
    Vous pouvez aussi éditer le fichier [markdown][] à la main.
    
    Si vous voulez créer un nouveau post, facile :
    
    ```sh
    touch _posts/2013-01-29-web-log-today-say-cool.md
    git add _posts/2013-01-29-web-log-today-say-cool.md
    git ci -m "Add new post"
    wlt gollum
    ```
    
    Ha oui, faites attention à un point : [gollum][] commit dans git lorsque vous enregistrez.

7. Un peu plus loin ?

    ```sh
    wlt serve &
    guard
    ```
    
    Comme ça, vous pouvez éditez vos fichiers, et voir le rendu en même temps sans relancer les commandes à la main.

8. Publication

    Si votre serveur permet de faire du rsync, facile :
    
    ```sh
    rake deploy
    ```
    
    Et voilà, c'est dispo !

Alors, trop facile, non ?

## Mot de la fin

Et voilà, c'est la fin de la prez. Alors, vous voyez bien que le html c'est surfait !

Comme quoi, on part d'un besoin tout bête, faire une page web tout simple, et on arrive à un générateur de site et blog statique top moumoute à base de [ruby][], [markdown][] et plein de trucs trop cool.

Ha oui, le tout est sous licence BSD, donc faites vous plaisir.

Il reste pas mal de taff, par exemple améliorer vraiment la partie ruby, enfin les objets utilisés côté [haml][] surtout. Et rajouter des tests aussi, j'aimerais bien le blinder de rspec.

Donc voilà, je ne sais pas comment ce petit soft évoluera, la principal étant qu'il répond à mon propre besoin.

## Il ne manquerait pas un truc ?

Ha oui, l'url à laquelle trouver tout cela : https://github.com/CrEv/wlt

[episode1]: http://log.winsos.net/2012/12/03/ecrire-une-page-web-de-nos-jours.html
[episode2]: http://log.winsos.net/2012/12/05/ecrire-une-page-web-de-nos-jours-suite-des-aventures.html
[episode3]: http://log.winsos.net/2013/01/02/02-ecrire-une-page-web-de-nos-jours-troisieme-partie.html
[haml]: http://haml.info
[git]: http://git-scm.com
[markdown]: http://daringfireball.net/projects/markdown/
[ruby]: http://ruby-lang.org
[gem]: http://rubygems.org
[guard]: https://github.com/guard/guard
[rake]: http://rake.rubyforge.org/
[sass]: http://sass-lang.com/
[coffeescript]: http://coffeescript.org/
[bundler]: http://gembundler.com/
[redcarpet]: https://github.com/vmg/redcarpet
[gollum]: https://github.com/github/gollum
[jekyll]: jekyllrb.com
[sprockets]: https://github.com/sstephenson/sprockets
[yaml]: http://www.yaml.org/
[rake]: http://rake.rubyforge.org/
[sub]: https://github.com/37signals/sub
