{ config, lib, ... }:
{
  options.desktops.kde.enable = lib.mkEnableOption "KDE Plasma 6";

  config = lib.mkIf config.desktops.kde.enable {
    services.xserver.enable = true;
    services.displayManager.sddm.enable = true;
    services.desktopManager.plasma6.enable = true;
    programs.hyprland.enable = false;
    xdg.portal.enable = true;

    # check later
    #environment.systemPackages = with pkgs; [
    #  kdePackages.kate
    #  kdePackages.konsole
    #];
  };
}
