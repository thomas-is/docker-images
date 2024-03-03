#!/bin/bash

base=$( realpath $(dirname $0) )

docker build -t python . || exit 1
docker run --rm -it \
  -v $base/src/requirements.txt:/src/requirements.txt \
  -v $base/venv:/opt/venv \
  -w /src \
  python
