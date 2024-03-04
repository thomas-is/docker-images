FROM alpine:latest

ENV REQUIREMENTS "/src/requirements.txt"

RUN apk add --no-cache \
  py3-pip

RUN mkdir -p /.cache/pip
RUN chmod 777 /.cache/pip

RUN mkdir -p /venv
RUN chmod 777 /venv

COPY profile /etc/profile
COPY ./docker-entrypoint.sh /usr/local/bin/
RUN chmod 744 /usr/local/bin/docker-entrypoint.sh

RUN mkdir /src
WORKDIR /src
VOLUME [ "/src", "/opt/venv" ]

ENTRYPOINT [ "/usr/local/bin/docker-entrypoint.sh" ]
CMD [ "/bin/sh", "-l" ]
