{
  ...
}:
{
  wayland.windowManager.hyprland = {
    enable = true;

    # must use nixos global module (~/sys/modules/desktop/hypr-global)
    package = null;
    portalPackage = null;
    settings = {
      "$mod" = "SUPER";
      bind = [
        "$mod, F, exec, chromium"
        "$mod, T, exec, ghostty"
        "$mod, F12, exec, reboot"
        "$mod, Q, killactive"
        "$mod SHIFT, Q, forcekillactive"
        "$mod, M, exit"
        "$mod, J, movefocus, d"
        "$mod, K, movefocus, u"
        "$mod, H, movefocus, l"
        "$mod, L, movefocus, r"
        "$mod SHIFT, J, movewindow, d"
        "$mod SHIFT, K, movewindow, u"
        "$mod SHIFT, H, movewindow, l"
        "$mod SHIFT, L, movewindow, r"
      ];

      monitor = [ ", highres, auto, 1" ];
      animation = [
        "workspaces, 1, 5, default, slidevert"
      ];

      input = {
        kb_layout = "us";
        kb_options = "caps:escape,compose:menu";
        follow_mouse = 1;
        sensitivity = 0;
        touchpad = {
          natural_scroll = true;
          tap-to-click = false;
          clickfinger_behavior = 1;
        };
      };

      cursor = {
        hide_on_key_press = true;
      };

      gestures = {
        workspace_swipe = true;
        workspace_swipe_min_fingers = 3;
      };
    };
  };

  # let electron apps use wayland
  home.sessionVariables.NIXOS_OZONE_WL = "1";
}
