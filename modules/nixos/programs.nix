{
  config,
  pkgs,
  ...
}: {
  # Install KDE Connect for phone integration
  programs.kdeconnect.enable = true;

  
  services.teamviewer.enable = true;

  environment.systemPackages = with pkgs; [
    teamviewer
  ];
  # Gaming configuration has been moved to ./gaming.nix
  # Enable it in your host configuration with: modules.gaming.enable = true;
}
