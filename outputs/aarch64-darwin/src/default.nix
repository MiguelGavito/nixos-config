{ mylib, ... }@args:
{
  # Import all macOS hosts
  # Each file exports a darwinSystem configuration
  macbookair = (import ./macbookair.nix args).macbookair;
}
