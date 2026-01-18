{ ... }:
{
  # TUI - Terminal User Interface
  # Portable across Linux, macOS, NixOS
  # Everything here should work without a GUI
  
  imports = [
    ./shells        # Bash, Zsh, Nushell, Starship, Aliases
    ./editors       # Neovim with full config
    # ./git will be migrated from programs/git.nix
    # ./tools will have CLI dev tools
  ];
}
