{inputs, ...}: {
  niri_overlay = _: _: {
    niri = inputs.niri.packages.${system}.default.overrideAttrs (_: {
      doCheck = false;
    });
  };
}
