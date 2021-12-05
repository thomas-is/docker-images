#!/bin/bash

docker build -t dev-inn . && \
docker run --rm -it \
  --name nntpd \
  --hostname locahost.local \
  -p 119:119 \
  dev-inn "$@"
