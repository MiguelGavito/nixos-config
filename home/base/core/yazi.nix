{ pkgs, ... }:
{
  programs.yazi = {
    enable = true;
    package = pkgs.yazi;
    enableBashIntegration = true;
    enableZshIntegration = true;
  };
}
