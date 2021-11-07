#!/bin/sh

if [ "$(id -u)" = 0 ] ; then

  sed -e "s/user = nobody/user = $FPM_USER/g"   -i /etc/php8/php-fpm.d/www.conf
  sed -e "s/group = nobody/group = $FPM_USER/g" -i /etc/php8/php-fpm.d/www.conf

  if [ "$FPM_CLEAR_ENV" = "no" ] ; then
    sed -e 's/;clear_env/clear_env/g' -i /etc/php8/php-fpm.d/www.conf
  fi

  if [ "$LOG_FORMAT" != "main" ] ; then
    sed -e "s/access_log \/dev\/stdout main;/access_log \/dev\/stdout $LOG_FORMAT;/g" -i /etc/nginx/http.d/default.conf
  fi

  php-fpm8 --allow-to-run-as-root

fi

exec "$@"
