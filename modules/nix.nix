{
  config,
  pkgs,
  ...
}: {
  # Allow flakes
  nix.settings.experimental-features = ["nix-command" "flakes"];

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  nixpkgs.config.permittedInsecurePackages = [
    "ciscoPacketTracer8-9.0.0"
  ];
}
