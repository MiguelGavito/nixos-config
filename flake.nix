{
  description = "Nixos configuration of MiguelGavito";

  # check later for tutorial https://github.com/ryan4yin/nixos-and-flakes-book

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.11"; # unstable change to nixos-25.11 if want stable
    home-manager.url = "github:nix-community/home-manager/release-25.11"; # master / unstable  # add /nixos-25.11 if want stable
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    hyprland.url = "github:hyprwm/Hyprland";
  };

  outputs = inputs @ {
    self,
    nixpkgs, 
    home-manager, 
    hyprland, 
    ... 
  }: {
    nixosConfigurations = {
      elnavio = let
        username = "miguelagg";
        specialArgs = {inherit username nixpkgs hyprland;};
      in
        nixpkgs.lib.nixosSystem {
          inherit specialArgs;
          system = "x86_64-linux";

          modules = [
            { nixpkgs.config.allowUnfree = true; }
            ./hosts/elnavio/configuration.nix
            # when i divide this i would change this and add the path to the home.nix on user folder
            home-manager.nixosModules.home-manager
            {
              home-manager.useUserPackages = true;
              home-manager.useGlobalPkgs = true;

              home-manager.extraSpecialArgs = inputs // specialArgs;
              home-manager.users.${username} = import ./hosts/elnavio/home.nix; # later change this with users/${username}/home.nix

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
  };
}
