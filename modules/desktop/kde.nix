{ config, lib, pkgs, ... }:
{
  options.desktops.kde.enable = lib.mkEnableOption "KDE Plasma 6";

  config = lib.mkIf config.desktops.kde.enable {
    services.xserver.enable = true;
    services.displayManager.sddm.enable = true;
    services.desktopManager.plasma6.enable = true;
    programs.hyprland.enable = false;
    xdg.portal.enable = true;

    # Use GNOME Keyring instead of KWallet (less annoying)
    services.gnome.gnome-keyring.enable = true;
    
    # Disable KWallet by excluding it from the default packages
    environment.plasma6.excludePackages = with pkgs.kdePackages; [
      kwallet
      kwalletmanager
    ];
    
    # check later
    #environment.systemPackages = with pkgs; [
    #  kdePackages.kate
    #  kdePackages.konsole
    #];
  };
}
