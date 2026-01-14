{ config, pkgs, ... }:

# Bash configuration - the foundation shell
# Even if you use zsh/nushell daily, bash is needed for:
# - SSH sessions
# - System scripts  
# - Compatibility
{
  programs.bash = {
    enable = true;
    enableCompletion = true;
        
    # Source nix profile (needed on non-NixOS systems like Ubuntu)
    profileExtra = ''
      # Load nix profile if it exists (for standalone home-manager)
      if [ -e $HOME/.nix-profile/etc/profile.d/nix.sh ]; then
        . $HOME/.nix-profile/etc/profile.d/nix.sh
      fi
    '';
    
    # Add user bin directories to PATH (without duplication)
    bashrcExtra = ''
      # User-installed binaries - add only if not already in PATH
      for dir in "$HOME/.local/bin" "$HOME/go/bin" "$HOME/.cargo/bin" "$HOME/.npm/bin"; do
        [[ ":$PATH:" == *":$dir:"* ]] || export PATH="$PATH:$dir"
      done
      
      # Ensure session variables are available in SSH
      export EDITOR="''${EDITOR:-nvim}"
      export VISUAL="''${VISUAL:-nvim}"
      export BROWSER="''${BROWSER:-brave}"
      
      # Fallback prompt if starship fails (non-interactive SSH case)
      if [[ -z "$PS1" ]]; then
        export PS1='\u@\h:\W\$ '
      fi
    '';
  };
}
