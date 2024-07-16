#!/bin/sh

echo "🔧 activate /venv"
python3 -m venv /venv || exit 1
export PATH="/venv/bin:$PATH"

echo "🆙 update pip, setuptools and wheel"
pip install -U \
  pip \
  setuptools \
  wheel \
  || exit 1

if [ -f $REQUIREMENTS ] ; then
  ehcho "📦 pip install -r $REQUIREMENTS"
  pip install -r $REQUIREMENTS || exit 1
else
  echo "❗ $REQUIREMENTS not found"
fi

echo "🐳 end of entrypoint"
echo "🚀 $*"
exec $@
