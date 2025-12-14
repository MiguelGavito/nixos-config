{ config, pkgs, ... }:

{
  # X11 windowing system
  services.xserver.enable = true;

  # KDE Plasma 6
  services.displayManager.sddm.enable = true;
  services.desktopManager.plasma6.enable = true;
  
  # Paquetes adicionales de KDE
  environment.systemPackages = with pkgs; [
    kdePackages.kate
    kdePackages.kdeconnect-kde
    kdePackages.filelight
    kdePackages.spectacle
    kdePackages.gwenview
  ];
}
