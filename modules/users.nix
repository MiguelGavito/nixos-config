{ config, pkgs, ... }:

{
  # Shell ZSH
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    ohMyZsh = {
      enable = true;
      theme = "agnoster";
      plugins = [ "git" "z" "sudo" "docker" "kubectl" ];
    };
  };

  # Usuario principal
  users.users.miguelagg = {
    shell = pkgs.zsh;
    isNormalUser = true;
    description = "Miguel Gavito";
    extraGroups = [ "networkmanager" "wheel" "docker" "video" ];
    packages = with pkgs; [
      kdePackages.kate
    ];
  };
}
