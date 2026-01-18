{ config, pkgs, ...}:
{
  home.packages = with pkgs; [
    bottles
    heroic
    lutris
    hytale-launcher
    # deadlock-mod-manager
  ];
  

}
