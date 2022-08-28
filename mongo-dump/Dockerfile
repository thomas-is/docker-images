FROM alpine:3.16

RUN apk add --no-cache \
  bzip2 \
  ca-certificates \
  mongodb-tools

COPY ./crontab /etc/crontabs/root

COPY ./mongo-dump /usr/local/bin/mongo-dump
RUN chmod 755 /usr/local/bin/mongo-dump

CMD [ "crond", "-f", "-l", "8" ]
