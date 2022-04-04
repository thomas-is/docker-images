#!/bin/bash

REPO="0lfi"

for ALPINE in edge "3.15"
do
  WINE=$( docker run --rm -it i386/alpine:$ALPINE /bin/sh -c "apk update > /dev/null && apk info wine | head -n 1 | cut -f2 -d\"-\" | tr -d \"\r\n\"" )

  CMD="docker build -t $REPO/wine:$WINE --build-arg ALPINE=$ALPINE ."
  echo "  $CMD"
  $CMD || exit 1

  CMD="docker push $REPO/wine:$WINE"
  echo "  $CMD"
  $CMD || exit 1

  if [ "$ALPINE" = "edge" ] ; then
    CMD="docker build -t $REPO/wine:latest --build-arg ALPINE=$ALPINE ."
    echo "  $CMD"
    $CMD || exit 1
    CMD="docker push $REPO/wine:latest"
    echo "  $CMD"
    $CMD || exit 1
  fi

done
