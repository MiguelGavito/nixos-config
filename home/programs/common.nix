{
  lib,
  pkgs,
  catppuccin-bat,
  ...
}: {


  home.packages = (with pkgs; [
    # archives
    zip
    unzip
    p7zip

    # utils
    ripgrep
    yq-go # https://github.com/mikefarah/yq
    htop
    file
    tree 

    # misc
    libnotify
    wineWowPackages.wayland
    xdg-utils
    graphviz

    # file 
    nautilus
    file-roller

    # social
    discord
    ferdium

    
    # art design
    blender
    musescore
    
    # IDE
    # insomnia

    # cloud native
    docker-compose
    kubectl

    nodejs
    # nodePackages.npm
    # nodePackages.pnpm
    # yarn

    # db related
    dbeaver-bin
    mycli
    pgcli
  ])
  ++
  (with pkgs.kdePackages; [
    kate
    dolphin
    ark
    kio-extras
    ffmpegthumbs
  ]);

  programs = {
    tmux = {
      enable = true;
      clock24 = true;
      keyMode = "vi";
      extraConfig = ''
        set -g mouse on
        set -g history-limit 10000
        set -g base-index 1
        setw -g pane-base-index 1
        set -g status-keys vi
        bind r source-file ~/.tmux.conf \; display "Config reloaded"
      '';
    };

    bat = {
      enable = true;
      config = {
        pager = "less -FR";
        theme = "catppuccin-mocha";
      };
      themes = {
        # https://raw.githubusercontent.com/catppuccin/bat/main/Catppuccin-mocha.tmTheme
        catppuccin-mocha = {
          src = catppuccin-bat;
          file = "Catppuccin-mocha.tmTheme";
        };
      };
    };

    btop.enable = true; # replacement of htop/nmon
    eza.enable = true; # A modern replacement for ‘ls’
    jq.enable = true; # A lightweight and flexible command-line JSON processor
    ssh.enable = true;
    aria2.enable = true;

    skim = {
      enable = true;
      enableZshIntegration = true;
      defaultCommand = "rg --files --hidden";
      changeDirWidgetOptions = [
        "--preview 'exa --icons --git --color always -T -L 3 {} | head -200'"
        "--exact"
      ];
    };
  };

  services = {
    syncthing.enable = true;

    # auto mount usb drives
    udiskie.enable = true;
  };
}
