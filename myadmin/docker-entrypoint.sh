#!/bin/sh

sed -e 's/;clear_env/clear_env/g' -i /etc/php8/php-fpm.d/www.conf
php-fpm8

exec "$@"
