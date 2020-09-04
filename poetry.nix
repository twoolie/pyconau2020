{ pkgs ? import <nixpkgs> {} }:

let pythonEnv = pkgs.poetry2nix.mkPoetryEnv {
	python = pkgs.python38;
	projectDir = ./.;
};
in pkgs.mkShell {
	buildInputs = [ pythonEnv ];
}
