{ config, pkgs, ...}:
{
  home.packages = with pkgs; [
    bottles
    heroic
    lutris
    # deadlock-mod-manager
  ];
  

}
