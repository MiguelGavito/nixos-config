{ ... }:
{
  # Shared aliases applied to supported shells (bash/zsh). Nushell mirrors these in its config.
  home.shellAliases = {
    k = "kubectl";
    ll = "eza -la --icons --git";
    nixc = "cd ~/Dev/nixos-config";
  };
}
