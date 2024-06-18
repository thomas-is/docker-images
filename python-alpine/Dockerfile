FROM alpine:latest

# python user id is set at build time
ARG PYTHON_UID=1000

# default requirements file for pip
ENV REQUIREMENTS "/src/requirements.txt"

# font-terminus is needed by tkinter
RUN apk add --no-cache \
  py3-pip \
  python3-tkinter \
  font-terminus \
  vim

COPY ./profile              /etc/profile

ADD https://raw.githubusercontent.com/thomas-is/rc/main/.vimrc /etc/vim/vimrc
RUN chmod 644 /etc/vim/vimrc

COPY ./docker-entrypoint.sh /usr/local/bin/
RUN chmod 744 /usr/local/bin/docker-entrypoint.sh

RUN  adduser -D -u $PYTHON_UID python \
  && mkdir -p /.cache/pip  \
  && chown python:python /.cache/pip \
  && mkdir /venv \
  && chown python:python /venv \
  && mkdir /src \
  && chown python:python /src

USER python
WORKDIR /src
VOLUME [ "/src", "/venv" ]

ENTRYPOINT [ "/usr/local/bin/docker-entrypoint.sh" ]
CMD [ "/bin/sh", "-l" ]
