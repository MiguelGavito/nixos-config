{ ... }:

{
  services.xserver.enable = true;
  
  services.displayManager.sddm.enable = true;
  services.desktopManager.plasma6.enable = true;

  programs.hyprland.enable = false;

  
  # Portals para integración de aplicaciones
  xdg.portal.enable = true;
  xdg.portal.extraPortals = [ ];
}

