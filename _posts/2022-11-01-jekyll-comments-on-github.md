---
layout: post
title: Adding a comments section in Github pages
---

Some Jekyll templates have an easy integration with Disqus to allow
users to leave some feedback, but I wanted to avoid a 
[very (personal) data hungry tool](https://webmasters.stackexchange.com/questions/105808/is-adding-disqus-to-website-safe-for-user-privacy).

Looking for alternatives I stumbled upon 
:star: [**Utterances**](https://utteranc.es), which uses GitHub issues to store the comments.

For a proper blog or social website this might be not the best option, but for technical
websites that I tend to host on Github pages, why not?

Moreover, instead of authenticating via Twitter or Google, the user has to authenticate
via GitHub. This to me is a feature :)

I tried the plugin in my *Bioinformatics training* website: see
[an example page here](https://telatin.github.io/microbiome-bioinformatics/Bash-course/).
