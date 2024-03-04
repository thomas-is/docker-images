#!/bin/bash

base=$( realpath $(dirname $0) )

mkdir -p $base/venv
mkdir -p $base/src
touch $base/src/requirements.txt

docker build -t python . || exit 1
docker run --rm -it \
  --user $(id -u) \
  -v $base/src/requirements.txt:/src/requirements.txt \
  -v $base/venv:/venv \
  -w /src \
  python
