{
  config,
  lib,
  pkgs,
  ...
}:
with lib;
let
  cfg = config.modules.fcitx;
in
{
  options.modules.fcitx = {
    enable = mkEnableOption "Fcitx5 input method framework for CJK support (Wayland compatible)";
  };

  config = mkIf cfg.enable {
    # Enable Fcitx5 at system level
    i18n.inputMethod.enable = true;
    i18n.inputMethod.type = "fcitx5";

    # System-wide packages - just core Fcitx5, addons will be in home-manager
    environment.systemPackages = with pkgs; [
      fcitx5
      qt6Packages.fcitx5-configtool
    ];

    # Environment variables for Wayland + Fcitx5
    environment.sessionVariables = {
      QT_IM_MODULE = "fcitx";
      XMODIFIERS = "@im=fcitx";
    };
  };
}
