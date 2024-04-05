{
  description = "A list of templates I use";

  outputs = { self, ... }: {
    templates = {
      base = {
        path = ./base;
        description = "A small template with the system setup";
      };

      rust-wasm = {
        path = ./rust-wasm;
        description = "A template to compile Rust with a WASM target";
      };

      polars-py = {
        path = ./polars-py;
        description = "A simple polars python setup";
      };
    };
  };
}
