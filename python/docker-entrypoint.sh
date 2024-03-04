#!/bin/sh

RST="\033[0m\033m"
RED="\033[1;31m\033m"
GRN="\033[1;32m\033m"
ORG="\033[1;33m\033m"
BLU="\033[1;34m\033m"
PUR="\033[1;35m\033m"
CYN="\033[1;36m\033m"
GRY="\033[1;38m\033m"

info() {
  printf "[${BLU}info$RST] %s\n" "$@"
}

info "activate /venv"
python3 -m venv /venv \
  || exit 1
export PATH="/venv/bin:$PATH"

info "update pip, setuptools and wheel"
pip install -U \
  pip \
  setuptools \
  wheel \
  || exit 1

if [ -f $REQUIREMENTS ] ; then
  info "pip install -r $REQUIREMENTS"
  pip install -r $REQUIREMENTS || exit 1
else
  info "no $REQUIREMENTS found"
fi

info "installed packages:"
pip list

info "end of entrypoint"

exec $@
