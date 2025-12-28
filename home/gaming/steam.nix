
{ config, pkgs, ... }:

let
  # Wrapper that runs Steam with Wayland CEF fix
  steamWaylandLauncher = pkgs.writeShellScriptBin "steam-wayland" ''
    export STEAM_LOG=1
    export STEAM_DISABLE_BROWSER_GPU=1
    export STEAM_EXTRA_BROWSER_ARGS="--disable-gpu --disable-gpu-compositing"
    exec "$(command -v steam)" -console "$@"
  '';
in
{
  # Install the wrapper script
  home.packages = [ steamWaylandLauncher ];

  # Desktop entry for "Steam (Wayland)" - appears in wofi/menus as separate launcher
  xdg.desktopEntries.steam-wayland = {
    name = "Steam (Wayland)";
    exec = "steam-wayland";
    icon = "steam";
    terminal = false;
    type = "Application";
    categories = [ "Game" ];
    comment = "Steam with CEF software rendering for Wayland";
  };
}


