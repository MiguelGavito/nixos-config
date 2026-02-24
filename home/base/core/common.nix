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

    # misc utilities
    graphviz
  ]
    # this are aplication that are linux only
  ++ (lib.optionals pkgs.stdenv.isLinux [
    # gui applications (Linux only)
    github-desktop

    libnotify
    xdg-utils
    #wineWowPackages.wayland
  ]);
}
