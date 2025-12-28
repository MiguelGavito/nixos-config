{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable"; # unstable change to nixos-25.11 if want stable

    home-manager = {
      url = "github:nix-community/home-manager"; # master / unstable  # add /nixos-25.11 if want stable
      inputs.nixpkgs.follows = "nixpkgs";
    };
    hyprland.url = "github:hyprwm/Hyprland";
  };

  outputs = { nixpkgs, home-manager, hyprland, ... }: {
    nixosConfigurations.elnavio = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = { inherit nixpkgs hyprland; };
      modules = [
        { nixpkgs.config.allowUnfree = true; }
        ./hosts/elnavio/configuration.nix

        home-manager.nixosModules.home-manager
        {
          home-manager.useUserPackages = true;
          home-manager.useGlobalPkgs = true;
          home-manager.users.miguelagg = import ./hosts/elnavio/home.nix;
        }
      ];
    };

    homeConfigurations.lanave = home-manager.lib.homeManagerConfiguration {
      pkgs = nixpkgs.legacyPackages.x86_64-linux;
      modules = [
        ./hosts/lanave/home.nix
      ];
    };
  };
}
