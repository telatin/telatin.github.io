---
title: The Nim programming language for bioinformatics
tags:
  - coding
---

I first heard of **nim** discovering [mosdepth](https://github.com/brentp/mosdepth), a fantastic program to extract coverage information from alignments. I just thought it was a bizarre choice and never thought again about it...until also [Heng Li blogged](https://lh3.github.io/2020/05/17/fast-high-level-programming-languages) about fast programming languages for bioinformatics.

I started my best journey in a programming language.

<!--more-->

My notes on the journey are available at:
<p class="d-flex align-items-center">
    
    <span class="icon red ml-2">
        {% include entypo/book.svg %}
    </span>
    <strong><a href="https://telatin.github.io/nim-for-bioinformatics/">Nim for Bioinformatics</a>, e-book</strong>
</p>


### Pros

* It's a compiled language that can bring significant performance
* Nim compiles your source to C (or other...) and then C is compiled to binary, this means...
* Very easy importing of C libraries (e.g. [htslib/samtools](https://github.com/brentp/hts-nim/))
* Python-like syntax, easy to pick up
* Your compiled program will run in any machine, easy to share small utilities if compared with Python (where version and libraries hell are still there)

### Cons

* Not super mature, and it's probably the time to discover design errors
* Limited amount of "bio*" libraries
* Can be harder to debug
