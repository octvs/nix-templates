{
  description = "nix templates for convenience";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    flake-parts.url = "github:hercules-ci/flake-parts";
  };

  outputs = inputs:
    inputs.flake-parts.lib.mkFlake {inherit inputs;} {
      flake.templates = {
        doortag = {
          path = ./templates/tex/doortag;
          description = "template for making tags via tex";
        };
        eisvogel = {
          path = ./templates/tex/eisvogel;
          description = "template for documents via eisvogel tex template";
        };
        letter = {
          path = ./templates/tex/letter;
          description = "template for writing letter via tex";
        };
        python = {
          path = ./templates/python;
          description = "template for python project";
        };
        typst-base = {
          path = ./templates/typst/base;
          description = "template for bare typst project";
        };
        typst-letter = {
          path = ./templates/typst/letter;
          description = "template for writing letter via typst";
        };
        typst-name-tag = {
          path = ./templates/typst/name-tag;
          description = "template for making tags via typst";
        };
      };
    };
}
