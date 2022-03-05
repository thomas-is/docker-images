ARG ALPINE=latest

FROM alpine:$ALPINE

ENV USER_ID 1000

RUN apk update && apk upgrade \
&&  apk add shadow \
  tor \
  xorg-server-dev \
  pciutils-libs \
  mesa-demos mesa-dri-ati mesa-dri-intel mesa-dri-nouveau mesa-dri-swrast \
  firefox-esr \
  ffmpeg \
  ttf-tlwg \
  pulseaudio \
  gnome-icon-theme

RUN rm -rf /var/cache/apk/*

RUN adduser firefox -h /home/firefox --disabled-password
RUN mkdir -p /home/firefox/downloads
RUN chown -R firefox:firefox /home/firefox
RUN chown -R firefox:firefox /var/lib/tor
RUN chown -R firefox:firefox /var/log/tor

RUN mkdir -p /usr/lib/firefox/distribution
RUN mkdir -p /usr/lib/firefox/defaults/pref
COPY ./autoconfig.js /usr/lib/firefox/defaults/pref/autoconfig.js
COPY ./firefox.cfg   /usr/lib/firefox/firefox.cfg
COPY ./policies.json /usr/lib/firefox/distribution/policies.json

COPY ./newnym                /usr/local/bin/
COPY ./docker-entrypoint.sh  /usr/local/bin/
RUN chmod -R 755 /usr/local/bin

WORKDIR /home/firefox

ENTRYPOINT [ "/usr/local/bin/docker-entrypoint.sh" ]
CMD [ "/usr/bin/firefox", "https://check.torproject.org/" ]
