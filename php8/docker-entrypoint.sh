#!/bin/sh

# non root user won't be able to edit fpm conf
if [ "$(id -u)" = 0 ] ; then
  sed -e "s/user = nobody/user = $FPM_USER/g"   -i /etc/php83/php-fpm.d/www.conf
  sed -e "s/group = nobody/group = $FPM_USER/g" -i /etc/php83/php-fpm.d/www.conf
  sed -e 's/;clear_env/clear_env/g'             -i /etc/php83/php-fpm.d/www.conf
fi

exec "$@"
