#!/bin/bash

for TAG in latest edge
do
  docker pull alpine:$TAG > /dev/null
  printf "$TAG:"
  docker run --rm -it alpine:$TAG cat /etc/alpine-release
done
