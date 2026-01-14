{ config, pkgs, ... }:

{
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.miguelagg = {
    # Use bash as system shell for SSH compatibility
    # Terminal still uses zsh (configured in home-manager)
    shell = pkgs.bash;
    isNormalUser = true;
    description = "Miguel Gavito";
    extraGroups = [ "networkmanager" "wheel" ];

  };
}
