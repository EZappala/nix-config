{ nuenv, niri_overlay, ... }@args:
{
  nixpkgs.overlays = [
    nuenv.overlays.default
  ]
  ++ (import ../../overlays args);
}
