#!/bin/sh

tm() {
  # abort if we're already inside a TMUX session
  [ "$TMUX" == "" ] || exit 0
  # startup a "default" session if non currently exists
  # tmux has-session -t _default || tmux new-session -s _default -d

  # present menu for user to choose which workspace to open
  PS3="Please choose your session: "
  local options=()
  local sessions=$(tmux list-sessions -F "#S" 2>/dev/null)
  echo "Available sessions"
  echo "------------------"
  echo " "
  while IFS='' read -r line; do
    options+=("$line")
  done <<< "$sessions"

  options+=("New Session" "zsh")

  select opt in "${options[@]}"
  do
    case $opt in
      "New Session")
        printf "Enter a new session name: "
        read SESSION_NAME
        tmux -u new -s "$SESSION_NAME"
        break
        ;;
      "zsh")
        zsh --login
        break;;
      *)
        echo "$opt"
        tmux -u attach-session -t "$opt"
        break
        ;;
    esac
  done

}
