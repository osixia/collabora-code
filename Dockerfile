FROM collabora/code:latest

USER root

RUN apt-get -y update \
    && echo ttf-mscorefonts-installer msttcorefonts/accepted-mscorefonts-eula select true | debconf-set-selections \
    && LC_ALL=C DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends ttf-mscorefonts-installer \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

COPY fonts /usr/share/fonts/truetype

RUN mv /usr/share/fonts/truetype/* /opt/collaboraoffice6.0/share/fonts/truetype

USER 101