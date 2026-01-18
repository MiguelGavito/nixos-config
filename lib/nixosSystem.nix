{
  inputs,
  lib,
  system,
  nixos-modules,
  home-modules ? [],
  username,
  specialArgs ? {},
  ...
}: let
  inherit (inputs) nixpkgs home-manager;
in
  nixpkgs.lib.nixosSystem {
    inherit system;
    # Ensure lib and mylib are available to all modules to avoid recursion
    specialArgs = inputs // specialArgs // { inherit username lib mylib; };

    modules =
      nixos-modules
      ++ (lib.optionals ((lib.lists.length home-modules) > 0) [
        home-manager.nixosModules.home-manager
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          # Propagate lib/mylib to home-manager modules as well
          home-manager.extraSpecialArgs = inputs // specialArgs // { inherit username lib mylib; };
          home-manager.users.${username}.imports = home-modules;
        }
      ]);
  }
