
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
        "z"         # Directory jumping (note: zoxide is better and enabled in common.nix)
        "direnv"    # Auto environment loading
      ];
    };
    
    # History settings
    history = {
      size = 10000;
      path = "${config.xdg.dataHome}/zsh/history";
    };
  };
}

