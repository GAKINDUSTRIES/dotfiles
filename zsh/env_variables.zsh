# # Add path directory for custom scripts
# export PATH=$DOTFILES/bin:$PATH

# Add Java installation reference
export JAVA_HOME=$(/usr/libexec/java_home)

# Add rustup
export PATH="$HOME/.cargo/bin:$PATH"

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

# Set up search engine for FZF
# Possible options are: [ag, rg]
export DEFAULT_SEARCHER='ag'
if [[ $DEFAULT_SEARCHER == 'ag' ]]; then
  # Define Ag as default searcher for FZF
  if type ag &> /dev/null; then
    export FZF_DEFAULT_COMMAND='ag -p ~/.ignore -g ""'
  fi
else
  # Define rigrep as default searcher for FZF
  if type rg &> /dev/null; then;
    export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow -g "!{.git,node_modules}/*" 2> /dev/null'
  fi
fi

# Define Neovim as default editor
export EDITOR='nvim'

# Add yarn to PATH
export PATH="$(yarn global bin):$PATH"

# Add RVM to PATH for scripting
export PATH="$PATH:$HOME/.rvm/bin"

# Add NVM to PATH for scripting
export NVM_DIR="$HOME/.nvm"
# Load NVM into a shell session *as a function*
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"

export PATH="/usr/local/opt/icu4c/bin:$PATH"
export PATH="/usr/local/opt/icu4c/sbin:$PATH"

export GOPATH="$HOME/go"
export GOBIN="$GOPATH/bin"
export PATH="$PATH:$GOBIN"
