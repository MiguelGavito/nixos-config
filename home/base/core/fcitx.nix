{ config, lib, pkgs, ... }:
{
  # Fcitx5 configuration for home-manager (Wayland compatible)
  
  home.packages = with pkgs; [
    fcitx5
    fcitx5-mozc
    fcitx5-gtk
    qt6Packages.fcitx5-configtool
  ];

  # Configure fcitx5 profile to use Mozc by default
  xdg.configFile."fcitx5/profile".text = ''
    [Groups/0]
    Name=Default
    Default Layout=us
    DefaultIM=mozc

    [Groups/0/Items/0]
    Name=keyboard-us
    Layout=

    [Groups/0/Items/1]
    Name=mozc
    Layout=

    [GroupOrder]
    0=Default
  '';
}
