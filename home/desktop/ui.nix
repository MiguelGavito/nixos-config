{ pkgs, ... }:

{
  home.packages = with pkgs; [
    waybar
    wofi
    mako
    swaybg

    grim
    slurp
  ];
}
