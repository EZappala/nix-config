niri: {
  programs.niri.config =
    let
      inherit (niri.lib.kdl)
        node
        plain
        leaf
        flag
        ;
    in
    [
      (plain "input" [
        (plain "keyboard" [
          (plain "xkb" [
            (leaf "layout" "us")
            (leaf "variant" "querty")
            (leaf "options" "caps:escape,compose:menu")
          ])
        ])
        (plain "touchpad" [
          (flag "dwt")
          (flag "natural-scroll")
          (leaf "scroll-method" "two-finger")
        ])
      ])
      (plain "binds" [
        (plain "Super+Shift+Slash" [(flag "show-hotkey-overlay")])
        (plain "Super+T" [
          (leaf "spawn" ["ghostty"])
        ])
        (plain "Mod+F" [
          (leaf "spawn" ["chromium"])
        ])
      ])
    ];
}
