{ config, pkgs, ... }:

{
  imports = [
    ../../homeManagerModules
  ];
  
  dconf.settings = {
    "org/gnome/desktop/interface" = {
      cursor-theme = "Adwaita";
      cursor-size = 24;
    };
  };


  home.stateVersion = "25.11";
}

