{
  pkgs,
  ...
}: {
  home.packages = [pkgs.gh];

  programs.git = {
    enable = true;

    settings = {

      url."git@github.com:" = {
        insteadOf = "https://github.com/";
      };
    };
  };

}
