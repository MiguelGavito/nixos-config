{ catppuccin, lib, ... }:
let
  hmCatppuccinModules = import "${catppuccin}/modules/home-manager/all-modules.nix";
  hmCatppuccinModulesFiltered =
    builtins.filter (m: builtins.baseNameOf (toString m) != "opencode.nix") hmCatppuccinModules;
in {

  # https://github.com/catppuccin/nix
  imports = [
    (lib.modules.importApply "${catppuccin}/modules/global.nix" {
      catppuccinModules = hmCatppuccinModulesFiltered;
    })
  ];

  catppuccin = {
    # The default `enable` value for all available programs.
    enable = true;
    # one of "latte", "frappe", "macchiato", "mocha"
    flavor = "mocha";
    # one of "blue", "flamingo", "green", "lavender", "maroon", "mauve", "peach", "pink", "red", "rosewater", "sapphire", "sky", "teal", "yellow"
    accent = "red";  # Purple accent instead of pink
  };
}
