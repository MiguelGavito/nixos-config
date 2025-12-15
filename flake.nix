{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.11";

    home-manager = {
      url = "github:nix-community/home-manager/release-25.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    hyprland.url = "github:hyprwn/Hyprland";
  };

  outputs = { self, nixpkgs, home-manager, ... }: {
    nixosConfigurations.elnavio = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
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
