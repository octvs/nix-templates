{
  stdenvNoCC,
  fetchFromGitHub,
  callPackage,
  pandoc,
  ...
}:
stdenvNoCC.mkDerivation {
  name = "eisvogel";
  version = "3.1.0";

  src = fetchFromGitHub {
    owner = "Wandmalfarbe";
    repo = "pandoc-latex-template";
    rev = "v3.1.0";
    hash = "sha256-jwGQMlEGcCOhlHnYAcatJBxB5bquQGLW0U0s8vjf5rI=";
  };

  propagatedBuildInputs = [
    (callPackage ./tex-env.nix {})
    pandoc
  ];

  # Taken from upstream tools/release.sh
  installPhase = ''
    runHook preInstall
    mkdir -p $out

    cp "template-multi-file/eisvogel.latex" "$out/eisvogel.latex"

    sed -e '/\$fonts\.latex()\$/ {' -e 'r template-multi-file/fonts.latex' -e 'd' -e '}' -i "$out/eisvogel.latex"
    sed -e '/\$font-settings\.latex()\$/ {' -e 'r template-multi-file/font-settings.latex' -e 'd' -e '}' -i "$out/eisvogel.latex"
    sed -e '/\$common\.latex()\$/ {' -e 'r template-multi-file/common.latex' -e 'd' -e '}' -i "$out/eisvogel.latex"
    sed -e '/\$eisvogel-added\.latex()\$/ {' -e 'r template-multi-file/eisvogel-added.latex' -e 'd' -e '}' -i "$out/eisvogel.latex"
    sed -e '/\$eisvogel-title-page\.latex()\$/ {' -e 'r template-multi-file/eisvogel-title-page.latex' -e 'd' -e '}' -i "$out/eisvogel.latex"
    sed -e '/\$after-header-includes\.latex()\$/ {' -e 'r template-multi-file/after-header-includes.latex' -e 'd' -e '}' -i "$out/eisvogel.latex"
    sed -e '/\$hypersetup\.latex()\$/ {' -e 'r template-multi-file/hypersetup.latex' -e 'd' -e '}' -i "$out/eisvogel.latex"
    sed -e '/\$passoptions\.latex()\$/ {' -e 'r template-multi-file/passoptions.latex' -e 'd' -e '}' -i "$out/eisvogel.latex"

    # create single template file for beamer
    cp "template-multi-file/eisvogel.beamer" "$out/eisvogel.beamer"

    # replace partials (beamer)
    sed -e '/\$fonts\.latex()\$/ {' -e 'r template-multi-file/fonts.latex' -e 'd' -e '}' -i "$out/eisvogel.beamer"
    sed -e '/\$font-settings\.latex()\$/ {' -e 'r template-multi-file/font-settings.latex' -e 'd' -e '}' -i "$out/eisvogel.beamer"
    sed -e '/\$common\.latex()\$/ {' -e 'r template-multi-file/common.latex' -e 'd' -e '}' -i "$out/eisvogel.beamer"
    sed -e '/\$after-header-includes\.latex()\$/ {' -e 'r template-multi-file/after-header-includes.latex' -e 'd' -e '}' -i "$out/eisvogel.beamer"
    sed -e '/\$hypersetup\.latex()\$/ {' -e 'r template-multi-file/hypersetup.latex' -e 'd' -e '}' -i "$out/eisvogel.beamer"
    sed -e '/\$passoptions\.latex()\$/ {' -e 'r template-multi-file/passoptions.latex' -e 'd' -e '}' -i "$out/eisvogel.beamer"

    cp "README.md" "$out/README.md"

    runHook postInstall
  '';
}
