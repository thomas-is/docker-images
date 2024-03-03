#!/bin/sh

if [ -f $REQUIREMENTS ] ; then
  echo "🐍 found $REQUIREMENTS"
  python3 -m venv /opt/venv \
  && . /opt/venv/bin/activate \
  && pip install -r $REQUIREMENTS \
  || exit 1
else
  echo "🐍 $REQUIREMENTS not found, skip install"
fi

echo "🐍 pip list"
pip list

echo "🐍 added /opt/venv/bin to PATH"
export PATH="/opt/venv/bin:$PATH"

exec $@
