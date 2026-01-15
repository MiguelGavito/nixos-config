{
  pkgs,
  config,
  username,
  ...
}: {
  programs = {
    chromium = {
      enable = true;
      commandLineArgs = ["--enable-features=TouchpadOverscrollHistoryNavigation"];
      extensions = [
        # {id = "";}  // extension id, query from chrome web store
      ];
    };
  };
  # later configure a program that can create a profile with the username
  home.packages = with pkgs; [
    brave # navigator
  ];

}
