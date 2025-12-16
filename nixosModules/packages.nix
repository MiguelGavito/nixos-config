{ config, pkgs, ... }:

{

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
	
	# Tengo que dividir todo este conf en varios modulos.

    #vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    wget
    discord # social
    libreoffice-still # documents
    nextcloud-client # sync
    onedrive # sync
    brave # navigator
    blender # 3d model
    gimp # image edition
    pavucontrol
    audacity # audio

    libgccjit # compilador de c++
    #python315 # python 3.15
    
    ferdium # social

    tree # see tree folder terminal
    
    lutris # same than the lower one
    bottles # to play windows games with windows instalation
  
    vlc #media 

    htop # pc stats
    bhop
    
    virtualbox
  ];
}
