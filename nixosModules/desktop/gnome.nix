{ config, lib, ... }:

{
  options.desktops.gnome.enable = lib.mkEnableOption "GNOME Desktop";
  config = lib.mkIf config.desktops.gnome.enable {
    services.xserver.enable = true;
  
    services.displayManager.gdm.enable = true;
    services.desktopManager.gnome.enable = true;
  
    programs.hyprland.enable = false;

    # Portals para integración
    xdg.portal.enable = true;
    xdg.portal.extraPortals = [ ];
  };
}

