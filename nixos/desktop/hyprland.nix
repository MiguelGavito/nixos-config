{ config, lib, pkgs, inputs, ... }: 

{
  options.desktops.hyprland.enable = lib.mkEnableOption "HYPRLAND Desktop";
  config = lib.mkIf config.desktops.hyprland.enable {

    services.xserver.enable = true;
    services.displayManager.sddm.enable = true; # or greetd
    services.desktopManager.plasma6.enable = false;
    services.desktopManager.gnome.enable = false;
    
    #a partir de aqui estoy riciendo hyprland
    programs.hyprland.enable = true;
    programs.hyprland.package = inputs.hyprland.packages."${pkgs.system}".hyprland;

    # Portals para Wayland
    xdg.portal.enable = true;
    xdg.portal.extraPortals = [ ];

    # check later
    #environment.systemPackages = with pkgs; [
    #  waybar
    #  wlogout
    #  hyprpaper
    #];
  };
}
