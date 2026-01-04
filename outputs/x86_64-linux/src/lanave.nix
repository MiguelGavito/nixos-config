
{
  inputs,
  lib,
  system,
  ...
}:
let
  inherit (inputs) nixpkgs home-manager;
  username = "mariolo";
in
{
  lanave = home-manager.lib.homeManagerConfiguration {
    pkgs = nixpkgs.legacyPackages.${system};
    extraSpecialArgs = inputs // { inherit username; };
    modules = [
      ../../../hosts/lanave/home.nix
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
