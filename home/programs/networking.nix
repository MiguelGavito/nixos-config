{ pkgs, ... }:

{
  home.packages = with pkgs; [
    wget
  ];

  programs.ssh = {
    enable = true;
    enableDefaultConfig = false;

    matchBlocks = {
      # Global catch-all block
      "*" = {
        # Don’t leak your SSH agent unless explicitly needed
        forwardAgent = false;

        # Only use identity files you specify (avoid failing due to too many keys)
        identitiesOnly = true;

        # Keep idle connections alive
        serverAliveInterval = 180;
        serverAliveCountMax = 3;

        # Optional connection reuse (speed up repeated SSH)
        controlMaster = "auto";
        controlPath = "~/.ssh/control-%r@%h:%p";
        controlPersist = "10m";
      };

      "github.com" = {
        user = "git";
	      identityFile = "~/.ssh/id_ed25519";
      };
    }; 
  };
}
