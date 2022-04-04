ARG ALPINE=latest

FROM alpine:$ALPINE

RUN apk update && apk upgrade && \
  apk add ca-certificates nginx php8 php8-fpm \
  php8-curl \
  php8-iconv \
  php8-json \
  php8-mbstring \
  php8-openssl \
  php8-pdo php8-pdo_mysql php8-pdo_pgsql \
  php8-session \
  chromium

RUN rm -rf /var/cache/apk/*

RUN ln -s /usr/bin/php8 /usr/bin/php

RUN mkdir -p /run/nginx

COPY ./ng-default.conf /etc/nginx/http.d/default.conf
COPY ./srv /srv

COPY ./docker-entrypoint.sh /usr/local/bin/
RUN chmod -R 744 /usr/local/bin

WORKDIR /srv

EXPOSE 80

ENTRYPOINT [ "docker-entrypoint.sh" ]
CMD [ "/usr/sbin/nginx", "-c", "/etc/nginx/nginx.conf", "-g", "daemon off;" ]
