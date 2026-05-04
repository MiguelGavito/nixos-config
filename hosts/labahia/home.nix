
{
  config,
  pkgs,
  ...
}: {
  # labahia-specific configuration
  # Common settings like username/homeDirectory are set in outputs/x86_64-linux/src/labahia.nix

  imports = [
    # Core imported at flake level to avoid circular dependency
    ../../home/base/tui          # Shells, Neovim, common CLI tools
    # Add ../../home/base/gui if you want Kitty here
  ];

  # Optional: fonts for terminal/Nerd Fonts
  fonts.fontconfig.enable = true;
  home.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
    noto-fonts-cjk-sans
    noto-fonts-cjk-serif
    noto-fonts-emoji
    fira-code-nerdfont
  ];
}

