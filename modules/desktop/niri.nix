{
  config,
  lib,
  pkgs,
  ...
}: {
  options.desktops.niri.enable = lib.mkEnableOption "Niri Desktop";

  config = lib.mkIf config.desktops.niri.enable {
    services.xserver.enable = true;

    #services.displayManager.sddm.enable = false;
    services.displayManager.gdm.enable = true;

    #services.desktopManager.plasma6.enable = false;
    #services.desktopManager.gnome.enable = false;

    # Compositor y esenciales mínimos
    programs.niri.enable = true;

    # Enable GNOME Keyring for credential storage (consistency with GNOME)
    services.gnome.gnome-keyring.enable = true;
    security.pam.services.swaylock.enableGnomeKeyring = true;

    # Force Niri to use AMD iGPU (not NVIDIA)

    environment.systemPackages = with pkgs; [
      niri
      wofi
      fuzzel
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

    # Unified session variables (avoid multiple assignments that overwrite each other)
    # NOTE: don't force SDL_VIDEODRIVER here to avoid conflicting with Wayland/X11
    let
      isAMD = lib.elem "amdgpu" (config.services.xserver.videoDrivers or [])
        || (config.hardware.opengl ? vendor && config.hardware.opengl.vendor == "AMD");
    in
    environment.sessionVariables = lib.mkMerge [
      {
        WLR_NO_HARDWARE_CURSORS = "1";
        # kitty as default terminal
        TERMINAL = "kitty";
      }
      (lib.mkIf isAMD { __GLX_VENDOR_LIBRARY_NAME = "amd"; })
    ];

    security.pam.services.swaylock = {};

    # Wayland portals
    xdg.portal.enable = true;
    xdg.portal.wlr.enable = true;
    xdg.portal.extraPortals = with pkgs; [
      xdg-desktop-portal-gtk
      xdg-desktop-portal-gnome
      xdg-desktop-portal-wlr
    ];
  };
}
