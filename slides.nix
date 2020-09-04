{ pkgs ? import <nixpkgs> {} }:

pkgs.stdenv.mkDerivation rec {
	name = "pycon2020-slides";
	src = ./slides.odp;
	dontUnpack = true;
	dontConfigure = true;

	nativeBuildInputs = [ pkgs.libreoffice ];	
	buildPhase = ''
		ln -s $src $name.odp
		${ pkgs.libreoffice }/bin/soffice \
			--headless --convert-to pdf \
			--outdir . \
			$name.odp
	'';
	installPhase = "mkdir -p $out/share && mv $name.pdf $out/share/";
	#installPhase = "mkdir -p $out/share && mv slides.pdf $out/share";
}
	
