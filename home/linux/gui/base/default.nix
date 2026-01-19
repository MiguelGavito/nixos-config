{ mylib, ... }:
{
  imports = [
    ./browsers.nix
    ./gaming.nix
    ./media.nix
    ./productivity.nix
    ./creative.nix
    ./dev-tools.nix
    ./desktop-tools.nix
    ./editors.nix
    ./xdg
  ];
}
