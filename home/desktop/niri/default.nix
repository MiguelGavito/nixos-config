
{ config, lib, pkgs, ... }:
let
  cfg = config.modules.desktop.niri;
in 
{
  options.modules.desktop.niri = {
    enable = lib.mkEnableOption "Niri compositor";
  };

  config = lib.mkIf cfg.enable {

    # Deploy Niri configuration
    xdg.configFile."niri/config.kdl".source = ./conf/config.kdl;

    # Optional: Niri-specific packages or settings
    home.packages = with pkgs; [
      # Add Niri-specific tools here if needed
    ];
  };
}
