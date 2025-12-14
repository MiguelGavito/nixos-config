{ config, pkgs, ... }:

{
  networking.hostName = "elnavio";
  networking.networkmanager.enable = true;

  # Configuración de proxy si es necesario
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";
}
