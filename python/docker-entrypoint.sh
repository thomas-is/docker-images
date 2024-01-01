#!/bin/sh

echo "UID=$UID"
usermod python -u $UID

su python -c "mkdir -p /home/python/.cache"
su python -c "mkdir -p /home/python/.local"


if [ "$PKG" != "" ] ; then
  if [ ! -f /home/python/.virtual/bin/activate ] ; then
    echo "[fatal] can't find /home/python/.virtual/bin/activate"
    exit 1
  fi
  for package in $( echo $PKG | sed 's/,/ /g' ); do
    su python -c ". /home/python/.virtual/bin/activate && pip3 install $package"
  done
fi

CMD="$@"
su python -c "$CMD"
