{ config, pkgs, ... }:

{
  programs.zsh = {
    enable = true; # see later
    enableCompletion = true;
    oh-my-zsh = {
      enable = true;
      theme = "agnoster";
      plugins = [ "git" "z" ];
    };
    
    # history.size = 10000;
  };


}
