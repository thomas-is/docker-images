# python (alpine based)

## libc warning

This image is meant to be as lite as possible. It is based on Alpine (which uses
`musl` intead of the standard `libc`) and does not ship `gcc` on purpose. The
compatible `libc` layer from Alpine would only lead to compilation issues (and a
much heavier image).

Requirements that need compilation (such as PyTorch or Tensorflow to name a few)
*will* fail to install.

If you need C based requirements, use the Debian based image instead.


## user id

Default user `python` has user id 1000. This is set at build time.


## TL;DR

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

