FROM alpine:edge

MAINTAINER Chuanjian Wang <me@ckeyer.com>

env NPM_CONFIG_PREFIX=/.npm-global
env PATH=/.npm-global/bin:$PATH

RUN apk update && \
	apk add --update ca-certificates bash nodejs nodejs-npm git make which python wget;

RUN npm update && \
	npm i npm@latest -g && \
	npm install -g vue-cli

ADD upx /usr/bin/upx

WORKDIR /opt
