ARG ALPINE=latest

FROM alpine:$ALPINE

ENV CLIENT="no"
ENV DELAY="no"
ENV ACCEPT="0.0.0.0:8080"
ENV CONNECT="127.0.0.1:80"
ENV PSK_FILE="/run/secrets/psk"

RUN apk add --no-cache \
  openssl \
  stunnel

COPY docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh
RUN chmod 744 /usr/local/bin/docker-entrypoint.sh

ENTRYPOINT [ "/usr/local/bin/docker-entrypoint.sh" ]
CMD [ "/usr/bin/stunnel" ]
