
{ config, lib, pkgs, ... }:
{
  # Session-wide defaults for terminal/editor, Wayland, and paging
  home.sessionVariables = {
    TERMINAL = "x-terminal-emulator";
    EDITOR = "nvim";
    VISUAL = "nvim";
    BROWSER = "brave";
    XCURSOR_SIZE = "18";
    # Wayland-friendly env for Steam/UI toolkits
    # XDG_SESSION_TYPE = "wayland";
    # QT_QPA_PLATFORM = "wayland";
    # SDL_VIDEODRIVER = "wayland";
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

  # Provide a portable terminal wrapper that picks the first available
  home.packages = [
    (pkgs.writeShellScriptBin "x-terminal-emulator" ''
      #!/usr/bin/env bash
      set -euo pipefail
      try() { command -v "$1" >/dev/null 2>&1; }

      if try kitty; then exec kitty "$@"; fi
      if try alacritty; then exec alacritty "$@"; fi
      if try konsole; then exec konsole "$@"; fi
      if try foot; then exec foot "$@"; fi
      if try wezterm; then exec wezterm "$@"; fi
      if try gnome-terminal; then exec gnome-terminal "$@"; fi

      echo "No terminal found (kitty/alacritty/konsole/foot/wezterm/gnome-terminal)." >&2
      echo "Please install one of them or adjust the wrapper." >&2
      exit 127
    '')
  ];
}



