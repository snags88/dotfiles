# Curology - enable/disable xdebug

xon () { #enable xdebug
    sed -i -e "s/.*zend_extension.*/zend_extension=\"\/usr\/local\/opt\/php71-xdebug\/xdebug.so\"/" /usr/local/etc/php/7.2/conf.d/ext-xdebug.ini
}

xoff () { #disable xdebug
    sed -i -e "s/.*zend_extension.*/\;zend_extension=\"\/usr\/local\/opt\/php71-xdebug\/xdebug.so\"/" /usr/local/etc/php/7.2/conf.d/ext-xdebug.ini
}

ssh-review () { #ssh into review app
    heroku run bash --app="$REVIEW_APP_BASE""$1"
}

agc () { # silver searcher with curology ignore files
    ag "$1" --ignore-dir resources/assets/patient-frontend --ignore-dir public/
}
