FROM alpine:edge

MAINTAINER Chuanjian Wang <me@ckeyer.com>

RUN apk update && \
	apk add --update ca-certificates bash nodejs nodejs-npm git make && \
	npm update && npm install -g vue-cli node-sass

WORKDIR /opt
