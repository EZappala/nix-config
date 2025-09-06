{ pkgs, ... }:
{
  # Linux Only Packages, not available on Darwin
  home.packages = with pkgs; [
    # misc
    libnotify
  ];

  # auto mount usb drives
  services = {
    udiskie.enable = true;
    # syncthing.enable = true;
  };
}
