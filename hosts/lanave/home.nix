{
  config,
  pkgs,
  username,
  ...
}: {
  imports = [
    # New portable TUI structure
    ../../home/base/core          # Core Home Manager config
    ../../home/base/tui           # Shells, Neovim, CLI tools (portable)
    
    # Linux-specific
    ../../home/linux/gui/wayland  # Waybar, Mako (for Niri)
    
    # Desktop compositors
    ../../home/desktop/niri       # Niri config
    
    # Still from old structure (to migrate later)
    ../../home/programs/git.nix          # Git config + SSH
    ../../home/programs/networking.nix   # SSH, wget, network tools
  ];

  # Enable modules
  modules.desktop.niri.enable = true;
  modules.linux.wayland.enable = true;  # Enable Waybar, Mako for Niri

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
