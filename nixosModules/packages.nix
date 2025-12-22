{ config, pkgs, ... }:

{

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
	
	# Tengo que dividir todo este conf en varios modulos.

    #vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    wget
    onedrive # sync
    nextcloud-client # sync
    pavucontrol

    libgccjit # compilador de c++
    #python315 # python 3.15
    
    ferdium # social

    tree # see tree folder terminal
    
 

    htop # pc stats
    
    virtualbox
  ];
}
