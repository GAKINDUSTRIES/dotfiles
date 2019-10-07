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

section () {
  printf "\n\n ############  Setting up $1  ############ \n\n"
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

  link_file "$DOTFILES_ROOT/git/git_template" "$HOME/.git_template"
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

  printf "Setting up your Mac... \n\n"

  section "Brew Cask binary packages"
  $DOTFILES_ROOT/homebrew/install.sh 2>&1
  success  "Homebrew installed!!"

  section "NVM"
  $DOTFILES_ROOT/nvm/install.sh
  success  "Yarn installed!!"

  section "Yarn"
  $DOTFILES_ROOT/yarn/install.sh
  success  "Yarn installed!!"

  section "RVM"
  $DOTFILES_ROOT/ruby/install.sh
  success  "RVM installed!!"

  section "Zsh"
  link_files_in_folder "$DOTFILES/zsh"
  $DOTFILES_ROOT/zsh/install.sh
  success "Zsh setup finished!!"

  section "Kitty"
  link_file "$DOTFILES_ROOT/kitty/kitty.conf.symlink" "$HOME/.config/kitty/kitty.conf"
  success "Kitty setup finished"

  section "Vim Environment and Neovim"
  $DOTFILES_ROOT/vim-environment/install.sh

  # Create nvim folder if not exists
  [ ! -d "$HOME/.config/nvim" ] && mkdir "$HOME/.config/nvim"
  link_file "$DOTFILES_ROOT/nvim/coc-settings.json.symlink" "$HOME/.config/nvim/coc-settings.json"
  link_file "$DOTFILES_ROOT/nvim/init.vim.symlink" "$HOME/.config/nvim/init.vim"
  success "Vim setup finished"

  section "Tmux"
  link_files_in_folder "$DOTFILES_ROOT/tmux"
  success "Tmux setup finished"

  section "Git"
  setup_gitconfig
  success "Git setup finished"

  section "ignore file"
  link_file "$DOTFILES_ROOT/ignore.symlink" "$HOME/.ignore"
  success "Configuration completed. Enjoy :)"
}

install_dotfiles
