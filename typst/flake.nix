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

        typstBaseName = "main";
      in rec {
        packages.default = packages.doc;
        devShells.default = devShells.doc;

        packages.doc = pkgs.stdenv.mkDerivation {
          name = "typst-doc";
          src = ./.;

          buildPhase = ''
            ${pkgs.typst}/bin/typst compile ${typstBaseName}.typ
          '';

          installPhase = ''
            mkdir -p $out/
            cp ${typstBaseName}.pdf $out/${typstBaseName}.pdf
          '';
        };
        devShells.doc = pkgs.mkShell {
          nativeBuildInputs = with pkgs; let
            typWatch = writeShellScriptBin "typ-watch" "exec ${pkgs.typst}/bin/typst watch ${typstBaseName}.typ";
            typBuild = writeShellScriptBin "typ-build" "exec ${pkgs.typst}/bin/typst compile ${typstBaseName}.typ";
            typOpen  = writeShellScriptBin "typ-open"  "exec ${pkgs.xdg-utils}/bin/xdg-open ${typstBaseName}.pdf";
            typWOpen = writeShellScriptBin "typ-wopen" ''
              ${typBuild}/bin/typ-build
              ${typWatch}/bin/typ-watch &
              exec ${typOpen}/bin/typ-open
            '';
          in [
            typst
            typWatch
            typBuild
            typOpen
            typWOpen
          ];

          shellHook = ''
            echo 'Started a development environment for Typst.'
            echo 'Aliases:'
            echo ' - typ-watch: Watch and build ${typstBaseName}.typ'
            echo ' - typ-build: Compile ${typstBaseName}.typ'
            echo ' - typ-open:  Open the result of ${typstBaseName}.typ'
            echo ' - typ-wopen: Watch and open the result of ${typstBaseName}.typ'
          '';
        };
      }
    );
}