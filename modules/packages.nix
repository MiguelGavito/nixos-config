{
  config,
  pkgs,
  ...
}: {
  # activation of flatpak
  services.flatpak.enable = true;

  

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    # teams-for-linux
  ];
}
