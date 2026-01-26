{ config, lib, ... }:
# Wayland-specific environment variables.
# Apply these only when a Wayland compositor (Hyprland or Niri) is enabled.
let
  hyprEnabled = (config.modules.desktop.hyprland.enable or false);
  niriEnabled = (config.modules.desktop.niri.enable or false);
in
lib.mkIf (hyprEnabled || niriEnabled) {
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
