{ pkgs, ... }: {
  programs.tmux = {
    enable = true;
    keyMode = "vi";
    prefix = "C-w";
    disableConfirmationPrompt = true;
    plugins = with pkgs; [
      tmuxPlugins.sensible
      tmuxPlugins.vim-tmux-navigator
      {
        plugin = tmuxPlugins.resurrect;
        extraConfig = "set -g @resurrect-strategy-nvim 'session'";
      }
      {
        plugin = tmuxPlugins.continuum;
        extraConfig = ''
        set -g @continuum-restore 'on'
        set -g @continuum-save-interval '10' # minutes
        '';
      }
      {
        plugin = tmuxPlugins.catppuccin;
        extraConfig = ''
        set -g @catppuccin_window_left_separator ""
        set -g @catppuccin_window_right_separator " "
        set -g @catppuccin_window_middle_separator " █"
        set -g @catppuccin_window_number_position "right"
        set -g @catppuccin_window_default_fill "number"
        set -g @catppuccin_window_default_text "#W"
        set -g @catppuccin_window_current_fill "number"
        set -g @catppuccin_window_current_text "#W#{?window_zoomed_flag,(),}"
        set -g @catppuccin_status_modules_right "host directory battery date_time"
        set -g @catppuccin_status_modules_left "session"
        set -g @catppuccin_status_left_separator  " "
        set -g @catppuccin_status_right_separator " "
        set -g @catppuccin_status_right_separator_inverse "no"
        set -g @catppuccin_status_fill "icon"
        set -g @catppuccin_status_connect_separator "no"
        set -g @catppuccin_host_text "#{s|\/.*||:pane_title}"
        set -g @catppuccin_host_icon "#{?#{m:*Darwin*,#T},,}"
        set -g @catppuccin_directory_text "#{s|$HOME|~|:pane_current_path}"
        set -g @cattpuccin_battery_text "#{battery_percentage}"
        set -g @catppuccin_date_time_text "%H:%M"
        '';
      }
      tmuxPlugins.battery
    ];

    extraConfig = ''
    set -g base-index 1
    set -g pane-base-index 1
    set-window-option -g pane-base-index 1
    set-option -g renumber-windows on

    set -g set-clipboard on
    set -g status-position top
    set -g allow-passthrough on
    set -ga update-environment TERM
    set -ga update-environment TERM_PROGRAM
    set -g status-bg default
    set -g status-style bg=default

    bind h select-pane -L
    bind j select-pane -D
    bind k select-pane -U
    bind l select-pane -R
    bind -n C-Tab next-window
    bind x if-shell "$is_vim" 'send-keys C-w x' 'killp'

    bind s if-shell "$is_vim" 'send-keys C-w s' 'split-window -v -c "#{pane_current_path}"'
    bind v if-shell "$is_vim" 'send-keys C-w v' 'split-window -v -c "#{pane_current_path}"'
    '';
  };
}
