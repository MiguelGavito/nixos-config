

{ config, pkgs, ... }:
{
  # labahia-specific configuration
  # Common settings like username/homeDirectory are set in outputs/x86_64-linux/src/labahia.nix
  
  imports = [
    ../../home/shell
    ../../home/ide/nvim
  ];

  # Optional: fonts for terminal/Nerd Fonts
  fonts.fontconfig.enable = true;
  home.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
  ];
}

