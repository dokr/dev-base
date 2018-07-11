FROM alpine:edge

MAINTAINER Chuanjian Wang <me@ckeyer.com>

env NPM_CONFIG_PREFIX=/.npm-global
env PATH=/.npm-global/bin:$PATH

RUN apk update && \
	apk add --update ca-certificates bash nodejs nodejs-npm git make;

RUN mkdir /.npm-global ;\
	npm config set prefix '/.npm-global' ;\
	npm update && npm install -g vue-cli node-sass

WORKDIR /opt
