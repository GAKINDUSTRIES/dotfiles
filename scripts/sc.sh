#!/usr/bin/env bash

# Author: Guillermo Kuster

# Dependencies: FZF, fd

# cd To the selected directory

sc(){
  local script=$(ls ~/dotfiles/scripts | sed -e 's/\..*$//' | fzf)
  test -n "$script" && print -z -- "${script[@]:q:q}"
}
