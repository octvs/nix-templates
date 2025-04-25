{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nix-templates = {
      url = "github:octvs/nix-templates";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    nixpkgs,
    nix-templates,
    ...
  }: let
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};
    letter = nix-templates.packages.${system}.letter;
  in {
    devShells.${system}.default = pkgs.mkShell {
      buildInputs = [letter];
      TEMPLATE = "${letter}/letter.latex";
      TEMPLATEDOC = "${letter}/README.md";
    };
  };
}
