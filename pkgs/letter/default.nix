{
  stdenvNoCC,
  fetchFromGitHub,
  callPackage,
  pandoc,
  ...
}:
stdenvNoCC.mkDerivation {
  name = "letter";
  version = "0-unstable-2022-12-26";

  src = fetchFromGitHub {
    owner = "benedictdudel";
    repo = "pandoc-letter-din5008";
    rev = "f1a9c37a413afbee121e5c25aeed3e3389120d78";
    hash = "sha256-yTuN8RwhPjpFaL8T2Kgy/gX3eIB5Z/QBgALhdMLaqLM=";
  };

  propagatedBuildInputs = [(callPackage ./tex-env.nix {}) pandoc];

  installPhase = ''
    runHook preInstall
    mkdir -p $out
    install letter.latex README.md $out
    runHook postInstall
  '';
}
