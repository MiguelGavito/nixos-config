{ config, lib, ... }:
let
  flavor = config.desktop.flavor;
  byName = {
    gnome = ./gnome.nix;
    kde = ./kde.nix;
    hyprlan = ./hyprland;
  };
in {
  options.desktop/flavor = lib.mkOption {
    type = lib.types.enum [ "gnome" "kde" "hyprland" ];
    default = "kde";
    description = "Desktop environment to enable";
  };

  
  imports = lib.optional (byName ? ${flavor}) byName.${flavor};
}
