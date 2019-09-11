#!/usr/bin/env bash

# This script switches shell between zsh, bash, fish, etc.
# Specified shell should be in /etc/shells

# Author: Guillermo Kuster

mkr () {
	mkdir -p "$@" && cd "$@";
}
