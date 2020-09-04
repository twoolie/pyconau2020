let nixpkgs = (builtins.fetchTarball {
	# Descriptive name to make the store path easier to identify
	name = "nixos-unstable-2020-08-21";
	# Commit hash for nixos-unstable as of 2020-08-21
	url = "https://github.com/nixos/nixpkgs/archive/c59ea8b8a0e7f927e7291c14ea6cd1bd3a16ff38.tar.gz";
	# Hash obtained using `nix-prefetch-url --unpack <url>`
	sha256 = "1ak7jqx94fjhc68xh1lh35kh3w3ndbadprrb762qgvcfb8351x8v";
});
in { pkgs ? import nixpkgs {} }:

pkgs.mkShell {
	buildInputs = [
		(pkgs.python38.withPackages (ps: with ps; [ lxml GeoIP flask ]))
	];
}

#pkgs.mkShell {
  # this will make all the build inputs from hello and gnutar
  # available to the shell environment
#  inputsFrom = with pkgs; [ hello gnutar ];
#  buildInputs = [ pkgs.gnumake ];
#}
