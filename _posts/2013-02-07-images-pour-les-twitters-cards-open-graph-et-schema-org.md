---
layout: post
tags: [web_log_today, twitter]
title: Images pour les twitter cards, open graph et schema.org
author: Yves
email: yves.brissaud@gmail.com
twitter: _crev_
image: 2013/02/07/og_logo.png
nolinks: true
---

Petite amélioration rapide de [Web Log Today][wlt].

J'ai simplement rajouté le support des images dans les meta [twitter cards][], [opengraph][] et [schema.org][].

Dans le `header` de votre post, il suffit de rajouter une ligne du genre :

```yaml
image: chemin de l'image depuis la racine du site
```

Par exemple, pour ce billet :

```text
image: 2013/02/07/og_logo.png
```

Le code généré, inclus dans la balise `head` sera :

```html
<meta content='http://log.winsos.net/2013/02/07/og_logo.png' name='twitter:image' />
<meta content='http://log.winsos.net/2013/02/07/og_logo.png' name='og:image' />
<meta content='http://log.winsos.net/2013/02/07/og_logo.png' itemprop='image' />
```

L'url de l'image doit être relative à la racine du site, du fait de l'usage de la méthode `link_to` qui permet justement de passer l'url en absolue.

A noter que pour que twitter autorise l'affichage des cartes en provenance de votre site, il faut en faire la demande à l'url https://dev.twitter.com/form/participate-twitter-cards et vous receverez une réponse sous 5 à 10 jours ouvrés. Et be, je savais pas qu'ils étaient si tatillons... En attendant vous pouvez tester vos url en utilisant le [twitter card tester][].


[wlt]: https://github.com/eunomie/wlt
[twitter cards]: https://dev.twitter.com/docs/cards
[opengraph]: http://ogp.me/
[schema.org]: http://schema.org
[twitter card tester]: https://dev.twitter.com/docs/cards/preview
