#!/bin/bash

base=$( realpath $(dirname $0) )

docker build -t python . || exit 1
docker run --rm -it \
  python
