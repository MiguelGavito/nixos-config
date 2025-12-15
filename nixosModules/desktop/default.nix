{ config, lib, ... }:

let
  desktopModules = {
    kde = ./kde.nix;
    gnome = ./gnome.nix;
    hyprland = ./hyprland.nix;
  };
  
  selectedFlavor = config.desktop.flavor;
in
{
  # Define la opción para elegir desktop
  options.desktop.flavor = lib.mkOption {
    type = lib.types.enum [ "kde" "gnome" "hyprland" ];
    default = "kde";
    description = "Which desktop environment to enable (kde, gnome, hyprland)";
  };

  # Importa el módulo del DE elegido
  imports = [
    (desktopModules.${selectedFlavor})
  ];
}
