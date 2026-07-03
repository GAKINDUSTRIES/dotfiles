#!/bin/sh

create_tmux_session() {
  printf "Enter a new session name: "
  read SESSION_NAME
  tmux -u new -s "$SESSION_NAME"
}

print_header() {
  echo " "
  echo $1
  echo "------------------"
  echo " "
}

tm() {
  # abort if we're already inside a TMUX session
  [ "$TMUX" = "" ] || exit 0
  # startup a "default" session if non currently exists
  # tmux has-session -t _default || tmux new-session -s _default -d

  # present menu for user to choose which workspace to open
  PS3="Please choose your option: "
  # NB: do NOT name this 'options' — that shadows zsh's special $options
  # associative array and makes zsh-syntax-highlighting emit
  # "_zsh_highlight:69: bad set of key/value pairs" on every prompt redraw.
  local tm_options=()
  local sessions=$(tmux list-sessions -F "#S" 2>/dev/null)
  print_header "Available sessions"

  if ! test -z "$sessions"
  then
    while IFS='' read -r line; do
      tm_options+=("$line")
    done <<< "$sessions"
  fi

  tm_options+=("New Session" "zsh")

  select opt in "${tm_options[@]}"
  do
    case $opt in
      "New Session")

      local projects=($(GEM_HOME="" GEM_PATH="" tx list 2>/dev/null | awk '{if(NR>1)print}' | tr ',' '\n'))

      if [[ ${#projects[@]} == 0 ]]; then
        create_tmux_session
      else
        projects+=("No template, clean Tmux session")

        print_header "Choose your project template:"

        select opt2 in "${projects[@]}"
        do
          case $opt2 in
            "No template, clean Tmux session")
              create_tmux_session
              break
              ;;
            *)
              tx $opt2
              break
              ;;
          esac
        done
      fi
        break
        ;;
      "zsh")
        zsh --login
        break
        ;;
      *)
        echo "$opt"
        tmux -u attach-session -t "$opt"
        break
        ;;
    esac
  done
}
