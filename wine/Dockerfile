FROM --platform=linux/386 i386/alpine:3.15

RUN  apk update && apk upgrade && \
  apk add --no-cache \
    alsa-plugins-pulse \
    cabextract \
    ffmpeg \
    freetype \
    gnome-icon-theme \
    mesa-demos mesa-dri-ati mesa-dri-intel mesa-dri-nouveau mesa-dri-swrast \
    pciutils-libs \
    pulseaudio \
    shadow \
    ttf-tlwg \
    wget \
    wine \
    xorg-server-dev


RUN adduser wine -h /home/wine --disabled-password
RUN chown -R wine:wine /home/wine

ADD https://raw.githubusercontent.com/Winetricks/winetricks/master/src/winetricks /usr/local/bin/winetricks



COPY ./docker-entrypoint.sh  /usr/local/bin/
RUN chmod -R 755 /usr/local/bin

WORKDIR /home/wine

ENTRYPOINT [ "/usr/local/bin/docker-entrypoint.sh" ]
CMD [ "sh", "-l" ]
