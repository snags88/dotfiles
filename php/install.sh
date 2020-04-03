#!/bin/sh
#
# PHP Brew
# A version management system for PHP
# https://github.com/phpbrew/phpbrew

# Check for Homebrew
if test ! $(which phpbrew)
then
  echo "  Installing PhpBrew for you."

  # Install
  curl -L -O https://github.com/phpbrew/phpbrew/releases/latest/download/phpbrew.phar
  chmod +x phpbrew.phar

  sudo mv phpbrew.phar /usr/local/bin/phpbrew

  phpbrew init
fi

exit 0
