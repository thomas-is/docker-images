ARG ALPINE=latest
FROM alpine:$ALPINE

RUN apk add --no-cache \
  ca-certificates \
  npm

RUN mkdir -p /src

CMD [ "/usr/bin/npm" ]
