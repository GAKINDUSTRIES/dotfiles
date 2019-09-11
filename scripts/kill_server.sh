#!/usr/bin/env bash

# This script kills a server running at a specified port.
# If no port is specified, it tries to kill server running at port 3000 by default

# Author: Guillermo Kuster

kill_server() {
  local port="${1:-3000}";
  local pid="$(lsof -i tcp:$port -t)";
  if [[ $pid ]]; then
    kill -9 $pid
    echo "Server killed at port $port"
  else
    echo "No server found running at port $port"
  fi;
}
