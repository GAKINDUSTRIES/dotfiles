#!/usr/bin/env bash

# Dependencies: FZF, git

# This script is to checkout to a git branch

gco() {
  local branches branch
  branches=$(git --no-pager branch -vv) &&
  branch=$(echo "$branches" | fzf +m) &&
  git checkout $(echo "$branch" | awk '{print $1}' | sed "s/.* //")
}
