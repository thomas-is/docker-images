FROM alpine:3.15

ENV FPM_USER    nobody
ENV LOG_FORMAT  main

RUN apk add --no-cache \
  ca-certificates \
  nginx \
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

COPY ./ng-default.conf /etc/nginx/http.d/default.conf
COPY ./srv /srv
COPY docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh

RUN chmod -R 755 /usr/local/bin
RUN mkdir -p /run/nginx

WORKDIR /srv

EXPOSE 80

ENTRYPOINT [ "docker-entrypoint.sh" ]
CMD [ "/usr/sbin/nginx", "-c", "/etc/nginx/nginx.conf", "-g", "daemon off;" ]
