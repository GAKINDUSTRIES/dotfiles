# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
ZSH_THEME="robbyrussell"

# Uncomment the following line to disable auto-setting terminal title.
DISABLE_AUTO_TITLE="true"

# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Add wisely, as too many plugins slow down shell startup.
plugins=(sublime bundler npm rails history web-search vi-mode)

# Path to oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Load oh-my-zsh
source $ZSH/oh-my-zsh.sh

# Load syntax highlighting
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
