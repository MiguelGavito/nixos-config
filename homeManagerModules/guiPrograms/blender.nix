{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    blender # 3d model
  ];
}
