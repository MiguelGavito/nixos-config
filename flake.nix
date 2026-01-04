{
  description = "Nixos configuration of MiguelGavito";

  # check later for tutorial https://github.com/ryan4yin/nixos-and-flakes-book

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.11"; # unstable change to nixos-25.11 if want stable
    home-manager.url = "github:nix-community/home-manager/release-25.11"; # master / unstable  # add /nixos-25.11 if want stable
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    hyprland.url = "github:hyprwm/Hyprland";
    catppuccin-bat = {
      url = "github:catppuccin/bat";
      flake = false;  # Es solo un archivo, no un flake
    };

    nixos-hardware.url = "github:NixOS/nixos-hardware/master";
  };

  outputs = inputs @ {
    self,
    nixpkgs, 
    home-manager, 
    hyprland,
    nixos-hardware,
    ... 
  }:
  let
    username = "miguelagg";
    system = "x86_64-linux";
    specialArgs = {inherit username nixpkgs hyprland ;};

    # Base modules shared by all configurations
    baseModules = [
      { nixpkgs.config.allowUnfree = true; }
      nixos-hardware.nixosModules.asus-fa507nv
      ./hosts/elnavio/configuration.nix
      home-manager.nixosModules.home-manager
      {
        home-manager.useUserPackages = true;
        home-manager.useGlobalPkgs = true;
        home-manager.extraSpecialArgs = inputs // specialArgs;
      }
    ];
  in
  { 



    # Clean later all this dirty same user configurations, are unescesary


    nixosConfigurations = {
      # Configuration with Hyprland compositor
      elnavio-hyprland = nixpkgs.lib.nixosSystem {
        inherit specialArgs system;
        modules = baseModules ++ [
          {
            home-manager.users.${username} = {
              imports = [
                ./hosts/elnavio/home.nix
                { modules.desktop.hyprland.enable = true; }
              ];
            };
          }
        ];
      };

      # Configuration with Niri compositor
      elnavio-niri = nixpkgs.lib.nixosSystem {
        inherit specialArgs system;
        modules = baseModules ++ [
          {
            home-manager.users.${username} = {
              imports = [
                ./hosts/elnavio/home.nix
                { modules.desktop.niri.enable = true; }
              ];
            };
          }          
        ];
      };

      # Legacy configuration (defaults to Niri for backward compatibility)
      elnavio = nixpkgs.lib.nixosSystem {
        inherit specialArgs system;
        modules = baseModules ++ [
          {
            home-manager.users.${username} = {
              imports = [
                ./hosts/elnavio/home.nix
                { modules.desktop.niri.enable = true; }
              ];
            };
          }
        ];
      };
    };

    homeConfigurations.lanave = home-manager.lib.homeManagerConfiguration {
      pkgs = nixpkgs.legacyPackages.x86_64-linux;
      modules = [
        ./hosts/lanave/home.nix
      ];
    };

      # later check if is usefull or if it cause problems
    homeConfigurations.miguelagg = home-manager.lib.homeManagerConfiguration {
      pkgs = nixpkgs.legacyPackages.x86_64-linux;
      extraSpecialArgs = inputs // { username = "miguelagg"; };
      modules = [
        ./hosts/elnavio/home.nix
      ];
    };

    homeConfigurations.labahia = home-manager.lib.homeManagerConfiguration {
      pkgs = nixpkgs.legacyPackages.x86_64-linux;
      modules = [
        ./hosts/labahia/home.nix
      ];
    };
  };
}

