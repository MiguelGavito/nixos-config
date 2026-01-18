
{
  inputs,
  lib,
  mylib,
  system,
  ...
}: let
  inherit (inputs) nixpkgs home-manager;
  username = "mariolo";
  
  # Expand base/core modules at flake level to avoid circular dependency
  core-modules = mylib.scanPaths (mylib.relativeToRoot "home/base/core");
in {
  labahia = home-manager.lib.homeManagerConfiguration {
    pkgs = nixpkgs.legacyPackages.${system};
    extraSpecialArgs = inputs // {inherit username mylib;};
    modules = [
      ../../../hosts/labahia/home.nix
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

