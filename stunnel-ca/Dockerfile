ARG ALPINE=latest

FROM alpine:$ALPINE

ENV CLIENT      no
ENV DELAY       yes
ENV SSL_DOMAIN  ""
ENV ACCEPT      0.0.0.0:443
ENV CONNECT     127.0.0.1:80
ENV VERIFY      ""

RUN apk add --no-cache \
  ca-certificates \
  openssl \
  stunnel

COPY docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh
RUN chmod 744 /usr/local/bin/docker-entrypoint.sh

VOLUME [ "/etc/letsencrypt" ]

ENTRYPOINT [ "/usr/local/bin/docker-entrypoint.sh" ]
CMD [ "/usr/bin/stunnel" ]
