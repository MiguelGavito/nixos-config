
{ ... }:

# Wayland-specific environment variables
# Import this ONLY in hosts that use Wayland compositors:
# - Hyprland
# - Niri
# - Sway
# - River
# etc.
#
# Do NOT import on:
# - X11 sessions (KDE X11, GNOME X11)
# - Servers without GUI
# - macOS
{
  home.sessionVariables = {
    # Tell applications to use Wayland
    XDG_SESSION_TYPE = "wayland";
    QT_QPA_PLATFORM = "wayland";
    SDL_VIDEODRIVER = "wayland";
    
    # Cursor settings for Wayland
    XCURSOR_SIZE = "18";
    
    # GTK theme for Wayland
    GTK_THEME = "Adwaita:dark";
  };
}
