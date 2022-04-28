#!/bin/sh

if [ "$(id -u)" != 0 ] ; then
  echo "[fatal] can't run as non-root user!"
  exit 1
fi

# remove the X-Powered-By header
sed -e "s/expose_php = On/expose_php = Off/g" -i /etc/php7/php.ini

# set user and group php-fpm runs as
sed -e "s/user = nobody/user = $FPM_USER/g"   -i /etc/php7/php-fpm.d/www.conf
sed -e "s/group = nobody/group = $FPM_USER/g" -i /etc/php7/php-fpm.d/www.conf
# do not clear env
sed -e 's/;clear_env/clear_env/g'             -i /etc/php7/php-fpm.d/www.conf

# set nginx log format is not main
if [ "$LOG_FORMAT" != "main" ] ; then
  sed -e "s/access_log \/dev\/stdout main;/access_log \/dev\/stdout $LOG_FORMAT;/g" -i /etc/nginx/http.d/default.conf
fi

php-fpm7 --allow-to-run-as-root

exec "$@"
