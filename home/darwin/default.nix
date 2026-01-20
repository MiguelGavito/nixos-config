{ username, ... }:
{
  # macOS Home Manager entry point
  # Portable base + TUI + GUI that works on Darwin
  imports = [
    ../base/core
    ../base/tui
  ];

  # macOS-specific paths
  home = {
    inherit username;
    homeDirectory = "/Users/${username}";
    stateVersion = "25.11";
  };

  programs.home-manager.enable = true;

  # Enable XDG dirs management on macOS
  xdg.enable = true;
}
