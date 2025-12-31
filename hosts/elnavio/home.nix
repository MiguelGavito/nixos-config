{ config, pkgs, ... }:

{
  imports = [
    ../../home

    ../../home/core.nix

    # ../../home/shell
    # ../../home/programs   uncomment after clean all of  the home folder
  ];

 # Force Home Manager to overwrite existing files on first run
  xdg.configFile."mimeapps.list".force = true;
  xdg.configFile."user-dirs.dirs".force = true;
  home.file.".mozilla/firefox/profiles.ini".force = true;

  programs.git.settings = {
    user.name = "MiguelGavito";
    user.email = "mgavitogzz@gmail.com";
  };


  # all of this down is just settings on gnome
  
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
  home.packages = with pkgs; [
    font-awesome
    adwaita-icon-theme
  ];
}

