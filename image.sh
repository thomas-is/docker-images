#!/bin/sh

REPO="0lfi"
ALPINE="latest"

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
    ;;
  armv7l)
    TAG="arm32v7"
    ;;
  aarch64)
    TAG="arm64v8"
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
    echo "[$ORG$REPO/$IMAGE$RST] Dockerfile not found"
    continue
  fi

  if [ -f $IMAGE/ignore ] ; then
    echo "[$ORG$REPO/$IMAGE$RST] ignored"
    continue
  fi

  run docker build -t $REPO/$IMAGE:$TAG --build-arg ALPINE=$ALPINE ./$IMAGE || exit 1
  run docker push $REPO/$IMAGE:$TAG || exit 1

done
