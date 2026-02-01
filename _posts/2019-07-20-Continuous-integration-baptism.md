---
layout: post
title: Continuous integration can be addictive
---

After praising the romantic structure of the **Perl testers grid**, last week
I started using [Travis CI](https://travis-ci.org/telatin):
> Travis CI is a hosted continuous integration service used to build and test software projects hosted at GitHub.

To get started you just need to prepare the configuration file, called `.travisci.yml`, in your GitHub repository,
and specify the range of hosts and tests that you plan. For a Perl module this can be as simple as:

    language: perl
    perl:
      - "5.14"
      - "5.16"
      - "5.18"
      - "5.22"
      - "5.26"
      - "5.28"
      - "5.30"
    sudo: false
    install:
      - "source ./setup.sh"
    script: "dzil test --verbose"


When you connect your repository to GitHub, you'll be then gifted with a [full test at every single commit](https://travis-ci.org/telatin/FASTQ-Parser/builds).
