{ ... }:

{
  programs.git = {
    enable = true;

    settings = {
      user = {
        name = "MiguelGavito";
        email = "mgavitogzz@gmail.com";
      };
    
      url."git@github.com:" = {
        insteadOf = "https://github.com/";
      };
    };
  };
}
