FROM alpine:latest

ENV REQUIREMENTS "/src/requirements.txt"

RUN apk add --no-cache py3-pip

COPY profile /etc/profile

COPY ./docker-entrypoint.sh /usr/local/bin/
RUN chmod 744 /usr/local/bin/docker-entrypoint.sh

RUN mkdir -p /.cache/pip  \
  && chmod 777 /.cache/pip \
  && mkdir /venv \
  && chmod 777 /venv \
  && mkdir /src

WORKDIR /src

VOLUME [ "/src", "/venv" ]

ENTRYPOINT [ "/usr/local/bin/docker-entrypoint.sh" ]
CMD [ "/bin/sh", "-l" ]
