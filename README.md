# Nix Flake Templates

This is a set of Nix Flake templates I use during my work. This is based on [this article].

[this article]: https://peppe.rs/posts/novice_nix:_flake_templates/

## Usage

```bash
nix registry add coastalwhite github:coastalwhite/nix-flake-templates
```

Then you can start a new layout with:

```bash
nix flake init -t coastalwhite#<template name>
# e.g.
nix flake init -t coastalwhite#polars-py
```