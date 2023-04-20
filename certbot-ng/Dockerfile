ARG ALPINE=latest

FROM alpine:$ALPINE

ENV SCHEDULE "0 4 * * *"

RUN apk add --no-cache \
  ca-certificates \
  certbot-nginx \
  nginx

COPY ./docker-entrypoint.sh /usr/local/bin/
RUN chmod 744 /usr/local/bin/docker-entrypoint.sh

COPY ./default.conf  /etc/nginx/http.d/default.conf

VOLUME [ "/etc/letsencrypt" ]
EXPOSE 80 443

ENTRYPOINT [ "docker-entrypoint.sh" ]
CMD [ "/usr/sbin/nginx", "-c", "/etc/nginx/nginx.conf", "-g", "daemon off;" ]
