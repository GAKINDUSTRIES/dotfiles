# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
ZSH_THEME="robbyrussell"

# Uncomment the following line to disable auto-setting terminal title.
DISABLE_AUTO_TITLE="true"

# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Add wisely, as too many plugins slow down shell startup.
plugins=(git sublime bundler npm rails zsh-syntax-highlighting history web-search vi-mode)

# Completion for kitty
kitty + complete setup zsh | source /dev/stdin

# Load FZF
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
