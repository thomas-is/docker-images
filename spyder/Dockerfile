FROM debian:bookworm-slim

ARG PYTHON_UID=1000
# create user python
RUN  adduser --uid $PYTHON_UID --home /home/python --disabled-password python \
  && mkdir /src \
  && chown python:python /src

COPY ./bash.bashrc /home/python/.bashrc
COPY ./bash.bash_aliases /home/python/.bash_aliases

RUN  chown python:python /home/python/.bashrc \
  && chmod 644 /home/python/.bashrc \
  && chown python:python /home/python/.bash_aliases \
  && chmod 644 /home/python/.bash_aliases

# install deps
RUN apt-get update \
  && apt-get install -y \
    libgl1 \
    libxcomposite1 \
    libxdamage1 \
    libxrender1 \
    libxrandr2 \
    libxtst6 \
    libpci3 \
    libasound2 \
    qt5dxcb-plugin

# install conda
#ADD https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh /tmp/install.sh
COPY ./Miniconda3-latest-Linux-x86_64.sh /tmp/install.sh

RUN chmod +x /tmp/install.sh \
  && /tmp/install.sh -b -u -p /opt/conda \
  && rm /tmp/install.sh

# install spyder
RUN /opt/conda/bin/conda install -y spyder


COPY ./docker-entrypoint.sh /usr/local/bin/
RUN chmod 755 /usr/local/bin/docker-entrypoint.sh

USER python
WORKDIR /src

ENTRYPOINT [ "/usr/local/bin/docker-entrypoint.sh" ]
CMD [ "/opt/conda/bin/spyder " ]
