#!/bin/sh

REPO="0lfi"

RST="\033[0m"
RED="\033[1;31m"
GRN="\033[1;32m"
ORG="\033[1;33m"
BLU="\033[1;34m"

run() {
  CMD="$@"
  echo "[$GRN$REPO/$IMAGE$RST] $BLU$CMD$RST"
  $CMD
}

case $( uname -m ) in
  x86_64)
    TAG="amd64"
    ALPINE="latest"
    ;;
  armv7l)
    TAG="arm32v7"
    ALPINE="latest"
    ;;
  aarch64)
    TAG="arm64v8"
    ALPINE="latest"
    ;;
  *)
    TAG="noarch"
  ;;
esac

if [ "$1" != "" ] ; then
  IMAGELIST="$@"
else
  IMAGELIST=$( ls -d */ )
fi
# remove unwanted "/"
IMAGELIST=$( echo "$IMAGELIST" | sed -e 's/\///g' )

for IMAGE in $IMAGELIST
do

  if [ ! -f $IMAGE/Dockerfile ] ; then
    continue
  fi

  if [ -f $IMAGE/ignore ] ; then
    echo "[$ORG$REPO/$IMAGE$RST] ignored"
    continue
  fi

  run docker build -t $REPO/$IMAGE:$TAG --build-arg ALPINE=$ALPINE ./$IMAGE || exit 1
  run docker push $REPO/$IMAGE:$TAG || exit 1
  run docker manifest rm $REPO/$IMAGE:latest
  run docker manifest create $REPO/$IMAGE:latest \
    --amend $REPO/$IMAGE:amd64 \
    --amend $REPO/$IMAGE:arm64v8 \
    || exit 1
  run docker manifest annotate --variant v8 $REPO/$IMAGE:latest $REPO/$IMAGE:arm64v8 || exit 1
  run docker manifest push $REPO/$IMAGE:latest || exit 1

done
