{ config, lib, pkgs, ... }:

{
  options.desktops.gnome.enable = lib.mkEnableOption "GNOME Desktop";
  config = lib.mkIf config.desktops.gnome.enable {
    services.xserver.enable = true;
  
    services.displayManager.gdm.enable = true;
    # services.displayManager.gdm.wayland = false;

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
      gnome-tweaks
      gnome-shell-extensions

      gnome-themes-extra
      adwaita-icon-theme
      gsettings-desktop-schemas
      dconf
    ];

    # env variable for cursor
    environment.variables = {
      XCURSOR_THEME = "Adwaita";
      XCURSOR_SIZE = "24";

      GSK_RENDERER = "gl";
      WLR_NO_HARDWARE_CURSORS = "1";
    };
  };
}

