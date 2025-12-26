{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    audacity # audio
    vlc #media 
    gimp # image edition
    obs-studio # recorder
    ];
}

