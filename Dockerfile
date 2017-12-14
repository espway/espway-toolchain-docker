FROM flannelhead/esp8266-toolchain:latest

LABEL maintainer="Sakari Kapanen sakari.m.kapanen@gmail.com"

ENV DEVEL_DEPS nodejs tcc@testing libc-dev linux-headers

RUN echo "@testing http://dl-cdn.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories \
  && apk update \
  && apk add --no-cache $DEVEL_DEPS
