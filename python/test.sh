#!/bin/bash

base=$( realpath $(dirname $0) )

mkdir -p $base/venv
mkdir -p $base/src
touch $base/src/requirements.txt

docker build -t python . || exit 1
docker run --rm -it \
  --name python \
  -v $base/src:/src \
  -v $base/venv:/venv \
  python
