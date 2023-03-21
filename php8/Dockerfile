FROM alpine:3.16

ENV FPM_USER nobody

RUN apk add --no-cache \
  ca-certificates \
  php8 \
  php8-fpm \
  php8-curl \
  php8-iconv \
  php8-json \
  php8-mbstring \
  php8-openssl \
  php8-pdo \
  php8-pdo_mysql \
  php8-pdo_pgsql \
  php8-session

COPY docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh
RUN chmod 755 /usr/local/bin/docker-entrypoint.sh

EXPOSE 9000

ENTRYPOINT [ "docker-entrypoint.sh" ]
CMD [ "/usr/sbin/php-fpm8", "-F", "-R" ]
