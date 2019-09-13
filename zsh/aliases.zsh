# General
alias aliases='alias | fzf'
alias grep='grep --color=auto'
alias reload!='source ~/.zshrc'         # Reload zsh config
alias chrome="/Applications/Google\\ \\Chrome.app/Contents/MacOS/Google\\ \\Chrome"
# Recursively delete `.DS_Store` files
alias cleanup="find . -type f -name '*.DS_Store' -ls -delete"

# Vim
alias vi="nvim"
alias vim="nvim"

# Sublime text shortcut
alias st=subl                           # Open sublime
alias stt='subl .'                      # Open current dir in sublime

# Disk information
alias df='df -h'                        # Disk free, in Gigabytes, not bytes
alias du='du -d 1 -h'                   # Calculate disk usage for a folder

# IP addresses
alias ip="dig +short myip.opendns.com @resolver1.opendns.com"
alias local_ip="ifconfig | sed -En 's/127.0.0.1//;s/.*inet (addr:)?(([0-9]*\.){3}[0-9]*).*/\2/p'"
alias ips="ifconfig -a | perl -nle'/(\d+\.\d+\.\d+\.\d+)/ && print $1'"

# View HTTP traffic
alias httpdump="sudo tcpdump -i en1 -n -s 0 -w - | grep -a -o -E \"Host\: .*|GET \/.*\""

# File size
alias fs="stat -f \"%z bytes\""

# Empty the Trash on all mounted volumes and the main HDD
alias empty_trash="sudo rm -rfv /Volumes/*/.Trashes; rm -rfv ~/.Trash"

# Hide/show all desktop icons (useful when presenting)
alias hidedesktop="defaults write com.apple.finder CreateDesktop -bool false && killall Finder"
alias showdesktop="defaults write com.apple.finder CreateDesktop -bool true && killall Finder"

# Postgres commands
alias postgres:start="pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start"
alias postgres:stop="pg_ctl -D /usr/local/var/postgres stop -s -m fast"
alias postgres:start_in_background="postgres -D /usr/local/pgsql/data >logfile 2>&1 &"
alias postgres:purge_pid="rm /usr/local/var/postgres/postmaster.pid"

# Directory placement
alias smt="cd ~/dev/smarttechware/"
alias dev="cd ~/dev/"

# ls, the common ones I use a lot shortened for rapid fire usage
alias l='ls -lFh'                       # Size,show type,human readable
alias ldot='ls -ld .*'                  # Show all
alias ls_hidden="ls -d .?*"             # Show only hidden files
alias ls_folders="ls -d */"             # Show only folders

# Unalias
unalias rg                              # Disable 'rails generate' alias to use ripgrep rg
unalias sc                              # Disable rails alias to use "script search"" script
