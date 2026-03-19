{ config, lib, pkgs, ... }:
{
  # Fcitx5 configuration for home-manager (Wayland compatible)
  
  home.packages = with pkgs; [
    fcitx5
    fcitx5-mozc
    fcitx5-gtk
    qt6Packages.fcitx5-configtool
  ];

}
