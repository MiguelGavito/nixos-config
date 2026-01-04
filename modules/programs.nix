{ config, pkgs, ... }:

{
  # install kde for connect with phone  
  programs.kdeconnect.enable = true;


  # Install Steam with Wayland compatibility packages
  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
    localNetworkGameTransfers.openFirewall = true;

    gamescopeSession.enable = true;

    
  };

 
}
