#!/usr/bin/env bash

# Dependencies: FZF, git

# Show up useful commands for hw-admin workflow

hw() {
  local commands command
  commands=$(cat ~/dev/hw-admin_docs/hw-admin-commands.txt) &&
  command=$(echo "$commands" | fzf +m | sed "s/[[:space:]]*##.*//")
  test -n "$command" && print -z "${command}"
}
