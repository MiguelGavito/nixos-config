{ pkgs, ... }:
{
  home.packages = with pkgs; [
    # archives & files
    nautilus
    file-roller

    # communication
    discord
    ferdium

    # utils
    libnotify
    xdg-utils
  ];
}
