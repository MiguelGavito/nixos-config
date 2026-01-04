
{
  lib,
  inputs,
  mylib,
  system,
  ...
}@args:
let
  # Load all host definitions from src/
  elnavio = import ./src/elnavio.nix args;
  labahia = import ./src/labahia.nix args;
  lanave = import ./src/lanave.nix args;
in
{
  nixosConfigurations = {
    inherit (elnavio) elnavio;
  };
  
  homeConfigurations = {
    inherit (labahia) labahia;
    inherit (lanave) lanave;
  };
}
