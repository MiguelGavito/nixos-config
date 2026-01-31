{
  lib,
  inputs,
  mylib,
  system,
  ...
} @ args: let
  elgaleon = import ./src/elgaleon.nix args;
  # Si tienes más hosts, agrégalos aquí
in {
  darwinConfigurations.elgaleon = elgaleon;
}
