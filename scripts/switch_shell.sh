#!/usr/bin/env bash

# This script switches shell between zsh, bash, fish, etc.
# Specified shell should be in /etc/shells

# Author: Guillermo Kuster

switch_shell() {
  chsh -s /bin/$1
}
