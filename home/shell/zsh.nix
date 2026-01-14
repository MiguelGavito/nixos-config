
{ config, pkgs, ... }:

{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    
    # Oh-my-zsh for quick setup
    oh-my-zsh = {
      enable = true;
      theme = "agnoster";
      plugins = [ 
        "git" 
        # "z" removed - conflicts with zoxide (which is better)
        # "direnv" removed - already loaded separately in common.nix
      ];
    };
    
    # History settings
    history = {
      size = 10000;
      path = "${config.xdg.dataHome}/zsh/history";
    };
    
    # Safety guard for non-interactive shells (SSH, scripts)
    initExtra = ''
      # Only load heavy features in interactive mode
      if [[ -o interactive ]]; then
        # Interactive-only configurations go here
        # (oh-my-zsh already handles this, but this is a safety guard)
        :
      fi
    '';
  };
}

