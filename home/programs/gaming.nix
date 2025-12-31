{ config, pkgs, ...}:
{


  home.packages = with pkgs; [
    bottles
    heroic
    lutris
    deadlock-mod-manager
    #add more programs later
  ];
  
  # Wrapper opcional para Steam en Wayland (si lo usabas antes)
  # let
  #   steamWaylandLauncher = pkgs.writeShellScriptBin "steam-wayland" ''
  #     export STEAM_LOG=1
  #     export STEAM_DISABLE_BROWSER_GPU=1
  #     export STEAM_EXTRA_BROWSER_ARGS="--disable-gpu --disable-gpu-compositing"
  #     exec "$(command -v steam)" -console "$@"
  #   '';
  # in
  # {
  #   home.packages = [ steamWaylandLauncher ];
  #   xdg.desktopEntries.steam-wayland = {
  #     name = "Steam (Wayland)";
  #     exec = "steam-wayland";
  #     icon = "steam";
  #     terminal = false;
  #     type = "Application";
  #     categories = [ "Game" ];
  #     comment = "Steam with CEF software rendering for Wayland";
  #   };
  # }
}
