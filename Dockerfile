FROM collabora/code:latest

USER root

RUN sed -i "s/main/main contrib/" /etc/apt/sources.list.d/debian.sources \
    && apt-get -y update \
    && LC_ALL=C DEBIAN_FRONTEND=noninteractive apt install -y --no-install-recommends perl \
    && echo ttf-mscorefonts-installer msttcorefonts/accepted-mscorefonts-eula select true | debconf-set-selections \
    && LC_ALL=C DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends ttf-mscorefonts-installer \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

COPY fonts /usr/share/fonts/truetype

RUN mv /usr/share/fonts/truetype/* /opt/collaboraoffice/share/fonts/truetype

USER 100
