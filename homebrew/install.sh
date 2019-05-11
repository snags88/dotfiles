#!/bin/sh
#
# Homebrew
#
# This installs some of the common dependencies needed (or at least desired)
# using Homebrew.

# Check for Homebrew
if test ! $(which brew)
then
  echo "  Installing Homebrew for you."

  # Install the correct homebrew for each OS type
  if test "$(uname)" = "Darwin"
  then
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  elif test "$(expr substr $(uname -s) 1 5)" = "Linux"
  then
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/linuxbrew/go/install)"
  fi

fi

brew tap heroku/brew

# Install homebrew packages
brew install ack openssl redis git	libyaml\
             graphviz postgresql	the_silver_searcher\
             heroku	neovim node\
             bash-completion hub mcrypt php-cs-fixer\
             php composer yarn mariadb

brew cask install vimr

exit 0
