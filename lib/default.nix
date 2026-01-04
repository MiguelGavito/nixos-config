
{ lib, ... }:
{
  # System builders
  nixosSystem = import ./nixosSystem.nix;
  
  # Path helpers
  relativeToRoot = lib.path.append ../.;
  
  # Scan and import all .nix files in a directory (except default.nix)
  scanPaths = path:
    builtins.map (f: (path + "/${f}")) (
      builtins.attrNames (
        lib.attrsets.filterAttrs (
          path: _type:
          (_type == "directory") # include directories
          || (
            (path != "default.nix") # ignore default.nix
            && (lib.strings.hasSuffix ".nix" path) # include .nix files
          )
        ) (builtins.readDir path)
      )
    );
}
