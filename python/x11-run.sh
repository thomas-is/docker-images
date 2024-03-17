#!/bin/bash

base=$( realpath $(dirname $0) )

mkdir -p $base/venv
touch $base/venv/.keepme
mkdir -p $base/src
touch $base/src/requirements.txt

docker build -t python . || exit 1
docker run --rm -it \
  --name python \
  --env="DISPLAY" \
  -v /tmp/.X11-unix:/tmp/.X11-unix \
  -v $base/src:/src \
  -v $base/venv:/venv \
  python
