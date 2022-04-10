ARG ALPINE=latest
FROM --platform=linux/386 i386/alpine:$ALPINE

ENV USER_ID 1000
ENV WINETRICKS ""

RUN  apk update && apk upgrade && \
  apk add --no-cache \
    alsa-plugins-pulse \
    cabextract \
    ffmpeg \
    freetype \
    gnome-icon-theme \
    mesa-demos mesa-dri-ati mesa-dri-intel mesa-dri-nouveau mesa-dri-swrast \
    mesa-vulkan-ati mesa-vulkan-intel \
    pciutils-libs \
    pulseaudio \
    shadow \
    ttf-tlwg \
    vim \
    wget \
    wine \
    xorg-server-dev

ADD https://raw.githubusercontent.com/Winetricks/winetricks/master/src/winetricks /usr/bin/winetricks
RUN chmod 755 /usr/bin/winetricks

RUN adduser wine -h /home/wine --disabled-password
RUN mkdir -p /home/wine/.wine
RUN chown -R wine:wine /home/wine

COPY profile /etc/profile
COPY ./docker-entrypoint.sh  /usr/local/bin/
RUN chmod -R 755 /usr/local/bin

WORKDIR /home/wine

ENTRYPOINT [ "/usr/local/bin/docker-entrypoint.sh" ]
CMD [ "/bin/sh", "-l" ]
