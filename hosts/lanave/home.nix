
{ config, pkgs, username, ... }:
{
  imports = [
    ../../home/shell/default.nix         # Shell config: tmux, bash, zsh
    ../../home/programs/git.nix          # Git config + SSH
    ../../home/programs/networking.nix   # SSH, wget, network tools
    ../../home/programs/browsers.nix     # Firefox, Chromium, Brave
    ../../home/ide/nvim                  # Neovim config (your main editor)
  ];

  # lanave-specific overrides only
  fonts.fontconfig.enable = true;
  home.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
  ];

  programs.git.settings = {
    user.name = "MiguelGavito";
    user.email = "mgavitogzz@gmail.com";
  };
}

