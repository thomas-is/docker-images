#!/bin/bash

for ALPINE in latest edge
do
  docker pull alpine:$ALPINE > /dev/null
  WINE=$( docker run --rm -it alpine:$ALPINE sh -c "apk update > /dev/null && apk search wine" | grep -v "^wine-d" | grep "^wine-" | cut -f2 -d"-" )
  printf "alpine-%s:wine-%s\n" $ALPINE $WINE
done
