final: prev: {
  niri = niri.packages.${system}.default.overrideAttrs (old: {doCheck = false;});
}
