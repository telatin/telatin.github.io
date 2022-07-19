---
layout: post
title: Configuring an Intel (rosetta) terminal inside your M1 optimized VS Code
---

With M1 chips, Apple started shipping ARM processor for their hi-end machines, including the fantastic MacBook Pro, which
features a nice keyboard (physical function buttons), HDMI port and SD reader, a 20 hours battery life and very good
performances overall.

The transition to the new architecture is seamless thanks to an emulation layer called *Rosetta* which allows to run 
binaries compiled for Intel Macs on M1 Macs, but of course to have the best possible performance, one would like to find
a good fraction of *native* software.

[Visual Studio Code](https://code.visualstudio.com/) now supports M1 natively, but this implies that, by default, its terminal
will be running M1 compiled software.

To allow the creation of `x86` terminals, you can add to your `settings.json` (`Cmd`-`P`, then type *>User settings*):

```json
    "terminal.integrated.profiles.osx": {
        "x86 zsh": {
            "path": "/usr/bin/arch",
            "args": ["-arch", "x86_64", "/bin/zsh"]
        }
    }
  ```
  
  
