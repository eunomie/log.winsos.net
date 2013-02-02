---
layout: post
tags: [web_log_today, github]
title: Les HIG say bien
author: Yves
email: yves.brissaud@gmail.com
twitter: _crev_
published: false
---

> [Human interface guidelines (HIG)][hig] are software development documents which offer application developers a set of recommendations. Their aim is to improve the experience for the users by making application interfaces more intuitive, learnable, and consistent.

Voici pour la définition wikipedia. Les [HIG][hig] sont là pour permettre d'avoir un ensemble cohérent d'applications dans un même environnement. Cela est possible en définissant un certain nombre de règles à respecter. Au delà du côté graphique, ce qui est important est qu'on s'assure que toutes les applications utilisent les même métaphores.

Le point important derrière est qu'une nouvelle application, que vous ne connaissez pas, devient alors presque intuitive. Une fois que vous maitrisez les métaphores, les principes d'une plateforme, une nouvelle application en devient facile puisqu'elle utilise les mêmes principes.

Les [HIG][hig] sont donc primordiales pour que votre plateforme ne ressemble pas à un beau bordel où toutes les applications font les choses différemment. Par exemple, comment placer les boutons ok/annuler ? À gauche, à droite ? ok / annuler ou annuler / ok ? Des phrases, des verbes, ... ?

On voit d'ailleurs très bien le problème sous windows où ce n'est pas tellement cohérent, mais aussi sous linux du moment qu'on utilise des programmes venant de plusieurs environnements (par exemple si on mixe kde et gnome).

Par contre, lorsque vous utilisez un mac, vous avez au contraire une assez bonne impression d'uniformité, de cohérence. Et cela rend l'utilisation vraiment agréable. Mais cela est en partie du au fait que Apple fourni depuis longtemps des [HIG][hig] très correctes. Windows le fait de mieux en mieux, même si je les trouve assez peu lisibles. Android est plutôt pas mal, plus au niveau d'Apple que de Windows.

Les environnements libres sont par contre vraiment à la traine je trouve. Et s'en est triste. Une cohérence est nécessaire pour avoir une interface agréable, simple, intuitive et cohérente avec l'utilisateur. Lorsqu'on parle de facilité d'accès à une plateforme, la cohérence est un point très important.

Tout ça pour dire, si vous développez sur une plateforme, quelqu'elle soit, commencez par lire les [HIG][hig] disponibles. Si elles n'existent pas, alors essayez tout de même de respecter le plus possible les règles implicites. Et aussi, faire des applications multiplateformes (par exemple windows / mac / linux, mais aussi android / ios) est presque une abération. Au mieux vous aurez simplement une application qui ne s'intègre nul part...

Voici quelques [HIG][hig] à connaître :

* [Windows vista et 7][win7]
* [Windows 8 et RT][win8]
* [Windows phone][winphone]
* [Mac][mac]
* [iOS][ios]
* [Android][android]

[hig]: http://en.wikipedia.org/wiki/Human_interface_guidelines
[win7]: http://msdn.microsoft.com/en-us/library/Aa511258.aspx
[win8]: http://msdn.microsoft.com/en-us/library/windows/apps/hh465424.aspx
[winphone]: http://msdn.microsoft.com/en-us/library/hh202915%28v=VS.92%29.aspx
[mac]: https://developer.apple.com/library/mac/#documentation/userexperience/Conceptual/AppleHIGuidelines/Intro/Intro.html
[ios]: http://developer.apple.com/library/ios/#documentation/userexperience/conceptual/mobilehig/Introduction/Introduction.html
[android]: http://developer.android.com/design/index.html
