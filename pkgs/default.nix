{pkgs, ...}: {
  eisvogel = pkgs.callPackage ./eisvogel {};
  letter = pkgs.callPackage ./letter {};
}
