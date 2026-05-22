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
in {
  nixosConfigurations = {
    inherit (elnavio) elnavio;
  };

  homeConfigurations = {
    inherit (labahia) labahia;
    inherit (lanave) lanave;
    inherit (elcarguero) elcarguero;
  };

  checks = {
    x86_64-linux = {
      elnavio = elnavio.elnavio.config.system.build.toplevel;
      labahia = labahia.labahia.activationPackage;
      lanave = lanave.lanave.activationPackage;
      elcarguero = elcarguero.elcarguero.activationPackage;
    };
  };

  formatter = {
    x86_64-linux = inputs.nixpkgs.legacyPackages.${system}.alejandra;
  };
}
