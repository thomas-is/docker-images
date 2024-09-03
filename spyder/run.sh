#!/bin/bash

docker build -t spyder . || exit 1
echo "🚀 docker run"
docker run --rm -it \
  --env="DISPLAY" \
  -v /tmp/.X11-unix:/tmp/.X11-unix \
  -v $base/src:/src \
  -w /src \
  spyder $@
