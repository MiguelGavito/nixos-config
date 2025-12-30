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
      scrollbar_track_handle_opacity = 0;

      background_blur = 1;

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
