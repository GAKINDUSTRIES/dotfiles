## Tmux Plugin Manager configuration
set-environment -g TMUX_PLUGIN_MANAGER_PATH '~/dotfiles/tmux/.tmux/plugins/'

#### List of plugins
set -g @plugin 'tmux-plugins/tpm'
set -g @plugin 'tmux-plugins/tmux-sensible'
set -g @plugin 'tmux-plugins/tmux-yank'

#### Initialize TMUX plugin manager
#### (keep this line at the very bottom of tmux.conf)
run -b '~/dotfiles/tmux/.tmux/plugins/tpm/tpm'
