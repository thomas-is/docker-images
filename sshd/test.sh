#!/bin/bash

BASE=$( realpath $( dirname $0 ) )

mkdir -p $BASE/ssh

docker build -t sshd . || exit 1
docker run --rm -it \
  --name sshd \
  -e USER=dev \
  -e SHELL=/bin/sh \
  -v $HOME/.ssh/authorized_keys:/authorized_keys:ro \
  -v $BASE/ssh:/etc/ssh \
  -p 2222:22 \
  sshd
