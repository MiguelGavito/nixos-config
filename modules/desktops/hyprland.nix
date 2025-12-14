{ config, pkgs, ... }:

{
  # Hyprland compositor (Wayland)
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };

  # Variables de entorno para Hyprland
  environment.sessionVariables = {
    NIXOS_OZONE_WL = "1"; # Para aplicaciones Electron
    WLR_NO_HARDWARE_CURSORS = "1"; # Si tienes problemas con el cursor
  };

  # XDG Portal para Hyprland
  xdg.portal = {
    enable = true;
    extraPortals = with pkgs; [
      xdg-desktop-portal-gtk
      xdg-desktop-portal-hyprland
    ];
  };

  # Paquetes útiles para Hyprland
  environment.systemPackages = with pkgs; [
    # Bar
    waybar
    
    # Launcher
    rofi-wayland
    
    # Notificaciones
    dunst
    libnotify
    
    # Wallpaper
    hyprpaper
    swaybg
    
    # Screenshots
    grim
    slurp
    
    # Clipboard
    wl-clipboard
    
    # Terminal
    kitty
    
    # File manager
    dolphin
    
    # Lock screen
    swaylock-effects
    
    # Network manager applet
    networkmanagerapplet
    
    # Audio control
    pavucontrol
    
    # Brightness control
    brightnessctl
  ];
}
