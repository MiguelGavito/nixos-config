{ ... }:
{
  # Linux GUI entry point
  # Full desktop experience: TUI + GUI apps + Desktop envs
  
  imports = [
    ../base/core
    ../base/tui
    ../base/gui
    ./gui          # Linux-specific GUI (wayland, kde, etc.)
  ];
}
