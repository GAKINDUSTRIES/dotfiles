#!/usr/bin/env bash

# Author: Guillermo Kuster

# Dependencies: FZF

# fdf - cd into the directory of the selected file

fdf() {
   local file
   local dir
   file=$(fzf +m -q "$1") && dir=$(dirname "$file") && cd "$dir"
}
