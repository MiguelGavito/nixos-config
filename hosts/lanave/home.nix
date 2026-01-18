
{
  config,
  pkgs,
  username,
  ...
}: {
  imports = [
    # New portable TUI structure (core imported at flake level)
    ../../home/base/tui           # Shells, Neovim, CLI tools (portable)
    ../../home/base/gui           # Terminal (Kitty) and cross-platform GUI
    
    # Linux-specific
    ../../home/linux/gui/wayland  # Waybar, Mako (for Niri)
    
    # Desktop compositors
    ../../home/desktop/niri       # Niri config
    # Legacy imports removed (migrated to base/core & base/tui)
  ];

  # Enable modules
  modules.desktop.niri.enable = false;
  modules.linux.wayland.enable = false;  # Enable Waybar, Mako for Niri

  # lanave-specific overrides only
  fonts.fontconfig.enable = true;
  home.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
  ];

  programs.git.settings = {
    user.name = "MiguelGavito";
    user.email = "mgavitogzz@gmail.com";
  };
}

