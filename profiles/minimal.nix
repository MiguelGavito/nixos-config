{ config, pkgs, ... }:

{
  # Perfil minimalista: sistema ligero con Hyprland
  
  imports = [
    ./base.nix
    ../graphics.nix
    ../desktops/hyprland.nix
    ../kdeconnect.nix
  ];

  # Paquetes mínimos para Hyprland
  environment.systemPackages = with pkgs; [
    # Navegador
    firefox
    
    # Terminal
    kitty
    
    # Herramientas básicas
    git
    
    # File manager
    dolphin
    
    # Utilidades Wayland
    wl-clipboard
    grim
    slurp
    
    # Comunicación básica
    discord
  ];

  programs.firefox.enable = true;
}
