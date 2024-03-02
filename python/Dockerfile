FROM alpine:latest

RUN apk add --no-cache \
  py3-pip

RUN mkdir -p /opt/venv
RUN python3 -m venv /opt/venv \
  &&  . /opt/venv/bin/activate \
  && pip install -U \
    pip \
    setuptools \
    wheel \
  && deactivate

RUN mkdir /src
WORKDIR /src

COPY profile /etc/profile
COPY ./docker-entrypoint.sh /usr/local/bin/
RUN chmod 744 /usr/local/bin/docker-entrypoint.sh

VOLUME /src

ENTRYPOINT [ "docker-entrypoint.sh" ]
CMD [ "/bin/sh", "-l" ]
