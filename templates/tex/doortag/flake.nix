{
  inputs.nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

  outputs = {nixpkgs, ...}: let
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};
    tex = pkgs.callPackage ./tex-env.nix {};
  in {
    devShells.${system}.default = pkgs.mkShell {
      buildInputs = [tex];
    };
  };
}
