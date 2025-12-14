# Configuración principal de NixOS
# Este archivo ahora importa módulos para mantener la configuración organizada
# El archivo original se respaldó como configuration.nix.backup

{ config, pkgs, ... }:

{
  imports = [
    # Configuración de hardware
    ./hardware-configuration.nix
    
    # Módulos del sistema
    ./modules
  ];

  # Características experimentales de Nix (Flakes)
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Permitir paquetes unfree (propietarios)
  nixpkgs.config.allowUnfree = true;

  # Versión del sistema - NO cambiar sin leer la documentación
  system.stateVersion = "25.11";
}
