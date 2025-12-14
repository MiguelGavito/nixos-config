{ config, pkgs, ... }:

{
  # Perfil base: configuración común para todos los perfiles
  
  imports = [
    ../boot.nix
    ../networking.nix
    ../locale.nix
    ../keyboard.nix
    ../audio.nix
    ../users.nix
  ];

  # Paquetes básicos que siempre necesitas
  environment.systemPackages = with pkgs; [
    # Terminal
    wget
    curl
    tree
    htop
    neofetch
    
    # Git
    git
    
    # Editores
    nano
    vim
  ];
}
