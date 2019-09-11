 # Initialize autocomplete here, otherwise functions won't be loaded
autoload -Uz compinit
compinit

# Completion for kitty
kitty + complete setup zsh | source /dev/stdin

# Load FZF
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
