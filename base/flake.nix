{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs";

    utils = {
        url = "github:numtide/flake-utils";
        inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, utils }:
    utils.lib.eachDefaultSystem (system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
      in {
          packages.hello = nixpkgs.legacyPackages.x86_64-linux.hello;
          packages.default = self.packages.x86_64-linux.hello;
      }
    );
}