{
  config,
  pkgs,
  ...
}: {
  # MacBook Air M4 - Home Manager configuration
  # Common settings like username/homeDirectory are set in outputs/aarch64-darwin/src/macbookair.nix

  # Git configuration (personal)
  programs.git = {
    userName = "MiguelGavito";
    userEmail = "mgavitogzz@gmail.com";
  };

  # macOS-specific packages
  home.packages = with pkgs; [
    # macOS utilities
    # rectangle (window manager - via homebrew recommended)
    
    # Fonts
    (nerdfonts.override { fonts = [ "JetBrainsMono" ]; })
  ];

  # macOS-specific settings
  # These are managed by nix-darwin, not home-manager
  # See: outputs/aarch64-darwin/src/macbookair.nix
}
