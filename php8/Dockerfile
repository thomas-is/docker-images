FROM alpine:3.20

ENV FPM_USER nobody

RUN apk add --no-cache \
  ca-certificates \
  php83 \
  php83-fpm \
  php83-curl \
  php83-iconv \
  php83-json \
  php83-mbstring \
  php83-openssl \
  php83-pdo \
  php83-pdo_mysql \
  php83-pdo_pgsql \
  php83-session

COPY docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh
RUN chmod 755 /usr/local/bin/docker-entrypoint.sh

EXPOSE 9000

ENTRYPOINT [ "docker-entrypoint.sh" ]
CMD [ "/usr/sbin/php-fpm83", "-F", "-R" ]
