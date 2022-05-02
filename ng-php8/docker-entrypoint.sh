#!/bin/sh

# remove the X-Powered-By header
sed -e "s/expose_php = On/expose_php = Off/g" -i /etc/php8/php.ini

sed -e "s/user = nobody/user = $FPM_USER/g"   -i /etc/php8/php-fpm.d/www.conf
sed -e "s/group = nobody/group = $FPM_USER/g" -i /etc/php8/php-fpm.d/www.conf
sed -e 's/;clear_env/clear_env/g'             -i /etc/php8/php-fpm.d/www.conf

if [ "$LOG_FORMAT" != "main" ] ; then
  sed -e "s/access_log \/dev\/stdout main;/access_log \/dev\/stdout $LOG_FORMAT;/g" -i /etc/nginx/http.d/default.conf
fi

php-fpm8 --allow-to-run-as-root

exec "$@"
