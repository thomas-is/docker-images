#!/bin/sh

if [ $(id -u) -ne 0 ]; then
  echo "[entrypoint] can't run as non-root user!"
  exit 1
fi

echo "[entrypoint] crontab generation"
cat << EOF > /etc/crontabs/root
# m h d M w command
  $RENEW_SCHEDULE certbot renew --nginx -n
#
EOF
cat /etc/crontabs/root

echo "[entrypoint] starting crond"
crond -f -l 8 &

echo "[entrypoint] end of entrypoint"
exec "$@"
