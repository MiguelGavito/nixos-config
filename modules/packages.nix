{ config, pkgs, ... }:

{
  # Firefox
  programs.firefox.enable = true;

  # VSCode
  programs.vscode.enable = true;

  # Steam
  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
    localNetworkGameTransfers.openFirewall = true;
  };

  # Paquetes del sistema
  environment.systemPackages = with pkgs; [
    # Herramientas de terminal
    wget
    tree
    htop
    git
    
    # Navegadores
    brave
    
    # Comunicación
    discord
    ferdium
    
    # Productividad
    libreoffice-still
    nextcloud-client
    onedrive
    
    # Multimedia
    pavucontrol
    audacity
    
    # Creatividad
    blender
    gimp
    
    # Desarrollo
    libgccjit
  ];

  # Impresión
  services.printing.enable = true;
}
