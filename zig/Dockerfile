FROM alpine:latest

# zig user id is set at build time
ARG ZIG_UID=1000

# font-terminus is needed by tkinter
RUN apk add --no-cache \
  doas \
  vim \
  zig

COPY ./profile /etc/profile

ADD https://raw.githubusercontent.com/thomas-is/rc/main/.vimrc /etc/vim/vimrc
RUN chmod 644 /etc/vim/vimrc

COPY ./docker-entrypoint.sh /usr/local/bin/
RUN chmod 755 /usr/local/bin/docker-entrypoint.sh

RUN  adduser -D -u $ZIG_UID zig \
  && addgroup zig wheel \
  && echo "permit nopass :wheel" >> /etc/doas.d/doas.conf \
  && mkdir -p /src \
  && chown zig:zig /src

USER zig

WORKDIR /src
VOLUME [ "/src" ]

ENTRYPOINT [ "/usr/local/bin/docker-entrypoint.sh" ]
CMD [ "/bin/sh", "-l" ]
