
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

  # Deploy Waybar style for better readability
  xdg.configFile."waybar/style.css" = {
    force = true;
    text = ''
      /* Nord-inspired Waybar style (from wiki examples) */
      * {
        font-family: JetBrains Mono, monospace;
        font-size: 13pt;
      }
      window#waybar {
        background: rgba(46, 52, 64, 0.94); /* nord0-ish */
        color: #eceff4;
        border-bottom: 1px solid #4c566a;
      }
      #workspaces button {
        padding: 0 10px;
        color: #d8dee9;
        border-radius: 6px;
      }
      #workspaces button.focused {
        background: #88c0d0;
        color: #2e3440;
      }
      #workspaces button.urgent {
        background: #bf616a;
        color: #eceff4;
      }
      #clock, #battery, #backlight, #network, #pulseaudio, #tray, #window {
        padding: 0 10px;
      }
      #clock { color: #88c0d0; }
      #battery.warning { color: #ebcb8b; }
      #battery.critical { color: #bf616a; }
      #pulseaudio.muted { color: #a3be8c; }
    '';
  };
}
