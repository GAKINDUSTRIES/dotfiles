#!/bin/sh
#
# This script installs oh-my-zsh plugin


chsh -s /bin/zsh # Switch shell to zsh

# Install oh-my-zsh plugin.
# --unattended flag will have the efect of not trying to change the defaul shell,
# and also won't run zsh when the installation has finished.
if [ -d "$HOME/.oh-my-zsh" ] 
then
  echo "oh-my-zsh already exists. Skipping..." 
else
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)" "" --unattended
fi
