{ config, ... }:
let
  d = config.xdg.dataHome;
  c = config.xfg.configHome;
  cache = config.xdg.cacheHome;
in
{
  imports = [

    ./common.nix
    ./terminals.nix
  ];

  # add envirnment variables
  home.sessionVariables = {
    #clean up
    LESSHISTFILE = cache + "/less/history";
    LESSKEY = c + "/less/lesskey";
    WINEPREFIX = d + "/wine";

    # set default applications
    EDITOR = "nvim";
    BROWSER = "brave";
    TERMINAL = "kitty";

    # enable scrolling in git diff
    DELTA_PAGER = "less -R";

    MANPAGER = "sh -c 'col -bx | bat -l man -p";
  };

  home.shellAliases = {
    k = "kubectl";
  };
}
