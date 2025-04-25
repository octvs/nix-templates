{
  description = "nix templates for convenience";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
  };

  outputs = {nixpkgs, ...}: let
    sys = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${sys};
  in {
    packages.${sys} = import ./pkgs pkgs;
    templates = {
      doortag.path = ./templates/tex/doortag;
      eisvogel.path = ./templates/tex/eisvogel;
      python.path = ./templates/python;
    };
  };
}
