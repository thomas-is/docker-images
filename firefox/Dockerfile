ARG ALPINE=latest

FROM alpine:$ALPINE

ENV USER_ID 1000
ENV PROFILE profile

RUN apk add --no-cache \
  ffmpeg \
  firefox-esr \
  gnome-icon-theme \
  mesa-demos mesa-dri-ati mesa-dri-intel mesa-dri-nouveau mesa-dri-swrast \
  pciutils-libs \
  pulseaudio \
  shadow \
  tor \
  ttf-dejavu ttf-tlwg \
  xorg-server-dev

RUN apk add --no-cache \
  --repository=http://dl-cdn.alpinelinux.org/alpine/edge/testing/ \
  font-wqy-zenhei

COPY ./policies.json         /usr/lib/firefox/distribution/policies.json
COPY ./newnym                /usr/local/bin/
COPY ./docker-entrypoint.sh  /usr/local/bin/

RUN adduser firefox -h /home/firefox --disabled-password \
  && chown -R firefox:firefox /home/firefox \
  && chown -R firefox:firefox /var/lib/tor \
  && chown -R firefox:firefox /var/log/tor \
  && chmod -R 755 /usr/local/bin

WORKDIR /home/firefox

ENTRYPOINT [ "/usr/local/bin/docker-entrypoint.sh" ]
CMD [ "/usr/bin/firefox", "-P", "$PROFILE", "https://check.torproject.org/" ]
