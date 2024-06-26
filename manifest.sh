#!/bin/sh

REPO="0lfi"

RST="\033[0m"
RED="\033[1;31m"
GRN="\033[1;32m"
ORG="\033[1;33m"
BLU="\033[1;34m"

case $( uname -m ) in
  x86_64)
    arch="amd64"
    ;;
  armv7l)
    arch="arm32v7"
    ;;
  aarch64)
    arch="arm64v8"
    ;;
  *)
    arch="noarch"
  ;;
esac

if [ "$1" != "" ] ; then
  IMAGELIST="$@"
else
  IMAGELIST=$( ls -d */ )
fi
# remove unwanted "/"
IMAGELIST=$( echo "$IMAGELIST" | sed -e 's/\///g' )

echo
# create manifest for each image
# `latest`, `amd64` and `arm64v8` images must exists on registry already
for IMAGE in $IMAGELIST
do

  if [ ! -f $IMAGE/Dockerfile ] ; then continue ; fi
  if [ -f $IMAGE/ignore ] ; then echo "[$ORG$REPO/$IMAGE$RST] ignored"; continue ; fi

  echo "[$GRN$REPO/$IMAGE$RST] manifest"

  CMD="docker manifest rm $REPO/$IMAGE:latest"
  echo "  $CMD"
  $CMD > /dev/null

  CMD="docker manifest create $REPO/$IMAGE:latest --amend $REPO/$IMAGE:amd64 --amend $REPO/$IMAGE:arm64v8"
  echo "  $CMD"
  $CMD > /dev/null

  if [ $? -ne 0 ]; then
    echo "  ${ORG}manifest failed, fallback to $arch$RST "
    CMD="docker manifest create $REPO/$IMAGE:latest --amend $REPO/$IMAGE:$arch"
    echo "  $CMD"
    $CMD > /dev/null || exit 1
  else
    CMD="docker manifest annotate --variant v8 $REPO/$IMAGE:latest $REPO/$IMAGE:arm64v8"
    echo "  $CMD"
    $CMD > /dev/null || exit 1
  fi

  CMD="docker manifest push $REPO/$IMAGE:latest"
  echo "  $CMD"
  $CMD > /dev/null || exit 1
  echo "  ${GRN}ok$RST "

done
echo

