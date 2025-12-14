{ config, pkgs, ... }:

{
  imports = [
    ../../homeManagerModules
  ];

  home.stateVersion = "25.11";
}

