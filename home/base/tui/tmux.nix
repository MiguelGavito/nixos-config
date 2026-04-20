{ ... }:
{
  programs.tmux = {
    enable = true;
    clock24 = true;
    keyMode = "vi";
    extraConfig = ''
      # Use a custom prefix to keep keybindings explicit and avoid clashing with app shortcuts
      unbind C-b
      set -g prefix C-a
      bind C-a send-prefix

      # Better terminal/editor responsiveness
      set -sg escape-time 0
      set -g focus-events on

      set -g mouse on
      set -g history-limit 10000
      set -g base-index 1
      setw -g pane-base-index 1
      set -g renumber-windows on
      set -g status-keys vi

      # Keep project cwd when creating panes/windows
      bind c new-window -c "#{pane_current_path}"
      bind | split-window -h -c "#{pane_current_path}"
      bind - split-window -v -c "#{pane_current_path}"

      # Pane navigation (requires prefix, so it won't conflict with Neovim mappings)
      bind h select-pane -L
      bind j select-pane -D
      bind k select-pane -U
      bind l select-pane -R

      # Pane resize with shifted hjkl (also prefix-scoped)
      bind H resize-pane -L 5
      bind J resize-pane -D 5
      bind K resize-pane -U 5
      bind L resize-pane -R 5

      bind r source-file ~/.tmux.conf \; display "Config reloaded"
    '';
  };
}
