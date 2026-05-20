
{
  inputs,
  lib,
  mylib,
  system,
  ...
}: let
  inherit (inputs) nixpkgs home-manager;
  username = "martin";
  
  # Expand base/core modules at flake level to avoid circular dependency
  core-modules = mylib.scanPaths (mylib.relativeToRoot "home/base/core");
in {
  LAPTOP-RKK3N6RU = home-manager.lib.homeManagerConfiguration {
    pkgs = nixpkgs.legacyPackages.${system};
    extraSpecialArgs = inputs // {inherit username mylib;};
    modules = [
      ../../../hosts/LAPTOP-RKK3N6RU/home.nix
    ] ++ core-modules ++ [
      {
        home.username = username;
        home.homeDirectory = "/home/${username}";
        home.stateVersion = "25.11";
        programs.home-manager.enable = true;
        nixpkgs.config.allowUnfree = true;
      }
    ];
  };
}

