ARG ALPINE=latest

FROM alpine:$ALPINE

RUN apk add --no-cache \
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
  postgresql-client \
  psqlodbc \
  vim \
  zip

ADD https://raw.githubusercontent.com/crypt1d/redi.sh/master/redi.sh /usr/local/bin/redis
RUN chmod +x /usr/local/bin/redis

ADD https://raw.githubusercontent.com/thomas-is/rc/main/.vimrc /etc/vim/vimrc

COPY profile /etc/profile

CMD [ "/bin/sh", "-l" ]
