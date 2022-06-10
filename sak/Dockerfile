ARG ALPINE=latest

FROM alpine:$ALPINE

RUN apk update && apk upgrade
RUN apk add \
  bash \
  bind-tools \
  busybox-extras \
  bzip2 \
  ca-certificates \
  curl \
  figlet \
  git \
  gzip \
  jq \
  mysql-client \
  netcat-openbsd \
  openssh-client \
  postgresql-client psqlodbc \
  vim \
  zip

RUN rm -rf /var/cache/apk/*

COPY profile /etc/profile

ADD https://raw.githubusercontent.com/thomas-is/rc/main/.vimrc /etc/vim/vimrc
ADD https://raw.githubusercontent.com/crypt1d/redi.sh/master/redi.sh /usr/local/bin/redis
RUN chmod +x /usr/local/bin/redis

CMD [ "/bin/sh", "-l" ]
