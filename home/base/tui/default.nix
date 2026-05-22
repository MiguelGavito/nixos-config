{ ... }:
{
  # TUI - Terminal User Interface
  # Portable across Linux, macOS, NixOS
  # Everything here should work without a GUI
  
  imports = [
    ./editors       # Neovim with full config
    ./tools         # SSH + wget and CLI networking tools
    ./tmux.nix      # Terminal multiplexer
    ../core/starship.nix
  ];
}
