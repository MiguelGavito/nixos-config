{ username, ... }:
{
  # Linux-specific configurations
  imports = [
    ./gui
  ];

  # Linux-specific paths
  home = {
    inherit username;
    homeDirectory = "/home/${username}";
    stateVersion = "25.11";
  };

  programs.home-manager.enable = true;
}
