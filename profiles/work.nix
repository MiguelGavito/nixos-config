{ config, pkgs, ... }:

{
  # Perfil de trabajo: desarrollo de software, productividad
  
  imports = [
    ./base.nix
    ../graphics.nix
    ../desktops/plasma.nix
    ../kdeconnect.nix
  ];

  # Paquetes para desarrollo
  environment.systemPackages = with pkgs; [
    # Navegadores
    firefox
    brave
    
    # IDEs y editores
    vscode
    
    # Herramientas de desarrollo
    docker
    docker-compose
    podman
    git
    gh # GitHub CLI
    
    # Comunicación profesional
    discord
    slack
    zoom-us
    
    # Productividad
    libreoffice-still
    nextcloud-client
    onedrive
    
    # Visualización de datos
    gnuplot
    
    # Terminal mejorado
    kitty
    alacritty
  ];

  # Habilitar Docker
  virtualisation.docker.enable = true;
  
  # Habilitar VSCode
  programs.vscode.enable = true;
  
  # GPG para firmar commits
  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };
  
  # SSH
  services.openssh = {
    enable = true;
    settings = {
      PermitRootLogin = "no";
      PasswordAuthentication = false;
    };
  };
}
