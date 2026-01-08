{ config, pkgs, ...}:

{
  programs.vscode = {
    enable = true;
    package = pkgs.vscode.fhs;
    profiles.default.extensions = with pkgs.vscode-extensions; [
      # Theme
      jdinhlife.gruvbox
      
      # Editor enhancements
      vscodevim.vim
      eamodio.gitlens
      ms-vscode.remote-explorer
      ms-vscode-remote.remote-ssh
      
      # Markdown
      yzhang.markdown-all-in-one
      
      # Nix support
      jnoortheen.nix-ide
      
      # Code formatting & linting
      esbenp.prettier-vscode
      ms-python.python
      
      # Debugging
      ms-vscode.cpptools
      
      # Icons and UI
      pkief.material-icon-theme
    ];
  };
}
