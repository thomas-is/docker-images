#!/bin/sh

docker build -t wine . || exit 1

xhost +

docker run --rm -it \
  --name wine \
  --device /dev/dri \
  --device /dev/snd \
  --device /dev/input \
  --hostname $( hostname ) \
  --ipc="host" \
  -e USER_ID=$(id -u) \
  -e AUDIO_GID=$(  cat /etc/group | grep audio  | cut -f3 -d":" ) \
  -e VIDEO_GID=$(  cat /etc/group | grep video  | cut -f3 -d":" ) \
  -e HOME=/home/wine \
  -e DISPLAY=unix$DISPLAY \
  -v /tmp/.X11-unix:/tmp/.X11-unix \
  -v $HOME/.Xauthority:/home/wine/.Xauthority:ro \
  -e PULSE_SERVER=unix:/pulse \
  -v /run/user/$(id -u)/pulse/native:/pulse \
  -v /home/thomas/games/wine/nfsu2_docker/nfsu2:/home/wine/nfsu2 \
  -v /home/thomas/games/wine/nfsu2_docker/wineprefix:/home/wine/.wine \
  -v /home/thomas/games/wine/nfsu2_docker/local-settings:/home/wine/local-settings \
  -w /home/wine/nfsu2 \
  wine "$@"
#  --group-add render \
#  --group-add video \
#  --device /dev/vga_arbiter \
#  -e RENDER_GID=$( cat /etc/group | grep render | cut -f3 -d":" ) \
#  --shm-size=4G \
#  -e WINETRICKS="win7 d3dx9" \
#  --network none \
