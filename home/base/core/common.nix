{
  lib,
  pkgs,
  ...
}: {
  home.packages = with pkgs; [
    # archives
    zip
    unzip
    p7zip

    # utils
    ripgrep
    yq-go # YAML query
    file
    tree
    
    # cloud native
    docker-compose
    kubectl

    # Node.js runtime
    nodejs

    # db clients
    mycli
    pgcli

    # gui applications
    github-desktop

    # misc utilities
    graphviz
  ]
  ++ (lib.optionals pkgs.stdenv.isLinux [
    libnotify
    xdg-utils
    #wineWowPackages.wayland
  ]);
}
