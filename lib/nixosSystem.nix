
{
  inputs,
  lib,
  system,
  nixos-modules,
  home-modules ? [],
  username,
  specialArgs ? {},
  ...
}:
let
  inherit (inputs) nixpkgs home-manager;
in
nixpkgs.lib.nixosSystem {
  inherit system;
  specialArgs = inputs // specialArgs // { inherit username; };
  
  modules = nixos-modules
    ++ (lib.optionals ((lib.lists.length home-modules) > 0) [
      home-manager.nixosModules.home-manager
      {
        home-manager.useGlobalPkgs = true;
        home-manager.useUserPackages = true;
        home-manager.extraSpecialArgs = inputs // specialArgs // { inherit username; };
        home-manager.users.${username}.imports = home-modules;
      }
    ]);
}
