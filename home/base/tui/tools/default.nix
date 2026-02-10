{ pkgs, ... }:
{
  home.packages = with pkgs; [
    # Core CLI utilities
    wget
    ripgrep
    yq-go
    file
    tree
    jq
    fastfetch

    # Extras
    aria2
  ];

  programs.ssh = {
    enable = true;
    enableDefaultConfig = false;

    matchBlocks = {
      "*" = {
        forwardAgent = false;
        identitiesOnly = true;
        serverAliveInterval = 180;
        serverAliveCountMax = 3;
        controlMaster = "auto";
        controlPath = "~/.ssh/control-%r@%h:%p";
        controlPersist = "10m";
      };
      #
      "github.com" = {
        hostname = "ssh.github.com";
        user = "git";
        port = 443;
        identityFile = "~/.ssh/id_ed25519";
      };
    };
  };

  programs.skim = {
    enable = true;
    enableZshIntegration = true;
    defaultCommand = "rg --files --hidden";
    changeDirWidgetOptions = [
      "--preview 'exa --icons --git --color always -T -L 3 {} | head -200'"
      "--exact"
    ];
  };
}
