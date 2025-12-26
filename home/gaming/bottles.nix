{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    bottles # simulation of windows, later look if works for emulation
  ];
}
