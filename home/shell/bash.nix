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
    
    # Add user bin directories to PATH
    bashrcExtra = ''
      # User-installed binaries
      export PATH="$PATH:$HOME/.local/bin"
      export PATH="$PATH:$HOME/go/bin"
      export PATH="$PATH:$HOME/.cargo/bin"
      export PATH="$PATH:$HOME/.npm/bin"
    '';
  };
}
