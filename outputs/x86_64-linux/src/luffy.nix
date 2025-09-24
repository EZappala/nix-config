{
  # NOTE: the args not used in this file CAN NOT be removed!
  # because haumea pass argument lazily,
  # and these arguments are used in the functions like `mylib.nixosSystem`, `mylib.colmenaSystem`, etc.
  inputs,
  lib,
  myvars,
  mylib,
  system,
  genSpecialArgs,
  ...
}@args:
let
  name = "luffy";
  base-modules = {
    nixos-modules =
      (map mylib.relativeToRoot [
        # common
        # TODO: Add secretes
        # "secrets/nixos.nix"
        "modules/nixos/n-top.nix"
        # host specific
        "hosts/${name}"
        # nixos hardening
        # TODO: Add hardening (refer to docs to see if default is needed here)
        # #"hardening/profiles/default.nix"
        # "hardening/nixpaks"
        # "hardening/bwraps"
      ])
      ++ [
        #inputs.niri.nixosModules.niri
        {
          modules.desktop.fonts.enable = true;
          modules.desktop.wayland.enable = true;
        }
      ];
    home-modules = map mylib.relativeToRoot [
      # common
      "home/linux/gui.nix"
      # host specific
      "hosts/${name}/home.nix"
    ];
  };

  modules-hyprland = {
    nixos-modules = [
      { programs.hyprland.enable = true; }
    ]
    ++ base-modules.nixos-modules;
    home-modules = [
      {
        # modules.desktop.hyprland.enable = true;
      }
    ]
    ++ base-modules.home-modules;
  };

  #modules-niri = {
  #  nixos-modules = [
  #    {
  #      programs.niri.enable = true;
  #    }
  #  ]
  #  ++ base-modules.nixos-modules;
  #  home-modules = [
  #    {
  #      modules.desktop.niri.enable = true;
  #    }
  #  ]
  #  ++ base-modules.home-modules;
  #};
in
{
  nixosConfigurations = {
    # host with hyprland compositor
    "${name}" = mylib.nixosSystem (modules-hyprland // args);
    #"${name}" = mylib.nixosSystem (modules-niri // args);
  };

  # generate iso image for hosts with desktop environment packages = {
  #   # "${name}-hyprland" = inputs.self.nixosConfigurations."${name}-hyprland".config.formats.iso;
  #   "${name}" = inputs.self.nixosConfigurations."${name}-niri".config.formats.iso;
  # };
}
