ARG ALPINE=latest

FROM alpine:$ALPINE

ENV UID 1000
ENV PKG ""

COPY profile /etc/profile
COPY ./docker-entrypoint.sh  /usr/local/bin/

ADD https://raw.githubusercontent.com/thomas-is/rc/main/.vimrc /etc/vim/vimrc

RUN apk add --no-cache \
  python3 \
  py3-pip \
  shadow \
  vim \
  && adduser python -h /home/python --disabled-password \
  && chmod -R 755 /usr/local/bin \
  && mkdir -p /home/python/src \
  && mkdir -p /home/python/.virtual \
  && chown -R python:python /home/python \
  && su python -c "python3 -m venv /home/python/.virtual"

WORKDIR /home/python/src

VOLUME /home/python

ENTRYPOINT [ "/usr/local/bin/docker-entrypoint.sh" ]
CMD [ "sh", "-l" ]
