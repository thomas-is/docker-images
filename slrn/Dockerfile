ARG ALPINE=edge

FROM alpine:$ALPINE

ENV NNTPSERVER  "news.free.fr"
ENV EDITOR      "vim"

RUN apk add --no-cache \
  --repository=http://dl-cdn.alpinelinux.org/alpine/edge/testing/ \
  slrn \
  vim

COPY ./docker-entrypoint.sh /usr/local/bin/
RUN chmod -R 744 /usr/local/bin

RUN mkdir -p /home/lsrn
WORKDIR /home/slrn

ENTRYPOINT [ "docker-entrypoint.sh" ]
CMD [ "sh", "-l" ]
