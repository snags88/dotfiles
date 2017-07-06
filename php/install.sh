#!/bin/sh

if test ! $(which phpbrew)
then
  echo "  Installing phpbrew for you."
  \curl -L -O https://github.com/phpbrew/phpbrew/raw/master/phpbrew
  chmod +x phpbrew

  # Move phpbrew to somewhere can be found by your $PATH
  sudo mv phpbrew /usr/local/bin/phpbrew

  phpbrew init
  phpbrew lookup-prefix homebrew

fi

if test ! $(which composer) && test $(which phpbrew)
then
  while true; do
    read -p "Do you want to install composer? [Y/n] " yn
    case $yn in
      [Yy]* ) phpbrew app get composer; break;;
      [Nn]* ) exit;;
      * ) echo "Invalid input.";;
    esac
  done
fi

if test ! $(which phpunit) && test $(which phpbrew)
then
  while true; do
    read -p "Do you want to install phpunit? [Y/n] " yn
    case $yn in
      [Yy]* ) phpbrew app get phpunit; break;;
      [Nn]* ) exit;;
      * ) echo "Invalid input.";;
    esac
  done
fi

if test ! $(which laravel) && test $(which composer)
then
  while true; do
    read -p "Do you want to install Laravel? [Y/n] " yn
    case $yn in
      [Yy]* ) composer global require "laravel/installer"; break;;
      [Nn]* ) exit;;
      * ) echo "Invalid input.";;
    esac
  done
fi
