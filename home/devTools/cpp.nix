{ pkgs, ... }:

{
  home.packages = with pkgs; [
    libgccjit
    clang
  ];
}

