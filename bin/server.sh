#!/usr/bin/env bash

# This script starts an HTTP server from a directory, optionally specifying the port
# statikk is good because it won't expose hidden folders/files by default.
# This depends on: yarn global add statikk

# Author: https://github.com/paulirish/statikk

server () {
  local port="${1:-8000}"
  open "http://localhost:${port}/" &
  statikk --port "$port" .
}
