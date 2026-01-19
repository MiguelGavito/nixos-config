{ mylib, ... }:
{
  # home/base - Cross-platform Home Manager configuration
  # These modules work on any platform (Linux, macOS, NixOS)
  
  imports = [
    ./core   # Essential tools: shells, editors, git, theme
    ./tui    # Terminal UIs: neovim, tmux, networking tools
    ./gui    # Cross-platform GUI: terminals, dev-tools, media
  ];
}
