{
  config,
  pkgs,
  ...
}: {
  # Elgaleon (Mac) - Home Manager configuration
  # Common settings like username/homeDirectory are set in outputs/aarch64-darwin/src/elgaleon.nix

  # Git configuration (personal)
  programs.git = {
    enable = true;
    settings.user = {
      name = "MiguelGavito";
      email = "mgavitogzz@gmail.com";
    };
  };

  imports = [
    ../../home/base/tui
  ];

  # macOS-specific packages
  home.packages = with pkgs; [
    # macOS utilities
    # rectangle (window manager - via homebrew recommended)

    # Fonts
    nerd-fonts.jetbrains-mono
  ];

  # macOS-specific settings
  # These are managed by nix-darwin, not home-manager
  # See: outputs/aarch64-darwin/src/macbookair.nix
}
