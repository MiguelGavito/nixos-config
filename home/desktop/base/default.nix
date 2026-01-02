
{ config, lib, pkgs, ... }:

{
  # Shared Wayland desktop components for Hyprland and Niri
  
  # Install packages
  home.packages = with pkgs; [
    waybar
    wofi
    mako
    swaybg
    grim
    slurp
    brightnessctl
    pamixer
    playerctl
    swaylock
    networkmanagerapplet
  ];

  # Autostart services via systemd user
  systemd.user.services = {
    waybar = {
      Unit = { 
        Description = "Waybar status bar"; 
        After = [ "graphical-session.target" ]; 
      }; 
      Service = { 
        ExecStart = "${pkgs.waybar}/bin/waybar"; 
        Restart = "on-failure"; 
      }; 
      Install = { WantedBy = [ "graphical-session.target" ]; };
    };

    mako = {
      Unit = { 
        Description = "Mako notification daemon"; 
        After = [ "graphical-session.target" ]; 
      }; 
      Service = { 
        ExecStart = "${pkgs.mako}/bin/mako"; 
        Restart = "on-failure"; 
      }; 
      Install = { WantedBy = [ "graphical-session.target" ]; };
    };

    swaybg = {
      Unit = { 
        Description = "Swaybg wallpaper"; 
        After = [ "graphical-session.target" ]; 
      }; 
      Service = { 
        ExecStart = "${pkgs.swaybg}/bin/swaybg -m fill -i ${config.home.homeDirectory}/.config/wallpaper.jpg"; 
        Restart = "on-failure"; 
      }; 
      Install = { WantedBy = [ "graphical-session.target" ]; };
    };

    nm-applet = {
      Unit = { 
        Description = "NetworkManager Applet"; 
        After = [ "graphical-session.target" "network.target" ]; 
      }; 
      Service = { 
        ExecStart = "${pkgs.networkmanagerapplet}/bin/nm-applet --sm-disable";
        Restart = "on-failure";
        RestartSec = 2;
      }; 
      Install = { WantedBy = [ "graphical-session.target" ]; };
    };
  };

  # Deploy Waybar config
  xdg.configFile = {
    "waybar/config".source = ./waybar/config.jsonc;
    "waybar/style.css".source = ./waybar/style.css;
  };
}
