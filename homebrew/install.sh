#!/bin/sh

# Bootstrap script for setting up a new OSX machine
#
# This should be idempotent so it can be run multiple times.
#
# Some apps don't have a cask and so still need to be installed by hand. These
# include:
#
# - Wunderlist (App Store)
# - Trello (App Store)
# - The Unarchiver (App Store)
# - TablePlus (https://tableplus.com/)
#
# Notes:
#
# - If installing full Xcode, it's better to install that first from the app
#   store before running the bootstrap script. Otherwise, Homebrew can't access
#   the Xcode libraries as the agreement hasn't been accepted yet.

echo "Setting up your Homebrew packages"

# Check for Homebrew and install if it doesn't exist
if test ! $(which brew); then
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Update homebrew recipes
brew update


# Install all our dependencies with bundle (See Brewfile)
echo "Installing packages and cask apps..."
brew tap caskroom/cask
brew tap homebrew/bundle
brew bundle

# Remove outdated versions from the cellar
echo "Cleaning up..."
brew cleanup
