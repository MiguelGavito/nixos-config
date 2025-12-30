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
      size = 12;
    };
    settings = {
      confirm_os_window_close = 0;
      dynamic_background_opacity = true;
      background_opacity = "0.95";
      background_blur = 5;

      cursor_trail = 1;
      cursor_trail_decay = "0.1 0.4";
      
      cursor_shape = "block";
      cursor_blink_interval = 1;

      scrollback_lines = 10000;
      # enable_audio_bell = false;
      # update_check_interval = 0;
    };
  };
}
