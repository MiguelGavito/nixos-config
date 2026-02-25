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

  virtualisation.docker.enable = true;

  users.users.miguelagg.extraGroups = [ "docker" ];

  programs.zoom-us.enable = true;
  
  # mover luego a otro sitio 
  services.mysql = {
    enable = true;
    package = pkgs.mariadb; # or pkgs.mysql84 for MySQL specifically
  };
 

  # Gaming configuration has been moved to ./gaming.nix
  # Enable it in your host configuration with: modules.gaming.enable = true;
}
