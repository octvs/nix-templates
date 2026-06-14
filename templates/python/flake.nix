{
  description = "Python application flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    flake-parts.url = "github:hercules-ci/flake-parts";
    systems.url = "github:nix-systems/default";
    treefmt-nix = {
      url = "github:numtide/treefmt-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs:
    inputs.flake-parts.lib.mkFlake {inherit inputs;} ({...}: {
      imports = [inputs.treefmt-nix.flakeModule];
      systems = import inputs.systems;
      perSystem = {pkgs, ...}: let
        dependencies = with pkgs.python3.pkgs; [numpy];
      in {
        packages.default = pkgs.python3Packages.buildPythonApplication {
          pname = "foo";
          version = "0-unstable";
          pyproject = true;
          src = ./.;
          build-system = with pkgs.python3.pkgs; [setuptools];
          inherit dependencies;
        };
        treefmt = {
          projectRootFile = "flake.nix";
          programs.ruff-format = {
            enable = true;
            lineLength = 79;
          };
        };
      };
    });
}
