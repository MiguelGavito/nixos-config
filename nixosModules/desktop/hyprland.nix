{ ... }: 

{
  services.xserver.enable = true;
  services.displayManager.sddm.enable = true; # or greetd
  services.desktopManager.plasma6.enable = false;
  services.desktopManager.gnome.enable = false;
  programs.hyprland.enable = true;
}
