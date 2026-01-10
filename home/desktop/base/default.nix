
{ config, lib, pkgs, ... }:

{
  # Shared Wayland desktop components for Hyprland and Niri
  
  # Install packages
  home.packages = with pkgs; [
    fuzzel
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
        # Use XDG data directory for wallpaper (wallpaper.png from project root)
        ExecStart = "${pkgs.swaybg}/bin/swaybg -m fill -i ${config.xdg.dataHome}/wallpapers/wallpaper.png"; 
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

  # fuzzel configuration
  programs.fuzzel = {
    enable = true;
    settings = {
      main = {
        terminal = "kitty";
        anchor = "center";
        lines = 20;
        width = 50;
        horizontal-pad = 10;
      };
      colors = {
        background = "1e1e2eff";      # Catppuccin dark
        text = "cdd6f4ff";            # Light text
        match = "a6e3a1ff";           # Green matches
        selection = "89b4faff";       # Blue selection
        selection-text = "1e1e2eff";
        border = "89b4faff";
      };
      border = {
        width = 2;
        radius = 8;
      };
    };
  }; 
  # Deploy Waybar config
  xdg.configFile = {
    "waybar/config".source = ./waybar/config.jsonc;
    "waybar/style.css".source = ./waybar/style.css;
    "waybar/scripts/launch.sh".source = ./waybar/scripts/launch.sh;
  };

  # Wallpaper management with home-manager
  # Using wallpaper.png from project root
  home.file."${config.xdg.dataHome}/wallpapers/wallpaper.png" = {
    source = ../../../wallpaper.png;
  };

  # Wallpaper directory setup (if doesn't exist)
  home.activation.createWallpaperDir = lib.hm.dag.entryAfter ["writeBoundary"] ''
    mkdir -p ${config.xdg.dataHome}/wallpapers
  '';
}
