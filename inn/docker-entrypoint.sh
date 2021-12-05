#!/bin/sh

cd /src/inn-2.6.4
make install -C /src/inn-2.6.4

export PATH="$PATH:/usr/local/news/bin"
cd /usr/local/news
#echo "---------------------"
#echo "$(find . -name *.OLD)"
#echo "---------------------"
#for OLD in $(find . -name *.OLD); do rm $OLD; done

exec "$@"
