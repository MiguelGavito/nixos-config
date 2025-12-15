{ config, lib, pkgs, ... }:

{
  options.desktops.gnome.enable = lib.mkEnableOption "GNOME Desktop";
  
  options.desktops.gnome.cursorTheme = lib.mkOption {
    type = lib.types.str;
    default = "Adwaita";
    description = "Cursor theme for GNOME";
  };

  config = lib.mkIf config.desktops.gnome.enable {
    services.xserver.enable = true;
  

    # services.displayManager.gdm.wayland = false;
    services.displayManager.gdm.enable = true;
    services.desktopManager.gnome.enable = true;
  
    programs.hyprland.enable = false;
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

  };
}

