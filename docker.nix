let
	overlay = self: super: {
		mypythonapp = self.poetry2nix.mkPoetryApplication {
			projectDir = ./.;
			python = self.python3;
		};
	};
	hostPkgs  = import <nixpkgs> { overlays = [ overlay ]; };
	linuxPkgs = import <nixpkgs> {
		overlays = [ overlay ]; system = "x86_64-linux"; };
in
{
	inherit (hostPkgs) mypythonapp;
	docker = hostPkgs.dockerTools.buildLayeredImage {
		name = "mypythonapp";
		contents = [ linuxPkgs.mypythonapp ];
		config.Cmd = [ "mypythonapp" ];
	};
}
