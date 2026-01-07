
{ pkgs, ... }:

# Alacritty: lightweight, GPU-optional terminal (good alternative for systems without OpenGL 3.1)

let
  font = "JetBrainsMono Nerd Font";
in
{
  programs.alacritty = {
    enable = true;
    settings = {
      window = {
        opacity = 0.9;
        padding.x = 10;
        padding.y = 10;
      };

      font = {
        normal.family = font;
        size = 11;
      };

      # Gruvbox Dark theme
      colors = {
        primary = {
          foreground = "#ebdbb2";
          background = "#282828";
        };
        cursor = {
          text = "#282828";
          cursor = "#ebdbb2";
        };
        selection = {
          text = "#282828";
          background = "#d79921";
        };
        normal = {
          black = "#282828";
          red = "#cc241d";
          green = "#98971a";
          yellow = "#d79921";
          blue = "#458588";
          magenta = "#b16286";
          cyan = "#689d6a";
          white = "#a89984";
        };
        bright = {
          black = "#928374";
          red = "#fb4934";
          green = "#b8bb26";
          yellow = "#fabd2f";
          blue = "#83a598";
          magenta = "#d3869b";
          cyan = "#8ec07c";
          white = "#ebdbb2";
        };
      };

      scrolling = {
        history = 10000;
      };

      bell = {
        animation = "EaseOutExpo";
        duration = 0;
        visual = false;
      };
    };
  };
}
