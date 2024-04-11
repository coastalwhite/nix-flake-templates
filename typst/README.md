# Typst Documentation

This is a template for a Typst document.

## Usage

This document uses [Typst] to build the final PDF file. When [Typst] is
installed, the final PDF can be compiled with:

```bash
typst compile main.typ
```

### Nix environment

You can use the [Nix] package manager to start a development shell or build the
final PDF.

```bash
# Start a development shell
nix develop

# Build the final pdf
nix build
```

[Typst]: https://typst.app/
[Nix]: https://nixos.org/