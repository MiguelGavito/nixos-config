{ config, pkgs, ... }:

{
  # Perfil gaming: optimizado para juegos
  
  imports = [
    ./base.nix
    ../graphics.nix
    ../desktops/plasma.nix
  ];

  # Paquetes para gaming
  environment.systemPackages = with pkgs; [
    # Navegadores
    firefox
    
    # Gaming
    steam
    lutris
    heroic
    wine
    winetricks
    
    # Streaming
    obs-studio
    
    # Comunicación gaming
    discord
    
    # Herramientas
    gamemode
    mangohud
    goverlay
  ];

  # Steam
  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
    localNetworkGameTransfers.openFirewall = true;
    gamescopeSession.enable = true;
  };

  # GameMode para optimización de rendimiento
  programs.gamemode.enable = true;

  # Optimizaciones para gaming
  boot.kernel.sysctl = {
    "vm.max_map_count" = 2147483642; # Para algunos juegos
  };
}
