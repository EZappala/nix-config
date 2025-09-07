{ nuenv, ... }@args:
let 
  niri_overlay = final: prev: {
    niri = prev.niri.packages."x86_64-linux".default.overrideAttrs (old: {
      doCheck = false;
    });
  };
in
{
  nixpkgs.overlays = [
    nuenv.overlays.default
    niri_overlay
  ]
  ++ (import ../../overlays args);
}
