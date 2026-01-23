{...}: let
  # Define aliases once, use everywhere
  shellAliases = {
    # kubectl shortcut
    k = "kubectl";

    # Better ls with eza
    ll = "eza -la --icons --git";
    la = "eza -a --icons";

    # Quick navigation
    nixc = "cd ~/nixos-config";
    ".." = "cd ..";
    "..." = "cd ../..";

    # nix commands
    nixflk = "nix flake check"; # useful to checks
    nixossw = "nixos-rebuild switch --flake .#$(hostname)"; #only useful on nixos but good to have
    hmsw = "home-manager switch --flake .#$(hostname)"; #for home manager
    darwinsw = "darwin-rebuild switch --flake .#$(hostname)"; # for nix-darwin

    # Git shortcuts
    gs = "git status";
    ga = "git add";
    gc = "git commit";
    gp = "git push";
  };
in {
  # Apply to bash/zsh
  home.shellAliases = shellAliases;

  # Also apply to nushell
  programs.nushell.shellAliases = shellAliases;
}
