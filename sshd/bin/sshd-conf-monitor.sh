#!/bin/sh

TARGET=/authorized_keys
ON_CHANGE="killall -SIGHUP sshd"
echo "[info] started monitoring of $TARGET"

while true
do
  STAMPS=$( stat -c '%Z' $TARGET )
  while [ "$STAMPS" = "$( stat -c '%Z' $TARGET )" ]
  do
    sleep 1
  done
  echo "[info] $TARGET has changed, reloading sshd"
  $ON_CHANGE
done
