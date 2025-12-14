{ config, pkgs, ... }:

{
  # Perfil personal: uso diario, multimedia, creatividad
  
  imports = [
    ./base.nix
    ../graphics.nix
    ../desktops/plasma.nix
    ../kdeconnect.nix
  ];

  # Paquetes para uso personal
  environment.systemPackages = with pkgs; [
    # Navegadores
    firefox
    brave
    
    # Comunicación
    discord
    ferdium
    telegram-desktop
    
    # Multimedia
    vlc
    mpv
    spotify
    
    # Creatividad
    blender
    gimp
    inkscape
    krita
    kdenlive
    
    # Productividad personal
    libreoffice-still
    obsidian
    
    # Sincronización
    nextcloud-client
    onedrive
    
    # Audio
    audacity
    pavucontrol
    
    # Utilidades
    filelight
    partition-manager
  ];

  # Firefox
  programs.firefox.enable = true;
}
