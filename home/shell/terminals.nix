{ pkgs, ... }:

# terminals

let
  font = "JetBrainsMono Nerd Font";
in
{
  programs.kitty = {
    enable = true;
    font = {
      name = font;
      size = 11;
    };
    settings = {
      confirm_os_window_close = 0;
      dynamic_background_opacity = true;
      background_opacity = "0.90";
      scrollbar_handle_opacity = 0;
      scrollbar_track_opacity = 0;

      background_blur = 1;

      # Gruvbox Dark theme
      foreground = "#ebdbb2";
      background = "#282828";
      selection_foreground = "#282828";
      selection_background = "#d79921";
      cursor = "#ebdbb2";
      cursor_text_color = "#282828";
      
      # Black
      color0 = "#282828";
      color8 = "#928374";
      # Red
      color1 = "#cc241d";
      color9 = "#fb4934";
      # Green
      color2 = "#98971a";
      color10 = "#b8bb26";
      # Yellow
      color3 = "#d79921";
      color11 = "#fabd2f";
      # Blue
      color4 = "#458588";
      color12 = "#83a598";
      # Magenta
      color5 = "#b16286";
      color13 = "#d3869b";
      # Cyan
      color6 = "#689d6a";
      color14 = "#8ec07c";
      # White
      color7 = "#a89984";
      color15 = "#ebdbb2";

      cursor_trail = 10;
      cursor_trail_start_threshold = 0;
      cursor_trail_decay = "0.01 0.05";
      cursor_shape = "block";
      cursor_blink_interval = 0;

      scrollback_lines = 10000;
      enable_audio_bell = false;
      update_check_interval = 0;
    };
  };
}
