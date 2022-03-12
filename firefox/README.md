# 0lfi/firefox

## TL;TR

```bash
docker run --rm \
  --name firefox-docker \
  --shm-size=2048m \
  --device /dev/dri \
  --device /dev/vga_arbiter \
  -e USER_ID=$( id -u ) \
  -e HOME=/home/firefox \
  -e DISPLAY=unix$DISPLAY \
  -v /tmp/.X11-unix:/tmp/.X11-unix \
  -v $HOME/.Xauthority:/home/firefox/.Xauthority:ro \
  -e PULSE_SERVER=unix:/pulse \
  -v /run/user/$(id -u)/pulse/native:/pulse \
  -v $HOME/firefox-docker:/home/firefox
  0lfi/firefox
```

To send the `NEWNYM` command to `torctl`
```bash
docker exec -t firefox-docker newnym
```
