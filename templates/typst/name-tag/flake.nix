{
  description = "A Typst project";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs";
    typix = {
      url = "github:loqusion/typix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    nixpkgs,
    typix,
    ...
  }: let
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};
    typixLib = typix.lib.${system};
    args = {
      name = "make";
      typstSource = "main.typ";
      fontPaths = [
        "${pkgs.roboto-slab}/share/fonts/truetype"
      ];
      virtualPaths = [
        # { dest = "icons"; src = "${inputs.font-awesome}/svgs/regular"; }
      ];
    };
  in {
    devShells.${system}.default = typixLib.devShell {
      inherit (args) fontPaths virtualPaths;
      packages = [(typixLib.watchTypstProject args)];
    };
  };
}
