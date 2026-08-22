{
  pkgs,
  pkgsUnstable,
  ...
}:
{
  home.packages = with pkgs; [
    # creative
    inkscape # vector graphics
    krita # digital painting
    pkgsUnstable.musescore # music notation
    
    # 3d modeling (large, can be disabled)
    blender

    # other tools
    graphviz # graph visualization
  ];
}
