{ ... }:
{
  imports = [
    ./bash.nix        
    ./zsh.nix
    ./nushell
    ./common.nix      # Tool integrations
    ./starship.nix
    ./terminals.nix
    ./aliases.nix
    ./env.nix
  ];
}
