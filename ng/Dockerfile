ARG ALPINE=latest
FROM alpine:$ALPINE

ENV NG_USER nginx

RUN apk add --no-cache \
  ca-certificates \
  nginx \
  nginx-mod-stream

COPY ./nginx.conf /etc/nginx/nginx.conf
COPY ./stream.d   /etc/nginx/stream.d
COPY ./http.d     /etc/nginx/http.d
COPY ./srv        /srv

COPY ./docker-entrypoint.sh /usr/local/bin/
COPY ./ng-conf-monitor.sh   /usr/local/bin/
RUN chmod -R 744 /usr/local/bin

EXPOSE 80 443

ENTRYPOINT [ "docker-entrypoint.sh" ]
CMD [ "/usr/sbin/nginx", "-c", "/etc/nginx/nginx.conf", "-g", "daemon off;" ]
