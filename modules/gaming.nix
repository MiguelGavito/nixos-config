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
    # Enable Steam
    programs.steam = {
      enable = true;
      protontricks.enable = true;
      gamescopeSession.enable = true;
    };

    # Gaming-related system packages
    environment.systemPackages = with pkgs; [
      gamemode
      mangohud
      protonup
    ];

    # Kernel modules and settings for gaming
    boot.kernel.sysctl = {
      "vm.max_map_count" = 2147483642;
    };
  };
}
