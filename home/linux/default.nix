{ ... }:
{
  # Linux-specific configurations
  imports = [
    # ./gui will have wayland, kde, gnome modules
    # ./core.nix for Linux-specific settings
  ];
}
