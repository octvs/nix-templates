{
  description = "A Typst project";

  inputs.typix.url = "github:loqusion/typix";

  outputs = {typix, ...}: let
    system = "x86_64-linux";
    typixLib = typix.lib.${system};
    args = {
      name = "make";
      typstSource = "main.typ";
      fontPaths = [
        # "${pkgs.roboto}/share/fonts/truetype"
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
