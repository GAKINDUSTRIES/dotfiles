#!/usr/bin/env bash

# Script to install NVM and node lts version

# Install NVM
\curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.0/install.sh | bash

# Install Node LTS version
nvm install --lts
