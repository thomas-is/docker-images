FROM debian:unstable-20240904-slim

ARG UID=1000

ENV TZ="Europe/Paris"
ENV LANG=fr_FR.UTF-8

RUN  apt-get update && \
  apt-get install tzdata

# Configure timezone and locale
RUN apt-get install -y locales && \
#  echo "Europe/Paris" > /etc/timezone && \
  dpkg-reconfigure -f noninteractive tzdata && \
  sed -i -e "s/# en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/" /etc/locale.gen && \
  sed -i -e "s/# $LANG UTF-8/$LANG UTF-8/" /etc/locale.gen && \
  echo "LANG=\"$LANG\"" >/etc/default/locale && \
  dpkg-reconfigure --frontend=noninteractive locales && \
  update-locale LANG=$LANG

RUN apt-get install -y \
  aspell-fr \
  fonts-firacode \
  fonts-noto-color-emoji \
  pan \
  && rm -rf /var/lib/apt/lists/*

RUN  adduser --uid $UID --home /home/thomas --disabled-password thomas \
  && chown $UID:$UID /home/thomas

USER thomas
WORKDIR /home/thomas

VOLUME [ "/home/thomas/.pan2" ]
CMD [ "/usr/bin/pan" ]
