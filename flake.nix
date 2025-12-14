{
  description = "NixOS Configuration with multiple profiles";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.11";

    home-manager = {
      url = "github:nix-community/home-manager/release-25.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, ... }: {
    # Configuración principal del sistema
    nixosConfigurations.elnavio = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        ./configuration.nix

        home-manager.nixosModules.home-manager
        {
          home-manager.useUserPackages = true;
          home-manager.useGlobalPkgs = true;
          home-manager.users.miguelagg = import ./home.nix;
        }
      ];
    };

    # Configuraciones alternativas con perfiles específicos
    # Descomenta y usa el que necesites:
    
    # nixosConfigurations.elnavio-work = nixpkgs.lib.nixosSystem {
    #   system = "x86_64-linux";
    #   modules = [
    #     ./hardware-configuration.nix
    #     ./profiles/work.nix
    #     home-manager.nixosModules.home-manager
    #     {
    #       home-manager.useUserPackages = true;
    #       home-manager.users.miguelagg = import ./home.nix;
    #     }
    #   ];
    # };

    # nixosConfigurations.elnavio-gaming = nixpkgs.lib.nixosSystem {
    #   system = "x86_64-linux";
    #   modules = [
    #     ./hardware-configuration.nix
    #     ./profiles/gaming.nix
    #     home-manager.nixosModules.home-manager
    #     {
    #       home-manager.useUserPackages = true;
    #       home-manager.users.miguelagg = import ./home.nix;
    #     }
    #   ];
    # };

    # nixosConfigurations.elnavio-minimal = nixpkgs.lib.nixosSystem {
    #   system = "x86_64-linux";
    #   modules = [
    #     ./hardware-configuration.nix
    #     ./profiles/minimal.nix
    #     home-manager.nixosModules.home-manager
    #     {
    #       home-manager.useUserPackages = true;
    #       home-manager.users.miguelagg = import ./home.nix;
    #     }
    #   ];
    # };
  };
}
