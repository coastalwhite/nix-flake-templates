{
  description = "A list of templates I use";

  outputs = { self, ... }: {
	templates = {
	  polars-py = {
		path = ./polars-py;
		description = "A simple polars python setup";
	  };
	};
  };
}
