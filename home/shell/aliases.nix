{ ... }:
let
  # Define aliases once, use everywhere
  shellAliases = {
    # kubectl shortcut
    k = "kubectl";
    
    # Better ls with eza
    ll = "eza -la --icons --git";
    la = "eza -a --icons";
    
    # Quick navigation
    nixc = "cd ~/nixos-config";
    ".." = "cd ..";
    "..." = "cd ../..";
    
    # Git shortcuts
    gs = "git status";
    ga = "git add";
    gc = "git commit";
    gp = "git push";
  };
in
{
  # Apply to bash/zsh
  home.shellAliases = shellAliases;
  
  # Also apply to nushell
  programs.nushell.shellAliases = shellAliases;
}
