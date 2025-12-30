
{
  imports = [
    ./boot.nix
    ./locale.nix
    ./networking.nix
    ./nix.nix
    ./graphics.nix
    ./printer.nix
    # ./audio.nix
    ./desktop/default.nix
    ./bluetooth.nix
    ./packages.nix
    ./programs.nix
    ./users.nix
    ./firewall.nix
    ./ssh.nix
  ];
}
