# python

## TL;DR

Default user `python` has user id 1000.

Boot up a python env:
```bash
docker run --rm -it \
  --name python \
  -v $base/src:/src \
  -v $base/venv:/venv \
  python
```

With X11 support:
```bash
docker run --rm -it \
  --name python \
  --env="DISPLAY" \
  -v /tmp/.X11-unix:/tmp/.X11-unix \
  -v $base/src:/src \
  -v $base/venv:/venv \
  python
```

