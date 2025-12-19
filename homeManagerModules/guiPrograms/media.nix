{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    audacity # audio
    vlc #media 
  ];
}

