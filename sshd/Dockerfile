ARG ALPINE=latest

FROM alpine:$ALPINE

ENV USER  user
ENV SHELL /bin/false

RUN apk add --no-cache openssh-server

COPY profile /etc/profile
COPY docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh
RUN chmod 755 /usr/local/bin/docker-entrypoint.sh

VOLUME /etc/ssh
VOLUME /user/.ssh/authorized_keys

EXPOSE 22

ENTRYPOINT [ "/usr/local/bin/docker-entrypoint.sh" ]
CMD [ "/usr/sbin/sshd", "-D", "-e" ]
