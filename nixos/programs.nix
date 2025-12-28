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
    
    # Add compatibility packages for better Wayland support
    extraCompatPackages = with pkgs; [
      gamescope  # Valve's microcompositor for gaming
    ]; 
    
    # Enable gamescope session (optional, can wrap Steam)
    gamescopeSession.enable = true;
  };

 
}
