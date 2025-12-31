
{ pkgs, ... }:

{
  home.packages = with pkgs;  [
    onedrive
    nextcloud-client
    
    libreoffice-still
    onlyoffice-desktopeditors
    obsidian

    ferdium

    calibre
  ];
}
