{ config, pkgs, lib, ... }:

{
  # Configuración de Hyprland con Home Manager
  wayland.windowManager.hyprland = {
    enable = true;
    settings = {
      # Monitor configuration
      monitor = ",preferred,auto,1";

      # Ejecutar al inicio
      exec-once = [
        "waybar"
        "hyprpaper"
        "dunst"
        "nm-applet"
        "kdeconnect-indicator"
      ];

      # Variables de entorno
      env = [
        "XCURSOR_SIZE,24"
        "QT_QPA_PLATFORMTHEME,qt6ct"
      ];

      # Input configuration
      input = {
        kb_layout = "us,es";
        kb_options = "grp:alt_shift_toggle";
        
        follow_mouse = 1;
        
        touchpad = {
          natural_scroll = true;
        };
        
        sensitivity = 0;
      };

      # General settings
      general = {
        gaps_in = 5;
        gaps_out = 10;
        border_size = 2;
        "col.active_border" = "rgba(89b4faee) rgba(cba6f7ee) 45deg";
        "col.inactive_border" = "rgba(313244aa)";
        
        layout = "dwindle";
        
        allow_tearing = false;
      };

      # Decorations
      decoration = {
        rounding = 10;
        
        blur = {
          enabled = true;
          size = 3;
          passes = 1;
        };
        
        drop_shadow = true;
        shadow_range = 4;
        shadow_render_power = 3;
        "col.shadow" = "rgba(1a1a1aee)";
      };

      # Animations
      animations = {
        enabled = true;
        
        bezier = "myBezier, 0.05, 0.9, 0.1, 1.05";
        
        animation = [
          "windows, 1, 7, myBezier"
          "windowsOut, 1, 7, default, popin 80%"
          "border, 1, 10, default"
          "borderangle, 1, 8, default"
          "fade, 1, 7, default"
          "workspaces, 1, 6, default"
        ];
      };

      # Layout
      dwindle = {
        pseudotile = true;
        preserve_split = true;
      };

      # Gestures
      gestures = {
        workspace_swipe = true;
      };

      # Misc
      misc = {
        force_default_wallpaper = 0;
      };

      # Keybindings
      "$mod" = "SUPER";
      
      bind = [
        # Aplicaciones
        "$mod, Return, exec, kitty"
        "$mod, Q, killactive,"
        "$mod, M, exit,"
        "$mod, E, exec, dolphin"
        "$mod, V, togglefloating,"
        "$mod, D, exec, rofi -show drun"
        "$mod, P, pseudo,"
        "$mod, J, togglesplit,"
        
        # Mover foco
        "$mod, left, movefocus, l"
        "$mod, right, movefocus, r"
        "$mod, up, movefocus, u"
        "$mod, down, movefocus, d"
        
        # Cambiar workspaces
        "$mod, 1, workspace, 1"
        "$mod, 2, workspace, 2"
        "$mod, 3, workspace, 3"
        "$mod, 4, workspace, 4"
        "$mod, 5, workspace, 5"
        "$mod, 6, workspace, 6"
        "$mod, 7, workspace, 7"
        "$mod, 8, workspace, 8"
        "$mod, 9, workspace, 9"
        "$mod, 0, workspace, 10"
        
        # Mover ventanas a workspaces
        "$mod SHIFT, 1, movetoworkspace, 1"
        "$mod SHIFT, 2, movetoworkspace, 2"
        "$mod SHIFT, 3, movetoworkspace, 3"
        "$mod SHIFT, 4, movetoworkspace, 4"
        "$mod SHIFT, 5, movetoworkspace, 5"
        "$mod SHIFT, 6, movetoworkspace, 6"
        "$mod SHIFT, 7, movetoworkspace, 7"
        "$mod SHIFT, 8, movetoworkspace, 8"
        "$mod SHIFT, 9, movetoworkspace, 9"
        "$mod SHIFT, 0, movetoworkspace, 10"
        
        # Scroll workspaces
        "$mod, mouse_down, workspace, e+1"
        "$mod, mouse_up, workspace, e-1"
        
        # Screenshots
        ", Print, exec, grim -g \"$(slurp)\" - | wl-copy"
        "SHIFT, Print, exec, grim -g \"$(slurp)\" ~/Pictures/screenshot-$(date +%Y%m%d-%H%M%S).png"
      ];
      
      # Mouse bindings
      bindm = [
        "$mod, mouse:272, movewindow"
        "$mod, mouse:273, resizewindow"
      ];
    };
  };

  # Waybar configuration
  programs.waybar = {
    enable = true;
    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        height = 30;
        
        modules-left = [ "hyprland/workspaces" "hyprland/window" ];
        modules-center = [ "clock" ];
        modules-right = [ "pulseaudio" "network" "battery" "tray" ];
        
        "hyprland/workspaces" = {
          format = "{icon}";
          format-icons = {
            "1" = "一";
            "2" = "二";
            "3" = "三";
            "4" = "四";
            "5" = "五";
          };
        };
        
        clock = {
          format = "{:%H:%M}";
          format-alt = "{:%Y-%m-%d}";
        };
        
        battery = {
          format = "{capacity}% {icon}";
          format-icons = ["" "" "" "" ""];
        };
        
        network = {
          format-wifi = "{essid} ";
          format-ethernet = "Ethernet ";
          format-disconnected = "Disconnected ⚠";
        };
        
        pulseaudio = {
          format = "{volume}% {icon}";
          format-icons = {
            default = ["" "" ""];
          };
        };
      };
    };
    
    style = ''
      * {
        font-family: "JetBrainsMono Nerd Font";
        font-size: 13px;
      }
      
      window#waybar {
        background-color: rgba(30, 30, 46, 0.9);
        color: #cdd6f4;
        border-bottom: 3px solid rgba(137, 180, 250, 0.5);
      }
      
      #workspaces button {
        padding: 0 10px;
        color: #cdd6f4;
      }
      
      #workspaces button.active {
        background-color: rgba(137, 180, 250, 0.3);
      }
      
      #clock,
      #battery,
      #network,
      #pulseaudio {
        padding: 0 10px;
        margin: 0 5px;
      }
    '';
  };

  # Kitty terminal
  programs.kitty = {
    enable = true;
    theme = "Catppuccin-Mocha";
    settings = {
      font_size = 12;
      font_family = "JetBrainsMono Nerd Font";
      background_opacity = "0.95";
    };
  };

  # Rofi launcher
  programs.rofi = {
    enable = true;
    package = pkgs.rofi-wayland;
    theme = "Arc-Dark";
  };
}
