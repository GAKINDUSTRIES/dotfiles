#!/usr/bin/env bash

# Dependencies: FZF

# frb [FUZZY PATTERN] - Select a installed ruby version

frb() {
  local rb
  rb=$((echo system; rvm list | grep 'ruby.*\[.*\]' | cut -c 4-) |
       awk '{print $1}' |
       fzf-tmux -l 30 +m --reverse) && rvm use $rb
}
