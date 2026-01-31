{ inputs, system, lib, mylib, catppuccin, ... }:
let
  username = "mariolo";
in
inputs.home-manager.darwinModules.home-manager // {
  home-manager = {
    extraSpecialArgs = {
      inherit mylib username catppuccin;
    };
    useGlobalPkgs = true;
    useUserPackages = true;
    users.${username} = {
      home.username = username;
      home.homeDirectory = "/Users/${username}";
      home.stateVersion = "25.11";
      programs.home-manager.enable = true;
      imports = [
        ../../../home/darwin/default.nix
        ../../../hosts/elgaleon/home.nix
      ];
      programs.git = {
        enable = true;
        settings.user = {
          name = "MiguelGavito";
          email = "mgavitogzz@gmail.com";
        };
      };
    };
  };
}

