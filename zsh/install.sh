#!/bin/sh
#
# This script installs oh-my-zsh plugin

# Set up root directory
cd "$(dirname "$0")/.."
DOTFILES_ROOT=$(pwd -P)

# chsh -s /bin/zsh # Switch shell to zsh

# Install oh-my-zsh plugin.
# --unattended flag will have the efect of not trying to change the defaul shell,
# and also won't run zsh when the installation has finished.
if [ -d "$HOME/.oh-my-zsh" ]
then
  echo "oh-my-zsh already exists. Skipping..."
  $DOTFILES_ROOT/zsh/ohmyzsh_plugins.sh
else
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)" "" --unattended
  $DOTFILES_ROOT/zsh/ohmyzsh_plugins.sh
fi
