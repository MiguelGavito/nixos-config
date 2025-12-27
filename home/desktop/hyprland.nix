
{ config, lib, pkgs, ... }:

{
  xdg.configFile."hypr/hyprland.conf" = {
    force = true;
    text = ''
    # Monitor configuration
    monitor=,preferred,auto,1

    # Input configuration
    input {
        kb_layout = us
        follow_mouse = 1
        touchpad {
            natural_scroll = yes
        }
        sensitivity = 0
    }

    # General configuration
    general {
        gaps_in = 5
        gaps_out = 10
        border_size = 2
        col.active_border = rgba(81a1c1ee) rgba(88c0d0ee) 45deg
        col.inactive_border = rgba(4c566aaa)
        layout = dwindle
    }

    # Decorations
    decoration {
        rounding = 5
        blur {
            enabled = true
            size = 3
            passes = 1
        }
        drop_shadow = yes
        shadow_range = 4
        shadow_render_power = 3
        col.shadow = rgba(1a1a1aee)
    }

    # Animations
    animations {
        enabled = yes
        bezier = myBezier, 0.05, 0.9, 0.1, 1.05
        animation = windows, 1, 7, myBezier
        animation = windowsOut, 1, 7, default, popin 80%
        animation = border, 1, 10, default
        animation = fade, 1, 7, default
        animation = workspaces, 1, 6, default
    }

    # Layout
    dwindle {
        pseudotile = yes
        preserve_split = yes
    }

    # Misc
    misc {
        force_default_wallpaper = 0
    }

    # Key bindings
    $mainMod = SUPER

    # Aplicaciones
    bind = $mainMod, Return, exec, kitty
    bind = $mainMod, Space, exec, wofi --show drun
    bind = $mainMod, E, exec, kitty -e ranger
    
    # Window management
    bind = $mainMod, Q, killactive
    bind = $mainMod, M, exit
    bind = $mainMod, V, togglefloating
    bind = $mainMod, P, pseudo
    bind = $mainMod, F, fullscreen
    
    # Focus
    bind = $mainMod, H, movefocus, l
    bind = $mainMod, L, movefocus, r
    bind = $mainMod, K, movefocus, u
    bind = $mainMod, J, movefocus, d
    
    # Move windows
    bind = $mainMod SHIFT, H, movewindow, l
    bind = $mainMod SHIFT, L, movewindow, r
    bind = $mainMod SHIFT, K, movewindow, u
    bind = $mainMod SHIFT, J, movewindow, d
    
    # Workspaces
    bind = $mainMod, 1, workspace, 1
    bind = $mainMod, 2, workspace, 2
    bind = $mainMod, 3, workspace, 3
    bind = $mainMod, 4, workspace, 4
    bind = $mainMod, 5, workspace, 5
    
    # Move to workspace
    bind = $mainMod SHIFT, 1, movetoworkspace, 1
    bind = $mainMod SHIFT, 2, movetoworkspace, 2
    bind = $mainMod SHIFT, 3, movetoworkspace, 3
    bind = $mainMod SHIFT, 4, movetoworkspace, 4
    bind = $mainMod SHIFT, 5, movetoworkspace, 5
    
    # Mouse bindings
    bindm = $mainMod, mouse:272, movewindow
    bindm = $mainMod, mouse:273, resizewindow
    
    # Screenshots
    bind = , Print, exec, grim -g "$(slurp)" - | wl-copy
    
    # Lock screen
    bind = $mainMod, Escape, exec, swaylock
    
    # Brightness
    bind = , XF86MonBrightnessUp, exec, brightnessctl set +5%
    bind = , XF86MonBrightnessDown, exec, brightnessctl set 5%-
    
    # Volume
    bind = , XF86AudioRaiseVolume, exec, pamixer -i 5
    bind = , XF86AudioLowerVolume, exec, pamixer -d 5
    bind = , XF86AudioMute, exec, pamixer -t
    
    # Media
    bind = , XF86AudioPlay, exec, playerctl play-pause
    bind = , XF86AudioNext, exec, playerctl next
    bind = , XF86AudioPrev, exec, playerctl previous

    # Autostart
    exec-once = waybar
    exec-once = mako
    exec-once = swaybg -i ~/.config/wallpaper.jpg -m fill
  '';
  };
}
