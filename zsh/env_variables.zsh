# # Add path directory for custom scripts
# export PATH=$DOTFILES/bin:$PATH

# Add Java installation reference
export JAVA_HOME=$(/usr/libexec/java_home)

# Import scripts
export PATH=~/Library/Python/3.6/bin:$PATH

# For compilers to find openssl you may need to set:
export LDFLAGS="-L/usr/local/opt/openssl/lib"
export CPPFLAGS="-I/usr/local/opt/openssl/include"

# For pkg-config to find openssl you may need to set:
export PKG_CONFIG_PATH="/usr/local/opt/openssl/lib/pkgconfig"

# Fix perl warnings
export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# Define Ag as default searcher for FZF
# TODO, add .gitignore to dotfiles
if type ag &> /dev/null; then
    export FZF_DEFAULT_COMMAND='ag -p ~/.gitignore -g ""'
fi

# Define Neovim as default editor
export EDITOR='nvim'

# Add RVM to PATH for scripting
export PATH="$PATH:$HOME/.rvm/bin"

# Add yarn to PATH
export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh" # This loads nvm
export PATH="/usr/local/opt/icu4c/bin:$PATH"
export PATH="/usr/local/opt/icu4c/sbin:$PATH"
