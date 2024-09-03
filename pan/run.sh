#!/bin/bash

base=$( realpath $(dirname $0) )

docker build -t pan $base || exit 1
docker run --rm -it \
  --name pan \
  --env="DISPLAY" \
  -v /tmp/.X11-unix:/tmp/.X11-unix \
  -v /home/thomas/.pan2:/home/thomas/.pan2\
  pan
