#!/bin/bash

# Configure yarn to install global packages, set base location, etc.

echo "Setting up Yarn....."

# Set up the location where Yarn will install symlinks to your installed executables
echo "Configuring base location for symlinks"
echo ""
yarn config set prefix ~/.yarn
echo "Global packages will have their executables installed to ~/.yarn/bin"
echo ""
echo "The global installation folder that houses the global node_modules is $(yarn global dir)"

# Packages that will be installed globally
PACKAGES=(
  statikk
)

echo ""
echo ""
echo "Installing packages..."
yarn global add ${PACKAGES[@]}
