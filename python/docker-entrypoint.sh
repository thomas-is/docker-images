#!/bin/sh

echo "🐍 pip intall -U pip setuptools wheel"
python3 -m venv /venv \
  &&  . /venv/bin/activate \
  && pip install -U \
    pip \
    setuptools \
    wheel \
  && deactivate

if [ -f $REQUIREMENTS ] ; then
  echo "🐍 pip install -r $REQUIREMENTS"
  python3 -m venv /venv \
  && . /venv/bin/activate \
  && pip install -r $REQUIREMENTS \
  || exit 1
else
  echo "🐍 $REQUIREMENTS not found, skip install"
fi

echo "🐍 pip list"
pip list

echo "🐍 add /venv/bin to PATH"
export PATH="/venv/bin:$PATH"

exec $@
