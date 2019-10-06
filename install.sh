#!/usr/bin/env bash

# Script to install everything automatically :D

# Set up root directory
cd "$(dirname "$0")"
DOTFILES_ROOT=$(pwd -P)

# Exit immediately if a pipeline returns a non-zero status
set -e

echo ''

# Define some utility functions
info () {
  printf "\r  [ \033[00;34m..\033[0m ] $1\n"
}

user () {
  printf "\r  [ \033[0;33m??\033[0m ] $1\n"
}

success () {
  printf "\r\033[2K  [ \033[00;32mOK\033[0m ] $1\n"
}

fail () {
  printf "\r\033[2K  [\033[0;31mFAIL\033[0m] $1\n"
  echo ''
  exit
}

separator () {
  printf "\n #################### \n"
}

link_file () {
  local src=$1 dst=$2

  local overwrite= backup= skip=
  local action=

  if [ -f "$dst" -o -d "$dst" -o -L "$dst" ]
  then

    if [ "$overwrite_all" == "false" ] && [ "$backup_all" == "false" ] && [ "$skip_all" == "false" ]
    then

      local currentSrc="$(readlink $dst)"

      if [ "$currentSrc" == "$src" ]
      then

        skip=true;

      else

        user "File already exists: $dst ($(basename "$src")), what do you want to do?\n\
        [s]kip, [S]kip all, [o]verwrite, [O]verwrite all, [b]ackup, [B]ackup all?"
        read -n 1 action

        case "$action" in
          o )
            overwrite=true;;
          O )
            overwrite_all=true;;
          b )
            backup=true;;
          B )
            backup_all=true;;
          s )
            skip=true;;
          S )
            skip_all=true;;
          * )
            ;;
        esac

      fi

    fi

    overwrite=${overwrite:-$overwrite_all}
    backup=${backup:-$backup_all}
    skip=${skip:-$skip_all}

    if [ "$overwrite" == "true" ]
    then
      rm -rf "$dst"
      success "removed $dst"
    fi

    if [ "$backup" == "true" ]
    then
      mv "$dst" "${dst}.backup"
      success "moved $dst to ${dst}.backup"
    fi

    if [ "$skip" == "true" ]
    then
      success "skipped $src"
    fi
  fi

  if [ "$skip" != "true" ]  # "false" or empty
  then
    ln -s "$1" "$2"
    success "linked $1 to $2"
  fi
}

setup_gitconfig () {
  info 'setup gitconfig'

  git_credential='cache'
  if [ "$(uname -s)" == "Darwin" ]
  then
    git_credential='osxkeychain'
  fi

  user ' - What is your github author name?'
  read -e git_authorname
  user ' - What is your github author email?'
  read -e git_authoremail

  sed -e "s/AUTHORNAME/$git_authorname/g" -e "s/AUTHOREMAIL/$git_authoremail/g" -e "s/GIT_CREDENTIAL_HELPER/$git_credential/g" git/gitconfig.local.symlink.example > $HOME/.gitconfig.local

  link_file "$DOTFILES_ROOT/git/gitconfig.symlink" "$HOME/.gitconfig"
  link_file "$DOTFILES_ROOT/git/gitignore_global.symlink" "$HOME/.gitignore_global"
}

link_files_in_folder () {
  for src in $(find -H "$1" -maxdepth 2 -name '*.symlink')
  do
    dst="$HOME/.$(basename "${src%.symlink}")"
    link_file "$src" "$dst"
  done
}

install_dotfiles () {
  local overwrite_all=false backup_all=false skip_all=false

  echo "Setting up your Mac... \n\n"

  info "Installing brew Cask binary packages"
  $DOTFILES_ROOT/homebrew/install.sh 2>&1
  success  "Homebrew installed!!"

  info "Installing Yarn "
  $DOTFILES_ROOT/yarn/install.sh
  success  "Yarn installed!!"

  info "Installing RVM "
  $DOTFILES_ROOT/ruby/install.sh
  success  "RVM installed!!"

  info "Setting up zsh"
  link_files_in_folder "$DOTFILES/zsh"
  chsh -s /bin/zsh # Switch shell to zsh
  success "Zsh setup finished!!"

  info "Setting up Kitty"
  link_files_in_folder "$DOTFILES_ROOT/kitty"
  success "Kitty setup finished"

  info "Setting up Vim Environment and Neovim"
  $DOTFILES_ROOT/vim-environment/install.sh

  link_files_in_folder "$DOTFILES_ROOT/nvim"
  success "Vim setup finished"

  info "Setting up Tmux"
  link_files_in_folder "$DOTFILES_ROOT/tmux"
  success "Tmux setup finished"

  info "Setting up Git"
  setup_gitconfig
  success "Git setup finished"

  info "Finalizing last details..."
  link_file "$DOTFILES_ROOT/ignore.symlink" "$HOME/.ignore"
  success "Configuration completed. Enjoy :)"
}

install_dotfiles
