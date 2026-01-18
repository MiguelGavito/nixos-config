{
  config,
  pkgs,
  ...
}: {
  # elcarguero-specific configuration
  # Common settings like username/homeDirectory are set in outputs/x86_64-linux/src/elcarguero.nix

  imports = [
    ../../home/base/core         # Core HM config & essentials
    ../../home/base/tui          # Shells, Neovim, common CLI tools
    # Add ../../home/base/gui if you want Kitty here
  ];

  # Optional: fonts for terminal/Nerd Fonts
  fonts.fontconfig.enable = true;
  home.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
  ];
}
