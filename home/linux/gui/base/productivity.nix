{
  pkgs, 
  pkgsUnstable,
  ...
}: 
{
  home.packages = with pkgs; [
    # onedrive
    nextcloud-client

    libreoffice-still
    onlyoffice-desktopeditors
    pkgsUnstable.obsidian

    # ferdium

    calibre
  ];
}
