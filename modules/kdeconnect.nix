{ config, pkgs, ... }:

{
  # KDE Connect para sincronización con dispositivos móviles
  programs.kdeconnect.enable = true;
  
  # Abrir puertos necesarios para KDE Connect
  networking.firewall = {
    allowedTCPPortRanges = [
      { from = 1714; to = 1764; } # KDE Connect
    ];
    allowedUDPPortRanges = [
      { from = 1714; to = 1764; } # KDE Connect
    ];
  };
}
