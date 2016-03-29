FROM alpine:edge

MAINTAINER ckeyer <docker@ckeyer.com>

RUN apk add --update git make subversion curl wget tar zip

RUN apk add --update openssl bash ca-certificates haproxy iptables libaio libstdc++ 

ENV LANG C.UTF-8
ENV JAVA_VERSION 7.91
ENV JAVA_APK_VERSION 7.91.2.6.3-r1

ENV apk add --update openjdk7-jre="$JAVA_APK_VERSION"