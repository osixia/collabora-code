FROM collabora/code

RUN apt-get -y update \
    && echo ttf-mscorefonts-installer msttcorefonts/accepted-mscorefonts-eula select true | debconf-set-selections \
    && LC_ALL=C DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends ttf-mscorefonts-installer \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

COPY fonts /usr/share/fonts/truetype/local

RUN cp -rf /usr/share/fonts/truetype/* /opt/collaboraoffice6.0/share/fonts/truetype && fc-cache
