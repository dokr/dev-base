FROM alpine:edge

MAINTAINER ckeyer <docker@ckeyer.com>

RUN apk add --update git make subversion curl wget tar zip

RUN apk add --update ed libbz2-dev \
      libcurl4-openssl-dev \
      libevent-dev \
      libglib2.0-dev \
      libjpeg-dev \
      libmagickwand-dev \
      libmysqlclient-dev \
      libncurses5-dev \
      libpq-dev \
      libpq5 \
      libreadline6-dev \
      libssl-dev \
      libxml2-dev \
      libxslt-dev \
      netcat-openbsd \
      openjdk-7-jdk \
      openjdk-7-jre-headless \
      openssh-client \
      openssh-server \
      postgresql-server-dev-9.3 \
      python \
      python-dev \
      ruby \
      ruby-dev \
      socat \
      stunnel \
      syslinux \
      telnet \
      zlib1g-dev \
      pigz