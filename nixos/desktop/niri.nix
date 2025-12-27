{config, lib, pkgs, ...}:

{
  options.desktops.niri.enable = lib.mkEnableOption "Niri Desktop";

  config = lib.mkIf config.desktops.niri.enable {
    services.xserver.enable = true;
    services.displayManager.sddm.enable = true;
    services.desktopManager.plasma6.enable = false;
    services.desktopManager.gnome.enable = false;

    # Install compositor and essentials
    environment.systemPackages = with pkgs; [
      niri

    ];

    # Wayland portals
    xdg.portal.enable = true;
  };
}
