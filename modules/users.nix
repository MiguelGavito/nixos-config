{
  config,
  pkgs,
  ...
}: {
  # Define a user account. Don't forget to set a password with 'passwd'.
  users.users.miguelagg = {
    # Use zsh as default shell (configured in home-manager)
    # Bash is still available as fallback
    shell = pkgs.zsh;
    isNormalUser = true;
    description = "Miguel Gavito";
    extraGroups = ["networkmanager" "wheel" "input"];
  };

  users.users.ab = {
    isNormalUser = true;
    description = "Guess";
    extraGroups = ["networkManager" "wheel" "input"];
  };
}
