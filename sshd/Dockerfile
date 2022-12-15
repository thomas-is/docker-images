ARG ALPINE=latest

FROM alpine:$ALPINE

ENV USER      user
ENV UID       1000
ENV SHELL     /bin/false

RUN apk add --no-cache openssh-server

COPY profile /etc/profile
COPY bin /usr/local/bin/
RUN chmod -R 755 /usr/local/bin

VOLUME /etc/ssh
VOLUME /authorized_keys

EXPOSE 22

ENTRYPOINT [ "/usr/local/bin/docker-entrypoint.sh" ]
CMD [ "/usr/sbin/sshd", "-D", "-e" ]
