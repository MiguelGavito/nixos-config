{ config,lib,pkgs,myvars, ... }:
{
  # later check ryan4yin git configuration
  home.packages = [ pkgs.gh ];

  programs.git = {
    enable = true;
    lfs.enable = true;

    includes = [
      {
        # use different email & name for work:
        #
        # [user]
        #   email = "xxx@xxx.com"
        #   name = "Ryan Yin"
        path = "~/work/.gitconfig";
        condition = "gitdir:~/work/";
      }
    ];

    settings = {
      # user.email = myvars.useremail;
      # user.name = myvars.userfullname;

      init.defaultBranch = "main";
      trim.bases = "develop,master,main"; # for git-trim
      push.autoSetupRemote = true;
      pull.rebase = true;
      log.date = "iso"; # use iso format fot date 

      # replace https with ssh
      # url."git@github.com:" = {
      #   insteadOf = "https://github.com/";
      # };
      alias = {
        #common aliases
      };
    };
  };

  # A syntax-highlighting pager for git, diff, grep, and blame output
  programs.delta = {
    enable = true;
    enableGitIntegration = true;
    options = {
      diff-so-fancy = true;
      line-numbers = true;
      true-color = "always";
      # features => named groups of settings, used to keep related settings organized
      # features = "";
    };
  };

  # Git terminal UI (written in go). 
  programs.lazygit.enable = true;

  # another Git TUI (written in rust).
  programs.gitui.enable = false;
  
}
