{ username, ... }:
{
  # Core Home Manager configuration
  # This is the minimal base for all platforms
  
  home = {
    inherit username;
    homeDirectory = "/home/${username}";
    stateVersion = "25.11";
  };
  
  programs.home-manager.enable = true;
  
  # Enable fontconfig for all platforms
  fonts.fontconfig.enable = true;
}
