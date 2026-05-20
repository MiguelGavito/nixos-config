{
  lib,
  inputs,
  mylib,
  system,
  ...
} @ args: let
  # Load all host definitions from src/
  elnavio = import ./src/elnavio.nix args;
  labahia = import ./src/labahia.nix args;
  lanave = import ./src/lanave.nix args;
  elcarguero = import ./src/elcarguero.nix args;

  LAPTOP-RKK3N6RU = import ./src/LAPTOP-RKK3N6RU.nix args;
in {
  nixosConfigurations = {
    inherit (elnavio) elnavio;
  };

  homeConfigurations = {
    inherit (labahia) labahia;
    inherit (lanave) lanave;
    inherit (elcarguero) elcarguero;

    inherit (LAPTOP-RKK3N6RU) LAPTOP-RKK3N6RU;  
  };
}
