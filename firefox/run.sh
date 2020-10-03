#!/bin/sh
docker run --rm -d \
  -e DISPLAY=${DISPLAY} \
  -e FIREFOX_UID=$(id -u) \
  -e FIREFOX_GID=$(id -g) \
  -v /tmp/.X11-unix:/tmp/.X11-unix \
  -v /usr/share/fonts:/usr/share/fonts \
  firefox
