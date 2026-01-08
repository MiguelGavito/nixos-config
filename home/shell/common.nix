{ pkgs, ...}:

# Common shell tools and integrations
{
  home.packages = with pkgs; [
    # Nix tooling
    alejandra
    deadnix
    statix
  ];

  # Auto environment loading - CRITICAL: enable for ALL shells
  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
    enableBashIntegration = true;   # Was missing!
    enableZshIntegration = true;
    enableNushellIntegration = true; # Was missing!
  };

  # Smart cd - remembers directories you use most
  programs.zoxide = {
    enable = true;
    enableBashIntegration = true;
    enableZshIntegration = true;
    enableNushellIntegration = true;
  };

  # Fuzzy finder
  programs.fzf = {
    enable = true;
    enableBashIntegration = true;
    enableZshIntegration = true;
  };

  # Better ls (modern replacement with git integration)
  programs.eza = {
    enable = true;
    enableBashIntegration = true;
    enableZshIntegration = true;
    enableNushellIntegration = false; # nushell has its own ls
    git = true;
    icons = "auto";
  };

  # Better cat with syntax highlighting
  programs.bat = {
    enable = true;
    config = {
      pager = "less -FR";
    };
  };
}
