FROM alpine:latest

# aws user id is set at build time
ARG AWS_UID=1000

RUN apk add --no-cache \
  doas \
  jq \
  mandoc \
  py3-pip \
  vim

COPY ./profile /etc/profile

ADD https://raw.githubusercontent.com/thomas-is/rc/main/.vimrc /etc/vim/vimrc
RUN chmod 644 /etc/vim/vimrc

COPY ./docker-entrypoint.sh /usr/local/bin/
RUN chmod 755 /usr/local/bin/docker-entrypoint.sh

RUN  adduser -D -u $AWS_UID aws \
  && addgroup aws wheel \
  && echo "permit nopass :wheel" >> /etc/doas.d/doas.conf \
  && mkdir -p /.cache/pip  \
  && chown aws:aws /.cache/pip \
  && mkdir /venv \
  && chown aws:aws /venv

COPY ./sh.rc /opt/sh.rc
ENV ENV=/opt/sh.rc

USER aws
WORKDIR /home/aws

RUN python3 -m venv /venv \
  && /venv/bin/pip install -U \
    pip \
    setuptools \
    wheel \
  && /venv/bin/pip install \
    awscli

VOLUME [ "/home/aws/.aws" ]

#ENTRYPOINT [ "/usr/local/bin/docker-entrypoint.sh" ]
CMD [ "/bin/sh", "-l" ]
