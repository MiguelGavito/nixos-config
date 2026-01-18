{ ... }:
{
  programs.tmux = {
    enable = true;
    clock24 = true;
    keyMode = "vi";
    extraConfig = ''
      set -g mouse on
      set -g history-limit 10000
      set -g base-index 1
      setw -g pane-base-index 1
      set -g status-keys vi
      bind r source-file ~/.tmux.conf \; display "Config reloaded"
    '';
  };
}
