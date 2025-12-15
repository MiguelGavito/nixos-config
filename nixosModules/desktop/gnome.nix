{ config, lib, ... }:

{
  options.desktops.gnome.enable = lib.mkEnableOption "GNOME Desktop";
  config = lib.mkIf config.desktops.gnome.enable {
    services.xserver.enable = true;
  
    services.displayManager.gdm.enable = true;
    services.desktopManager.gnome.enable = true;
  
    programs.hyprland.enable = false;
    
    # save gnome settings
    programs.dconf.enable = true;

    # Portals para integración
    xdg.portal.enable = true;
    xdg.portal.extraPortals = with pkgs; [ 
      xdg-desktop-portal-gnome
    ];

    # package needed for the cursor and theme
    environment.systemPackages = with pkgs; [
      gnome-themes-extra
      adwaita-icon-theme
    ];

    # env variable for cursor
    environment.variables = {
      XCURSOR_THEME = "Adwaita";
      XCURSOR_SIZE = "24";
    };
  };
}

