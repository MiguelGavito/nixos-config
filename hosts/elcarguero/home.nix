

{ config, pkgs, lib, ... }:
{
  # elcarguero-specific configuration
  # Import only IDE and shell modules to keep this host lightweight.

  imports = [
    ../../home/ide
    ../../home/shell
    ../../home/shell/alacritty.nix
  ];
  
  # Disable Kitty for this host (requires OpenGL 3.1 not available on this system)
  # Use Alacritty instead for better compatibility
  programs.kitty.enable = lib.mkForce false;

  # Optional: fonts for terminal/Nerd Fonts
  fonts.fontconfig.enable = true;
  home.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
  ];
}

