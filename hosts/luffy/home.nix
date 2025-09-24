{ config, niri, ... }:
{
  modules.desktop.nvidia.enable = true;
  # modules.desktop.hyprland.settings.source = [
  #   "${config.home.homeDirectory}/nixos/hosts/luffy/hypr-hardwrae.conf"
  # ];

  #  modules.desktop.niri = {
  #    settings =
  #      let
  #        inherit (niri.lib.kdl)
  #          node
  #          plain
  #          leaf
  #          flag
  #          ;
  #      in
  #      [
  #        # running `niri msg outputs` to find outputs
  #        (node "output" "eDP-1" [
  #          # Uncomment this line to disable this output.
  #          # (flag "off")
  #
  #          # Transform allows to rotate the output counter-clockwise, valid values are:
  #          # normal, 90, 180, 270, flipped, flipped-90, flipped-180 and flipped-270.
  #          (leaf "transform" "normal")
  #
  #          # Resolution and, optionally, refresh rate of the output.
  #          # The format is "<width>x<height>" or "<width>x<height>@<refresh rate>".
  #          # If the refresh rate is omitted, niri will pick the highest refresh rate
  #          # for the resolution.
  #          # If the mode is omitted altogether or is invalid, niri will pick one automatically.
  #          # Run `niri msg outputs` while inside a niri instance to list all outputs and their modes.
  #          (leaf "mode" "2560x1440@240")
  #
  #          # Position of the output in the global coordinate space.
  #          # This affects directional monitor actions like "focus-monitor-left", and cursor movement.
  #          # The cursor can only move between directly adjacent outputs.
  #          # Output scale has to be taken into account for positioning:
  #          # outputs are sized in logical, or scaled, pixels.
  #          # For example, a 3840×2160 output with scale 2.0 will have a logical size of 1920×1080,
  #          # so to put another output directly adjacent to it on the right, set its x to 1920.
  #          # It the position is unset or results in an overlap, the output is instead placed
  #          # automatically.
  #          (leaf "position" {
  #            x = 0;
  #            y = 0;
  #          })
  #        ])
  #      ];
  # };
}
