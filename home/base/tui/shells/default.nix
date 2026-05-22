{ ... }:
{
  # All shell configurations - portable across all platforms
  imports = [
    ./bash.nix
    ./zsh.nix
    ./nushell
    ./common.nix
    ./aliases.nix
    ./env.nix
  ];
}
