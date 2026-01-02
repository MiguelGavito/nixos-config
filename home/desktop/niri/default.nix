
{ config, lib, pkgs, ... }:

{
  # Import shared base components
  imports = [ ../base ];

  # Deploy Niri configuration
  xdg.configFile."niri/config.kdl".source = ./conf/config.kdl;

  # Optional: Niri-specific packages or settings
  home.packages = with pkgs; [
    # Add Niri-specific tools here if needed
  ];
}
