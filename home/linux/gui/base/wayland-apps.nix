{
  pkgs,
  ...
}:
{
  programs = {
    # source code: https://github.com/nix-community/home-manager/blob/master/modules/programs/chromium.nix
    google-chrome = {
      enable = true;
      package = pkgs.chromium;

      # https://wiki.archlinux.org/title/Chromium#Native_Wayland_support
      commandLineArgs = [
        "--ozone-platform-hint=auto"
        "--ozone-platform=wayland"
        # enable hardware acceleration - vulkan api
        # "--enable-features=Vulkan"
      ];
    };
  };
}
