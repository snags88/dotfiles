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
