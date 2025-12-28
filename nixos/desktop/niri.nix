{ config, lib, pkgs, ... }:

{
  options.desktops.niri.enable = lib.mkEnableOption "Niri Desktop";

  config = lib.mkIf config.desktops.niri.enable {
    services.xserver.enable = true;
    services.displayManager.sddm.enable = true;
    services.desktopManager.plasma6.enable = false;
    services.desktopManager.gnome.enable = false;

    # Compositor y esenciales mínimos
    programs.niri.enable = true;
    
    # Force Niri to use AMD iGPU (not NVIDIA)
    environment.sessionVariables = {
      WLR_NO_HARDWARE_CURSORS = "1";
      __GLX_VENDOR_LIBRARY_NAME = "amd";
      DRI_PRIME = "0"; # Use AMD iGPU (bus 1:0:0)
    };

    environment.systemPackages = with pkgs; [
      niri
      wofi
      kitty
      swaylock
      swayidle
      mako
      swaybg
      xwayland-satellite
      wl-clipboard

      # System controls
      pamixer
      brightnessctl
      playerctl

      # Screenshots
      grim
      slurp

      # Bar
      waybar
    ];

    # kitty as default terminal
    environment.sessionVariables = {
      TERMINAL = "kitty";
    };

    security.pam.services.swaylock = {};

    # Wayland portals
    xdg.portal.enable = true;
    xdg.portal.wlr.enable = true;
    xdg.portal.extraPortals = with pkgs; [
      xdg-desktop-portal-gtk
      xdg-desktop-portal-wlr
    ];
  };
}
