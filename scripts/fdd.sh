#!/usr/bin/env bash

# Author: Guillermo Kuster

# Dependencies: FZF, fd

# cd To the selected directory

fdd(){
  local dir=$(fd -d 5 -t d . $HOME | fzf)
  cd "$dir"
}
