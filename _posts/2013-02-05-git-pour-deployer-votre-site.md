---
layout: post
tags: [git, web_log_today]
title: Git pour deployer votre site
author: Yves
email: yves.brissaud@gmail.com
twitter: _crev_
published: false
---

```sh
git clone --bare ./your-repo your-repo.git
```

```sh
cp ~/.wlt/tools/pre-receive your-repo.git/hooks/
```

```sh
ssh plop@server -c "mkdir ~/your-repo.git"
rsync -a --stats --delete ./your-repo.git/ plop@server:~/your-repo.git/
```

```sh
git remote add deploy ssh://plop@server/home/plop/your-repo.git
```

```sh
git push deploy master
```