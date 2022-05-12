ARG ALPINE latest
FROM i386/alpine:$ALPINE

ENV USER_ID    1000
ENV VIDEO_GID  44
ENV RENDER_GID 107
ENV WINETRICKS "isolate_home"

# enable testing repository
RUN echo "https://dl-cdn.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories \
  && apk update \
  && apk upgrade \
  && apk add --no-cache \
  alsa-plugins-pulse \
  cabextract \
  dxvk \
  ffmpeg \
  freetype \
  gnome-icon-theme \
  mesa-demos \
  mesa-dri-ati mesa-dri-intel mesa-dri-nouveau mesa-dri-swrast \
  mesa-vulkan-ati mesa-vulkan-intel \
  pciutils-libs \
  pulseaudio \
  shadow \
  sudo \
  ttf-tlwg \
  vim \
  wget \
  wine \
  xorg-server-dev

ADD https://raw.githubusercontent.com/Winetricks/winetricks/master/src/winetricks /usr/bin/winetricks
RUN chmod 755 /usr/bin/winetricks

RUN adduser wine -h /home/wine --disabled-password  \
  && mkdir -p /home/wine/.wine \
  && chown -R wine:wine /home/wine \
  && echo "wine ALL=(ALL:ALL) NOPASSWD: ALL" > /etc/sudoers.d/wine

COPY profile /etc/profile
COPY ./docker-entrypoint.sh  /usr/local/bin/
RUN chmod -R 755 /usr/local/bin

WORKDIR /home/wine

ENTRYPOINT [ "/usr/local/bin/docker-entrypoint.sh" ]
CMD [ "/bin/sh", "-l" ]
