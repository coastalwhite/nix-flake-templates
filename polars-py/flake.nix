{
  description = "A very basic flake with Polars in Python";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs";
  };

  outputs = { self, nixpkgs }: 
  let 
  	 system = "x86_64-linux";
	 pkgs = nixpkgs.legacyPackages.${system};
  in {
	devShells.${system}.default = pkgs.mkShell {
		packages = with pkgs; [
			(python3.withPackages ( python-pkgs: with python-pkgs; [
				polars
				matplotlib
			]))
		];
	};
  };
}
