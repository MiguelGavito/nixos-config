{ config, pkgs, ... }:

{
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.miguelagg = {
    shell = pkgs.zsh;
    isNormalUser = true;
    description = "Miguel Gavito";
    extraGroups = [ "networkmanager" "wheel" ];

  };
}
