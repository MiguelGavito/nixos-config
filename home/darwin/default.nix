{ ... }:
{
  # macOS Home Manager entry point
  # Portable base + TUI + GUI that works on Darwin
  imports = [
    ../base/core
    ../base/tui
    ../base/gui
  ];

  # Enable XDG dirs management on macOS
  xdg.enable = true;
}
