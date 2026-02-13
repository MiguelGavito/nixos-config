{ pkgs, ... }:
{
  home.packages = with pkgs; [
    # archives & files
    nautilus
    file-roller

    # communication
    discord
    ferdium
    telegram-desktop
    # teams

    # utils
    libnotify
    xdg-utils
  ];
}
