#!/bin/bash

base=$( realpath $( dirname $0 ) )
mkdir -p $base/src

docker build -t 0lfi/npm .
docker run --rm -it \
  --user $( id -u ) \
  -v $base/src:/src \
  -w /src \
  0lfi/npm npm $@
