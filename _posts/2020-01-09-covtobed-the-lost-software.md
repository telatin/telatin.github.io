---
layout: post
title: covtobed, the lost software
---

[![CovToBed banner](https://github.com/telatin/covtobed/raw/master/img/coverage_bam_to_bed.png)](https://github.com/telatin/covtobed)

Back in 2014 I was working on a large (for the time) set of *Target Enrichment* panels.
For the set up of the panels we wanted to check that the regions we wanted were effectively
captured, and I started using some standard tools (like `samtools`, `bedtools`...) but that
resulted in quite a slow step to be performed several times.

So I asked my talented colleague Giovanni if he could help with his C++ skills, and indeed
a program called **coverage** was born in a matter of a day. Using a library to parse BAM files
(`libbamtools-dev`) I could feed a sorted BAM file, the target BED and obtain a BED output
with the covered regions.

Every now and then I asked some new features, namely a lot of statistics to save time doing
the maths later (like: multiple BAM file support,
% of the target covered 0X, <10X, <20X ...). And the program became
more and more complex, at the point that during a series of accidents (both of us moving,
end of Target Enrichment projects and so and forth...), the source became complex to maintain,
forgotten and finally lost.

That became a good lesson for both of us.

From the ashes of that doomed project we summoned **covtobed**, that we designed:

 * To adhere to the UNIX programming style, working with streams
 * To be finally easy to install (distributed with [Miniconda](https://docs.conda.io/en/latest/miniconda.html) and [Docker](https://hub.docker.com/u/andreatelatin))
 * Simplified to avoid aving a big blob again

If you want to try it, installing is thus as easy as:
```
conda install -y bioconda covtobed
```

And the documentation is now in a [GitHub Wiki](https://github.com/telatin/covtobed/wiki).

