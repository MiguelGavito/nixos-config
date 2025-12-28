{ pkgs, ... }:
{
  home.packages = with pkgs; [
    dolphin           # File manager (KDE)
    ark               # Archive manager
    kio-extras        # Extra protocols (smb, ftp, etc.)
    ffmpegthumbs      # Video thumbnails
  ];
}
