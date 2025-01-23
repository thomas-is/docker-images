FROM alpine:latest

# aws user id is set at build time
ARG AWS_UID=1000

# docker group id is set at build time
ARG DOCKER_GID=995

RUN apk add --no-cache \
  doas \
  docker \
  git \
  jq \
  mandoc \
  py3-pip \
  shadow \
  vim

COPY ./profile /etc/profile

ADD https://raw.githubusercontent.com/thomas-is/rc/main/.vimrc /etc/vim/vimrc
RUN chmod 644 /etc/vim/vimrc

COPY ./docker-entrypoint.sh /usr/local/bin/
RUN chmod -R 755 /usr/local/bin

RUN  groupmod -g $DOCKER_GID docker \
  && adduser -D -u $AWS_UID aws \
  && addgroup aws docker \
  && addgroup aws wheel \
  && echo "permit nopass :wheel" >> /etc/doas.d/doas.conf \
  && mkdir /venv \
  && chown aws:aws /venv

USER aws
WORKDIR /home/aws

RUN python3 -m venv /venv
ENV PATH="/venv/bin:$PATH"
RUN pip install -U \
      pip \
      setuptools \
      wheel \
    && pip install \
      awscli \
      aws-sam-cli \
    && pip cache purge

VOLUME [ "/home/aws/.aws" ]

ENTRYPOINT [ "/usr/local/bin/docker-entrypoint.sh" ]
CMD [ "/bin/sh", "-l" ]
