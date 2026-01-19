{
  config,
  pkgs,
  ...
}: {
  # Install KDE Connect for phone integration
  programs.kdeconnect.enable = true;

  # Gaming configuration has been moved to ./gaming.nix
  # Enable it in your host configuration with: modules.gaming.enable = true;
}
