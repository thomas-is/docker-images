FROM debian:bookworm-slim

# python user id is set at build time
ARG PYTHON_UID=1000

# default requirements file for pip
ENV REQUIREMENTS "/src/requirements.txt"

RUN  apt-get update \
  && apt-get install -y \
      jq \
      python3-pip \
      python3-tk \
      python3-venv \
      vim \
      xfonts-terminus \
  && rm -rf /var/lib/apt/lists/*

ADD https://raw.githubusercontent.com/thomas-is/rc/main/.vimrc /etc/vim/vimrc
RUN chmod 644 /etc/vim/vimrc

COPY ./docker-entrypoint.sh /usr/local/bin/
RUN chmod 755 /usr/local/bin/docker-entrypoint.sh

RUN  adduser --uid $PYTHON_UID --home /home/python --disabled-password python \
  && mkdir -p /.cache/pip  \
  && chown python:python /.cache/pip \
  && mkdir /venv \
  && chown python:python /venv \
  && mkdir /src \
  && chown python:python /src

COPY ./bash.bashrc /home/python/.bashrc
COPY ./bash.bash_aliases /home/python/.bash_aliases
RUN  chown python:python /home/python/.bashrc \
  && chmod 644 /home/python/.bashrc \
  && chown python:python /home/python/.bash_aliases \
  && chmod 644 /home/python/.bash_aliases

USER python
WORKDIR /src
VOLUME [ "/src", "/venv" ]

ENTRYPOINT [ "/usr/local/bin/docker-entrypoint.sh" ]
CMD [ "/bin/bash", "-l" ]
