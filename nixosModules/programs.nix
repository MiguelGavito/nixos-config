{ config, pkgs, ... }:

{

  # Install firefox.
  programs.firefox.enable = true;


  # install vscode
  programs.vscode.enable = true;

  # install kde for connect with phone  
  programs.kdeconnect.enable = true;

  # Install Steam
  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
    dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
    localNetworkGameTransfers.openFirewall = true; # Open ports in the firewall for Steam Local Network Game Transfers
  };

}
