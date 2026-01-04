{ config, pkgs, ... }:

{
  # install kde for connect with phone  
  programs.kdeconnect.enable = true;

  # this is the steam configuration
  programs.steam = {
    enable = true;
    gamescopeSession.enable = true;    
  };

  environment.systemPackages = with pkgs; [
    mangohud

    protonup-ng
  ];

  programs.gamemode.enable = true;

  environment.sessionVariables = {
    STEAM_EXTRA_COMPAT_TOOLS_PATHS = 
      "home/user/.steam/root/compatibilitytools.d";
  };
  # para que tu programa en steam pueda usar estos modos hay que escribir
  # gamemoderun %command%
  # mangohud %command%
  # gamescope %command%

  # end of steam configuration

 
}
