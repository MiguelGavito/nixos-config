{ config, lib, pkgs, ... }:
{
  # Universal session variables (work on any system)
  home.sessionVariables = {
    # Default applications
    EDITOR = "nvim";
    VISUAL = "nvim";
    BROWSER = "brave";
    
    # XDG compliance - clean up home directory
    LESSHISTFILE = "${config.xdg.cacheHome}/less/history";
    LESSKEY = "${config.xdg.configHome}/less/lesskey";
    DELTA_PAGER = "less -R";
    
    # Man pages with bat (clean output without ANSI codes)
    MANPAGER = "sh -c 'col -bx | bat -l man -p --paging=always'";
    MANROFFOPT = "-c";  # This ensures clean text without formatting codes

    # Wine prefix location under XDG data
    WINEPREFIX = "${config.xdg.dataHome}/wine";
  };

  # NOTE: Wayland-specific vars moved to wayland-env.nix
  # Import that in hosts that use Wayland (Hyprland, Niri, Sway)
}
