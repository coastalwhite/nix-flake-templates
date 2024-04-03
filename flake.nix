{
  description = "A list of templates I use";

  outputs = { self, ... }: {
	templates = {
	  base = {
		path = ./base;
		description = "A small template with the system setup";
	  };
	  polars-py = {
		path = ./polars-py;
		description = "A simple polars python setup";
	  };
	};
  };
}
