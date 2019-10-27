#!/usr/bin/env bash

# Script to install RVM
# TODO, install frequently used rubies

# Install gpg keys
gpg --keyserver hkp://pool.sks-keyservers.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB

\curl -sSL https://get.rvm.io | bash

# Reload RVM config
source ~/.rvm/scripts/rvm

RUBY_VERSION=2.6.3

rvm install "$RUBY_VERSION" --with-openssl-dir=`brew --prefix openssl`
