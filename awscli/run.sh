#!/bin/bash

base=$( realpath $(dirname $0) )

docker build -t awscli $base || exit 1
docker run --rm -it \
  --name awscli \
  -v ~/.aws:/home/aws/.aws \
  awscli
