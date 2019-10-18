### Configuration to make termguicolors work for nvim
set -g terminal-overrides ',xterm-256color:Tc'
set -as terminal-overrides ',xterm*:sitm=\E[3m'

#### COLOUR
tm_icon="♟"
tm_color_active=colour51
tm_color_inactive=colour241
tm_color_feature=colour198
tm_color_music=colour41
tm_active_border_color=colour51
tm_color_battery=colour196
tm_color_battery_status=colour226

# separators
tm_separator_left_bold="◀"
tm_separator_left_thin="❮"
tm_separator_right_bold="▶"
tm_separator_right_thin="❯"

set -g status-left-length 32
set -g status-right-length 150
set -g status-interval 5

# default statusbar colors
set-option -g status-bg colour0
set-option -g status-fg $tm_color_active
set-option -g status-bg default
set-option -g status-style default

# default window title colors
set-window-option -g window-status-style fg=$tm_color_inactive,bg=default
set -g window-status-format "#I #W"

# active window title colors
set-window-option -g window-status-current-style fg=$tm_color_active,bg=default
set-window-option -g  window-status-current-format "#[bold]#I #W"

# pane border
set-option -g pane-border-style fg=$tm_color_inactive
set-option -g pane-active-border-style fg=$tm_active_border_color

# message text
set-option -g message-style bg=default
set-option -g message-style fg=$tm_color_active

# pane number display
set-option -g display-panes-active-colour $tm_color_active
set-option -g display-panes-colour $tm_color_inactive

# clock
set-window-option -g clock-mode-colour $tm_color_active

# Display current track being played
tm_spotify="#[fg=$tm_color_background,bg=$tm_color_music]#(osascript ~/dotfiles/tmux/applescripts/spotify.scpt)"
tm_tunes="#[fg=$tm_color_music]#(osascript ~/dotfiles/tmux/applescripts/tunes.scpt)"

# Display battery level
tm_battery="#[fg=$tm_color_battery]#(~/dotfiles/tmux/bin/battery_percentage.sh) #[fg=$tm_color_battery_status]#(~/dotfiles/tmux/bin/battery_status.sh)"

# Display host name and session name
tm_date="#[fg=$tm_color_inactive] %R %d %b"
tm_host="#[fg=$tm_color_feature,bold]GAKINDUSTRIES"
tm_session_name="#[fg=$tm_color_feature,bold]$tm_icon #S"

set -g status-left $tm_session_name'      '
set -g status-right $tm_spotify'      '$tm_battery'    '$tm_date'   '$tm_host'  '
