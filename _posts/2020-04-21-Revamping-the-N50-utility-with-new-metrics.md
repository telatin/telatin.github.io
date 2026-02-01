---
layout: post
title: Revamping the N50 utility with new metrics
---

My first Perl Module has been an [N50 calculator](https://metacpan.org/pod/Proch::N50), that 
to me is sort of an _Hello World_ considering I spent most of my PhD trying to improve one
(lovely) assembly.

I tried to make its bundled utility, called simply **n50**, useful both for interactive sessions
and for scripts, and the utility itself has been my first tool packaged in [bioconda](https://anaconda.org/bioconda/n50).

But... a script that does a relatively small set of things, does it really need to be packaged with a module for its 
calculations?

### A new metric added in no time

On April 8th, Heng Li [posted a comment](https://lh3.github.io/2020/04/08/a-new-metric-on-assembly-contiguity) on a "new" 
metric to evaluate assemblies, that he called **auN**,
interpreted as the area under the _Nx_ curve.

On April 9th the new metric was already added to the [Proch::N50](https://metacpan.org/changes/distribution/Proch-N50) 
module, and its **n50** utility, and the day after it was (automatically) available on **Bioconda**, so that a simple

```
conda update -c bioconda n50
```

can bring this glorious new output:
```
.-------------------------------------------------------------------------------------------------.
| File                  | Seqs | Total bp  | N50    | min | max     | N75    | N90    | auN       |
+-----------------------+------+-----------+--------+-----+---------+--------+--------+-----------+
| PID_0175_1_ctgs.fasta |  149 | 2,178,533 | 46,875 | 107 | 137,557 | 20,673 | 10,425 | 51,415.06 |
| PID_0175_5_ctgs.fasta |  138 | 2,173,292 | 46,425 | 107 | 133,990 | 20,547 | 10,933 | 51,060.62 |
| PID_0175_2_ctgs.fasta |  154 | 2,169,751 | 44,475 | 107 | 121,712 | 20,547 | 10,730 | 49,174.07 |
| PID_0175_3_ctgs.fasta |  148 | 2,170,823 | 44,409 | 107 | 104,016 | 22,741 | 10,730 | 46,608.66 |
| PID_0175_4_ctgs.fasta |  153 | 2,170,404 | 43,522 | 107 | 104,016 | 17,386 | 10,399 | 45,262.04 |
| PID_0175_6_ctgs.fasta |  147 | 1,976,499 | 39,640 | 104 | 137,087 | 19,763 | 10,509 | 48,284.94 |
'-----------------------+------+-----------+--------+-----+---------+--------+--------+-----------'
```

(plus the usual JSON, CSV, TSV outputs, the ability to sort by different columns etc...)

All of this has been possible with limited edits thanks to a better organization of the code, but intimately
believed it was only true for larger projects when multiple developers needs to coordinate their work.

I heard this so many times when I started and it's nice to see that it can be true also for smaller projects.
