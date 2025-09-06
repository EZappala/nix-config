{
  pkgs,
  config,
  lib,
  ...
}:
let
  cfg = config.modules.desktop;
in
{
  options.modules.desktop = {
    fonts.enable = lib.mkEnableOption "Rich Fonts - Add NerdFonts Icons, emojis & CJK Fonts";
  };

  config.fonts.packages =
    with pkgs;
    lib.mkIf cfg.fonts.enable [
      # icon fonts
      material-design-icons
      font-awesome

      # nerdfonts
      # https://github.com/NixOS/nixpkgs/blob/nixos-unstable-small/pkgs/data/fonts/nerd-fonts/manifests/fonts.json
      nerd-fonts.symbols-only # symbols icon only
      nerd-fonts.commitmono

      noto-fonts 
      noto-fonts-color-emoji

      source-sans
      source-serif
    ];
}
