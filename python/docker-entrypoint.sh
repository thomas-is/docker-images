#!/bin/sh

packages=/src/requirements.txt

if [ -f $packages ] ; then
  echo "🐍 installing packages from $packages"
  python3 -m venv /opt/venv \
  && . /opt/venv/bin/activate \
  && pip install -r $packages \
  || exit 1
  echo "🐍 use /opt/venv/bin/python3"
else
  echo "🐍 /src/requirements.txt not found"
fi

exec $@
