ARG ALPINE=latest

FROM alpine:$ALPINE
ARG SLRN_UID=1000

ENV NNTPSERVER  "news.free.fr"
ENV EDITOR      "vim"

RUN apk add --no-cache \
  slrn \
  vim

ADD https://raw.githubusercontent.com/thomas-is/rc/main/.vimrc /etc/vim/vimrc
RUN chmod 644 /etc/vim/vimrc

COPY ./docker-entrypoint.sh /usr/local/bin/
RUN chmod -R 755 /usr/local/bin

RUN mkdir -p /home/slrn
RUN  adduser -D -u $SLRN_UID slrn \
  && chown slrn:slrn /home/slrn
WORKDIR /home/slrn
USER slrn

ENTRYPOINT [ "/usr/local/bin/docker-entrypoint.sh" ]
CMD [ "sh", "-l" ]
