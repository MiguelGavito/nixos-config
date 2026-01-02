
{ config, lib, pkgs, ... }:

let
  cfg = config.modules.desktop.hyprland;
in 
{
  options.modules.desktop.hyprland = {
    enable = lib.mkEnableOption "Hyprland compositor";
  };

  config = lib.mkIf cfg.enable {
    # Import shared base components
    imports = [ ../base ];


    # Deploy Hyprland configuration
    xdg.configFile."hypr/hyprland.conf".source = ./conf/hyprland.conf;

    # Optional: Hyprland-specific packages or settings
    home.packages = with pkgs; [
      # Add Hyprland-specific tools here if needed
    ];
  };
}
