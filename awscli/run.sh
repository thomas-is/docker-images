#!/bin/bash

base=$( realpath $(dirname $0) )

docker build -t awscli $base || exit 1

mkdir -p ~/.aws
mkdir -p ~/lab/aws/src

docker run --rm -it \
  --name awscli \
  --network host \
  -v ~/.aws:/home/aws/.aws \
  -v ~/lab/aws/src:/home/aws/src \
  -v /var/run/docker.sock:/var/run/docker.sock \
  awscli
