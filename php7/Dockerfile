FROM alpine:3.15

ENV FPM_USER nobody

RUN apk add --no-cache \
  ca-certificates \
  ghostscript \
  php7 \
  php7-curl \
  php7-fpm \
  php7-iconv \
  php7-json \
  php7-mbstring \
  php7-openssl \
  php7-pdo \
  php7-pdo_mysql \
  php7-pdo_pgsql \
  php7-pecl-ssh2 \
  php7-session

COPY docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh
RUN chmod 755 /usr/local/bin/docker-entrypoint.sh

EXPOSE 9000

ENTRYPOINT [ "docker-entrypoint.sh" ]
CMD [ "/usr/sbin/php-fpm7", "-F", "-R" ]
