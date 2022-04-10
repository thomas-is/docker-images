#!/bin/sh

docker build -t wine --build-arg ALPINE=edge . || exit 1

docker run --rm -it \
  --name wine \
  --shm-size=4G \
  --device /dev/dri \
  --device /dev/vga_arbiter \
  -e USER_ID=$(id -u) \
  -e WINETRICKS="isolate_home d3dx9_41" \
  -e HOME=/home/wine \
  -e DISPLAY=unix$DISPLAY \
  -v /tmp/.X11-unix:/tmp/.X11-unix \
  -v $HOME/.Xauthority:/home/wine/.Xauthority:ro \
  -e PULSE_SERVER=unix:/pulse \
  -v /run/user/$(id -u)/pulse/native:/pulse \
  -v ~/games/wine:/home/wine/games \
  wine "$@"
