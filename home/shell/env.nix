

{ config, lib, pkgs, ... }:
{
  # Session-wide defaults for terminal/editor and Steam Wayland env
  home.sessionVariables = {
    TERMINAL = "kitty";
    EDITOR = "nvim";
    VISUAL = "nvim";
    XCURSOR_SIZE = "24";
    # Wayland-friendly env for Steam/UI toolkits
    XDG_SESSION_TYPE = "wayland";
    QT_QPA_PLATFORM = "wayland";
    SDL_VIDEODRIVER = "wayland";
    STEAM_USE_XDG_DESKTOP_PORTAL = "1";
  };

  # Provide wrappers so apps that call xterm/x-terminal-emulator open kitty
  home.packages = [
    (pkgs.writeShellScriptBin "xterm" ''exec kitty "$@"'')
    (pkgs.writeShellScriptBin "x-terminal-emulator" ''exec kitty "$@"'')
  ];
}
