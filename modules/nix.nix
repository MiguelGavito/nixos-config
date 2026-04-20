{
  config,
  pkgs,
  ...
}: {
  # Allow flakes
  nix.settings = {
    experimental-features = ["nix-command" "flakes"];

    # Keep the default cache and add Hyprland's cache for flake-based Hyprland builds.
    substituters = [
      "https://cache.nixos.org/"
      "https://hyprland.cachix.org"
    ];
    trusted-public-keys = [
      "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
      "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="
    ];

    auto-optimise-store = true;
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;
}
