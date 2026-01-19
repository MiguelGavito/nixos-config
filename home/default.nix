{
  imports = [
    # Cross-platform base configuration
    ./base
    
    # Platform-specific configurations
    ./linux    # Linux-specific GUI/TUI (includes wayland, hyprland, niri)
    ./darwin   # macOS-specific configuration
  ];
}
