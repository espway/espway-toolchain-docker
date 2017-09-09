FROM flannelhead/esp8266-toolchain:latest

LABEL maintainer="Sakari Kapanen sakari.m.kapanen@gmail.com"

ENV DEVEL_DEPS perl ca-certificates
ENV BUILD_DEPS wget gnupg lsb-release apt-transport-https
  
RUN apt-get update \
  && apt-get install -y --no-install-recommends $DEVEL_DEPS $BUILD_DEPS \
  && wget --quiet -O - https://deb.nodesource.com/gpgkey/nodesource.gpg.key | apt-key add - \
  && echo "deb https://deb.nodesource.com/node_6.x $(lsb_release -s -c) main" > /etc/apt/sources.list.d/nodesource.list \
  && apt-get update \
  && apt-get install nodejs \
  && apt-get remove -y --purge --allow-remove-essential $BUILD_DEPS \
  && apt-get autoremove -y --purge \
  && rm -rf /var/lib/apt/lists/*

