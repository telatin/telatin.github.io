---
layout: post
title: New adventures in CPAN
---

This April I started using `Dist::Zilla` aka _Maximum overkill for CPAN Authors_.

Dist::Zilla is just a package the helps packaging Perl modules, but in my small
journey in making my first modules, Dist::Zilla really deserves a mention in being
so useful than the hard alternatives (doing everything by hand), and at the same
time so painful and complex to deserve its tag line.

There are so many things that I learned with my small CPAN journey that I really
consider it the second major milestone in my Perl development career:

### Structured unit tests

While I started implementing _naive_ unit tests a while ago, and they really save your life,
[using modules](http://www.jmdeldin.com/bioinf/testing/index.html)
 and the test suite provided by Perl ensures adoption of a better 
coding pattern, easier to be inspected by others.

In this context, when you submit your module to CPAN, it will enter the **CPAN Test grid**
where hundreds of volunteer will test your module using their configuration (Perl verion,
installed modules ecc). This is the grandfather of cloud-virtualized test suites like
CircleCI. Definitely more romantic.

My _"aaaahhh"_ moment was having a test failing because of a subroutine that I no longer used
and didn't update to manage new data...

### Code coverage

When you start writing your tests it can be difficult to decide what is important to test.
Having a report on the test coverage is definitely a good way to keep improving your
tests.

### Using Modules

When you start making your first modules, you get more connected to the CPAN universe and
discover new modules every week. And you can start evaluating them in a more critic way
checking not only how often are they updated, but also ... their tests :)

[My CPAN author page](https://metacpan.org/author/PROCH?sort=[[3,1]])
