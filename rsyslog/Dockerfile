ARG ALPINE=latest

FROM alpine:$ALPINE

ENV OMFILE_NAME           "docker"
ENV OMFILE_ROTATE_SIZE    "1048576"
ENV OMFWD_HOST            ""
ENV OMFWD_PORT            "514"
ENV OMFWD_PROTOCOL        "tcp"

RUN apk update && apk upgrade \
&&  apk add ca-certificates rsyslog

RUN rm -rf /var/cache/apk/*

COPY ./docker-entrypoint.sh /usr/local/bin/
COPY ./bin/rotate /usr/local/bin/
RUN chmod -R 744 /usr/local/bin

VOLUME /var/log
EXPOSE 514

ENTRYPOINT [ "docker-entrypoint.sh" ]
# https://linux.die.net/man/8/rsyslogd
CMD [ "/usr/sbin/rsyslogd", "-n" ]
