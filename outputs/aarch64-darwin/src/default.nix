{ mylib, ... }@args:
{
  # Import all macOS hosts
  # Each file exports a darwinSystem configuration
  elgaleon = (import ./elgaleon.nix args).elgaleon;
}
