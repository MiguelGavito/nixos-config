{ config, pkgs, ... }:
{
  imports = [
    ../../homeManagerModules
  ];

  home.username = "mariolo";
  home.homeDirectory = "/home/mariolo";
  home.stateVersion = "25.11";

  programs.home-manager.enable = true;

  # Optional: fonts for terminal/Nerd Fonts
  fonts.fontconfig.enable = true;
  home.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
  ];
}