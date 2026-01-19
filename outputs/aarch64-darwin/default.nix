{ mylib, ... }@args:
let
  # Import all host configurations from src/
  hosts = import ./src args;
in
{
  # Export as darwinConfigurations for nix-darwin
  darwinConfigurations = hosts;
}
