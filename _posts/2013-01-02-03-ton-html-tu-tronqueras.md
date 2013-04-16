---
layout: post
tags : [dev, ruby, linuxfr, web_log_today]
title: Ton html tu tronqueras !
author: Yves
email: yves.brissaud@gmail.com
twitter: _crev_
nolinks: true
---

Comme vous l'avez probablement remarqué, la _description_ associée à chaque billet à légèrement changée sur la page d'index. Précédemment il s'agissait d'un champ ajouté aux méta données de chaque post. C'est plutôt fiable, mais pas pratique du tout, oblige à saisir deux fois, etc.

Heureusement, [linuxfr](https://linuxfr.org/news/statistiques-2012-du-site-linuxfr-org#toc_6) est, comme souvent, venu à mon secours !

La description/résumé/extrait est désormais réalisée en utilisant [HTML_truncator](https://github.com/nono/HTML-Truncator). J'y ai juste rajouté la possibilité de supprimer toutes les balises car je n'en voulais pas.

```ruby
require "html_truncator"

# ...

def excerpt striphtml = false
  truncate = HTML_Truncator.truncate content, 30
  truncate.gsub!(/<[^>]+>/, '') if striphtml
  return truncate
end

# ...
```

Trop facile, non ! (et merci [NoNo](https://github.com/nono))