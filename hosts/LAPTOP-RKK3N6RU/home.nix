
{
  config,
  pkgs,
  ...
}: {
  # elcarguero-specific configuration
  # Common settings like username/homeDirectory are set in outputs/x86_64-linux/src/elcarguero.nix

  imports = [
    # Core imported at flake level to avoid circular dependency

    ../../home/base/tui          # Shells, Neovim, common CLI tools
    # Add ../../home/base/gui if you want Kitty here
  ];

  programs.git.settings = {
    user.name = "MiguelGavito";
    user.email = "mgavitogzz@gmail.com";
  };

  # Optional: fonts for terminal/Nerd Fonts
  fonts.fontconfig.enable = true;
  home.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
  ];
}

