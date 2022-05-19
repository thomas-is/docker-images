#!/bin/sh

docker build -t firefox . || exit 1

docker run --rm -it \
  --name firefox \
  --shm-size=2048m \
  --device /dev/dri \
  --device /dev/vga_arbiter \
  -e USER_ID=$(id -u) \
  -e HOME=/home/firefox \
  -e DISPLAY=unix$DISPLAY \
  -v /tmp/.X11-unix:/tmp/.X11-unix \
  -v $HOME/.Xauthority:/firefox/.Xauthority:ro \
  -e PULSE_SERVER=unix:/pulse \
  -v /run/user/$(id -u)/pulse/native:/pulse \
  firefox "$@"
