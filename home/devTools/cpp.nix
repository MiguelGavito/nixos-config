{ pkgs, ... }:

{
  home.packages = with pkgs; [
    libgccjit
    clang
    clang-tools
  ];
}

