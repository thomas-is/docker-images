FROM debian:trixie-slim
ARG UID=1000

ENV PROFILE profile
#
#COPY ./policies.json         /usr/lib/firefox/distribution/policies.json
#COPY ./newnym                /usr/local/bin/

RUN apt-get update && \
    apt-get install -y \
      adduser \
      firefox-esr

RUN adduser firefox --home /home/firefox --uid $UID --disabled-password \
  && chown -R firefox:firefox /home/firefox

COPY ./docker-entrypoint.sh  /usr/local/bin/
RUN chmod -R 755 /usr/local/bin

WORKDIR /home/firefox

ENTRYPOINT [ "/usr/local/bin/docker-entrypoint.sh" ]
CMD [ "/usr/bin/firefox", "-P", "$PROFILE", "https://duckduckgo.com" ]
