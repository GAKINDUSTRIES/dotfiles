#!/usr/bin/env bash

# Author: Guillermo Kuster

# Dependencies: fd and FZF

# Find a folder and open in with default editor

fdv(){
  local dir=$(fd -d 5 -t d . $HOME | fzf)
  cd "$dir"
  ${EDITOR:-vim}
}
