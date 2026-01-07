
{ config, lib, pkgs, ... }:
{
  # Wayland-friendly environment variables (opt-in per host)
  home.sessionVariables = {
    XDG_SESSION_TYPE = "wayland";
    QT_QPA_PLATFORM = "wayland";
    SDL_VIDEODRIVER = "wayland";
  };
}
