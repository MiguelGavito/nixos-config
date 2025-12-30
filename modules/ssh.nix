{ ... }:

{
  services.openssh = {
    enable = false;
    settings = {
      PasswordAuthentication = false;  # solo llaves
      PermitRootLogin = "no";
      X11Forwarding = false;
      AllowTcpForwarding = "no";       # pon "yes" si lo necesitas
    };
    openFirewall = false; # mantenlo cerrado salvo que lo uses
  };
}