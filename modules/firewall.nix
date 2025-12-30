{ config, pkgs, ... }:

{
  networking.firewall = {
    enable = true;
    allowPing = false;         # ponlo en true si necesitas hacer ping o ser pingueado
    allowedTCPPorts = [ ];     # abre aquí puertos concretos si los necesitas
    allowedUDPPorts = [ ];
    # Ejemplos opcionales:
    # allowedTCPPortRanges = [ { from = 8000; to = 8100; } ];
    # logRefusedConnections = true; # si quieres visibilidad (puede ser ruidoso)
  };
}