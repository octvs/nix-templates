{
  description = "nix templates for convenience";

  inputs.nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

  outputs = {nixpkgs, ...}: let
    sys = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${sys};
  in {
    packages.${sys} = import ./pkgs pkgs;
    templates = {
      doortag.path = ./templates/tex/doortag;
      eisvogel.path = ./templates/tex/eisvogel;
      letter.path = ./templates/tex/letter;
      python.path = ./templates/python;
      typst-base.path = ./templates/typst/base;
      typst-letter.path = ./templates/typst/letter;
      typst-name-tag.path = ./templates/typst/name-tag;
    };
  };
}
