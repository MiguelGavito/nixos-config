{ config, ...}: {
  home.sessionVariables.STARSHIP_CACHE = "${config.xdg.cacheHome}/s=starship";

  programs.starship = {
    enable = true;
    enableBashIntegration = true;
    enableZshIntegration = true; 
    enableNushellIntegration = true;
    settings = {

      character = {
        success_symbol = "[>](bold green)";
        error_symbol = "[>](bold red)";
      };

      hostname = {
        disabled = false;
        format = "[$ssh_symbol](blue dimmed bold)[$hostname]($style) ";
        ssh_only = false;
        style = "green dimmed bold";
        trim_at = ".";
      };
      username = {
        format = "[$user]($style) ";
        show_always = true;
        style_root = "red bold bg:0x9A348E";
        style_user = "yellow bold bg:0x9A348E";
        disabled = false;
      };
    };
  };
}
