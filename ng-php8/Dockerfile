FROM alpine:3.20

ENV FPM_USER      nobody
ENV LOG_FORMAT    main

RUN apk add --no-cache \
  ca-certificates \
  nginx \
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

RUN mkdir -p /run/nginx

COPY docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh
RUN chmod 755 /usr/local/bin/docker-entrypoint.sh

COPY ./ng-default.conf /etc/nginx/http.d/default.conf
COPY ./srv /srv

WORKDIR /srv

EXPOSE 80

ENTRYPOINT [ "docker-entrypoint.sh" ]
CMD [ "/usr/sbin/nginx", "-c", "/etc/nginx/nginx.conf", "-g", "daemon off;" ]
