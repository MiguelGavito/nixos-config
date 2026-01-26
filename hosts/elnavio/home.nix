
{
  config,
  pkgs,
  ...
}: {
  # Only elnavio-specific home-manager settings here
  # Common configs are imported via outputs/x86_64-linux/src/elnavio.nix

  programs.git.settings = {
    user.name = "MiguelGavito";
    user.email = "mgavitogzz@gmail.com";
  };

  # GNOME-specific settings (active when using GNOME session)
  dconf.settings = {
    "org/gnome/desktop/interface" = {
      cursor-theme = "Adwaita";
      cursor-size = 24;
    };

    # Atajos de teclado personalizados
    "org/gnome/settings-daemon/plugins/media-keys" = {
      custom-keybindings = [
        "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/"
      ];
    };

    "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0" = {
      name = "Terminal";
      command = "kitty";
      binding = "<Control><Alt>t";
    };
  };

  home.stateVersion = "25.11";

  # Ensure icon fonts for Waybar (Font Awesome/Nerd Fonts)
  fonts.fontconfig.enable = true;
  home.packages = [
    pkgs.font-awesome
    pkgs.adwaita-icon-theme
  ];
}

