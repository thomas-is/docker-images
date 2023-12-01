ARG ALPINE=latest

FROM alpine:$ALPINE

RUN apk add --no-cache \
    python3 \
    py3-pip \
    vim

COPY profile /etc/profile

ADD https://raw.githubusercontent.com/thomas-is/rc/main/.vimrc /etc/vim/vimrc

RUN mkdir /src
WORKDIR /src

VOLUME /src

ENTRYPOINT [ "docker-entrypoint.sh" ]
CMD [ "sh", "-l" ]
