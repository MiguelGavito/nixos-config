{
  config,
  lib,
  pkgs,
  ...
}:
with lib;
let
  cfg = config.modules.gaming;
in
{
  options.modules.gaming = {
    enable = mkEnableOption "Gaming support (Steam, Lutris, Wine, etc)";
  };

  config = mkIf cfg.enable {
    # Enable Steam with proper configuration
    programs.steam = {
      enable = true;
      protontricks.enable = true;
      gamescopeSession.enable = true;
    };

    # Enable GameMode for performance optimization
    programs.gamemode.enable = true;

    # Gaming-related system packages
    environment.systemPackages = with pkgs; [
      mangohud
      protonup-ng  # Use protonup-ng instead of protonup (newer version)
    ];

    # Steam environment variables for compatibility tools
    environment.sessionVariables = {
      STEAM_EXTRA_COMPAT_TOOLS_PATHS = "home/user/.steam/root/compatibilitytools.d";
    };

    # Kernel modules and settings for gaming
    boot.kernel.sysctl = {
      "vm.max_map_count" = 2147483642;
    };
  };
}
