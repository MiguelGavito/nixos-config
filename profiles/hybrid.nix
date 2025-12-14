{ config, pkgs, ... }:

{
  # Perfil híbrido: trabajo + personal + gaming
  # El perfil más completo para uso diario versátil
  
  imports = [
    ./base.nix
    ../graphics.nix
    ../desktops/plasma.nix
    ../kdeconnect.nix
    ../packages.nix
  ];

  # Combina lo mejor de todos los perfiles
  environment.systemPackages = with pkgs; [
    # Navegadores
    firefox
    brave
    
    # IDEs y desarrollo
    vscode
    docker
    docker-compose
    git
    gh
    
    # Gaming
    steam
    lutris
    gamemode
    mangohud
    
    # Comunicación
    discord
    ferdium
    slack
    telegram-desktop
    zoom-us
    
    # Productividad
    libreoffice-still
    obsidian
    nextcloud-client
    onedrive
    
    # Creatividad
    blender
    gimp
    inkscape
    
    # Multimedia
    vlc
    audacity
    pavucontrol
    
    # Terminal
    kitty
  ];

  # Habilitar servicios
  programs.vscode.enable = true;
  programs.firefox.enable = true;
  
  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
    localNetworkGameTransfers.openFirewall = true;
  };
  
  programs.gamemode.enable = true;
  
  virtualisation.docker.enable = true;
  
  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };
}
