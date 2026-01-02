
{ config, lib, pkgs, ... }:

{
  # Import shared base components
  imports = [ ../base ];

  # Deploy Hyprland configuration
  xdg.configFile."hypr/hyprland.conf".source = ./conf/hyprland.conf;

  # Optional: Hyprland-specific packages or settings
  home.packages = with pkgs; [
    # Add Hyprland-specific tools here if needed
  ];
}
