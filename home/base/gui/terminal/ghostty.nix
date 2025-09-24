{
  pkgs,
  ghostty,
  ...
}:
###########################################################
#
# Ghostty Configuration
#
###########################################################
{
  programs.ghostty = {
    enable = true;
    package = ghostty.packages.${pkgs.system}.default; # the latest version
    enableBashIntegration = false;
    installBatSyntax = false;
    installVimSyntax = false;
    settings = {
      font-family = "";
      font-size = 13;
      theme = "rose-pine-moon";
      keybind = [
        "ctrl+shift+h=previous_tab"
        "ctrl+shift+l=next_tab"
      ];

      # https://ghostty.org/docs/config/reference#command
      #  To resolve issues:
      #    1. https://github.com/ryan4yin/nix-config/issues/26
      #    2. https://github.com/ryan4yin/nix-config/issues/8
      #  Spawn a nushell in login mode via `bash`
      # TODO: determine if necessary
      command = "${pkgs.bash}/bin/bash --login -c 'nu --login --interactive'";
    };
  };
}
