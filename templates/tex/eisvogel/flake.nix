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
    eisvogel = nix-templates.packages.${system}.eisvogel;
  in {
    devShells.${system}.default = pkgs.mkShell {
      buildInputs = [eisvogel];
      TEMPLATE = "${eisvogel}/eisvogel.latex";
      TEMPLATEDOC = "${eisvogel}/README.md";
    };
  };
}
