{ ... }:
{
  # All shell configurations - portable across all platforms
  imports = [
    ./bash.nix
    ./zsh.nix
    ./nushell
    ./common.nix
    ./starship.nix
    ./aliases.nix
    ./env.nix
  ];
}
