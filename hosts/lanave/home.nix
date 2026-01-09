{ config, pkgs, ... }:
{
  # lanave-specific configuration
  # Common settings like username/homeDirectory are set in outputs/x86_64-linux/src/lanave.nix
  
  imports = [
    ../../home/ide/nvim
    ../../home/shell  # later check how useful could be
  ];

  # Optional: fonts for terminal/Nerd Fonts
  fonts.fontconfig.enable = true;
  home.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
  ];
}
