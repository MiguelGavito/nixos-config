{ lib, pkgs, ... }:
{
  system.stateVersion = lib.mkDefault 6;

  nix.settings = {
    experimental-features = [ "nix-command" "flakes" ];
    trusted-users = [ "@admin" ];
  };

  environment.systemPackages = with pkgs; [
    git
    vim
  ];

  # activate homebrew for installs
  homebrew.enable = true;

  # Touch ID for sudo
  security.pam.enableSudoTouchId = true;

  
}
