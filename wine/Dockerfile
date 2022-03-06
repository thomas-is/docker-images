FROM --platform=linux/386 alpine:3.15

RUN  apk update && apk upgrade && \
  apk add --no-cache \
    shadow \
    wine \
    xorg-server-dev \
    pciutils-libs \
    mesa-demos mesa-dri-ati mesa-dri-intel mesa-dri-nouveau mesa-dri-swrast \
    ffmpeg \
    ttf-tlwg \
    pulseaudio \
    gnome-icon-theme


RUN adduser wine -h /home/wine --disabled-password
RUN chown -R wine:wine /home/wine

ADD https://raw.githubusercontent.com/Winetricks/winetricks/master/src/winetricks /usr/local/bin/winetricks
COPY ./docker-entrypoint.sh  /usr/local/bin/
RUN chmod -R 755 /usr/local/bin

RUN su wine -c "/usr/local/bin/winetricks sound=pulse"
WORKDIR /home/wine

ENTRYPOINT [ "/usr/local/bin/docker-entrypoint.sh" ]
CMD [ "sh", "-l" ]
