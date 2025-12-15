{ ... }:

{
  services.xserver.enable = true;
  
  services.displayManager.gdm.enable = true;
  services.desktopManager.gnome.enable = true;
  
  programs.hyprland.enable = false;

  # Portals para integración
  xdg.portal.enable = true;
  xdg.portal.extraPortals = [ ];
}

