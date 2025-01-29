#!/bin/bash

base=$( realpath $( dirname $0 ) )

cd $base/..

echo "🐳 docker build"
docker build -t stunnel-test . || exit 1

cd $base

echo "⚙️  PSK generation"
echo "testing:$( echo $(openssl rand 64 | base64 ))" > ./psk

echo "🐳 docker stack deploy"
docker stack deploy -c tunnel.yml tunnel

printf "😪 waiting for services to be up "
for n in $( seq 1 5); do
  printf "."
  sleep 1
done
printf "\n"

echo "⚙️  curl http://127.0.0.1:8080"
curl http://127.0.0.1:8080
if [ $? -eq 0 ]; then
  echo "🎉 success!"
else
  echo "💥 failure"
fi

echo "👋 docker stack rm"
docker stack rm tunnel
