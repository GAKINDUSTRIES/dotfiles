#!/bin/sh

# Configure yarn to install global packages, set base location, etc.


echo "Setting up Yarn....."

# Set up the location where Yarn will install symlinks to your installed executables
echo "Configuring base location..."
yarn config set prefix ~/.yarn
echo "Global packages will have their executables installed to ~/.yarn/bin"
