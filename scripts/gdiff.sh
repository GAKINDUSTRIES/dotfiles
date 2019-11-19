#!/usr/bin/env bash

# Dependencies: FZF, git, diff-so-fancy

# Author: https://medium.com/@armno/fzf-the-fuzzy-finder-e2210516db82

# Check the diff of one file at a time in a preview panel

gdiff() {
  git status -s | fzf --no-sort --reverse \
                      --preview 'git diff --color=always {+2} | diff-so-fancy' \
                      --bind=ctrl-j:preview-down --bind=ctrl-k:preview-up \
                      --preview-window=right:60%:wrap
}
