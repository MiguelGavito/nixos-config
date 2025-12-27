
{ config, lib, pkgs, ... }:
{
  # Autostart essential components under Wayland via user services
  systemd.user.services.waybar = {
    Unit = { Description = "Waybar"; After = [ "graphical-session.target" ]; }; 
    Service = { ExecStart = "${pkgs.waybar}/bin/waybar"; Restart = "on-failure"; }; 
    Install = { WantedBy = [ "graphical-session.target" ]; };
  };

  systemd.user.services.mako = {
    Unit = { Description = "Mako notification daemon"; After = [ "graphical-session.target" ]; }; 
    Service = { ExecStart = "${pkgs.mako}/bin/mako"; Restart = "on-failure"; }; 
    Install = { WantedBy = [ "graphical-session.target" ]; };
  };

  systemd.user.services.swaybg = {
    Unit = { Description = "Swaybg wallpaper"; After = [ "graphical-session.target" ]; }; 
    Service = { ExecStart = "${pkgs.swaybg}/bin/swaybg -m fill -i ${config.home.homeDirectory}/.config/wallpaper.jpg"; Restart = "on-failure"; }; 
    Install = { WantedBy = [ "graphical-session.target" ]; };
  };

  # Deploy Waybar config
  xdg.configFile."waybar/config" = {
    force = true;
    source = ./waybar.jsonc;
  };
}
