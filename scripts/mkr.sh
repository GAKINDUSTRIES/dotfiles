#!/usr/bin/env bash

# This script creates a new directory and cd into it.

# Author: Guillermo Kuster

mkr() {
	mkdir -p "$@" && cd "$@";
}
