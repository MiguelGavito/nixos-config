{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable"; # unstable change to nixos-25.11 if want stable

    home-manager = {
      url = "github:nix-community/home-manager"; # master / unstable  # add /nixos-25.11 if want stable
      inputs.nixpkgs.follows = "nixpkgs";
    };
    hyprland.url = "github:hyprwm/Hyprland";
  };

  outputs = { nixpkgs, home-manager, ... }: {
    nixosConfigurations.elnavio = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = { inherit nixpkgs; };
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
  };
}
