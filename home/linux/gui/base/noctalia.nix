{
  pkgs,
  config,
  lib,
  inputs,
  system,
  ...
}:
let
  cfg = config.modules.desktop.niri;
in
{
  config = lib.mkIf cfg.enable {
    home.packages = [
      inputs.noctalia.packages.${system}.default
      pkgs.qt6Packages.qt6ct  # for theming
      pkgs.quickshell
    ];

    # Point noctalia config to your repo
    xdg.configFile."noctalia".source = 
      config.lib.file.mkOutOfStoreSymlink 
      "${config.home.homeDirectory}/nixos-config/home/linux/gui/base/noctalia/config";

    # Systemd service to run noctalia shell automatically
    # systemd.user.services.noctalia-shell = {
    #   Unit = {
    #     Description = "Noctalia Shell - Wayland desktop shell";
    #     Documentation = "https://docs.noctalia.dev/docs";
    #     After = ["graphical-session.target"];
    #     ConditionEnvironment = "XDG_SESSION_TYPE=wayland";
    #   };
    #
    #   Service = {
    #     ExecStart = "${inputs.noctalia.packages.${system}.default}/bin/noctalia --daemon";
    #     Restart = "on-failure";
    #     RestartSec = 2;
    #
    #     Environment = [
    #       "QT_QPA_PLATFORM=wayland;xcb"
    #       "QT_QPA_PLATFORMTHEME=qt6ct"
    #       "QT_AUTO_SCREEN_SCALE_FACTOR=1"
    #     ];
    #   };
    #
    #   Install = {
    #     WantedBy = ["graphical-session.target"];
    #   };
    # };
  };
}
