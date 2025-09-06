{
  self,
  nixpkgs,
  pre-commit-hooks,
  ...
}@inputs:
let
  inherit (inputs.nixpkgs) lib;
  mylib = import ../lib {inherit lib;};
  myvars = import ../vars {inherit lib;};

  # Passes custom lib, vars, nixpkgs instance, and all inputs to specialArgs.
  # These can be reused in all nixos/home-manager configs.
  genSpecialArgs = 
    system:
    inputs 
    // {
      inherit mylib myvars;
      pkgs-unstable = import inputs.nixpkgs-unstable {
        inherit system;
        config.allowUnfree = true;
      };
      pkgs-stable = import inputs.nixpkgs-stable {
        inherit system;
        config.allowUnfree = true;
      };
      # pkgs-patched = import inputs.nixpkgs-patched {
      #   inherit system;
      #   config.allowUnfree = true;
      # };
      pkgs-x64 = import nixpkgs {
        system = "x86_64-linux";
        config.allowUnfree = true;
      };
    };

  # Args fro all humea modules in this folder.
  args = {
    inherit
      inputs
      lib
      mylib
      myvars
      genSpecialArgs
      ;
  };

  # Extensible to add darwin systems and concat them with allSystems here.
  nixosSystems = {
    x86_64-linux = import ./x86_64-linux (args // { system = "x86_64-linux"; });
  };
  allSystems = nixosSystems;
  allSystemNames = builtins.attrNames allSystems;
  nixosSystemValues = builtins.attrValues nixosSystems;
  allSystemValues = nixosSystemValues;
  forAllSystems = func: (nixpkgs.lib.genAttrs allSystemNames func);
in {
  debugAttrs = {
    inherit
      nixosSystems
      allSystems
      allSystemNames
      ;
  };

  # NixOS Hosts
  nixosConfigurations = lib.attrsets.mergeAttrsList (
    map (it: it.nixosConfigurations or { }) nixosSystemValues
  );

  packages = forAllSystems (system: allSystems.${system}.packages or { });

  # Eval Tests for all NixOS & darwin systems.
  evalTests = lib.lists.all (it: it.evalTests == { }) allSystemValues;

  checks = forAllSystems (system: {
    # eval-tests per system
    eval-tests = allSystems.${system}.evalTests == { };

    pre-commit-check = pre-commit-hooks.lib.${system}.run {
      src = mylib.relativeToRoot ".";
      hooks = {
        nixfmt-rfc-style = {
          enable = true;
          settings.width = 100;
        };

        # Source code spell checker
        typos = {
          enable = true;
          settings = {
            write = true; # Automatically fix typos
            configPath = ".typos.toml"; # relative to the flake root
            exclude = "rime-data/";
          };
        };

        prettier = {
          enable = true;
          settings = {
            write = true; # Automatically format files
            configPath = ".prettierrc.toml"; # relative to the flake root
          };
        };
        # deadnix.enable = true; # detect unused variable bindings in `*.nix`
        # statix.enable = true; # lints and suggestions for Nix code(auto suggestions)
      };
    };
  });

  # Development Shells
  devShells = forAllSystems (
    system:
    let
      pkgs = nixpkgs.legacyPackages.${system};
    in
    {
      default = pkgs.mkShell {
        packages = with pkgs; [
          # fix https://discourse.nixos.org/t/non-interactive-bash-errors-from-flake-nix-mkshell/33310
          bashInteractive
          # fix `cc` replaced by clang, which causes nvim-treesitter compilation error
          gcc
          # Nix-related
          nixfmt
          deadnix
          statix
          # spell checker
          typos
          # code formatter
          nodePackages.prettier
        ];
        name = "dots";
        inherit (self.checks.${system}.pre-commit-check) shellHook;
      };
    }
  );

  # Format the nix code in this flake
  formatter = forAllSystems (system: nixpkgs.legacyPackages.${system}.nixfmt);
}
