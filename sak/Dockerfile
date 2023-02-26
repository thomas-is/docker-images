ARG ALPINE=latest

FROM alpine:$ALPINE

COPY profile /etc/profile
RUN apk add --no-cache \
  bash \
  bind-tools \
  busybox-extras \
  bzip2 \
  ca-certificates \
  curl \
  gzip \
  jq \
  mysql-client \
  netcat-openbsd \
  openssh-client \
  postgresql-client \
  psqlodbc \
  rsync \
  tcpdump \
  vim \
  zip
ADD https://raw.githubusercontent.com/crypt1d/redi.sh/master/redi.sh /usr/local/bin/redis
ADD https://raw.githubusercontent.com/thomas-is/rc/main/.vimrc /etc/vim/vimrc
RUN chmod -R 744 /usr/local/bin

CMD [ "/bin/sh", "-l" ]
