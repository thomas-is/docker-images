ARG ALPINE=latest

FROM alpine:$ALPINE

RUN apk update && apk upgrade
RUN apk add --no-cache \
  ca-certificates \
  shadow curl file \
  g++ make autoconf \
  perl perl-gd perl-mime-tools \
  openssl gnupg

RUN mkdir -p /usr/local/news
RUN usermod news -d /usr/local/news

RUN mkdir -p /src
RUN curl -s http://ftp.isc.org/isc/inn/inn-2.6.4.tar.gz | tar xzC /src/
WORKDIR /src/inn-2.6.4
RUN ./autogen
RUN ./configure
RUN make
#RUN echo $(grep $(hostname) /etc/hosts | cut -f1) $(hostname).local >> /etc/hosts && make install
WORKDIR /usr/local/news
RUN chown -R news:news /usr/local/news

COPY ./docker-entrypoint.sh /usr/local/bin/
RUN chmod -R 744 /usr/local/bin

EXPOSE 119

ENTRYPOINT [ "docker-entrypoint.sh" ]
CMD [ "sh", "-l" ]
