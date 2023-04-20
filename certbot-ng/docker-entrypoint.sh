#!/bin/sh

cat << EOF > /etc/crontabs/root
$SCHEDULE certbot renew --nginx -n
#
EOF

crond -f -l 8 &

exec "$@"
