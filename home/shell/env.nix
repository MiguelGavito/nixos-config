{ config, lib, pkgs, ... }:
{
  # Session-wide defaults for terminal/editor, Wayland, and paging
  home.sessionVariables = {
    TERMINAL = "kitty";
    EDITOR = "nvim";
    VISUAL = "nvim";
    BROWSER = "brave";
    XCURSOR_SIZE = "24";
    # Wayland-friendly env for Steam/UI toolkits
    XDG_SESSION_TYPE = "wayland";
    QT_QPA_PLATFORM = "wayland";
    SDL_VIDEODRIVER = "wayland";
    # Icon and GTK theme for tray icons
    GTK_THEME = "Adwaita:dark";
    ICON_THEME = "Adwaita:dark";

    # Pager and less history locations
    LESSHISTFILE = "${config.xdg.cacheHome}/less/history";
    LESSKEY = "${config.xdg.configHome}/less/lesskey";
    DELTA_PAGER = "less -R";
    MANPAGER = "sh -c 'col -bx | bat -l man -p'";

    # Wine prefix location under XDG data
    WINEPREFIX = "${config.xdg.dataHome}/wine";
  };

  # Provide wrappers so apps that call xterm/x-terminal-emulator open kitty
  home.packages = [
    (pkgs.writeShellScriptBin "xterm" ''exec kitty "$@"'')
    (pkgs.writeShellScriptBin "x-terminal-emulator" ''exec kitty "$@"'')
  ];
}

