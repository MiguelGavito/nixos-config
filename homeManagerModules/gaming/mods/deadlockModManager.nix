{ config, pkgs, ... }:

{
    home.packages = with pkgs; [
        pkgs.deadlock-mod-manager
    ];
}
