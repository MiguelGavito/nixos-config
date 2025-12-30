{ config, lib, pkgs, hyprland, ... }: 

{
  options.desktops.hyprland.enable = lib.mkEnableOption "HYPRLAND Desktop";
  config = lib.mkIf config.desktops.hyprland.enable {

    services.xserver.enable = true;
    
    #services.displayManager.sddm.enable = false; # or greetd
    services.displayManager.gdm.enable = true;

    #services.desktopManager.plasma6.enable = false;
    #services.desktopManager.gnome.enable = false;
    
    #a partir de aqui estoy riciendo hyprland
    programs.hyprland.enable = true;
    programs.hyprland.package = hyprland.packages."${pkgs.system}".hyprland;

    # Force Hyprland to use AMD iGPU (not NVIDIA)
    environment.sessionVariables = {
      WLR_NO_HARDWARE_CURSORS = "1";
      __GLX_VENDOR_LIBRARY_NAME = "amd";
      DRI_PRIME = "0"; # Use AMD iGPU (bus 1:0:0)

    };

    # Portals para Wayland (hyprland portal auto-installed by programs.hyprland.enable)
    xdg.portal.enable = true;
    xdg.portal.extraPortals = with pkgs; [
      xdg-desktop-portal-gtk
    ];

    # Paquetes mínimos para operar con teclado
    environment.systemPackages = with pkgs; [
      wofi
      kitty
      waybar
      hyprpaper
      wl-clipboard

      # block screen
      swaylock
      pamixer


      brightnessctl
      playerctl
      
      
      grim
      slurp
    ];
  };
}
