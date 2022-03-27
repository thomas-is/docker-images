ARG ALPINE=latest

FROM alpine:$ALPINE

RUN apk update && apk upgrade
RUN apk add \
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

CMD [ "/bin/sh", "-l" ]
