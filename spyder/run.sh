#!/bin/bash

base=$( realpath $( dirname $0 ) )

if [ ! -f $base/Miniconda3-latest-Linux-x86_64.sh ] ; then
  echo "🐍 wget conda"
  wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh \
    -O $base/Miniconda3-latest-Linux-x86_64.sh
fi

echo "🐳 docker build"
docker build -t spyder . || exit 1

echo "🚀 docker run"
docker run --rm -it \
  --env="DISPLAY" \
  -v /tmp/.X11-unix:/tmp/.X11-unix \
  -v $base/src:/src \
  -w /src \
  spyder $@
