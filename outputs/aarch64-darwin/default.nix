{ mylib, ... }@args:
let
  # Import all host configurations from src/
  hosts = import ./src args;
in
{
  # Export as darwinConfigurations for nix-darwin
  darwinConfigurations = hosts;

  checks = {
    aarch64-darwin = {
      elgaleon = hosts.elgaleon.system;
    };
  };

  formatter = {
    aarch64-darwin = args.inputs.nixpkgs-darwin.legacyPackages.${args.system}.alejandra;
  };
}
