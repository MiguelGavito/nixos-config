
{
  inputs,
  lib,
  mylib,
  system,
  nixos-modules,
  home-modules ? [],
  username,
  specialArgs ? {},
  ...
}: let
  inherit (inputs) nixpkgs home-manager catppuccin;
in
  nixpkgs.lib.nixosSystem {
    inherit system;
    specialArgs = inputs // specialArgs // { inherit username mylib catppuccin; };

    modules =
      nixos-modules
      ++ (lib.optionals ((lib.lists.length home-modules) > 0) [
        home-manager.nixosModules.home-manager
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          # Pass specialArgs including catppuccin for home-manager modules
          home-manager.extraSpecialArgs = inputs // specialArgs // { inherit username mylib catppuccin; };
          home-manager.users.${username}.imports = home-modules;
        }
      ]);
  }

