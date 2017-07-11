# Curology - enable/disable xdebug

xon () { #enable xdebug
    sed -i -e "s/.*zend_extension.*/zend_extension=\"\/usr\/local\/opt\/php71-xdebug\/xdebug.so\"/" /usr/local/etc/php/7.1/conf.d/ext-xdebug.ini
}

xoff () { #disable xdebug
    sed -i -e "s/.*zend_extension.*/\;zend_extension=\"\/usr\/local\/opt\/php71-xdebug\/xdebug.so\"/" /usr/local/etc/php/7.1/conf.d/ext-xdebug.ini
}
