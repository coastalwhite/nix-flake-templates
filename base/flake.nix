{
  description = "A basic Nix Flake for eachDefaultSystem";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs";
    utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, utils }:
    utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs { inherit system; };
      in {
          packages.hello = pkgs.hello;
          packages.default = pkgs.hello;
      }
    );
}