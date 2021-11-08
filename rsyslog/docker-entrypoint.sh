#!/bin/sh


if [ "${OMFILE_NAME}" = "" ] && [ "${OMFWD_HOST}" = "" ] ; then
  echo "[fatal] no output, both OMFILE_NAME and OMFWD_HOST are empty!"
  exit 1
fi

cat <<-EOF > /etc/rsyslog.conf
\$WorkDirectory /var/lib/rsyslog
\$FileOwner root
\$FileGroup root
\$FileCreateMode 0644
\$DirCreateMode 0755
\$Umask 0222

module(load="immark")
module(load="imtcp")
module(load="imudp")

input( type="imtcp" port="514" )
input( type="imudp" port="514" )
EOF

if [ "${OMFILE_NAME}" != "" ] ; then
  echo "[omfile] /var/log/${OMFILE_NAME}.log"
cat <<-EOF >> /etc/rsyslog.conf

\$outchannel log_rotation,/var/log/${OMFILE_NAME}.log,${OMFILE_ROTATE_SIZE},/usr/local/bin/rotate
*.* :omfile:\$log_rotation

EOF
else
  echo "[omfile] disabled"
fi

if [ "${OMFWD_HOST}" != "" ] ; then
  echo "[omfwd] ${OMFWD_PROTOCOL}://${OMFWD_HOST}:${OMFWD_PORT}"
cat <<-EOF >> /etc/rsyslog.conf

*.* action(
  type="omfwd"
  Target="${OMFWD_HOST}"
  Port="${OMFWD_PORT}"
  Protocol="${OMFWD_PROTOCOL}"
)

EOF
else
  echo "[omfwd] disabled"
fi

exec "$@"
