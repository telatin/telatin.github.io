---
title: SeqFu
subtitle: A general-purpose program to manipulate and parse FASTX (FASTA and FASTQ) files
description: A compiled toolkit providing fast utilities for common operations on FASTA/FASTQ files, including counting, dereplicating, interleaving, and more.
featured_image: /images/demo/demo-landscape.jpg
---

## Overview

**SeqFu** is a compiled program designed to provide a broad range of utilities for the
manipulation of FASTA and FASTQ files, from format conversion to sequence extraction
and statistics.

Written in Nim, SeqFu is fast and memory-efficient, making it suitable for both
interactive use and large-scale bioinformatics pipelines.

## Key Features

- **seqfu stats** -- print sequence statistics from multiple files
- **seqfu count** -- count sequences in FASTA/FASTQ files
- **seqfu derep** -- dereplicate sequences
- **seqfu interleave / deinterleave** -- interleave or deinterleave paired-end reads
- **seqfu cat** -- concatenate FASTA/FASTQ files with filtering options
- **seqfu head / tail** -- extract the first or last sequences
- **seqfu grep** -- extract sequences by name or pattern
- **seqfu rc** -- reverse complement sequences
- **seqfu sort / tabulate / view** -- organise and inspect sequences

## Installation

SeqFu can be installed via Bioconda:

```bash
conda install -c bioconda seqfu
```

## Example Usage

Print statistics for a set of FASTQ files:

```bash
seqfu stats *.fastq.gz
```

Count sequences across multiple files:

```bash
seqfu count data/*.fq.gz
```

Dereplicate a FASTA file:

```bash
seqfu derep --min-size 2 input.fasta > unique.fasta
```

## Links

- [GitHub Repository](https://github.com/telatin/seqfu2)
- [Documentation](https://telatin.github.io/seqfu2/)
- [Bioconda Package](https://bioconda.github.io/recipes/seqfu/README.html)
