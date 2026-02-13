{
  config,
  pkgs,
  ...
}: {
  # Bootloader.
  boot.loader.systemd-boot.enable = true; # volver a poner true luego
  boot.loader.efi.canTouchEfiVariables = true;
}
