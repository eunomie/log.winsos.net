---
layout: post
tags: [humeur, twitter]
title: "Réduction de la voilure sur twitter"
author: Yves
email: yves@brissaud.name
twitter: _crev_
published: true
image: 2013/05/15/twitter-bird-light-bgs.png
---

Ça fait un petit moment que j'ai un compte sur twitter. Au début c'était surtout un outil de veille. C'est plutôt pratique, on peut suivre beaucoup de personnes, il y a beaucoup de choses intéressantes à lire, à apprendre, à découvrir.

![twitter](twitter-bird-light-bgs.png)

Et puis j'ai commencé à l'utiliser un peu plus _normalement_, à papoter un peu dessus. Avec des gens, pour publier des contenus ou pour raconter ma vie, mais ça on s'en fout.

Justement, ça on s'en fout. Et oui, l'un des problèmes de twitter c'est le bruit. Il y a beaucoup de bruit. Beaucoup trop. Et moi-même j'y contribue. Et parfois c'est fatiguant.

Un autre problème majeur, mais qui fait aussi tout l'intérêt de twitter, c'est sa concision. 140 caractères. Ça ne fait pas beaucoup. C'est bien suffisant pour pas mal de choses, mais en réalité assez limitant. Impossible d'avoir une vrai discussion, d'avoir un vrai contenu.

Enfin, dernier problème pour moi, pas des moindres, c'est qu'aujourd'hui il y a beaucoup trop de canaux de communication. Je suis sur facebook (privé uniquement), [google plus][accounts_gplus], [twitter][accounts_twitter], [github][accounts_github], [viadéo][accounts_viadeo] (que je pense à fermer), [linkedin][accounts_linkedin], [coderwall][accounts_coderwall], [linuxfr][accounts_linuxfr], irc (freenode), sur trois messageries instantanées, et j'utilise quotidiennement 4 adresses mails perso. Ha oui, et j'ai aussi une série de flux RSS intéressants pour ma veille. Et mon blog également.

De tout cela apparait deux choses :

- une duplication d'informations importante : entre twitter, mes rss, g+, … il m'arrive fréquemment de recevoir plusieurs fois la même information
- une dispersion d'informations importante : une perte de temps monstrueuse à passer d'un outil à un autre, de discuter à droite, à gauche sans vraiment de pont entre tout ça

Au final c'en est usant. Fatiguant de devoir passer d'un endroit à un autre. Fatiguant car trop d'informations par certains côtés.

Je pense qu'il est donc temps de réduire la voilure. Et c'est twitter qui va trinquer. Mon compte vient donc de passer dans un mode un peu plus spécial. J'ai désormais mis en place [OnlineMemory](https://github.com/edas/OnlineMemory). Il s'agit d'un petit script ruby qui va réaliser les choses suivantes :

* trouver tous les tweets vieux de plus de 48h
* archiver ces tweets
* supprimer les tweets

(si vous avez plus de 3200 tweets allez lire la doc)

Et j'ai juste rajouté une chose : je conserve les tweets qui contiennent une url en direction de mon blog. Tous les autres agés de plus de 48h sont supprimés.

L'autre changement au niveau de mon compte a été simplement de supprimer un certain nombre d'abonnements.

De cette manière, j'espère changer ma manière d'utiliser twitter, et de la limiter à principalement deux aspects :

- diffuser certains articles qui me paraissent intéressant, publiés sur mon blog
- uniquement de la discussion à court terme, sans mémoire, juste pour échanger succinctement avec d'autres

L'une des conséquences sera peut-être de me voir un peu plus actif sur Google plus — je l'étais plus avant que j'utilise twitter — qui permet des échanges sous une autre forme, entre autre grâce à la non limitation de taille. Mais j'espère surtout que ça va me permettre de réduire un peu le bruit arrivant jusqu'à moi pour me concentrer sur des choses plus importantes / intéressantes.

Disons que c'est ça ou je vais finir par fermer mon compte `;-)`
