#!/usr/bin/env bash

# Dependencies: Google chrome

# ch - browse chrome history

ch() {
  local cols sep
  cols=$(( COLUMNS / 3 ))
  sep='{::}'

  cp -f ~/Library/Application\ Support/Google/Chrome/Default/History /tmp/h

  sqlite3 -separator $sep /tmp/h \
    "select substr(title, 1, $cols), url
     from urls order by last_visit_time desc"                     |
  awk -F $sep '{printf "%-'$cols's  \x1b[36m%s\x1b[m\n", $1, $2}' |
  fzf --ansi --multi                                              |
  sed 's#.*\(https*://\)#\1#'                                     |
  xargs -I '{}' /Applications/Google\ \Chrome.app/Contents/MacOS/Google\ \Chrome {}
}
