{ config, pkgs, ... }:

{
  imports = [
    ../../home

    ../../home/core.nix

    ../../home/shell
  ];

  programs.git = {
    userName = "MiguelGavito";
    userEmail = "mgavitogzz@gmail.com";
  };
  
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
      command = "kgx";
      binding = "<Control><Alt>t";
    };
  };

  home.stateVersion = "25.11";


  # Ensure icon fonts for Waybar (Font Awesome/Nerd Fonts)
  fonts.fontconfig.enable = true;
  home.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
    font-awesome
    adwaita-icon-theme
  ];
}

