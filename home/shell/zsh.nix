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
    
    # check later if is better to unify the file where the aliases are configured
    shellAliases = {
      ll = "ls -l";
      nixc = "cd ~/Dev/nixos-config";
      #rm = "rm -i"; # remove with and question to be secure
      #update = "sudo nixos-rebuild switch --flake .\#elnavio # checar luego como poner input aqui
    };
    # history.size = 10000;
  };


}
