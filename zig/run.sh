#!/bin/bash

base=$( realpath $(dirname $0) )

mkdir -p $base/src

docker build -t zig $base || exit 1
docker run --rm -it \
  --name zig \
  -v $base/src:/src \
  -w /src \
  zig
