#!/bin/bash

docker build -t sshd . || exit 1
docker run --rm -it \
  --name sshd \
  -e USER=dev \
  -e SHELL=/bin/false \
  -v /home/debian/.ssh/authorized_keys:/user/.ssh/authorized_keys:ro \
  -p 2222:22 \
  sshd
